<%@page import="com.taxiMe.model.Maintaine"%>
<%@page import="com.taxiMe.model.Accident"%>
<%@page import="com.taxiMe.services.Smaintain"%>
<%@page import="com.taxiMe.interfaces.Imaintain"%>
<%@page import="com.taxiMe.services.Saccident"%>
<%@page import="com.taxiMe.interfaces.Iaccident"%>
<%@page import="com.taxiMe.services.Svehicle"%>
<%@page import="com.taxiMe.model.Vehicle"%>
<%@page import="com.taxiMe.interfaces.Ivehicle"%>
<%@page import="com.taxiMe.model.Resarvation"%>
<%@page import="com.taxiMe.services.Sresarvation"%>
<%@page import="com.taxiMe.interfaces.Iresarvation"%>
<%@page import="com.taxiMe.utill.ratingUtill"%>
<%@page import="com.taxiMe.model.Rating"%>
<%@page import="com.taxiMe.services.Srating"%>
<%@page import="com.taxiMe.interfaces.Irating"%>
<%@page import="com.taxiMe.model.Employee"%>
<%@page import="com.taxiMe.services.Semployee"%>
<%@page import="com.taxiMe.interfaces.Iemployee"%>
<%@page import="java.util.ArrayList"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - TaxiMe</title>
    <link rel="icon" type="image/png" sizes="1500x1500" href="../assets/img/2.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="../assets/img/2.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="../assets/img/1.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="../assets/img/1.png">
    <link rel="icon" type="image/png" sizes="1500x1500" href="../assets/img/1.png">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="../assets/css/Article-Clean.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
</head>

<body id="page-top" style="background-color: white;">
		<%
		  Ivehicle vehicleService = new Svehicle();
		  ArrayList<Vehicle> vehicleList = new ArrayList<Vehicle>();
		  String id = request.getParameter("id"); 
		  
        %>
    <div id="wrapper" style="background-color: white;"> 
     
        <div class="d-flex flex-column" id="content-wrapper" style="background-color: white;">
        <div class="row bg-primary ">
     <div class="col-md-2 ">
          <h3 class="text-light mb-2 mt-2 " style="margin-left: 26px;">TaxiMe Report</h3>  
        </div> 
        <div class="col-md-8"> 
          <button class="btn btn-success mt-2 mb-3"id="get-pdf" onclick="Export();" >Save</button>
        </div> 
     </div>
     
     <div id="canvas">
        <div class="row bg-dark mb-4">
        <div class="col-md-2" style="justify-content: center;">
        <img src="../assets/img/2.png" class="mt-3 ml-5" style="width: 150px;height: 150px;">
        </div>
        <div class="col-md-7">
          <h3 class="text-light mb-2 text-center mt-5 text-danger" style="margin-left: 26px;">TaxiMe</h3>
                <h4 class="text-light mb-1 text-center mt-3  " style="margin-left: 26px;">Vehicle report</h4>
                <h5 class="-text-secondary mb-4 text-center mt-2  " style="margin-left: 26px;"> vehicle number : <%=id %></h5>
        </div> 
        <div class="col-md-3"></div>
      
                </div>
                <div class="container-fluid">
                     <table class="table my-0" id="dataTable">
                                        <thead>
                                        <tr class="table-warning">
                                            <th>Vehicle Number</th>
                                            <th>No Of pasengers</th>
                                            <th>Type</th>
                                            <th>Address</th>
                                            <th>Owner Name</th>
                                            <th>Status</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%int i=0;
                                    Vehicle vehicle = vehicleService.getVehicle(id); 
                                    
                                    %>
                                   
                                        <tr> 
                                       <td ><p style="color: var(--bs-danger);"><%=vehicle.getVehicleNumber() %></p></td> 
                                            <td><%=vehicle.getNoOfPasenger() %></td>
                                            <td><%=vehicle.getType() %></td>
                                            <td><%=vehicle.getAddress() %></td>
                                            <td><%=vehicle.getOwnerName() %></td>
                                            <%if (!vehicle.getStatus().equals("not-assigned")){ %>
                                            <td class="text-success"><%=vehicle.getStatus() %></td>
                                            <%}else{ %>
                                            <td class="text-danger"><%=vehicle.getStatus() %></td>
                                            <%} %>
                                             
                                                 
                                        </tr> 
                                        <thead class="mt-5">
                                        <tr >
                                            <th >Summary</th>    
                                        </tr>
                                        
                                         <%
                                         ArrayList<Vehicle>list= vehicleService.getVehicleList(); 
                                     	int accidents = 0; 
                                    	int resarvations = 0;
                                    	int maintaines = 0;  
                                    	
                                    	Iaccident accidentService = new Saccident();
                                    	Imaintain maintainService = new Smaintain();
                                    	Iresarvation resarvationService = new Sresarvation();
                                    	
                                    	ArrayList<Accident> accidentList =accidentService.getAccidentByVehicleId(id);
                                    	ArrayList<Maintaine> maintainList = maintainService.getMaintaineByVehicleId(id);
                                    	ArrayList<Resarvation>resarvationList = resarvationService.getResarvationByVehicle(id);
                                    	
                                    	for(Resarvation resarvation :resarvationList){resarvations++;}
                                    	for(Maintaine maintaine :maintainList){maintaines++;}
                                    	for(Accident accident :accidentList){accidents++;}
                                        %>
                                        <tr > 
                                            <th>Total accidents : <%=accidents %></th>
                                            <th>Total resarvations : <%=resarvations %></th>   
                                            <th>Total maintaines : <%=maintaines %></th>   
                                            <th> </th> 
                                            
                                        </tr>
                                         
                                    </thead>
                                    </tbody>
                                    <tfoot>
                                        <tr></tr>
                                    </tfoot>
                                </table>
                </div>
            </div>
          
       
    </div>
    
      <script type="text/javascript">
      function Export() {
          html2canvas(document.getElementById('canvas'), {
              onrendered: function (canvas) {
                  var data = canvas.toDataURL();
//          data.text
                  var docDefinition = {
                      content: [{ 
                              image: data,
                              width: 500,
                              pageSize: 'A4',
                              pageMargins: [ 0, 0, 0, 0 ]
                          }]
                  };
                  
                  var today = new Date();
                  var dd = String(today.getDate()).padStart(2, '0');
                  var mm = String(today.getMonth() + 1).padStart(2, '0');  
                  var yyyy = today.getFullYear();

                  today = mm + '/' + dd + '/' + yyyy; 
                  
                  pdfMake.createPdf(docDefinition).download("vehiclesReport-"+today+".pdf");
              }
          });
      }

            </script>
    </div>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/theme.js"></script>
</body>

</html>