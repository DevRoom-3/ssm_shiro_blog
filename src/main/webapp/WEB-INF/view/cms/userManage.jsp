<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/style/bootstrap-table/bootstrap-table.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/userRoleList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/style/pnotify/pnotify.custom.min.css">
<link rel="stylesheet"
      href="${pageContext.request.contextPath }/style/datetimepicker/css/bootstrap-datetimepicker.min.css">
<script src="${pageContext.request.contextPath}/style/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/style/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/style/pnotify/pnotify.custom.min.js"></script>
<script src="${pageContext.request.contextPath }/style/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/style/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/style/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
        charset="UTF-8"></script>
<script>
    $(document).ready(function () {
        $('#table1').bootstrapTable({
            columns: [
                {
                    field: 'id',
                    title: 'ID',
                    align: "center",
                    width: "5%"
                },
                {
                    field: 'username',
                    title: '用户名',
                    align: "center",
                    width: "10%"
                },
                {
                    field: 'roles',
                    title: '拥有角色',
                    align: "center",
                    width: "20%"
                },
                {
                    field: 'option',
                    title: '操作',
                    width: "5%",
                    align: "center",
                    formatter: operateFormatter,
                    events: operateEvents1
                }

            ],
            url: '${pageContext.request.contextPath }/cms/userRoleList',
            pagination: true,
            pageList: [10, 15],
            search: false,
            showHeader: true,
            pageNumber: 1,
            striped: true
        })
    })

    function operateFormatter() {
        return [
            '<button type="button" class="btn btn-sm btn-primary btn-edit">修改</button>' + '&nbsp;'
        ].join('');
    }

    window.operateEvents1 = {
        "click .btn-edit": function (e, value, row, index) {
            $('#panelHeading').html(row.username+"&nbsp;"+'<a href="wer" style="color: #FFFFFF;font-size: 15px;align:right">[保存]</a>');
            $('#rolePanel').show();
            var userRoleStr = row.roles;//该行角色数组
            var roleOptions = [];//所有选项值
            $("input[type='checkbox']").removeAttr("checked");
            roleOptions = $("input[name = 'userRoles']").each(function () {
                // console.log($(this).val())
                for (var i = 0; i < userRoleStr.length; i++) {
                    if (userRoleStr[i] == $(this).val()) {
                        $(this).prop("checked", true);
                    }
                }
            })
        }
    }


</script>
<body>
<div class="search-wrap">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-2"><p class="search-title">会员查询(TODO)</p></div>
        <div class="col-md-2">
            <input type="text" class="form-control" id="exampleInputName2" placeholder="请输入用户名.">
        </div>
        <div class="col-md-2">
            <div class="form-group">
                <div class='input-group date' id='date1'>
                    <input type='text' class="form-control"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-primary">查找</button>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
<%--user list--%>
<div class="result-wrap">
    <div class="row">
        <div class="col-md-10">
            <table id="table1"></table>
        </div>
        <%--panel--%>
        <div class="col-md-2">
            <div class="panel panel-primary" id="rolePanel" style="display: none">
                <div class="panel-heading" id="panelHeading">修改角色</div>
                <div class="panel-body" id="panelBody">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="userRoles" value="admin">
                            admin
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="userRoles" value="user">
                            user
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="userRoles" value="JAVA_dev">
                            JAVA_dev
                        </label>
                    </div>
                    <div class="checkbox" id="a">
                        <label>
                            <input type="checkbox" name="userRoles" value="IOS_dev">
                            IOS_dev
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="userRoles" value="PHP_dev">
                            IOS_dev
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="userRoles" value="C++_dev">
                            IOS_dev
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="userRoles" value="PHP_dev">
                            PHP_dev
                        </label>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="userRoles" value="manager">
                            manger
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>