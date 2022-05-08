<%@page import="com.taxiMe.services.Semployee"%>
<%@page import="com.taxiMe.interfaces.Iemployee"%>
<%@page import="com.taxiMe.model.Employee"%>
<%@page import="com.taxiMe.model.Customer"%>
<%@page import="com.taxiMe.services.Scustomer"%>
<%@page import="com.taxiMe.interfaces.Icustomer"%>
<%@page import="com.taxiMe.model.Accident"%>
<%@page import="com.taxiMe.services.Saccident"%>
<%@page import="com.taxiMe.interfaces.Iaccident"%>
<%@page import="com.sun.tools.javac.Main"%>
<%@page import="com.taxiMe.model.Maintaine"%>
<%@page import="com.taxiMe.services.Smaintain"%>
<%@page import="com.taxiMe.interfaces.Imaintain"%>
<%@page import="com.taxiMe.model.Resarvation"%>
<%@page import="com.taxiMe.services.Sresarvation"%>
<%@page import="com.taxiMe.interfaces.Iresarvation"%>
<%@page import="com.taxiMe.model.Vehicle"%>
<%@page import="com.taxiMe.services.Svehicle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.taxiMe.interfaces.Ivehicle"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Report - TaxiMe</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Article-Clean.css">
    <link rel="stylesheet" href="assets/css/User-rating.css">
</head>

