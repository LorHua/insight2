webpackJsonp([22],{"4svB":function(t,e){},cTSE:function(t,e,i){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var a=i("mvHQ"),n=i.n(a),o=i("INCx"),s=i.n(o),r=i("X2Oc"),l={name:"point",components:{},data:function(){return{frozenVisible:!1,unfrozenVisible:!1,rewardVisible:!1,is_pointrecord:0,form_errors:[],cur_entity:{},add_url:"/api/point/insert_update",list_url:"/api/point/list",del_url:"/api/point/del",del_list:new URLSearchParams,tableData:[],select_word:"",cur_page:1,page_size:10,total:0,multipleSelection:[],editVisible:!1,createVisible:!1,form:{}}},created:function(){this.getData()},updated:function(){this.$desensitive()},computed:{},filters:{formatDate:function(t){var e=new Date(s()(1e3*t));return Object(r.c)(e,"yyyy-MM-dd HH:mm:ss")},statusFilter:function(t){return{0:"info",1:"success",2:"danger"}[t]}},methods:{changeType:function(t){console.log(t),this.getData()},doOp:function(t){var e=this;this.form.id=this.cur_entity.id,this.$axios.post("/api/point/"+t,Object(r.h)(this.form)).then(function(t){1==t.data.status?(e.$message.success("操作成功"),e.getData()):e.$message.error("操作失败, 错误码:"+t.data.status+t.data.msg),e.frozenVisible=!1,e.unfrozenVisible=!1,e.rewardVisible=!1})},checkSelected:function(){return"{}"!=n()(this.cur_entity)||(this.$message.info("请选择数据"),!1)},sortChange:function(t,e,i){this.sortcolumn=t.prop,this.sortorder=t.order,this.getData()},viewUser:function(){this.cur_entity.id?this.$router.push({name:"viewuser",params:this.cur_entity}):this.$message.info("请选择数据")},doCreate:function(t){var e=this;this.$axios.post(this.add_url,Object(r.h)(this.form)).then(function(t){1==t.data.status?(e.$message.success("操作成功"),e.getData()):e.$message.error("操作失败, 错误码:"+t.data.status+t.data.msg),e.createVisible=!1,e.editVisible=!1})},getData:function(){var t=this;this.$axios.get(this.is_pointrecord?"api/point/log":this.list_url,{params:{search:this.select_word,page_index:this.cur_page,page_size:this.page_size,sort:this.sortcolumn,direction:this.sortorder}}).then(function(e){t.tableData=e.data.result,t.total=e.data.total})},handleSizeChange:function(t){this.page_size=t,this.getData()},handleCurrentChange:function(t){this.cur_page=t,this.getData()},handleCurrentChangeRow:function(t){this.cur_entity=t},search:function(){this.getData()},handleEdit:function(t,e){this.form_errors=[],this.editVisible=!0,this.form=e,delete this.form.password,delete this.form.create_time,this.form.enable=1==e.enable?"1":"0"},handleSelectionChange:function(t){this.multipleSelection=t},dataDel:function(t){var e=this,i=null;if(t)i=t;else{if(this.multipleSelection.length<=0)return void this.$message.info("未选择任何数据");this.del_list=this.multipleSelection.map(function(t){return t.id}),i=this.del_list}this.$confirm("是否确认此操作","提示",{confirmButtonText:"确认",cancelButtonText:"取消",type:"warning"}).then(function(){e.$axios.post(e.del_url,Object(r.h)({id:i})).then(function(t){t.data.status>=1?(e.getData(),e.$message.success("删除成功")):e.$message.error("删除失败, 错误码: "+t.data.status)})}).catch(function(){})}}},c={render:function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",[i("div",{staticClass:"crumbs"},[i("el-breadcrumb",{attrs:{separator:"/"}},[i("el-breadcrumb-item",[i("i",{staticClass:"el-icon-tickets"}),t._v(" 成长\n      ")]),t._v(" "),i("el-breadcrumb-item",[t._v("积分")])],1)],1),t._v(" "),i("div",{staticClass:"container"},[i("div",{staticClass:"handle-box"},[i("el-input",{staticClass:"handle-input mr10",attrs:{size:"mini",placeholder:"关键词"},nativeOn:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.search()}},model:{value:t.select_word,callback:function(e){t.select_word=e},expression:"select_word"}}),t._v(" "),i("el-button",{attrs:{size:"mini",type:"primary",icon:"search"},on:{click:t.search}},[t._v("搜索")]),t._v(" "),i("el-checkbox",{staticStyle:{"margin-bottom":"10px"},on:{change:t.changeType},model:{value:t.is_pointrecord,callback:function(e){t.is_pointrecord=e},expression:"is_pointrecord"}},[t._v("积分记录")]),t._v(" "),i("div",{directives:[{name:"show",rawName:"v-show",value:!t.is_pointrecord,expression:"!is_pointrecord"}],staticStyle:{float:"right"}},[i("el-button",{attrs:{size:"mini",type:"warning",icon:"search"},on:{click:function(e){t.checkSelected()&&(t.frozenVisible=!0)}}},[t._v("冻结积分")]),t._v(" "),i("el-button",{attrs:{size:"mini",icon:"search"},on:{click:function(e){t.checkSelected()&&(t.unfrozenVisible=!0)}}},[t._v("解冻积分")]),t._v(" "),i("el-button",{attrs:{size:"mini",type:"success",icon:"search"},on:{click:function(e){t.checkSelected()&&(t.rewardVisible=!0)}}},[t._v("奖励积分")])],1)],1),t._v(" "),i("el-table",{directives:[{name:"show",rawName:"v-show",value:!t.is_pointrecord,expression:"!is_pointrecord"}],attrs:{data:t.tableData,border:"","highlight-current-row":""},on:{"selection-change":t.handleSelectionChange,"current-change":t.handleCurrentChangeRow,"sort-change":t.sortChange}},[i("el-table-column",{attrs:{prop:"username",label:"用户名","min-width":"150"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("span",{staticClass:"insight_sensitive"},[t._v("     "+t._s(e.row.username)+"  ")])]}}])}),t._v(" "),i("el-table-column",{attrs:{prop:"total_points",label:"总积分","min-width":"180",sortable:"custom"}}),t._v(" "),i("el-table-column",{attrs:{prop:"frozen_points",label:"冻结积分","min-width":"180",sortable:"custom"}}),t._v(" "),i("el-table-column",{attrs:{prop:"total_points",label:"可用积分","min-width":"180",sortable:"custom"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v(t._s(e.row.total_points-e.row.frozen_points))]}}])}),t._v(" "),i("el-table-column",{attrs:{prop:"hornor",label:"称号","min-width":"180"}})],1),t._v(" "),i("el-table",{directives:[{name:"show",rawName:"v-show",value:t.is_pointrecord,expression:"is_pointrecord"}],attrs:{data:t.tableData,border:"","highlight-current-row":""},on:{"selection-change":t.handleSelectionChange,"current-change":t.handleCurrentChangeRow,"sort-change":t.sortChange}},[i("el-table-column",{attrs:{prop:"operator",label:"操作人","min-width":"80"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("span",{staticClass:"insight_sensitive"},[t._v("     "+t._s(e.row.operator)+"  ")])]}}])}),t._v(" "),i("el-table-column",{attrs:{prop:"relate_user",label:"操作对象","min-width":"80"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("span",{staticClass:"insight_sensitive"},[t._v("     "+t._s(e.row.relate_user)+"  ")])]}}])}),t._v(" "),i("el-table-column",{attrs:{prop:"create_time",label:"时间","min-width":"120"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v(t._s(t._f("formatDate")(e.row.create_time)))]}}])}),t._v(" "),i("el-table-column",{attrs:{prop:"title",label:"积分记录类型","min-width":"80"}}),t._v(" "),i("el-table-column",{attrs:{prop:"total_points",label:"总积分","min-width":"50"}}),t._v(" "),i("el-table-column",{attrs:{prop:"frozen_points",label:"冻结积分","min-width":"50"}}),t._v(" "),i("el-table-column",{attrs:{prop:"available_points",label:"可用积分","min-width":"50"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v(t._s(e.row.available_points))]}}])}),t._v(" "),i("el-table-column",{attrs:{prop:"message_id",label:"消息编号","min-width":"180"}})],1),t._v(" "),i("div",{staticClass:"pagination"},[i("el-pagination",{attrs:{"current-page":t.cur_page,"page-sizes":[10,20,50,100],"page-size":t.page_size,layout:"total, sizes, prev, pager, next, jumper",total:t.total},on:{"size-change":t.handleSizeChange,"current-change":t.handleCurrentChange,"update:currentPage":function(e){t.cur_page=e},"update:current-page":function(e){t.cur_page=e},"update:pageSize":function(e){t.page_size=e},"update:page-size":function(e){t.page_size=e},"update:total":function(e){t.total=e}}})],1)],1),t._v(" "),i("el-dialog",{attrs:{title:"冻结积分",visible:t.frozenVisible,width:"30%"},on:{"update:visible":function(e){t.frozenVisible=e}}},[i("el-form",{ref:"form",attrs:{model:t.form,"label-width":"80px"}},[i("el-form-item",{attrs:{label:"积分数量"}},[i("el-input-number",{attrs:{step:2},model:{value:t.form.point,callback:function(e){t.$set(t.form,"point",e)},expression:"form.point"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"操作原因"}},[i("el-input",{attrs:{type:"textarea",autosize:"",placeholder:"请输入内容"},model:{value:t.form.content,callback:function(e){t.$set(t.form,"content",e)},expression:"form.content"}})],1)],1),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.doOp("frozen")}}},[t._v("确定")])],1)],1),t._v(" "),i("el-dialog",{attrs:{title:"奖励积分",visible:t.rewardVisible,width:"30%"},on:{"update:visible":function(e){t.rewardVisible=e}}},[i("el-form",{ref:"form",attrs:{model:t.form,"label-width":"80px"}},[i("el-form-item",{attrs:{label:"积分数量"}},[i("el-input-number",{attrs:{step:2},model:{value:t.form.point,callback:function(e){t.$set(t.form,"point",e)},expression:"form.point"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"操作原因"}},[i("el-input",{attrs:{type:"textarea",autosize:"",placeholder:"请输入内容"},model:{value:t.form.content,callback:function(e){t.$set(t.form,"content",e)},expression:"form.content"}})],1)],1),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.doOp("reward")}}},[t._v("确定")])],1)],1),t._v(" "),i("el-dialog",{attrs:{title:"解冻积分",visible:t.unfrozenVisible,width:"30%"},on:{"update:visible":function(e){t.unfrozenVisible=e}}},[i("el-form",{ref:"form",attrs:{model:t.form,"label-width":"80px"}},[i("el-form-item",{attrs:{label:"积分数量"}},[i("el-input-number",{attrs:{step:2},model:{value:t.form.point,callback:function(e){t.$set(t.form,"point",e)},expression:"form.point"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"操作原因"}},[i("el-input",{attrs:{type:"textarea",autosize:"",placeholder:"请输入内容"},model:{value:t.form.content,callback:function(e){t.$set(t.form,"content",e)},expression:"form.content"}})],1)],1),t._v(" "),i("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{attrs:{type:"primary"},on:{click:function(e){return t.doOp("unfrozen")}}},[t._v("确定")])],1)],1)],1)},staticRenderFns:[]};var u=i("VU/8")(l,c,!1,function(t){i("4svB")},"data-v-5d5b668b",null);e.default=u.exports}});