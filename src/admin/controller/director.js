const Base = require('./base.js');

module.exports = class extends Base {
    /**
     * 获取理事列表
     * @return {Promise} []
     */
    async indexAction() {
        const model = this.model('director');
        const data = await model.order('sort_order asc').select();

        // 格式化添加时间
        for (const item of data) {
            if (item.add_time) {
                item.add_time = think.datetime(item.add_time);
            }
        }

        return this.success(data);
    }

    /**
     * 添加理事
     */
    async addAction() {
        const name = this.post('name');
        const position = this.post('position');
        const avatar = this.post('avatar');
        const introduction = this.post('introduction');
        const sort_order = this.post('sort_order') || 1000;
        const is_show = this.post('is_show') || 1;

        let info = {
            name,
            position,
            avatar,
            introduction,
            sort_order,
            is_show,
            add_time: parseInt(new Date().getTime() / 1000)
        }

        const model = this.model('director');
        const data = await model.add(info);
        return this.success(data);
    }

    /**
     * 更新理事信息
     */
    async updateAction() {
        const id = this.post('id');
        const name = this.post('name');
        const position = this.post('position');
        const avatar = this.post('avatar');
        const introduction = this.post('introduction');
        const sort_order = this.post('sort_order');
        const is_show = this.post('is_show');

        let info = {
            name,
            position,
            avatar,
            introduction,
            sort_order,
            is_show
        }

        const model = this.model('director');
        const data = await model.where({id: id}).update(info);
        return this.success(data);
    }

    /**
     * 删除理事
     */
    async deleteAction() {
        const id = this.post('id');
        await this.model('director').where({id: id}).limit(1).delete();
        return this.success();
    }

    /**
     * 获取理事详情
     * @return {Promise} []
     */
    async infoAction() {
        const id = this.get('id');
        
        if (!id) {
            return this.fail('理事ID不能为空');
        }

        const model = this.model('director');
        const data = await model.where({id: id}).find();
        
        if (think.isEmpty(data)) {
            return this.fail('理事不存在');
        }

        // 格式化添加时间
        if (data.add_time) {
            data.add_time = think.datetime(data.add_time);
        }

        return this.success(data);
    }

    /**
     * 更新理事显示状态
     */
    async updateShowAction() {
        const id = this.post('id');
        const is_show = this.post('is_show');
        
        const model = this.model('director');
        const data = await model.where({id: id}).update({is_show: is_show});
        return this.success(data);
    }

    /**
     * 更新理事排序
     */
    async updateSortAction() {
        const id = this.post('id');
        const sort_order = this.post('sort_order');
        
        const model = this.model('director');
        const data = await model.where({id: id}).update({sort_order: sort_order});
        return this.success(data);
    }
} 