<body class="bg-gradient-primary" style="background: var(--bs-orange);" onload="load()">
    <div class="container">
        <div class="row" style="height: 370px;">
            <div class="col text-start d-xxl-flex justify-content-xxl-center" style="color: var(--bs-light);background: var(--bs-orange);">
                <div class="card shadow-lg o-hidden border-0 my-5" style="width: 982px;margin-left: 86px;height: 549px;">
                    <div class="card-body p-0" style="width: 100%;">
                        <div class="row row-cols-2" style="width: 1056px;height: 595px;">
                            <div class="col" style="width: 1027px;height: 541px;margin-left: 12px;">
                                <div class="row">
                                    <div class="col">
                                        <h1 style="color: rgb(135,139,149);width: 839px;margin-left: 10px;"><a class="btn btn-primary" href="index.jsp" style="height: 9%;border-radius: 28px;border-style: none;box-shadow: 2px 4px 16px 2px rgb(107,162,193);margin-right: 46px;background: var(--bs-purple);"><i class="fa fa-arrow-left"></i></a>Reports</h1>
                                    </div>
                                </div>
                                <div style="background: #ffffff;">
                                    <ul class="nav nav-tabs" role="tablist" style="background: #e7dede;width: 947px;padding-top: 9px;padding-bottom: 10px;border-radius: 46px;margin-bottom: 9px;margin-top: 25px;">
                                        <li class="nav-item" role="presentation" style="transform: scale(0.91);"><a class="nav-link active" role="tab" data-bs-toggle="tab" href="#tab-1" style="color: rgb(245,245,245);background: var(--bs-red);border-radius: 51px;margin: 11px 0px 7px 9px;margin-top: 6px;margin-bottom: 7px;margin-left: 9px;box-shadow: 0px 3px 13px var(--bs-red);border-style: none;">Vehicle</a></li>
                                        <li class="nav-item" role="presentation" style="transform: scale(0.91);"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-2" style="color: rgb(245,245,245);background: var(--bs-red);border-radius: 51px;margin: 11px 0px 7px 9px;margin-top: 6px;margin-bottom: 7px;margin-left: 9px;box-shadow: 0px 3px 13px var(--bs-red);border-style: none;">Reservation</a></li>
                                        <li class="nav-item" role="presentation" style="transform: scale(0.91);"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-3" style="color: rgb(245,245,245);background: var(--bs-red);border-radius: 51px;margin: 11px 0px 7px 9px;margin-top: 6px;margin-bottom: 7px;margin-left: 9px;box-shadow: 0px 3px 13px var(--bs-red);border-style: none;">Maintains</a></li>
                                        <li class="nav-item" role="presentation" style="transform: scale(0.91);"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-4" style="color: rgb(245,245,245);background: var(--bs-red);border-radius: 51px;margin: 11px 0px 7px 9px;margin-top: 6px;margin-bottom: 7px;margin-left: 9px;box-shadow: 0px 3px 13px var(--bs-red);border-style: none;">Accident coverage</a></li>
                                        <li class="nav-item" role="presentation" style="transform: scale(0.91);"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-5" style="color: rgb(245,245,245);background: var(--bs-red);border-radius: 51px;margin: 11px 0px 7px 9px;margin-top: 6px;margin-bottom: 7px;margin-left: 9px;box-shadow: 0px 3px 13px var(--bs-red);border-style: none;">Customer</a></li>
                                        <li class="nav-item" role="presentation" style="transform: scale(0.91);"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-6" style="color: rgb(245,245,245);background: var(--bs-red);border-radius: 51px;margin: 11px 0px 7px 9px;margin-top: 6px;margin-bottom: 7px;margin-left: 9px;box-shadow: 0px 3px 13px var(--bs-red);border-style: none;">Employee</a></li>
                                        <li class="nav-item" role="presentation" style="transform: scale(0.91);"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-7" style="color: rgb(245,245,245);background: var(--bs-red);border-radius: 51px;margin: 11px 0px 7px 9px;margin-top: 6px;margin-bottom: 7px;margin-left: 9px;box-shadow: 0px 3px 13px var(--bs-red);border-style: none;">Feedback</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" role="tabpanel" id="tab-1" style="background: url(&quot;assets/img/header-illustration.svg&quot;) center / contain no-repeat;height: 350.8px;">
                                            <div class="card" style="width: 927px;border-style: none;background: rgba(255,255,255,0.71);height: 344.8px;">
                                                <div class="card-body" style="width: 921px;padding-left: 52px;background: rgba(255,255,255,0.34);">
                                                    <h4 class="card-title" style="color: var(--bs-gray-dark);text-align: center;">Vehicle Reports</h4>
                                                    <h1 style="font-size: 18px;color: rgb(32,64,159);">Vehicle report by status</h1>
                                                    <div class="btn-group" role="group">
                                                    <a class="btn btn-primary" href="reports/vehicleByStateReport.jsp?id=all" target="_blank" style="background: var(--bs-purple);">All Vehicles</a>
                                                    <a class="btn btn-primary" href="reports/vehicleByStateReport.jsp?id=not-assigned"target="_blank" style="background: var(--bs-purple);">Active Vehicles</a>
                                                    <a class="btn btn-primary" href="reports/vehicleByStateReport.jsp?id=assigned" target="_blank"style="background: var(--bs-purple);">Booked Vehicles</a>
                                                    </div>
                                                    <h1 style="font-size: 18px;color: rgb(32,64,159);margin-top: 14px;">Vehicle report for</h1>
                                                    <div class="row">
                                                        <div class="col">
                                                            <form style="width: 409px;">
                                                                <h4 style="color: rgb(68,74,92);">Vehicle</h4>
                                                                <div class="row">
                                                                    <div class="col">
                                                                    <select id="vehi" class="form-select" style="border-color: var(--bs-orange);">
                                                                            <optgroup label="Vehicle number">
                                                                             <option value=" " >--Select-- </option>
                                                                              <% Ivehicle vehicleservice = new Svehicle();
										                                    	ArrayList<Vehicle> vehicleList= vehicleservice.getVehicleList();
										                                    	for(Vehicle vehicle : vehicleList){
										                                     %> 
                                                                                <option value="<%=vehicle.getVehicleNumber() %>" ><%=vehicle.getVehicleNumber() %> </option> 
                                                                             <%} %>
                                                                            </optgroup>
                                                                        </select></div>
                                                                    <div class="col"><button onclick="vehicleReport()" class="btn btn-primary" type="button">Get</button></div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                         
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div id="vehicleAlert"  class="alert alert-success alert-dismissible" role="alert" style="width: 294px;margin-top: 9px;height: 53px;padding: 9px;color: rgb(255,255,255);background: rgb(204,113,247);padding-top: 11px;padding-left: 32px;border-top-right-radius: 32px;border-bottom-right-radius: 32px;border-bottom-left-radius: 32px;transform: rotateX(-2deg) skewX(0deg);transform-origin: bottom;transform-style: preserve-3d;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button><span style="margin-top: 8px;"><i class="fa fa-exclamation" style="margin-right: 13px;margin-bottom: 11px;"></i>Select vehicle.</span></div>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" role="tabpanel" id="tab-2" style="background: url(&quot;assets/img/header-illustration.svg&quot;) center / contain no-repeat;height: 350.8px;">
                                          <div class="card" style="width: 927px;border-style: none;background: rgba(255,255,255,0.71);height: 344.8px;">
                                                <div class="card-body" style="width: 921px;padding-left: 52px;background: rgba(255,255,255,0.34);">
                                                    <h4 class="card-title" style="color: var(--bs-gray-dark);text-align: center;">Reservation Reports</h4>
                                                    <h1 style="font-size: 18px;color: rgb(32,64,159);">Reservation report by status</h1>
                                                    <div class="btn-group" role="group">
                                                    <a class="btn btn-primary" href="reports/resavationStateReport.jsp?id=all" target="_blank" style="background: var(--bs-purple);">All reservations</a>
                                                    <a class="btn btn-primary" href="reports/resavationStateReport.jsp?id=Assinged" target="_blank" style="background: var(--bs-purple);">Assinged reservations</a>
                                                    <a class="btn btn-primary" href="reports/resavationStateReport.jsp?id=Pending" target="_blank" style="background: var(--bs-purple);">Pending reservations</a>
                                                    <a class="btn btn-primary" href="reports/resavationStateReport.jsp?id=Cancled" target="_blank" style="background: var(--bs-purple);">Cancel reservations</a>
                                                    <a class="btn btn-primary" href="reports/resavationStateReport.jsp?id=Finished" target="_blank" style="background: var(--bs-purple);">Finished reservations</a>
                                                    </div>
                                                    <h1 style="font-size: 18px;color: rgb(32,64,159);margin-top: 14px;">Reservation report for</h1>
                                                    <div class="row">
                                                        <div class="col">
                                                            <form style="width: 409px;">
                                                                <h4 style="color: rgb(68,74,92);">User</h4>
                                                                <div class="row">
                                                                    <div class="col"><select id="res"  class="form-select" style="border-color: var(--bs-orange);">
                                                                            <optgroup label="User ID :">
                                                                             <option value=" " >--Select-- </option>
                                                                                <% Iresarvation resarvationservice = new Sresarvation();
										                                    	ArrayList<Resarvation> resarvationList= resarvationservice.getResarvationList();
										                                    	for(Resarvation resarvation : resarvationList){
										                                     %> 
                                                                                <option value="<%=resarvation.getUserId() %>" ><%=resarvation.getUserId() %>  </option> 
                                                                             <%} %>
                                                                            </optgroup>
                                                                        </select></div>
                                                                    <div class="col"><button onclick="resarvationReport()" class="btn btn-primary" type="button">Get</button></div>
                                                                </div>
                                                            </form>
                                                        </div> 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div id="resarvationAlert"  class="alert alert-success alert-dismissible" role="alert" style="width: 294px;margin-top: 9px;height: 53px;padding: 9px;color: rgb(255,255,255);background: rgb(204,113,247);padding-top: 11px;padding-left: 32px;border-top-right-radius: 32px;border-bottom-right-radius: 32px;border-bottom-left-radius: 32px;transform: rotateX(-2deg) skewX(0deg);transform-origin: bottom;transform-style: preserve-3d;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button><span style="margin-top: 8px;"><i class="fa fa-exclamation" style="margin-right: 13px;margin-bottom: 11px;"></i>Select user.</span></div>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" role="tabpanel" id="tab-3" style="background: url(&quot;assets/img/header-illustration.svg&quot;) center / contain no-repeat;height: 350.8px;">
                                            <div class="card" style="width: 927px;border-style: none;background: rgba(255,255,255,0.71);height: 344.8px;">
                                                <div class="card-body" style="width: 921px;padding-left: 52px;background: rgba(255,255,255,0.34);">
                                                    <h4 class="card-title" style="color: var(--bs-gray-dark);text-align: center;">Maintains Reports</h4> 
                                                    <div class="btn-group" role="group">
                                                    <a class="btn btn-primary" href="reports/maintainReport.jsp" target="_blank" style="background: var(--bs-purple);">Maintains List</a> 
                                                    </div>
                                                    <h1 style="font-size: 18px;color: rgb(32,64,159);margin-top: 14px;">Maintains report for</h1>
                                                    <div class="row">
                                                        <div class="col">
                                                            <form style="width: 409px;">
                                                                <h4 style="color: rgb(68,74,92);">Vehicle</h4>
                                                                <div class="row">
                                                                    <div class="col"><select id="main" class="form-select" style="border-color: var(--bs-orange);">
                                                                            <optgroup label="Vehicle ID : ">
                                                                             <option value=" " >--Select-- </option>
                                                                             <% String oldId = "id";
                                                                             	Imaintain maintainservice = new Smaintain();
										                                    	ArrayList<Maintaine> maintainList= maintainservice.getMaintaineList();  
										                                    	for(Maintaine maintaine :maintainList){
										                                    	String id=	maintaine.getVehicleId();
										                                    	if(!id.equals(oldId)){
										                                    		oldId = id;
										                                    %> 
                                                                                <option value="<%=maintaine.getVehicleId() %>" ><%=maintaine.getVehicleId()  %>    </option> 
                                                                             <%}
										                                    	}%> 
                                                                            </optgroup>
                                                                        </select></div>
                                                                    <div class="col"><button onclick="maintainReport()" class="btn btn-primary" type="button">Get</button></div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                         
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div id="maintainAlert" class="alert alert-success alert-dismissible" role="alert" style="width: 294px;margin-top: 9px;height: 53px;padding: 9px;color: rgb(255,255,255);background: rgb(204,113,247);padding-top: 11px;padding-left: 32px;border-top-right-radius: 32px;border-bottom-right-radius: 32px;border-bottom-left-radius: 32px;transform: rotateX(-2deg) skewX(0deg);transform-origin: bottom;transform-style: preserve-3d;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button><span style="margin-top: 8px;"><i class="fa fa-exclamation" style="margin-right: 13px;margin-bottom: 11px;"></i>Select maintains.</span></div>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="tab-pane" role="tabpanel" id="tab-4" style="background: url(&quot;assets/img/header-illustration.svg&quot;) center / contain no-repeat;height: 350.8px;">
                                            <div class="card" style="width: 927px;border-style: none;background: rgba(255,255,255,0.71);height: 344.8px;">
                                                <div class="card-body" style="width: 921px;padding-left: 52px;background: rgba(255,255,255,0.34);">
                                                    <h4 class="card-title" style="color: var(--bs-gray-dark);text-align: center;">Accident coverage Reports</h4> 
                                                    <div class="btn-group" role="group">
                                                    <a class="btn btn-primary" href="reports/accidentReport.jsp" target="_blank" style="background: var(--bs-purple);">Accident coverage List</a> 
                                                    </div>
                                                    <h1 style="font-size: 18px;color: rgb(32,64,159);margin-top: 14px;">Accident coverage report for</h1>
                                                    <div class="row">
                                                        <div class="col">
                                                            <form style="width: 409px;">
                                                                <h4 style="color: rgb(68,74,92);">Vehicle</h4>
                                                                <div class="row">
                                                                    <div class="col"><select id="acc"  class="form-select" style="border-color: var(--bs-orange);">
                                                                            <optgroup label="Vehicle ID :">
                                                                             <option value=" " >--Select-- </option>
                                                                               <% String oldIdAcci = "id";
                                                                             	Iaccident accidentservice = new Saccident();
										                                    	ArrayList<Accident> accidentserviceList= accidentservice.getAccidentList();  
										                                    	for(Accident accident :accidentserviceList){
										                                    	String id=	accident.getVehicleId();
										                                    	if(!id.equals(oldIdAcci)){
										                                    		oldId = id;
										                                    %> 
                                                                                <option value="<%=accident.getVehicleId() %>" ><%=accident.getVehicleId()  %>    </option> 
                                                                             <%}
										                                    	}%> 
                                                                            </optgroup>
                                                                        </select></div>
                                                                    <div class="col"><button onclick="accidentReport()" class="btn btn-primary" type="button">Get</button></div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                         
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div id="accidentAlert"  class="alert alert-success alert-dismissible" role="alert" style="width: 294px;margin-top: 9px;height: 53px;padding: 9px;color: rgb(255,255,255);background: rgb(204,113,247);padding-top: 11px;padding-left: 32px;border-top-right-radius: 32px;border-bottom-right-radius: 32px;border-bottom-left-radius: 32px;transform: rotateX(-2deg) skewX(0deg);transform-origin: bottom;transform-style: preserve-3d;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button><span style="margin-top: 8px;"><i class="fa fa-exclamation" style="margin-right: 13px;margin-bottom: 11px;"></i>Select accident.</span></div>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="tab-pane" role="tabpanel" id="tab-5" style="background: url(&quot;assets/img/header-illustration.svg&quot;) center / contain no-repeat;height: 350.8px;">
                                             <div class="card" style="width: 927px;border-style: none;background: rgba(255,255,255,0.71);height: 344.8px;">
                                                <div class="card-body" style="width: 921px;padding-left: 52px;background: rgba(255,255,255,0.34);">
                                                    <h4 class="card-title" style="color: var(--bs-gray-dark);text-align: center;">Customer Reports</h4> 
                                                    <div class="btn-group" role="group">
                                                    <a class="btn btn-primary" href="reports/customerReport.jsp" target="_blank" style="background: var(--bs-purple);">Customer List</a> 
                                                    </div>
                                                    <h1 style="font-size: 18px;color: rgb(32,64,159);margin-top: 14px;">Customer report for</h1>
                                                    <div class="row">
                                                        <div class="col">
                                                            <form style="width: 409px;">
                                                                <h4 style="color: rgb(68,74,92);">Customer</h4>
                                                                <div class="row">
                                                                    <div class="col"><select  id="cus" class="form-select" style="border-color: var(--bs-orange);">
                                                                            <optgroup label="customer List :">
                                                                             <option value=" " >--Select-- </option>
                                                                                <% Icustomer customerservice = new Scustomer();
										                                    	ArrayList<Customer> customerList= customerservice.getCustomerList();
										                                    	for(Customer customer : customerList){
										                                     %> 
                                                                                <option value="<%=customer.getId() %>" ><%=customer.getId() %> :  <%=customer.getName() %>  </option> 
                                                                             <%} %>
                                                                            </optgroup>
                                                                        </select></div>
                                                                    <div class="col"><button onclick="customerReport()" class="btn btn-primary" type="button">Get</button></div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                         
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div id="customerAlert"  class="alert alert-success alert-dismissible" role="alert" style="width: 294px;margin-top: 9px;height: 53px;padding: 9px;color: rgb(255,255,255);background: rgb(204,113,247);padding-top: 11px;padding-left: 32px;border-top-right-radius: 32px;border-bottom-right-radius: 32px;border-bottom-left-radius: 32px;transform: rotateX(-2deg) skewX(0deg);transform-origin: bottom;transform-style: preserve-3d;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button><span style="margin-top: 8px;"><i class="fa fa-exclamation" style="margin-right: 13px;margin-bottom: 11px;"></i>Select customer.</span></div>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="tab-pane" role="tabpanel" id="tab-6" style="background: url(&quot;assets/img/header-illustration.svg&quot;) center / contain no-repeat;height: 350.8px;">
                                            <div class="card" style="width: 927px;border-style: none;background: rgba(255,255,255,0.71);height: 344.8px;">
                                                <div class="card-body" style="width: 921px;padding-left: 52px;background: rgba(255,255,255,0.34);">
                                                    <h4 class="card-title" style="color: var(--bs-gray-dark);text-align: center;">Employee Reports</h4> 
                                                    <div class="btn-group" role="group">
                                                    <a class="btn btn-primary" href="reports/employeeReport.jsp" target="_blank" style="background: var(--bs-purple);">Employee List</a> 
                                                    </div>
                                                    <h1 style="font-size: 18px;color: rgb(32,64,159);margin-top: 14px;">Employee report for</h1>
                                                    <div class="row">
                                                        <div class="col">
                                                            <form style="width: 409px;">
                                                                <h4 style="color: rgb(68,74,92);">Employee</h4>
                                                                <div class="row">
                                                                    <div class="col"><select id="emp"  class="form-select" style="border-color: var(--bs-orange);">
 																			<optgroup label="employee List :">
 																			 <option value=" " >--Select-- </option> 
                                                                                <% Iemployee employeeservice = new Semployee();
										                                    	ArrayList<Employee>employeeList= employeeservice.getEmployeeList();
										                                    	for(Employee employee : employeeList){
										                                     %> 
                                                                                <option value="<%=employee.getId() %>" ><%=employee.getId() %> :  <%=employee.getName() %>  </option> 
                                                                             <%} %>
                                                                            </optgroup>
                                                                        </select></div>
                                                                    <div class="col"><button onclick="employeeReport()" class="btn btn-primary" type="button">Get</button></div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                         
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div id="employeeAlert"  class="alert alert-success alert-dismissible" role="alert" style="width: 294px;margin-top: 9px;height: 53px;padding: 9px;color: rgb(255,255,255);background: rgb(204,113,247);padding-top: 11px;padding-left: 32px;border-top-right-radius: 32px;border-bottom-right-radius: 32px;border-bottom-left-radius: 32px;transform: rotateX(-2deg) skewX(0deg);transform-origin: bottom;transform-style: preserve-3d;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button><span style="margin-top: 8px;"><i class="fa fa-exclamation" style="margin-right: 13px;margin-bottom: 11px;"></i>Select employee.</span></div>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="tab-pane" role="tabpanel" id="tab-7" style="background: url(&quot;assets/img/header-illustration.svg&quot;) center / contain no-repeat;height: 350.8px;">
                                            <div class="tab-pane" role="tabpanel" id="tab-6">
                                            <div class="card" style="width: 927px;border-style: none;background: rgba(255,255,255,0.71);height: 344.8px;">
                                                <div class="card-body" style="width: 921px;padding-left: 52px;background: rgba(255,255,255,0.34);">
                                                    <h4 class="card-title" style="color: var(--bs-gray-dark);text-align: center;">Feedback Reports</h4> 
                                                    <div class="btn-group" role="group">
                                                    <a class="btn btn-primary"  href="reports/feedbackReport.jsp?id=all" target="_blank" style="background: var(--bs-purple);">All Feedback List</a> 
                                                    <a class="btn btn-primary"  href="reports/feedbackReport.jsp?id=1" target="_blank" style="background: var(--bs-purple);">1 Star</a>  
                                                    <a class="btn btn-primary"  href="reports/feedbackReport.jsp?id=2" target="_blank"  style="background: var(--bs-purple);">2 Star</a>  
                                                    <a class="btn btn-primary"  href="reports/feedbackReport.jsp?id=3" target="_blank"  style="background: var(--bs-purple);">3 Star</a>  
                                                    <a class="btn btn-primary"  href="reports/feedbackReport.jsp?id=4" target="_blank"  style="background: var(--bs-purple);">4 Star</a>  
                                                    <a class="btn btn-primary"  href="reports/feedbackReport.jsp?id=5" target="_blank"  style="background: var(--bs-purple);">5 Star</a>  
                                                    </div> 
                                                      
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	function load(){
    		document.getElementById('vehicleAlert').style.display="none";
    		document.getElementById('resarvationAlert').style.display="none";
    		document.getElementById('maintainAlert').style.display="none";
    		document.getElementById('accidentAlert').style.display="none";
    		document.getElementById('customerAlert').style.display="none";
    		document.getElementById('employeeAlert').style.display="none";
    		
    	}
    	function customerReport(){
    		var cusId = document.getElementById('cus').value;
    		if(cusId == " "){
    			document.getElementById('customerAlert').style.display="block";
    		}else{
    			window.open('reports/customerByReport.jsp?id='+cusId, '_blank');
    		}
    		
    	}
    	function resarvationReport(){
    		var cusId = document.getElementById('res').value;
    		if(cusId == " "){
    			document.getElementById('resarvationAlert').style.display="block";
    		}else{
    			window.open('reports/ResarvationByReport.jsp?id='+cusId, '_blank');
    		}
    		
    	} 
    	function maintainReport(){
    		var cusId = document.getElementById('main').value;
    		if(cusId == " "){
    			document.getElementById('maintainAlert').style.display="block";
    		}else{
    			window.open('reports/maintainByReport.jsp?id='+cusId, '_blank');
    		}
    		
    	}
    	function accidentReport(){
    		var cusId = document.getElementById('acc').value;
    		if(cusId == " "){
    			document.getElementById('accidentAlert').style.display="block";
    		}else{
    			window.open('reports/accidentReport.jsp?id='+cusId, '_blank');
    		}
    		
    	}
    	function employeeReport(){
    		var cusId = document.getElementById('emp').value;
    		if(cusId == " "){
    			document.getElementById('employeeAlert').style.display="block";
    		}else{
    			window.open('reports/employeeByReport.jsp?id='+cusId, '_blank');
    		}
    		
    	}
    	function vehicleReport(){
    		var cusId = document.getElementById('vehi').value;
    		if(cusId == " "){
    			document.getElementById('vehicleAlert').style.display="block";
    		}else{
    			window.open('reports/VehicleByReport.jsp?id='+cusId, '_blank');
    		}
    		
    	}
    	
    </script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>