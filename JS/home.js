"use strict"
var colorsElem={home1: 'white', home2: 'white', home3: 'white', home4: 'white', home5: 'white'}
localStorage.setItem('homeDiv', JSON.stringify(colorsElem))
var homeWidth=300;
var homeHeight=300;
var homeElem1X=60;
var homeElem1Y=95;
var homeElem1Width=180;
var homeElem1Height=180;
var homeElem2X=160;
var homeElem2Y=165;
var homeElem2Width=50;
var homeElem2Height=110;
var homeElem3X=80;
var homeElem3Y=130;
var homeElem3Width=25;
var homeElem3Height=60;
var homeElem4X=105;
var homeElem4Y=130;
var homeElem4Width=25;
var homeElem4Height=60;


var picS=document.getElementById('homeDiv');
var home=document.createElementNS ( "http://www.w3.org/2000/svg" , "svg" );
picS.appendChild (home);
home.setAttribute ('width', homeWidth);
home.setAttribute ('height',homeHeight);





var homeElem1=document.createElementNS("http://www.w3.org/2000/svg",'rect');
homeElem1.setAttribute("stroke","black");
homeElem1.setAttribute("fill",colorsElem.home1);
homeElem1.setAttribute("x",homeElem1X);
homeElem1.setAttribute("y",homeElem1Y);
homeElem1.setAttribute("width",homeElem1Width);
homeElem1.setAttribute("height",homeElem1Height);
homeElem1.setAttribute("id","home1");
home.appendChild(homeElem1);

var homeElem2=document.createElementNS("http://www.w3.org/2000/svg",'rect');
homeElem2.setAttribute("stroke","black");
homeElem2.setAttribute("fill",colorsElem.home2);
homeElem2.setAttribute("x",homeElem2X);
homeElem2.setAttribute("y",homeElem2Y);
homeElem2.setAttribute("width",homeElem2Width);
homeElem2.setAttribute("height",homeElem2Height);
homeElem2.setAttribute("id","home2");
home.appendChild(homeElem2);

var homeElem3=document.createElementNS("http://www.w3.org/2000/svg",'rect');
homeElem3.setAttribute("stroke","black");
homeElem3.setAttribute("fill",colorsElem.home3);
homeElem3.setAttribute("x",homeElem3X);
homeElem3.setAttribute("y",homeElem3Y);
homeElem3.setAttribute("width",homeElem3Width);
homeElem3.setAttribute("height",homeElem3Height);
homeElem3.setAttribute("id","home3");
home.appendChild(homeElem3);

var homeElem4=document.createElementNS("http://www.w3.org/2000/svg",'rect');
homeElem4.setAttribute("stroke","black");
homeElem4.setAttribute("fill",colorsElem.home4);
homeElem4.setAttribute("x",homeElem4X);
homeElem4.setAttribute("y",homeElem4Y);
homeElem4.setAttribute("width",homeElem4Width);
homeElem4.setAttribute("height",homeElem4Height);
homeElem4.setAttribute("id","home4");
home.appendChild(homeElem4);

var homeElem5=document.createElementNS("http://www.w3.org/2000/svg",'path');
homeElem5.setAttribute("stroke","black");
homeElem5.setAttribute("fill",colorsElem.home5);
homeElem5.setAttribute("d", 'M 20 95 l 130 -50 l 130 50 Z')
homeElem5.setAttribute("id","home5");
home.appendChild(homeElem5);
