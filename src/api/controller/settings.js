const Base = require("./base.js");
module.exports = class extends Base {
  async showSettingsAction() {
    let info = await this.model("show_settings")
      .where({
        id: 1,
      })
      .find();
    return this.success(info);
  }
  async saveAction() {
    let userId = this.getLoginUserId();
    let name = this.post("name");
    let mobile = this.post("mobile");
    let nickName = this.post("nickName");
    let avatar = this.post("avatar");
    let name_mobile = 0;
    if (name != "" && mobile != "") {
      name_mobile = 1;
    }
    const newbuffer = Buffer.from(nickName);
    let nickname = newbuffer.toString("base64");
    let data = {
      name: name,
      mobile: mobile,
      nickname: nickname,
      avatar: avatar,
      name_mobile: name_mobile,
    };
    let info = await this.model("user")
      .where({
        id: userId,
      })
      .update(data);
    return this.success(info);
  }
  async userDetailAction() {
    let userId = this.getLoginUserId();
    if (userId != 0) {
      let userInfo = await this.model("user")
        .where({
          id: userId,
        })
        .field("id,mobile,name,nickname,avatar")
        .find();
      
      let balanceInfo = await this.model("user_balance")
        .where({
          user_id: userId
        })
        .field("user_level_name,balance")
        .find();
      
      // 铺平的数据结构
      const responseData = {
        id: userInfo.id,
        mobile: userInfo.mobile,
        name: userInfo.name,
        nickname: Buffer.from(userInfo.nickname, "base64").toString(),
        avatar: userInfo.avatar,
        user_level_name: balanceInfo.user_level_name || '',
        balance: balanceInfo.balance || 0
      };

      return this.success(responseData);
    }
    else{
      return this.fail(100,'未登录')
    }
  }
};
