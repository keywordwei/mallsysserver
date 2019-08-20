const malldb = require('../utils/malldb');
const md5 = require('blueimp-md5');
const errMsg = require('./errmsg');
const constants = require('../utils/constants');

//查找所有用户
const findAllStaffs = async (req, res) => {
    let sql = 'select * from staff';
    let result = await malldb(sql, [], res);
    res.json({
        status: 0,
        data: result
    });
};

//查询用户信息
const findStaff = async (req, res) => {
    let { username, password } = req.body;
    let sqlFindUser = 'select *  from staff where username=? and password=?';
    let staff = await malldb(sqlFindUser, [username, md5(password)], res);
    if (staff.length) {
        //保存用户名到cookie，对信息进行签名
        let sql = 'select menus from role where roleId=?';
        let menus = await malldb(sql, staff[0].roleId, res);
        res.cookie('staff', staff, {
            maxAge: 1000 * 60 * 60 * 24,
            signed: true,
            httpOnly: true
        });
        res.json({
            status: 0,
            data: { staff: staff[0], menus: menus[0].menus.split('#') }
        });
    } else {
        res.json(errMsg.loginErr);
    }
};
//插入用户信息
const addStaff = async (req, res) => {
    let { username } = req.body;
    let sqlFindUser = 'select *  from staff where username=?';
    let staff = await malldb(sqlFindUser, username, res);
    if (staff.length) {
        //用户名已存在，注册失败
        res.json(errMsg.registerErr);
    } else {
        let sqlInsertStaff = 'insert into staff set ?';
        let sqlInsertUserTable = 'insert into t_user(user_id,user_name, user_pwd, user_email) values(?,?,?,?);';
        let staff = {
            ...req.body,
            password: md5(req.body.password)
        };
        let staffMsg = await malldb(sqlInsertStaff, staff, res);
        let sql = 'select staffId from staff where username=?';
        let result = await malldb(sql, username, res);
        const { password, email } = req.body;
        await malldb(sqlInsertUserTable, [result[0].staffId, username, password, email], res);
        res.json({
            status: 0,
            data: staffMsg
        });
    }
};
//删除职员
const delteStaff = async (req, res) => {
    let sql = 'delete from staff where staffId=?';
    let sqlDeleteUser = 'delete from t_user where user_id=?';
    let result = await malldb(sql, req.query.staffId, res);
    await malldb(sqlDeleteUser, req.query.staffId, res);
    res.json({
        status: 0,
        msg: '删除职员成功!'
    });
};
//修改头像
const updateAvatar = async (req, res) => {
    const { staffId, avatar } = req.body;
    let sqlUpdateStaff = 'update staff set avatar=? where staffId=?';
    let sqlUpdateUser = 'update t_user set user_img=? where user_id=?';
    let sqlFindeStaff = 'select * from staff where staffId=?';
    await malldb(sqlUpdateStaff, [avatar, staffId], res);
    await malldb(sqlUpdateUser, [avatar, staffId], res);
    let result = await malldb(sqlFindeStaff, staffId, res);
    res.json({
        status: 0,
        data: result[0]
    });
};

