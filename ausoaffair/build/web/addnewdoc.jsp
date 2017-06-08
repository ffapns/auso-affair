<%-- 
    Document   : addnewdoc
    Created on : Mar 1, 2017, 10:25:50 AM
    Author     : fifap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="customcss/custompage.css">
        <title>ADD NEW DOCUMENT - AUSO.JSP</title>

        <script>
            function addOrganizersRow() {
                var orgTb = document.getElementById("organizertb");
                var len = orgTb.rows.length;

                var row = orgTb.insertRow(len);
                console.log(len);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var stdName = "studentId"+len;
                var phoneName = "phoneNo"+len;
                var emailName = "emailAddress"+len;
                var positionName = "teampos"+len;
                cell1.innerHTML = "<input name='"+stdName+"' type='text' class='form-control'/>";
                cell2.innerHTML = "<input name='"+phoneName+"' type='text' class='form-control'/>";
                cell3.innerHTML = "<input name='"+emailName+"' type='text' class='form-control'/>";
                cell4.innerHTML = "<select name='"+positionName+"' style='width: 100%;'><option value='-'>-</option><option value='09'>Participant</option><option value='02'>Project Committee</option><option value='01'>Project Leader</option><option value='03'>Project Staff</option></select>";
            }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/ausoaffair/documentlist.jsp">
                        Student Affair Management Information System
                    </a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <!--                    <ul class="nav navbar-nav">
                                            <li class="active"><a href="#">Home</a></li>
                                            <li><a href="#about">About</a></li>
                                            <li><a href="#contact">Contact</a></li>
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Action</a></li>
                                                    <li><a href="#">Another action</a></li>
                                                    <li><a href="#">Something else here</a></li>
                                                    <li role="separator" class="divider"></li>
                                                    <li class="dropdown-header">Nav header</li>
                                                    <li><a href="#">Separated link</a></li>
                                                    <li><a href="#">One more separated link</a></li>
                                                </ul>
                                            </li>
                                        </ul>-->
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Signed in as :</a></li>
                        <li>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                ${username} <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/AUSOWeb/login.jsp">Sign out</a></li>
                            </ul>
                        </li>

                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>
        <div class="container">
            <div class="page-header">
                <h2>
                    <span class="label label-primary">
                        ADD NEW DOCUMENT
                    </span>
                </h2>
            </div>

            <div class="row" style="margin-bottom: 15px;">
                <div class="col-sm-12">
                    <form method="post" action="SubmitProject">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Activity Unit</label>
                            <p>School of Science and technology</p>
                        </div>
                        <div class="form-group">
                            <label for="refnumb">Reference Number</label>
                            <input name="refno" type="text" class="form-control" id="inputRefNumb" placeholder="ref number...">
                        </div>

                        <div class="form-group">
                            <label for="projectTitle">Project Title</label>
                            <input name="ptitle" type="text" class="form-control" id="inputProjectTitle" placeholder="project title...">
                        </div>

                        <div class="form-group">
                            <label for="projtype">Project Type</label>
                            <div>
                                <select name="projtype">
                                    <option value="-"></option>
                                    <option value="07">Arts &amp; Cultures</option>
                                    <option value="06">Civic Engagement &amp; Ethics</option>
                                    <option value="16">Fund Raising</option><option value="01">Ideal Graduate</option><option value="15">Procurement</option><option value="04">Social Service and Environment Conservation</option>
                                    <option value="03">Sport and Health Promotion</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="projectLevel">Project Level</label>
                            <div>
                                <select name="projectLevel">
                                    <option value="-"></option>
                                    <option value="Institutional">Institutional</option>
                                    <option value="Inter-collegiate">Inter-collegiate</option>
                                    <option value="Regional">Regional</option>
                                    <option value="National">National</option>
                                    <option value="international">International</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="semester">Semester</label>
                            <input name="sem" type="text" class="form-control" id="semester" placeholder="semester... eg. 2/2016">
                        </div>

                        <div class="form-group">
                            <label for="impForm">Implementation Date From</label>
                            <input name="dateFrom" type="date" class="form-control" id="dateFrom" placeholder="">
                        </div>

                        <div class="form-group">
                            <label for="impTp">Implementation Date To</label>
                            <input name="dateTo" type="date" class="form-control" id="dateTo" placeholder="">
                        </div>

                        <div class="form-group">
                            <label for="expParticipant">Expected Participant Number (Persons)</label>
                            <input name="exParticipant" type="text" class="form-control" id="expParticipant" placeholder="participant number (persons)...">
                        </div>

                        <fieldset class="form-group">
                            <label for="radioParType">Participant Type</label>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input name="pType" type="radio" class="form-check-input" name="optionsRadiosPar" id="optionsParRadios1" value="optionPar1">
                                    AU Student
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input name="pType" type="radio" class="form-check-input" name="optionsRadiosPar" id="optionsParRadios2" value="optionPar2">
                                    AU Personal
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="optionsRadiosPar" id="optionsParRadios3" value="optionPar3">
                                    Non-AU Members
                                </label>
                            </div>
                        </fieldset>

                        <fieldset class="form-group">
                            <label for="radioVenue">Venue</label>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input value="On Campus" type="radio" class="form-check-input" name="optionsRadiosCampus" id="optionsVenRadios1" value="optionVen1" checked>
                                    On Campus
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input value="Off Campus" type="radio" class="form-check-input" name="optionsRadiosOffCampus" id="optionsVenRadios2" value="optionVen2">
                                    Off Campus
                                   
                                </label>
                            </div>

                        </fieldset>

                        <div class="form-group">
                            <label for="venueName">Venue Name</label>
                            <input name="venue" type="text" class="form-control" id="venueName" placeholder="venue name...">
                        </div>

                        <fieldset class="form-group">
                            <legend>Organizers <span><button type="button" id="addOrganizer" onClick="addOrganizersRow()" class="btn btn-sm btn-success pull-right">+</button></span></legend>
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="organizertb">
                                        <thead>
                                            <tr>
                                                <th>Student Id</th>
                                                <th>Phone No.</th>
                                                <th>Email Address</th>
                                                <th>Position</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>

                                                <td>
                                                    <input name="studentId1" type="text" class="form-control"/>
                                                </td>
                                                <td>
                                                    <input name="phoneNo1" type="text" class="form-control"/>
                                                </td>
                                                <td>
                                                    <input name="emailAddres1" type="text" class="form-control"/>
                                                </td>
                                                <td>
                                                    <select name="teampos1" style="width: 100%;">
                                                        <option value="-">-</option>

                                                        <option value="09">Participant</option>

                                                        <option value="02">Project Committee</option>

                                                        <option value="01">Project Leader</option>

                                                        <option value="03">Project Staff</option>
                                                    </select>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="form-group">
                            <legend>Advisors <span><button type="button" class="btn btn-sm btn-success pull-right">+</button></span></legend>
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="advisortb">
                                        <thead>
                                            <tr>

                                                <th>Advisor Name</th>
                                                <th>Advisor Position</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input name="advisorName" type="text" class="form-control"/>
                                                </td>

                                                <td>
                                                    <select name="advisorPosition1" style="width: 100%;">
                                                        <option value="-">-</option>
                                                        <option value="Student Activity Advisor">Student Activity Advisor</option>
                                                        <option value="Coordinator from each faculty">Student Development Coordinator</option>
                                                    </select>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </fieldset>

                        <div class="form-group">
                            <label for="kpis">KPIs</label>
                            <textarea class="form-control" id="kpis" rows="3"></textarea>
                        </div>

                        <fieldset class="form-group">
                            <legend>Goals <span><button type="button" class="btn btn-sm btn-success pull-right">+</button></span></legend>
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="goaltb">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    1
                                                </td>
                                                <td>
                                                    <input name="goalTxt" type="text" class="form-control"/>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="form-group">
                            <legend>Expected Results <span><button type="button" class="btn btn-sm btn-success pull-right">+</button></span></legend>
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="expResulttb">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    1
                                                </td>
                                                <td>
                                                    <input name="expResTxt" type="text" class="form-control"/>
                                                </td>                                              
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="form-group">
                            <legend>Estimated Revenues <span><button type="button" class="btn btn-sm btn-success pull-right">+</button></span></legend>
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="expResulttb">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Revenue Type</th>
                                                <th>Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    1
                                                </td>
                                                <td>
                                                    <select name="income1" style="width:100%;">
                                                        <option value="-">-</option>

                                                        <option value="I0001">Commission of higher education support</option>

                                                        <option value="I0002">Fees</option>

                                                        <option value="I0003">Other Income - Sales</option>

                                                        <option value="I0006">Other income - Donation</option>

                                                        <option value="I0004">Sponsorship</option>

                                                        <option value="I0005">Student Organization Support</option>
                                                    </select>
                                                </td>

                                                <td>
                                                    <input name="Amount1" type="text" class="form-control"/>
                                                </td> 

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset class="form-group">
                            <legend>Estimated Expenses <span><button type="button" class="btn btn-sm btn-success pull-right">+</button></span></legend>
                            <div class="row">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="estimatedExp">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Expense Type</th>
                                                <th>Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    1
                                                </td>
                                                <td>
                                                    <select name="expExpense1" style="width:100%;" class="LK">
                                                        <option value="-">-</option>

                                                        <option value="E0002">Accommodation and seminar room</option>

                                                        <option value="E0012">Document</option>

                                                        <option value="E0010">Equipment</option>

                                                        <option value="E0001">Food and beverage</option>

                                                        <option value="E0011">Medicine</option>

                                                        <option value="E0018">Miscellaneous</option>

                                                        <option value="E0006">Promotion</option>

                                                        <option value="E0007">Remuneration</option>

                                                        <option value="E0009">Supply</option>

                                                        <option value="E0005">Survey</option>

                                                        <option value="E0003">Transportation</option>
                                                    </select>
                                                </td>

                                                <td>
                                                    <input name="Amount1" type="text" class="form-control"/>
                                                </td> 

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </fieldset>

                        <div class="button-group">
                            <button type="submit" class="btn btn-primary pull-right">Submit</button>
                            <a href="/ausoaffair/documentlist.jsp">
                                <button type="button" class="btn btn-default pull-right" style="margin-right: 5px;">Cancel</button>
                            </a>

                        </div>

                    </form>
                </div>
            </div>

        </div>


        <footer class="footer">
            <div class="container">
                <p class="text-muted"></p>
            </div>
        </footer>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
