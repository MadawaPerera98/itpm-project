<%@page import="java.util.ArrayList"%>
<%@page import="com.taxiMe.services.Svehicle"%>
<%@page import="com.taxiMe.interfaces.Ivehicle"%>
<%@page import="com.taxiMe.model.Vehicle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - TaxiMe</title>
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/2.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/2.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/1.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/1.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="assets/img/1.png">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Article-Clean.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
</head>

<body id="page-top">
    <div id="wrapper">
         <jsp:include page="header.jsp"/>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <jsp:include page="title.jsp"/>
                <h3 class="text-dark mb-4">Vehicle management</h3>
                <div class="container">
                    <div class="row">
                        <div class="col"><a href="addVehicle.jsp"><button class="btn btn-primary" type="button" style="margin-bottom: 29px;">Add Vehicle</button></a></div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 fw-bold">Vehicles</p>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>Vehicle Number</th>
                                            <th>No Of pasengers</th>
                                            <th>Type</th>
                                            <th>Address</th>
                                            <th>Owner Name</th>
                                            <th>Status</th>
                                            <th>Maintains</th>
                                            <th>Option</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%  Ivehicle service = new Svehicle();
                                    	ArrayList<Vehicle> vehicleList= service.getVehicleList();
                                    	for(Vehicle vehicle : vehicleList){
                                    	%>
                                        <tr>
                                            <td style="color: rgb(119, 50, 168);"><%=vehicle.getVehicleNumber() %></td>
                                            <td><%=vehicle.getNoOfPasenger() %></td>
                                            <td><%=vehicle.getType() %></td>
                                            <td><%=vehicle.getAddress() %></td>
                                            <td><%=vehicle.getOwnerName() %></td>
                                            <%if (!vehicle.getStatus().equals("not-assigned")){ %>
                                            <td class="text-success"><%=vehicle.getStatus() %></td>
                                            <%}else{ %>
                                            <td class="text-danger"><%=vehicle.getStatus() %></td>
                                            <%} %>
                                            <td><a href="maintainList.jsp?id=<%=vehicle.getVehicleNumber() %>" class="btn-sm btn-primary" type="button">View</a></td>
                                             <td>
                                                <div>
                                                    <div class="row">
                                                        <div class="col" style="width: 20px;padding-left: 0px;padding-right: 0px;height: 36px;margin-right: -74px;">
                                                        <a href="updateVehicle.jsp?id=<%=vehicle.getVehicleNumber() %>" class="btn btn-circle btn-primary" type="button" style="background: var(--bs-primary);border-color: var(--bs-primary);"><i class="fa fa-pencil"></i></a></div>
                                                        <div class="col" style="width: 57.6px;padding-right: 0px;padding-left: 2px;margin-left: 22px;">
                                                        <a href="deleteVehicle?id=<%=vehicle.getVehicleNumber() %>" class="btn btn-danger btn-circle ms-1" role="button"><i class="fas fa-trash text-white"></i></a></div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </tbody>
                                    <tfoot>
                                        <tr></tr>
                                    </tfoot>
                                </table>
                            </div>  </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <%--<div class="text-center my-auto copyright"><span>Copyright © TaxiMe 2021</span></div> --%>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="font-size: 24px;color: var(--bs-orange);background: rgb(245,181,128);">
                    <h4 class="modal-title" style="color: var(--bs-gray-dark);">Edit Vehicle maintain Details</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="border-style: none;">
                    <form class="user">
                        <div class="row mb-3">
                            <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="exampleFirstName-1" placeholder="Vehicle Number" name="VNumber" style="border-radius: 0px;"></div>
                            <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="exampleFirstName-2" placeholder="Number of pasengers" name="noOfPAsengers" style="border-radius: 0px;"></div>
                        </div>
                        <div class="mb-3"></div>
                        <div class="row mb-3">
                            <div class="col-sm-6 mb-3 mb-sm-0"><textarea class="form-control form-control-lg" name="owner_info" placeholder="Owner Infomation" style="height: 135.2px;font-size: 12.8px;width: 218px;border-radius: 0px;"></textarea></div>
                            <div class="col-sm-6"><label class="form-label">Vehicle type</label>
                                <div class="form-check" style="width: 116px;padding-left: 24px;"><input class="form-check-input" type="radio" id="formCheck-1" name="gender"><label class="form-check-label" for="formCheck-1">Car</label></div>
                                <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-4" name="gender"><label class="form-check-label" for="formCheck-2">Van</label></div>
                                <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-3" name="gender"><label class="form-check-label" for="formCheck-2">TuckTuck</label></div>
                                <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-5" name="gender"><label class="form-check-label" for="formCheck-2">Truck</label></div>
                            </div>
                        </div>
                        <hr><button class="btn btn-primary d-block btn-user w-100" type="submit" style="border-radius: 0px;background: var(--bs-orange);border-color: var(--bs-orange);">Add</button>
                        <hr>
                    </form>
                </div>
                <div class="modal-footer" style="background: #f5b580;"></div>
            </div>
        </div>
    </div>
    <div class="modal fade" role="dialog" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background: rgb(254,185,178);">
                    <h4 class="modal-title">TAXIME</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure</p>
                </div>
                <div class="modal-footer"><button class="btn btn-light" type="button" data-bs-dismiss="modal">No</button><button class="btn btn-primary" type="button" style="border-color: var(--bs-red);background: var(--bs-red);">Yes</button></div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>