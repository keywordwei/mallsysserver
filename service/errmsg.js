const dbErr = {
    status: 1,
    msg: '操作异常，请重新尝试'
};
const loginErr = {
    status: 1,
    msg: '用户名或密码不正确!'
};
const registerErr = {
    status: 1,
    msg: '用户名已存在，请更换用户名'
};
const addCategoryErr = {
    status: 1,
    msg: '品类名已存在,请更换其他品类名'
};
module.exports = {
    dbErr,
    loginErr,
    registerErr,
    addCategoryErr
};
