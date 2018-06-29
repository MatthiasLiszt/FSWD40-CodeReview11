
var Login=false;

var Sites={"offices": "office_list.php","cars": "cars_list.php","locFilter": "location_filter.php"};

$("#showOffices").click(function(){var iframe=`<iframe src="${Sites.offices}">`;
                                   //alert(iframe);
                                   $("#phpsite").html(iframe);
                                   $("#phpsite").show();
                                  });

$("#showCars").click(function(){var iframe=`<iframe src="${Sites.cars}">`;
                                   //alert(iframe);
                                   $("#phpsite").html(iframe);
                                   $("#phpsite").show();
                                  });

//alert(Sites.offices);

$.get("officelist.php",function(data){initOfficeSelect(data);});

function initOfficeSelect(data){
 var options=[];
 var o=`<option value='0'>---</option>`;
 var json=JSON.parse(data);
 options.push(o);
 json.map(function(x){var o=`<option value='${x.id}'>${x.name}</option>`;
                      options.push(o);
                     });
 $('#officeSelect').html(options.join(''));
}

$('#officeSelect').change(function(){var location=$('#officeSelect').val();
                                     var iframe=`<iframe src="${Sites.locFilter}?location=${location}">`;
                                     //alert(location);
                                     $("#phpsite").html(iframe);
                                     $("#phpsite").show();
                                    });

$('#register').click(function(){var iframe=`<iframe src="register.php">`;
                                   
                     $("#phpsite").html(iframe);
                     $("#phpsite").show();
                    });


function doLogCheck(){
 var password=$('#password').val();
 //alert(password);
 $.post("login.php",{"username": $('#username').val(), "password": password},function(data){doLogin(data)});
}

function doLogin(data){
 //alert(data);
 var logdata=JSON.parse(data);
 Login=logdata.Login;
 Sites=logdata.Sites;
 if(Login)
  {$("#login").hide();
   $("#register").hide();
   $("#logout").show();
   $("#showCars").show();
   $("#showOffices").show();
   $("#officeSelect").show();
   $("#phpsite").text("you are successfully logged in");
  }
}



$('#login').click(function(){var loginForm=`<h1>LogIn Form</h1>

                                              <p><input type="text" placeholder="username" id="username"></p>
                                              <p><input type="password" placeholder="password" id="password"></p>
                                              <p><button onclick="doLogCheck()">logIn</button></p>
                                             `;

                     //alert('login'); 
                     $("#phpsite").html(loginForm);
                     $("#phpsite").show();
                    });

function initPage(){
 if(!Login)
  {$('#showCars').hide();
   $('#showOffices').hide();
   $('#officeSelect').hide();
   $('#logout').hide();
  }
 
}

initPage();
