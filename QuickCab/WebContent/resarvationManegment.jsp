<%@page import="com.taxiMe.model.Resarvation"%>
<%@page import="com.taxiMe.services.Sresarvation"%>
<%@page import="com.taxiMe.interfaces.Iresarvation"%>
<%@page import="com.taxiMe.model.Customer"%>
<%@page import="com.taxiMe.services.Scustomer"%>
<%@page import="com.taxiMe.interfaces.Icustomer"%>
<%@page import="com.taxiMe.model.Vehicle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.taxiMe.services.Svehicle"%>
<%@page import="com.taxiMe.interfaces.Ivehicle"%>
<%@page import="com.taxiMe.model.User"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
<style>
#map_canvas {
     height:250px;
     width:60%;
     margin-left: 10%;
     margin-right: 10%;
      padding: 0;
     position: absolute; 
     overflow: show;
}
</style> 
<script type="text/javascript">
function pickMap() {
	   const map = new google.maps.Map(document.getElementById("map_canvas"), {
	    center: { lat: 40.749933, lng: -73.98633 },
	    zoom: 13,
	  }); 
	  const pick = document.getElementById("pick"); 
	  const drop = document.getElementById("drop"); 
	  const options = {
	    componentRestrictions: { country: "LK" },
	    fields: ["formatted_address", "geometry", "name"],
	    origin: map.getCenter(),
	    strictBounds: false,
	    types: ["establishment"],
	  }; 
	  const autocompletePick = new google.maps.places.Autocomplete(pick, options); 
	  const autocompleteDrop = new google.maps.places.Autocomplete(drop, options);
	  
	  autocompletePick.bindTo("bounds", map);
	  const infowindow = new google.maps.InfoWindow();
	  const infowindowContent = document.getElementById("infowindow-content");
	  infowindow.setContent(infowindowContent);
	  
	 
	  
	  autocompleteDrop.bindTo("bounds", map);
	  
	  
	  autocompletePick.addListener("place_changed", () => {
		  const pickup = new google.maps.Marker({
			    map,
			    anchorPoint: new google.maps.Point(0, -29),
			  });
	    infowindow.close();
	    pickup.setVisible(false);
	    const place = autocompletePick.getPlace(); 
	    if (!place.geometry || !place.geometry.location) { 
	      window.alert("No details available for input: '" + place.name + "'");
	      return;
	    }
	    if (place.geometry.viewport) {
	      map.fitBounds(place.geometry.viewport);
	    } else {
	      map.setCenter(place.geometry.location);
	      map.setZoom(17);
	    }
	    pickup.setPosition(place.geometry.location);
	    pickup.setVisible(true);
	    infowindowContent.children["place-name"].textContent = place.name;
	    infowindowContent.children["place-address"].textContent ="Pickup Location";
	    infowindow.open(map, pickup);
	  });
	  
	  autocompleteDrop.addListener("place_changed", () => {
		  const drop = new google.maps.Marker({
			    map,
			    anchorPoint: new google.maps.Point(0, -29),
			  });
		    infowindow.close();
		    drop.setVisible(false);
		    const place = autocompleteDrop.getPlace(); 
		    if (!place.geometry || !place.geometry.location) { 
		      window.alert("No details available for input: '" + place.name + "'");
		      return;
		    }
		    if (place.geometry.viewport) {
		      map.fitBounds(place.geometry.viewport);
		    } else {
		      map.setCenter(place.geometry.location);
		      map.setZoom(1);
		    }
		    drop.setPosition(place.geometry.location);
		    drop.setVisible(true);
		    infowindowContent.children["place-name"].textContent = place.name;
		    infowindowContent.children["place-address"].textContent ="Drop Location";
		    infowindow.open(map, drop);
		  });

	
	}
</script>
</head>

