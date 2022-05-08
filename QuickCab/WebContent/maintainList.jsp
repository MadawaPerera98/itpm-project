<%@page import="com.taxiMe.services.Smaintain"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.taxiMe.interfaces.Imaintain"%>
<%@page import="com.taxiMe.model.Maintaine"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="color: var(--bs-light);border-color: var(--bs-orange);">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register - TaxiMe</title>
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

<body class="bg-gradient-primary" style="border-color: var(--bs-orange);background: var(--bs-orange);">
    <div class="container" style="border-color: var(--bs-orange);">
        <div class="card shadow-lg o-hidden border-0 my-5">
            <div class="card-body p-0">
                <div class="row">
                    <a href="VehicleManegment.jsp"><div class="col" style="width: 785px;"><button class="btn btn-primary" type="button" style="height: 100%;border-radius: 0px;border-style: none;"><i class="fa fa-arrow-left"></i></button></div></a>
                    <div class="col-lg-5 d-none d-lg-flex" style="height: 457px;width: 476px;"><img src="assets/img/1.png" style="width: 100%;"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            
                            <%
                            String id = request.getParameter("id");
                 Imaintain maintainService = new Smaintain();
                 ArrayList<Maintaine> maintainList = maintainService.getMaintaineByVehicleId(id);
                %>
                <div class="text-center">
                                <h4 class="text-dark mb-4">Maintains list of <span class="text-danger"><%=id %></span></h4>
                            </div>
                            <div class="">
							  <table class="table table-responsive table-hover">
							    <thead>
                                    
                                        <tr class="table-warning">
                                            <th>ID</th> 
                                            <th>Status</th>
                                            <th>Part Id</th>
                                            <th>Qty</th>
                                            <th>Description</th>
                                            <th>Date</th>
                                            <th>Option</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for(Maintaine maintaine:maintainList){ %>
                                        <tr>
                                            <td style="color: var(--bs-danger);"><%=maintaine.getId() %></td> 
                                            <td><%=maintaine.getStatus() %></td>
                                            <td><%=maintaine.getPartId() %></td>
                                            <td><%=maintaine.getQty() %></td>
                                            <td><%=maintaine.getDescription() %></td>
                                            <td><%=maintaine.getDate() %></td>
                                            <td>
                                                <div>
                                                    <div class="row">
                                                        <div class="col" >
                                                       		 <a href="updateVehicleMaintaines.jsp?id=<%=maintaine.getId()%>" class="btn-sm btn-secondary" style="cursor: pointer;"><i class="fa fa-pencil"></i></a>
												        </div>
                                                         
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <%} %>
                                    </tbody>
							  </table>
							</div>
                            <div class="text-center"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>