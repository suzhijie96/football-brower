<template>
  <div class="index-bg woo-box-flex">
    <!-- 菜单 -->
    <CampusMenu
      class="hidden-xs-only"
      v-if="categoryObj != null"
      :categoryObj="categoryObj"
      @handleCategory="selectCatrgory"
    ></CampusMenu>

    <div class="campus-main">
      <div class="woo-box-flex" :style="{ 'min-height': mainMinHeight + 'px' }">
        <!-- 消息盒子 -->
        <div class="content-t" v-loading="loading">
          <div v-if="contentVo.categoryId === '123' " style="width: 605px;">
            <el-empty :description="'暂无数据'" v-if="contentObj.length === 0"></el-empty>
            <FootballGame v-for="(item, key) in contentObj"
                              :key="key"
                              :gameInfo="item"
            ></FootballGame>
          </div>
          <div v-else-if="contentVo.categoryId === '1234'">
            <Activity v-for="(item, key) in activitiesObjList"
                      :key="key" :activity="item"
            ></Activity>
          </div>
          <div v-else>
            <Content
              v-for="(item, key) in contentObj"
              :key="key"
              :contentObj="item"
              :loveContentIds="loveContentIds"
            ></Content>
            <!-- 分页 -->
            <div class="fenye" v-if="!loading">
              <el-pagination
                :hide-on-single-page="true"
                background
                layout="prev, pager, next"
                :total="total"
                :current-page="currentPage"
                :page-size="5"
                @current-change="handleCurrentChange"
              >
              </el-pagination>
            </div>
          </div>
        </div>
        <!-- 侧边栏内容 -->
        <CampusSide class="hidden-xs-only"></CampusSide>
      </div>
    </div>
  </div>
</template>

<script>
//api
import touristApi from "@/api/tourist";
import operateApi from "@/api/operate";

import cookie from "js-cookie";

import { getToken, setToken, removeToken } from "@/utils/auth";
//引用组件
import Content from "@/components/Content";
import CampusMenu from "@/components/Menu";
import CampusSide from "@/components/CampusSide";

export default {
  components: { Content, CampusMenu },
  data() {
    return {
      //菜单分类
      categoryObj: null,
      activitiesObjList: [],
      //墙内容
      contentObj: [],
      //点赞的墙列表
      loveContentIds: [],
      contentVo: {
        pageNum: 1,
        categoryId: null,
      },
      //最低高度
      mainMinHeight: "",
      //是否加载
      loading: true,
      total: 0,
      currentPage: 1,
    };
  },

  //创建的时候自动调用
  created() {

    this.getAllCategorys();
    this.getContent(this.contentVo);
  },
  //创建后
  mounted() {
    this.mainMinHeight = document.documentElement.clientHeight - 45;
    this.contentVo.pageNum = 1;
    // this.contentVo.categoryId = 0;
  },
  methods: {
    //点击菜单后（子组件传递数据）
    selectCatrgory(data) {
      console.log(data);
      this.contentObj = []
      this.contentVo.categoryId = data;
      if (this.contentVo.categoryId === '123') {
        this.getEuFootballGames();
      } else if (this.contentVo.categoryId === '1234') {
        this.getAllActivities();
      } else {
        this.getContent(this.contentVo);
      }
    },

    getEuFootballGames() {
      this.loading = true;
      touristApi.getEuFootballGamesList().then((response) => {
        console.log(response.data);
        this.categoryObj = response.data;
        this.contentObj = response.data.matches;
        this.loading = false;
      }).catch((err) => {
        console.log(err);
        this.loading = false;
      })
    },

    getAllActivities() {
      this.loading = true;
      touristApi.getAllActivitiesList().then((response) => {
        console.log(response.data);
        this.activitiesObjList = response.data;
        this.loading = false;
      }).catch((err) => {
        console.log(err);
        this.loading = false;
      })
    },

    //获取全部分类
    getAllCategorys() {

      touristApi
        .getCategoryList()
        .then((response) => {
          this.categoryObj = response.data;
        })
        .catch();
    },
    //获取所有内容
    getContent(contentVo) {
      this.contentObj = []
      this.loading = true;
      touristApi
        .getContent(contentVo)
        .then((response) => {
          this.contentObj = response.rows;
          this.total = parseInt(response.total);
          this.loveContentIds = response.loveContentIds;
          this.loading = false;
        })
        .catch((response) => {});
    },
    //当页数改变的时候
    handleCurrentChange(val) {
      this.contentVo.pageNum = val;
      this.currentPage = this.contentVo.pageNum;
      this.getContent(this.contentVo);
    },
  },
};
</script>

<style>
.index-bg {
  /* box-shadow: 0 25px 45px rgb(0 0 0 / 10%); */
  /* border: 1px solid rgba(255, 255, 255, 0.5); */
  border-right: 1px solid rgba(255, 255, 255, 0.2);
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 10px;

  max-width: 1122px;
  margin: auto;
}
.tag-group {
  text-align: center;
}
/* 分页 */
.fenye {
  width: 100%;
  margin: 0 auto;
  text-align: center;
}
/* 标签 */
.clickable {
  margin-top: 5px;
  cursor: pointer;
}
.content-t {
  margin: 20px 0 0 0;
}
</style>
