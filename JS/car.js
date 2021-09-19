"use strict"
var colorsElem={car1: 'white',wheelsBig1: 'white',wheelsSmall1: 'white',wheelsBig2: 'white',wheelsSmall2: 'white', car2: 'white',car3: 'white',car4: 'white'}
localStorage.setItem('carDiv', JSON.stringify(colorsElem))
var carWidth=300;
var carHeight=300;
var carElem1X=30;//координата X основного элемента машины
var carElem1Y=160;//координата Y основного элемента машины
var carElem1Width=240;//ширина основного элемента машины
var carElem1Height=70;//высота основного элемента машины
var carElem1radiusX=20;
var carElem1radiusY=10;
var wheels1X=90;
var wheels2X=215;
var wheelsY=230;
var radius1=30;//радиус колеса внешний
var radius2=16;//радиус колеса внутренний
var carElem3X=100;
var carElem3Y=100;
var carElem3Width=100;
var carElem3Height=60;

var picS1=document.getElementById('carDiv');
var car=document.createElementNS ( "http://www.w3.org/2000/svg" , "svg" );
picS1.appendChild (car);
car.setAttribute ('width', carWidth);
car.setAttribute ('height',carHeight);


var carElem1=document.createElementNS("http://www.w3.org/2000/svg",'rect');
carElem1.setAttribute("stroke","black");
carElem1.setAttribute("fill",colorsElem.car1);
carElem1.setAttribute("x",carElem1X);
carElem1.setAttribute("y",carElem1Y);
carElem1.setAttribute("width",carElem1Width);
carElem1.setAttribute("height",carElem1Height);
carElem1.setAttribute("rx",carElem1radiusX);
carElem1.setAttribute("id","car1");
car.appendChild(carElem1);

var wheels1B=document.createElementNS("http://www.w3.org/2000/svg",'circle');
wheels1B.setAttribute("stroke","black");
wheels1B.setAttribute("fill",colorsElem.wheelsBig1);
wheels1B.setAttribute("cx",wheels1X);
wheels1B.setAttribute("cy",wheelsY);
wheels1B.setAttribute("r",radius1);
wheels1B.setAttribute("id","wheelsBig1");
car.appendChild(wheels1B);

var wheels1S=document.createElementNS("http://www.w3.org/2000/svg",'circle');
wheels1S.setAttribute("stroke","black");
wheels1S.setAttribute("fill",colorsElem.wheelsSmall1);
wheels1S.setAttribute("cx",wheels1X);
wheels1S.setAttribute("cy",wheelsY);
wheels1S.setAttribute("r",radius2);
wheels1S.setAttribute("id","wheelsSmall1");
car.appendChild(wheels1S);

var wheels2B=document.createElementNS("http://www.w3.org/2000/svg",'circle');
wheels2B.setAttribute("stroke","black");
wheels2B.setAttribute("fill",colorsElem.wheelsBig2);
wheels2B.setAttribute("cx",wheels2X);
wheels2B.setAttribute("cy",wheelsY);
wheels2B.setAttribute("r",radius1);
wheels2B.setAttribute("id","wheelsBig2");
car.appendChild(wheels2B);


var wheels2S=document.createElementNS("http://www.w3.org/2000/svg",'circle');
wheels2S.setAttribute("stroke","black");
wheels2S.setAttribute("fill",colorsElem.wheelsSmall2);
wheels2S.setAttribute("cx",wheels2X);
wheels2S.setAttribute("cy",wheelsY);
wheels2S.setAttribute("r",radius2);
wheels2S.setAttribute("id","wheelsSmall2");
car.appendChild(wheels2S);

var carElem2=document.createElementNS("http://www.w3.org/2000/svg",'path');
carElem2.setAttribute("stroke","black");
carElem2.setAttribute("fill",colorsElem.car2);
carElem2.setAttribute("d", 'M 65 160 l 35 -60 v 60 Z')
carElem2.setAttribute("id","car2");
car.appendChild(carElem2);

var carElem3=document.createElementNS("http://www.w3.org/2000/svg",'rect');
carElem3.setAttribute("stroke","black");
carElem3.setAttribute("fill",colorsElem.car3);
carElem3.setAttribute("x",carElem3X);
carElem3.setAttribute("y",carElem3Y);
carElem3.setAttribute("width",carElem3Width);
carElem3.setAttribute("height",carElem3Height);
carElem3.setAttribute("id","car3");
car.appendChild(carElem3);

var carElem4=document.createElementNS("http://www.w3.org/2000/svg",'path');
carElem4.setAttribute("stroke","black");
carElem4.setAttribute("fill",colorsElem.car4);
carElem4.setAttribute("d", 'M 235 160 l -35 -60 v 60 Z')
carElem4.setAttribute("id","car4");
car.appendChild(carElem4);