//更新员工
const updateStaff = async (req, res) => {
    const { staffId } = req.body;
    let sql = 'update staff set ? where staffId=?';
    let sqlUpdateUser = 'update t_user set user_name=?, user_pwd=?, user_email=? where  user_id=?';
    req.body.staff.password = md5(req.body.staff.password);
    await malldb(sql, [req.body.staff, staffId], res);
    const { username, password, email } = req.body.staff;
    await malldb(sqlUpdateUser, [username, password, email, staffId], res);
    res.json({
        status: 0,
        msg: '更新用户成功'
    });
};
//查找所有的一级分类列表
const findFirstLevelCategorys = async (req, res) => {
    let sqlFindFirLevCate = 'select category_id as id, category_name as name from t_category';
    let result = await malldb(sqlFindFirLevCate, [], res);
    res.json({
        status: 0,
        data: result
    });
};
//添加一级分类列表
const addFirstLevelCategory = async (req, res) => {
    let sql = 'select count(*) as categoryNameCount from t_category where category_name=?';
    let result = await malldb(sql, req.body.categoryName, res);
    if (result[0].categoryNameCount) {
        res.json(errMsg.addCategoryErr);
    } else {
        let sqlAddFirLevcat = 'insert into t_category set category_name=?';
        let Insertresult = await malldb(sqlAddFirLevcat, req.body.categoryName, res);
        if (Insertresult.affectedRows === 1) {
            let sqlFindOneCategory =
                'select category_id as id,category_name as name from t_category where category_name=?';
            let insertCategory = await malldb(sqlFindOneCategory, req.body.categoryName, res);
            res.json({
                status: 0,
                data: insertCategory[0],
                msg: '添加一级品类成功'
            });
        }
    }
};
//修改二级品类
const updateFirstLevelCategory = async (req, res) => {
    let sqlUpdateFirLevCat = 'update t_category set category_name=? where category_id=?';
    const { firstId, categoryName } = req.body;
    let result = await malldb(sqlUpdateFirLevCat, [categoryName, firstId], res);
    if (result.affectedRows === 1) {
        res.json({
            status: 0,
            msg: '修改一级品类成功'
        });
    }
};
//根据一级品类Id删掉相应的一级品类和二级品类
const deleteFirstLevelCategory = async (req, res) => {
    //设置外键删除语句
    let sql = 'SET FOREIGN_KEY_CHECKS = 0;';
    let result = await malldb(sql, [], res);
    //左外连接同时删掉一级品类和二级品类数据
    let sqlDeleteCategory =
        'DELETE t_category ,prosecondarycategory  FROM t_category left join prosecondarycategory on t_category.category_id = prosecondarycategory.category_id where t_category.category_id=?';
    let deleteCategory = await malldb(sqlDeleteCategory, req.query.firstId, res);
    res.json({
        status: 0,
        msg: '删除一级品类成功'
    });
};
//查找二级分类列表
const findeSecondayCategorys = async (req, res) => {
    let sqlFindSecCat =
        'select secondaryId as id, secondaryCategoryName as name from prosecondarycategory where category_id=?';
    let result = await malldb(sqlFindSecCat, req.query.firstId, res);
    res.json({
        status: 0,
        data: result
    });
};
//根据一级品类Id, 二级品类名, 查找当前一级品类下二级品类名是否唯一(某一级品类下二级品类名应唯一)
const addSecondaryCategory = async (req, res) => {
    const { secondaryCategoryName } = req.body;
    const category_id = req.body.firstId;
    let sql =
        'select count(*) as categoryNameCount from prosecondarycategory where secondaryCategoryName=? and category_id=?';
    let result = await malldb(sql, [secondaryCategoryName, category_id], res);
    if (result[0].categoryNameCount) {
        res.json(errMsg.addCategoryErr);
    } else {
        let sqlAddSecondaryCategory = 'insert into prosecondarycategory set ?';
        let unique = await malldb(sqlAddSecondaryCategory, { secondaryCategoryName, category_id }, res);
        if (unique.affectedRows === 1) {
            let sqlFindOneCategory =
                'select secondaryId as id, secondaryCategoryName as name from prosecondarycategory where secondaryCategoryName=? and category_id=?';
            let secCategory = await malldb(sqlFindOneCategory, [secondaryCategoryName, category_id], res);
            res.json({
                status: 0,
                data: secCategory[0],
                msg: '添加二级级品类成功'
            });
        }
    }
};
//修改二级品类
const updateSecondaryCategory = async (req, res) => {
    const { secondaryId, secondaryCategoryName } = req.body;
    let sqlUpdateSecCate = 'update prosecondarycategory set secondaryCategoryName=?  where secondaryId=?';
    let result = await malldb(sqlUpdateSecCate, [secondaryCategoryName, secondaryId], res);
    if (result.affectedRows === 1) {
        res.json({
            status: 0,
            msg: '修改二级品类成功'
        });
    }
};
//删除二级品类
const deleteSecondaryCategory = async (req, res) => {
    let sqlDeleteSecCat = 'delete from prosecondarycategory where secondaryId=?';
    let result = await malldb(sqlDeleteSecCat, req.query.secondaryId, res);
    if (result.affectedRows === 1) {
        res.json({
            status: 0,
            msg: '删除二级品类成功'
        });
    }
};
//根据一级分类ID 二级分类名获取二级分类ID
const searchSecondaryId = async (req, res) => {
    let sql = 'select secondaryId from prosecondarycategory where category_id=? and secondaryCategoryName=?';
    const { goods_category_id, goods_category_name } = req.body;
    let result = await malldb(sql, [goods_category_id, goods_category_name]);
    res.json({
        status: 0,
        data: result[0].secondaryId
    });
};
//计算根据页数计算分页查找时的起始行
const calStartRow = (currentPage, pageSize) => {
    return (currentPage - 1) * pageSize;
};

