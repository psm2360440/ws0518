<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let std_detail = {
        init:()=>{
            $('#std_update_btn').click(() =>{
                std_detail.send();
            });
            $('#std_delete_btn').click(()=>{
                let d = confirm("wanna delete?");
                if(d){
                    location.href = '/student/deleteimpl?id=${std.id}';
                }
            });
        },
        send:()=>{
            $('#std_detail_form').attr({
                action:'/student/updateimpl',
                method:'post',
            });
            $('#std_detail_form').submit();
        }
    };
    $(function(){
        if("${loginadm.lev}">=3){
            $('#pwd').removeAttr('readonly');
        };
        std_detail.init();
    });
</script>

<!-- partial -->

<div class="content-wrapper">
    <div class="row justify-content-center">
        <div>
                <c:choose>
                    <c:when test="${std.img==null || (std.img).equals('')}"><img id="item_img" src="/images/adm.png" alt="profile img" style="width:90px; height:90px; border-radius:50%; overflow: hidden; margin-bottom: 10px">
                    </c:when>
                    <c:when test="${std.img!=null || !(std.img).equals('')}"><img id="item_img" src="/uimg/${std.img}" alt="${obj.img}" style="width:90px; height:90px; border: 1px solid lightsteelblue;border-radius:50%; overflow: hidden; margin-bottom: 20px"/></c:when>
                </c:choose>
        </div>
        <div class="col-sm-6">
                <div class="card" style="margin: 0 10px">
                    <div class="card-body">
                        <h4 class="card-title">Student Detail</h4>
                        <p class="card-description">
                            Student Detail
                        </p>

                        <form id = "std_detail_form" class="forms-sample">
                            <div class="form-group">
                                <label for="id">ID</label>
                                <input type="text" class="form-control" name = "id" id="id" value="${std.id}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="pwd">PWD</label>
                                <input type="password" class="form-control" name = "pwd" id="pwd" value="${std.pwd}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="name">NAME</label>
                                <input type="text" class="form-control" id="name" name = "name" value="${std.name}">
                            </div>
                            <div class="form-group">
                                <label for="email">EMAIL</label>
                                <input type="text" class="form-control" id="email" name = "email" value="${std.email}">
                            </div>
                            <div class="form-group">
                                <label for="contact">CONTACT</label>
                                <input type="text" class="form-control" id="contact" name = "contact" value="${std.contact}">
                            </div>

                            <button id = "std_update_btn" type="button" class="btn btn-primary mr-2">Update</button>
                            <button id = "std_delete_btn" type="button" class="btn btn-light">Delete</button>
                        </form>
                    </div>
                </div>
        </div>
    </div>
</div>
<!-- content-wrapper ends -->
