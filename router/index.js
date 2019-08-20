const express = require('express');
const service = require('../service');
//加载路由器中间件
const router = express.Router();
//员工管理路由
router.get('/staff/list', service.findAllStaffs);
router.post('/login',service.findStaff);
router.post('/register', service.addStaff);
router.get('/deleteStaff',service.delteStaff);
router.post('/updateStaff',service.updateStaff);
router.post('/updataStaffAvatar',service.updateAvatar);
//一级分类列表路由
router.get('/productCategory/list',service.findFirstLevelCategorys);
router.post('/productCategory/add',service.addFirstLevelCategory);
router.post('/productCategory/update',service.updateFirstLevelCategory);
router.get('/productCategory/delete',service.deleteFirstLevelCategory);
//二级分类列表路由
router.get('/productSecondaryCategory/list',service.findeSecondayCategorys);
router.post('/productSecondaryCategory/add',service.addSecondaryCategory);
router.post('/productSecondaryCategory/update',service.updateSecondaryCategory);
router.get('/productSecondaryCategory/delete',service.deleteSecondaryCategory);
router.post('/productSecondaryCategory/findSecondaryId',service.searchSecondaryId);
//商品路由
router.get('/products/list', service.getAllProducts);
router.post('/product/updateStatus',service.updateProductStatus);
router.get('/product/sorter', service.sorterProduct);
router.post('/product/conditionSearch',service.condtionSearch);
router.post('/product/searchAndSort',service.searchAndSortProduct);
router.get('/product/deleteProduct',service.deleteProductById);
router.post('/product/addProduct', service.addProduct);
router.post('/product/updateProduct',service.updateProduct);
//角色权限路由
router.get('/role/list',service.getRoles);
router.post('/role/add',service.addRole);
router.post('/role/addPermission',service.addRolePermission);
router.post('/role/deleteRole',service.deleteRole);
router.get('/homedata',service.getHomeData);
//商城用户路由
router.get('/user/searchById', service.findeUserById);
require('./file-upload')(router);
module.exports = router;