//获取商品列表
const getAllProducts = async (req, res) => {
    const { currentPage, pageSize } = req.query;
    const startRowRecord = calStartRow(currentPage, pageSize);
    let sqlFindAllPro = 'select * from t_sale_goods limit ?, ?;';
    let sqlTotal = 'select count(*) as total from t_sale_goods';
    let result = await malldb(sqlFindAllPro, [startRowRecord, parseInt(pageSize)], res);
    const totalProduct = await malldb(sqlTotal, [], res);
    res.json({
        status: 0,
        data: {
            total: totalProduct[0].total,
            products: result
        }
    });
};
//更新商品状态
const updateProductStatus = async (req, res) => {
    const { goods_id, goods_status } = req.body;
    let sqlUpdateProSta = 'update t_sale_goods set goods_status=? where goods_id=?';
    let result = await malldb(sqlUpdateProSta, [goods_status, goods_id], res);
    res.json({
        status: 0,
        msg: '更新商品状态成功'
    });
};
//更据某一字段对商品排序
const sorterProduct = async (req, res) => {
    const { currentPage, pageSize, sorterKeyWord, sorterType } = req.query;
    const startRowRecord = calStartRow(currentPage, pageSize);
    let sqlSorter = `select * from t_sale_goods order by ${sorterKeyWord} ${sorterType} limit ?, ?;`;
    let result = await malldb(sqlSorter, [startRowRecord, parseInt(pageSize)], res);
    let sqlTotal = 'select count(*) as total from t_sale_goods';
    const totalProduct = await malldb(sqlTotal, [], res);
    res.json({
        status: 0,
        data: {
            total: totalProduct[0].total,
            products: result
        }
    });
};
//全部分类带查询条件的查询条数
const allCategorySearchcount = params => {};

