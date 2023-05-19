<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- partial -->

<div class="content-wrapper">
    <div class="row">

        <div class="col-lg-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Announcement Board</h4>

                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Writer</th>
                                <th>Rdate</th>
                                <th>File</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${anc}">
                                <tr>
                                    <td>${obj.id}</td>
                                    <td><a href="/anc/detail?id=${obj.id}">${obj.title}</a></td>
                                    <td>${obj.writer}</td>
                                    <td>${obj.rdate}</td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
                <!-- content-wrapper ends -->
