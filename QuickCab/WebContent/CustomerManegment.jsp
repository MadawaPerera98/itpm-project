<%@page import="com.taxiMe.model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.taxiMe.services.Scustomer"%>
<%@page import="com.taxiMe.interfaces.Icustomer"%>
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
<%Icustomer customerService = new Scustomer();
                       	 ArrayList<Customer> customerList = customerService.getCustomerList();
                       %>
    <div id="wrapper">
       <jsp:include page="header.jsp"/>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                
                  <jsp:include page="title.jsp"/>
                <h3 class="text-dark mb-4">Customer management</h3>
                <div class="container-fluid">
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                   
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Telephone number</th>
                                            <th>Gender</th>
                                            <th>User Name</th>
                                            <th>Option</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <%for(Customer customer : customerList){ %>
                                        <tr>
                                            <td><%=customer.getId() %></td>
                                            <td><%=customer.getName() %></td>
                                            <td><%=customer.getMail()%></td>
                                            <td><%=customer.getTelephone()%></td>
                                            <td><%=customer.getGender() %></td>
                                            <td><%=customer.getUserName() %></td>
                                            <td>
                                                <div>
                                                    <div class="row">
                                                        <div class="col" style="width: 20px;padding-left: 0px;padding-right: 0px;height: 36px;margin-right: -74px;">
                                                       		 <a href="customerUpdate.jsp?id=<%=customer.getId() %>" class="btn-sm btn-secondary" style="cursor: pointer;"><i class="fa fa-pencil"></i></a>
												        </div>
                                                        <div class="col" style="width: 57.6px;padding-right: 0px;padding-left: 2px;margin-left: 22px;">
                                                        	 <a  href="deleteCustomer?id=<%=customer.getId() %>" class="btn-sm btn-secondary bg-danger" style="color:white;"><i class="fa fa-trash"></i></a>
														</div>
                                                    </div>
                                                </div>
                                            </td>
                                       
                                        
                                        
                                        <div class="modal fade" id="a" tabindex="-1" role="dialog" aria-labelledby="mTitle" aria-hidden="false">
											  <div class="modal-dialog" role="document">
												<div class="modal-content">
												  <div class="modal-header">
													<h5 class="modal-title bg-secondry" id="mTitle">Edit Rent Details</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													  <span aria-hidden="true">&times;</span>
													</button>
												  </div>
												  <div class="modal-body  ">
												  
												</div>
											  </div>
											</div>
										</div>
                                        <div class="modal fade" id="m<%=customer.getId()%>" tabindex="-1" role="dialog" aria-labelledby="mTitle" aria-hidden="true" style="z-index: 5;">
						                    <div class="modal-dialog" role="document">
						                        <div class="modal-content">
						                            <div class="modal-header" style="font-size: 24px;color: var(--bs-orange);background: rgb(245,181,128);">
						                                <h4 class="modal-title" style="color: var(--bs-gray-dark);">Edit User Details</h4><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						                            </div>
						                            <div class="modal-body" style="border-style: none;">
						                                <form class="user">
						                                    <div class="row mb-3">
						                                        <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="exampleFirstName-1" placeholder="First Name" name="first_name" style="border-radius: 0px;"></div>
						                                        <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="exampleFirstName-2" placeholder="Last Name" name="last_name" style="border-radius: 0px;"></div>
						                                    </div>
						                                    <div class="mb-3"><input class="form-control form-control-user" type="email" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Email Address" name="email" style="border-radius: 0px;"></div>
						                                    <div class="row mb-3">
						                                        <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="password" id="examplePasswordInput" placeholder="Telephone Number" name="tel" inputmode="tel" style="border-radius: 0px;"></div>
						                                        <div class="col-sm-6"><label class="form-label">Gender</label>
						                                            <div class="form-check" style="width: 116px;padding-left: 24px;"><input class="form-check-input" type="radio" id="formCheck-1" name="gender"><label class="form-check-label" for="formCheck-1">Male</label></div>
						                                            <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-2" name="gender"><label class="form-check-label" for="formCheck-2">Female</label></div>
						                                        </div>
						                                    </div>
						                                    <div class="row mb-3" style="width: 100%;">
						                                        <div class="col-12 col-sm-6 text-start mb-3 mb-sm-0" style="width: 721px;"><textarea class="form-control form-control-lg" name="address" placeholder="Address" style="height: 53.2px;font-size: 12.8px;width: 635px;border-radius: 0px;"></textarea></div>
						                                    </div>
						                                    <hr>
						                                    <div class="row mb-3">
						                                        <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="password" id="examplePasswordInput-1" placeholder="User Name" name="uName" style="border-radius: 0px;"></div>
						                                    </div><button class="btn btn-primary d-block btn-user w-100" type="submit" style="border-radius: 0px;background: var(--bs-orange);border-color: var(--bs-orange);">Update</button>
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
                                         </tr>
                                        
                                        <%} %>
                                    </tbody>
                                    <tfoot>
                                        <tr></tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <%-- ><div class="text-center my-auto copyright"><span>Copyright © TaxiMe 2021</span></div>--%>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>