//不带排序的条件查询
const condtionSearch = async (req, res) => {
    const { currentPage, pageSize, searchCategory, searchWays, searchInputMsg } = req.body;
    const startRowRecord = calStartRow(currentPage, pageSize);
    let sql;
    let sqlTotal;
    //选择所有品类且查找信息不为空，前端已做判断
    if (searchCategory === 'allCategory') {
        sql = `select * from t_sale_goods where ${searchWays} like '%${searchInputMsg}%' limit ${startRowRecord},${parseInt(
            pageSize
        )};`;
        sqlTotal = `select count(*) as total from t_sale_goods where ${searchWays} like '%${searchInputMsg}%';`;
    } else {
        //选择非所有分类 => 查找信息为空和不为空两种情况
        if (searchInputMsg) {
            sql = `select * from t_sale_goods where ${searchWays} like '%${searchInputMsg}%' and goods_category_id=${parseInt(
                searchCategory
            )} limit ${startRowRecord},${parseInt(pageSize)};`;
            sqlTotal = `select count(*) as total from t_sale_goods where ${searchWays} like '%${searchInputMsg}%' and goods_category_id=${parseInt(
                searchCategory
            )} `;
        } else {
            sql = `select * from t_sale_goods where goods_category_id=${parseInt(
                searchCategory
            )} limit ${startRowRecord},${parseInt(pageSize)};`;
            sqlTotal = `select count(*) as total from t_sale_goods where goods_category_id=${parseInt(searchCategory)}`;
        }
    }
    let result = await malldb(sql, [], res);
    let totalProduct = await malldb(sqlTotal, [], res);
    res.json({
        status: 0,
        data: {
            total: totalProduct[0].total,
            products: result
        }
    });
};
//产品带排序的条件查询
const searchAndSortProduct = async (req, res) => {
    const { currentPage, pageSize, searchCategory, searchWays, searchInputMsg, sorterKeyWord, sorterType } = req.body;
    let startRowRecord = calStartRow(currentPage, pageSize);
    let pageSizeInt = parseInt(pageSize);
    let sql, result, totalProduct;
    if (searchCategory === 'allCategory') {
        sql = `select *  from t_sale_goods where ${searchWays} like '%${searchInputMsg}%' order by ${sorterKeyWord} ${sorterType} limit ?,?;`;
        sqlTotal = `select count(*) as total from t_sale_goods where ${searchWays} like '%${searchInputMsg}%';`;
        result = await malldb(sql, [startRowRecord, pageSizeInt], res);
        totalProduct = await malldb(sqlTotal, [], res);
    } else {
        if (searchInputMsg) {
            sql = `select *  from t_sale_goods where ${searchWays} like '%${searchInputMsg}%' and goods_category_id=? order by ${sorterKeyWord} ${sorterType} limit ?,?;`;
            sqlTotal = `select count(*) as total  from t_sale_goods where ${searchWays} like '%${searchInputMsg}%'and goods_category_id=?`;
            result = await malldb(sql, [searchCategory, startRowRecord, pageSizeInt], res);
            totalProduct = await malldb(sqlTotal, [searchCategory], res);
        } else {
            sql = `select *  from t_sale_goods where goods_category_id=? order by ${sorterKeyWord} ${sorterType} limit ?,?;`;
            sqlTotal = `select count(*) as total  from t_sale_goods where goods_category_id=?`;
            result = await malldb(sql, [searchCategory, startRowRecord, pageSizeInt], res);
            totalProduct = await malldb(sqlTotal, [searchCategory], res);
        }
    }
    res.json({
        status: 0,
        data: {
            total: totalProduct[0].total,
            products: result
        }
    });
};
const deleteProductById = async (req, res) => {
    const { goods_id } = req.query;
    let sql = 'delete from t_sale_goods where goods_id=?';
    let result = await malldb(sql, goods_id, res);
    res.json({
        status: 0,
        msg: '删除商品成功'
    });
};
const findeUserById = async (req, res) => {
    const { goods_by_user_id } = req.query;
    let sql = 'select * from t_user where user_id = ?';
    let result = await malldb(sql, goods_by_user_id, res);
    res.json({
        status: 0,
        data: result[0]
    });
};
const addProduct = async (req, res) => {
    let sql = 'insert into t_sale_goods set ?';
    let result = await malldb(sql, req.body, res);
    res.json({
        status: 0,
        data: '添加商品成功'
    });
};
const updateProduct = async (req, res) => {
    let sql = 'update t_sale_goods set ? where goods_id=?';
    const goods_id = req.body.goods_id;
    delete req.body.goods_id;
    let result = await malldb(sql, [req.body, goods_id], res);
    res.json({
        status: 0,
        msg: '修改商品成功'
    });
};
//获取角色列表
const getRoles = async (req, res) => {
    let sql = 'select * from role ';
    const result = await malldb(sql, [], res);
    res.json({
        status: 0,
        data: result
    });
};
//添加角色
const addRole = async (req, res) => {
    let sql = 'select * from role where roleName = ?';
    let result = await malldb(sql, req.body.roleName, res);
    if (!result.length) {
        let sqlinsert = 'insert into role set ?';
        await malldb(sqlinsert, req.body, res);
        let role = await malldb(sql, req.body.roleName, res);
        res.json({
            status: 0,
            data: role[0]
        });
    } else {
        res.json({
            status: 1,
            msg: '角色已存在'
        });
    }
};
const addRolePermission = async (req, res) => {
    let sql = 'update role set ? where roleId = ?';
    let roleId = req.body.roleId;
    delete req.body.roleId;
    let result = await malldb(sql, [req.body, roleId], res);
    res.json({
        status: 0,
        msg: '设置权限成功'
    });
};
const deleteRole = async (req, res) => {
    let sql = 'delete from  role where roleId=?';
    await malldb(sql, req.body.roleId, res);
    res.json({
        status: 0,
        msg: '删除角色成功'
    });
};
const getHomeData = async (req, res) => {
    let sqlProduct = 'select count(*) as productCount from t_sale_goods';
    let sqlstaff = 'select count(*) as staffCount from staff';
    let sqlcategory = 'select count(*) as categoryCount from t_category';
    let resProduct = await malldb(sqlProduct, [], res);
    let resstaff = await malldb(sqlstaff, [], res);
    let rescategory = await malldb(sqlcategory, [], res);
    res.json({
        status: 0,
        data: {
            productCount: resProduct[0].productCount,
            staffCount: resstaff[0].staffCount,
            categoryCount: rescategory[0].categoryCount
        }
    });
};

module.exports = {
    findAllStaffs,
    findStaff,
    addStaff,
    delteStaff,
    findFirstLevelCategorys,
    addFirstLevelCategory,
    updateFirstLevelCategory,
    deleteFirstLevelCategory,
    findeSecondayCategorys,
    addSecondaryCategory,
    updateSecondaryCategory,
    deleteSecondaryCategory,
    getAllProducts,
    updateProductStatus,
    sorterProduct,
    condtionSearch,
    searchAndSortProduct,
    deleteProductById,
    findeUserById,
    addProduct,
    updateProduct,
    searchSecondaryId,
    getRoles,
    addRole,
    addRolePermission,
    deleteRole,
    updateStaff,
    getHomeData,
    updateAvatar
};
