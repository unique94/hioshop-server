const Base = require('./base.js');

module.exports = class extends Base {
    /**
     * 添加理事信息
     * @return {Promise} []
     */
    async addAction() {
        const name = this.post('name');
        const position = this.post('position');
        const avatar = this.post('avatar');
        const introduction = this.post('introduction');
        const sort_order = this.post('sort_order') || 1000;
        const is_show = this.post('is_show') || 1;

        // 数据校验
        if (!name || !position) {
            return this.fail('姓名和职位不能为空');
        }

        const model = this.model('director');
        const data = {
            name: name,
            position: position,
            avatar: avatar,
            introduction: introduction,
            sort_order: sort_order,
            is_show: is_show,
            add_time: parseInt(new Date().getTime() / 1000)
        };

        try {
            const insertId = await model.add(data);
            return this.success(insertId);
        } catch (err) {
            return this.fail('添加失败');
        }
    }
} 