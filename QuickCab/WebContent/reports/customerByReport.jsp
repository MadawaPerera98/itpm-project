<%@page import="com.taxiMe.services.Sresarvation"%>
<%@page import="com.taxiMe.model.Resarvation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.taxiMe.interfaces.Iresarvation"%>
<%@page import="com.taxiMe.interfaces.Icustomer"%>
<%@page import="com.taxiMe.model.Customer"%>
<%@page import="com.taxiMe.services.Scustomer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="color: var(--bs-light);border-color: var(--bs-orange);">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Report - TaxiMe</title>
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

<body class="bg-gradient-primary" style="border-color: var(--bs-orange);background: var(--bs-orange);">
    <div class="container" style="border-color: var(--bs-orange);">
    <div id="canvas">
        <div class="card shadow-lg o-hidden border-0 my-5" >
            <div class="card-body p-0">
                <div class="row">
                     <div class="col-lg-5 d-none d-lg-flex" style="height: 457px;width: 476px;"><img src="../assets/img/1.png" style="width: 100%;"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div >
                            <%
                            int id =Integer.parseInt(request.getParameter("id")); 
                            Icustomer customerService = new Scustomer();
                       	 	Customer customer = customerService.getCustomer(id);
                       	 Iresarvation resarvationService = new Sresarvation();
               		 	 ArrayList<Resarvation> resarvationList = resarvationService.getResarvationByUserId(id);
                       %>
                                <h4 class="text-dark mb-4 text-center">User Report   </h4>
                                <div class="row">
                                 <div class="col-md-6">
                                 <h5 class="text-disable mb-4 text-center">User details | user Id : <%=customer.getId()%></h5>
                                	<p>Name :<%=customer.getName()%></p>
                                	<p>Address :<%=customer.getAddress()%></p>
                                	<p>Gender :<%=customer.getGender()%></p>
                                	<p>E-mail :<%=customer.getMail()%></p>
                                	<p>Telephone number :<%=customer.getTelephone()%></p>
                                </div>
                                <div class="col-md-6">
                                
                                 <%
                                         ArrayList<Resarvation>list= resarvationService.getResarvationList();
                                    	int finish = 0;
                                    	int pending = 0;
                                    	int cancle = 0;
                                    	int assigned = 0;
                                    	int total = 0;
                                    	int starCount = 0; 
                                    	for(Resarvation resarvation : list){ 
                                    		if(resarvation.getStatus().equals("Assinged")) {
                                    			assigned++;
                                    		}if(resarvation.getStatus().equals("Pending")) {
                                    			pending++;
                                    		}if(resarvation.getStatus().equals("Cancled")) {
                                    			cancle++;
                                    		}if(resarvation.getStatus().equals("Finished")) {
                                    			finish++;
                                    		}
                                    	}
                                    	total = finish+pending+cancle+assigned;
                                        %>
                                        
                                <h5 class="text-disable mb-4 text-center">Resarvation details:  </h5>
                                	<p>Finished Resarvation :<%=finish%></p>
                                	<p>Cancled Resarvation :<%=cancle%></p>
                                	<p>Pending Resarvation :<%=pending%></p>
                                	<p>Current Resarvation  :<%=assigned%></p> 
                                	<hr>
                                	<p>Total Resarvation  :<%=total%></p> 
                                </div>
                                </div> 
                                
                            
                             
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
       
                            </div>
                             <div class="row">
                                	<button onclick="Export()" class="btn btn-success">Download</button>
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
                  
                  pdfMake.createPdf(docDefinition).download("userReport-"+today+".pdf");
              }
          });
      }

            </script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/theme.js"></script>
</body>

</html>