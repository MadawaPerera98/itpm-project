<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="color: var(--bs-light);border-color: var(--bs-cyan);">

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

<body class="bg-gradient-primary" style="border-color: var(--bs-cyan);background: var(--bs-cyan);">
    <div class="container" style="border-color: var(--bs-cyan);">
        <div class="card shadow-lg o-hidden border-0 my-5">
            <div class="card-body p-0">
                <div class="row">
                    <a href="VehicleManegment.jsp"><div class="col" style="width: 785px;"><button class="btn btn-primary" type="button" style="height: 100%;border-radius: 0px;border-style: none;"><i class="fa fa-arrow-left"></i></button></div></a>
                    <div class="col-lg-5 d-none d-lg-flex" style="height: 457px;width: 476px;"><img src="assets/img/0.png" style="width: 100%;"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h4 class="text-dark mb-4">Add new Vehicle</h4>
                            </div>
                            <form class="user" action="addVehicle" method="post">
                                <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="exampleFirstName-1" placeholder="Vehicle Number" name="VNumber" style="border-radius: 0px;" required="required"></div>
                                    <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="exampleFirstName-2" placeholder="Number of pasengers" name="noOfPAsengers" style="border-radius: 0px;" maxlength="2" required="required"  pattern="^[0-9]*$"  ></div>
                                </div>
                                <div class="col-sm-12 mb-3"><input class="form-control form-control-user" type="text" id="ownerName" placeholder="Owner Name" name="ownerName" style="border-radius: 0px;"  pattern="[a-zA-Z].+"></div>
                               <div class="row mb-3">
                                    <div class="col-sm-6 mb-3 mb-sm-0"><textarea class="form-control form-control-lg" name="address" placeholder="Address" style="height: 135.2px;font-size: 12.8px;width: 309px;border-radius: 0px;" required="required"></textarea></div>
                                    <div class="col-sm-6"><label class="form-label">Vehicle type</label>
                                        <div class="form-check" style="width: 116px;padding-left: 24px;"><input class="form-check-input" type="radio" id="formCheck-1" name="type" value="Car"><label class="form-check-label" for="formCheck-1">Car</label></div>
                                        <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-2" name="type" value="Van"><label class="form-check-label" for="formCheck-2">Van</label></div>
                                        <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-3" name="type" value="TuckTuck"><label class="form-check-label" for="formCheck-3">TuckTuck</label></div>
                                        <div class="form-check" style="width: 100px;"><input class="form-check-input" type="radio" id="formCheck-4" name="type" value="Truck"><label class="form-check-label" for="formCheck-4">Truck</label></div>
                                    </div>
                                </div>
                                <hr><button class="btn btn-primary d-block btn-user w-100" type="submit" style="border-radius: 0px;background: var(--bs-blue);border-color: var(--bs-blue);">Add</button>
                                <hr>
                            </form>
                            <div class="text-center"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
		        function validateNumber(evt) {
		            var theEvent = evt || window.event;
		            // Handle paste
		            if (theEvent.type === 'paste') {
		                key = event.clipboardData.getData('text/plain');
		            } else {
		                // Handle key press
		                var key = theEvent.keyCode || theEvent.which;
		                key = String.fromCharCode(key);
		            }
		            var regex = /[0-9]|\./;
		            if (!regex.test(key)) {
		                theEvent.returnValue = false;
		                if (theEvent.preventDefault)
		                    theEvent.preventDefault();
		            }

        </script>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>