<body id="page-top">
<% User user = (User)session.getAttribute("user"); %>
    <div id="wrapper">
         <jsp:include page="header.jsp"/>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                  <jsp:include page="title.jsp"/>
                  <% 
                  if(user != null && user.getUserType().equals("customer")){%>
                   <h3 class="text-dark mb-4">Add Reservation</h3>
                  <%}else{ %>
                	<h3 class="text-dark mb-4">Reservation management</h3>
                	<%} %>
                <p class="text-primary m-0 fw-bold" style="margin-left: 14px;padding-left: 24px;padding-bottom: 15px;width: 1162.6px;">Reservation Info</p>
                <div class="container">
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
                   
    <div id="map"></div>
     
                   
                    <div class="row">
                        <div class="col-md-12">
                            <form class="user" action="addReservation" method="post">
                                <div class="row mb-3" id="pac-container">
                                
      								<div class="col-sm-6 mb-3 mb-sm-0">
                                    <input class="form-control form-control-user" type="search" id="pick" placeholder="Pickup Location" name="pick_location" style="border-radius: 0px;" required="required"></div>
                                   
                                    <div class="col-sm-6">
                                    <input class="form-control form-control-user" type="search" id="drop" placeholder="Drop Location" name="drop_location" style="border-radius: 0px;" required="required"></div>
                                	<input type="hidden" name="userType" value="<%=user.getUserType() %>">
                                  </div>
                                <div class="mb-3"></div>
                                <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><label class="form-label">Time</label><input class="form-control" type="time" name="time" style="border-radius: 0px;" required="required"><label class="form-label">Date</label><input class="form-control" name="date" type="date" style="border-radius: 0px;" required="required"></div>
                                    <div class="col-sm-6"><label class="form-label">Vehicle type</label>
                                        <div class="form-check" style="width: 116px;padding-left: 24px;"><input class="form-check-input" type="radio" id="formCheck-1" name="type" value="Car"><label class="form-check-label" for="formCheck-1">Car</label></div>
                                        <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-2" name="type" value="Van"><label class="form-check-label" for="formCheck-2">Van</label></div>
                                        <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-3" name="type" value="TuckTuck"><label class="form-check-label" for="formCheck-3">TuckTuck</label></div>
                                        <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-4" name="type" value="Truck"><label class="form-check-label" for="formCheck-4">Truck</label></div>
                                    </div>
                                </div>
                                 <div class="row mb-3" >
                                
      								<div class="col-sm-6 mb-3 mb-sm-0">
                                     <%Ivehicle vehicleService = new Svehicle();
                                      ArrayList<Vehicle> vehicleNumberList = vehicleService.getVehicleByStatus("not-assigned");
                                      if(user.getUserType().equals("employee")){
                                    %>
                                    <input class="form-control form-control-user" type="text" id="exampleFirstName-1" placeholder="Vehicle Number" name="VNumber" style="border-radius: 0px; margin-bottom: 15px;"  list="numberList" required="required">
                                    <datalist id="numberList">
                                    <%for(Vehicle vehicle :vehicleNumberList){ %>
								        <option value="<%=vehicle.getVehicleNumber()%>"><%=vehicle.getVehicleNumber()%> - type :<%=vehicle.getType()%></option>
									<%} %>
								    </datalist>
								    <%} %>
                                   </div>
                                   <div class="col-sm-6 mb-3 mb-sm-0">
                                       <%Icustomer cusService = new Scustomer();
                                      ArrayList<Customer> cusList = cusService.getCustomerList();
                                      if(user.getUserType().equals("employee")){
                                    %>
                                    <input class="form-control form-control-user" type="text" id="exampleFirstName-1" placeholder="Customer Name" name="cusName" style="border-radius: 0px; margin-bottom: 15px;"  list="userName" required="required">
                                       <datalist id="userName">
                                       <%for(Customer customer :cusList){ %>
								        <option value="<%=customer.getId()%>">name : <%=customer.getName() %> | User name : <%=customer.getUserName() %></option>
									<%} %>
								    </datalist>
								    <%}else{ %>
								    <input type="hidden" name="cusName" value="<%=user.getId()%>">
                                    <%} %>
                                   </div>
                                    </div>
                                 <div class="row  mb-3" style="height: 250px;">
                                 <div id="map_canvas">  <div id="infowindow-content">
								      <span id="place-name" class="title"></span><br />
								      <span id="place-address"></span>
								    </div>
                                </div>
                                </div>
                                
                                <div class="row mb-3 p"   >
                                 <hr>
      								<div class="col-sm-6  " >
                                    <button class="btn btn-primary d-block btn-user w-100" type="submit" style="border-radius: 0px;border-color: var(--bs-blue);background: var(--bs-blue);width: 50px;">Add</button>
                                </div>
                                    <div class="col-sm-6 mb-3">
                                    <a href="resarvationManegment.jsp" class="btn btn-danger d-block btn-user w-100" type="reset" style="border-radius: 0px;width: 50px;">Reset</a>
                               
                               </div>
                                <hr>
                               </div>
                               
                            </form>
                        </div>
                    </div>
                </div>
                
                <%
               
                if(user != null && user.getUserType().equals("employee")){
                	
                	Iresarvation resarvationService = new Sresarvation();
                	ArrayList<Resarvation> reasavationList= resarvationService.getResarvationList();
                %>
                <div class="container-fluid">
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 fw-bold">Reservations</p>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive  table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0 table-responsive " id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>User Id</th>
                                            <th>Vehicle Id</th>
                                            <th>Pick Location</th>
                                            <th>Drop Location</th>
                                            <th>Time and Date</th>
					                        <th>Status</th>
                                            <th>Vehicle type</th>
                                            <th>Option</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for(Resarvation resarvation : reasavationList){ %>
                                        <tr>
                                            <td style="color: var(--bs-danger);"><%=resarvation.getId() %></td>
                                            <td><%=resarvation.getUserId() %></td>
                                            <td><%=resarvation.getVehicleId() %></td>
                                            <td><%=resarvation.getPickupLocation() %></td>
                                            <td><%=resarvation.getDropLocation() %></td>
                                            <td><%=resarvation.getDate() %> : <%=resarvation.getTime() %></td>  
                                            <td>
                                            <%if(resarvation.getStatus().equals("Assinged")) {%>
                                            	<p class="text-success"><%=resarvation.getStatus() %></p>
                                            <%} %>
                                            <%if(resarvation.getStatus().equals("Pending")) {%>
                                            	<p class="text-warning"><%=resarvation.getStatus() %></p>
                                            <%} %>
                                            <%if(resarvation.getStatus().equals("Cancled")) {%>
                                            	<p class="text-danger"><%=resarvation.getStatus() %></p>
                                            <%} %>
                                            <%if(resarvation.getStatus().equals("Finished")) {%>
                                            	<p class="text-info"><%=resarvation.getStatus() %></p>
                                            <%} %>
                                            </td>
                                           <td><%=resarvation.getVehicleType()%></td>                                             
                                             
                                                    <td>
                                                <div>
                                                    <div class="row">
                                                        <div class="col" style="width: 20px;padding-left: 0px;padding-right: 0px;height: 36px;margin-right: 0px;">
                                                        <a href="updateResarvation.jsp?id=<%=resarvation.getId() %>" class="btn btn-circle btn-primary" type="button" style="background: var(--bs-primary);border-color: var(--bs-primary);"><i class="fa fa-pencil"></i></a></div>
                                                        <div class="col" style="width: 57.6px;padding-right: 0px;padding-left: 2px;margin-left: 0px;">
                                                        <a href="deleteReservation?id=<%=resarvation.getId() %>" class="btn btn-danger btn-circle ms-1" role="button"><i class="fas fa-trash text-white"></i></a></div>
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
                            </div><%-- hashi modi gemmbi ibbi  --%> 
                             
                            </div>
                    </div>
                </div>
                <%} %>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <%--<div class="text-center my-auto copyright"><span>Copyright � TaxiMe 2021</span></div> --%>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    
    
    
    
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0STSY9ctrc8gyWOQ262iZiwnPw3Jb5YM&callback=pickMap&libraries=places&v=weekly"></script>
    
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
    
</body>

</html>