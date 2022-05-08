<%@page import="com.taxiMe.services.Saccident"%>
<%@page import="com.taxiMe.interfaces.Iaccident"%>
<%@page import="com.taxiMe.model.Accident"%>
<%@page import="com.taxiMe.services.Smaintain"%>
<%@page import="com.taxiMe.interfaces.Imaintain"%>
<%@page import="com.taxiMe.model.Maintaine"%>
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
<%String id = request.getParameter("id"); 
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
                <h4 class="text-light mb-1 text-center mt-3  " style="margin-left: 26px;">Accident report</h4>
                <h5 class="-text-secondary mb-4 text-center mt-2  " style="margin-left: 26px;"> Vehicle Id : <%=id%></h5>
        </div> 
        <div class="col-md-3"></div>
      
                </div>
                <div class="container-fluid">
                    <table class="table my-0" id="dataTable">
                     <%
                    		 
                        	Iaccident accidentService = new Saccident();
                        	ArrayList<Accident> accidentList = accidentService.getAccidentByVehicleId(id);
                        	 int i=0;
                        %>
                                    <thead>
                                       <tr class="table-warning">
                                            <th>ID</th>
                                            <th>Vehicle Number</th>
                                            <th>Location</th>
                                            <th>Date Time</th>
                                            <th>Driver Name</th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%for(Accident accident:accidentList){
                                    	i++;
                                    	%>
                                        <tr>
                                            <td style="color: var(--bs-danger);"><%=accident.getId() %></td>
                                            <td><%=accident.getVehicleId() %></td>
                                            <td><%=accident.getLocation() %></td>
                                            <td><%=accident.getDate() %> &nbsp; <%=accident.getTime() %></td>
                                            <td><%=accident.getDrivername() %></td>
                                            
                                        </tr>
                                        <%} %>
                                    </tbody>
                                    <tr>
                                            <th>Total accident :</th>
                                            <th><%=i%></th>
                                            
                                        </tr>
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
                  
                  pdfMake.createPdf(docDefinition).download("AllAccidentReport-"+today+".pdf");
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