syms l1 l2 l3 l4
syms c1 c2 c3 c4 c5 c6
syms s1 s2 s3 s4 s5 s6
syms th1 th2 th3 th4 th5 th6



th1 = pi/1;
th2 = pi/3;
th3 = pi/4;
th4 = pi/5;
th5 = pi/7;
th6 = 0;

l1 = 2; 
l2 = 2;
l3 = 3;
l4 = 3;
h = 10;



c1 = cos(th1); 
c2 = cos(th2); 
c3 = cos(th3); 
c4 = cos(th4); 
c5 = cos(th5 ); 
c6 = cos(th6); 

s1 = sin(th1);
s2 = sin(th2);
s3 = sin(th3);
s4 = sin(th4);
s5 = sin(th5 );
s6 = sin(th6);

%T = 
% ci    -si*cos(alpha)    si*sin(alpha)   ci*a
% si    ci*cos(alpha)     -ci*sin(alpha)  si*a
% 0     sin(aplha)        cos(alpha)        d
% 0       0                 0               1

A0 = [1, 0, 0, 0; 
    0, 0, 1, 0; 
    0, -1, 0, h; 
    0, 0, 0, 1 ];

A1 = [c1, 0, s1, 0;
    s1, 0, -c1, 0; 
    0, 1, 0, l1;
    0, 0, 0, 1 ];

A2 = [c2, -s2, 0, l2*c2; 
    s2, c2, 0, s2*l2; 
    0, 0, 1, 0;
    0, 0, 0, 1];

A3 = [c3, 0, s3, 0;   
    s3, 0, -c3, 0; 
    0, 1, 0, 0; 
    0, 0, 0, 1]; 

A4 = [c4, 0, s4, 0; 
    s4, 0, -c4, 0; 
    0, 1, 0, l3; 
    0, 0, 0, 1];

A5 = [c5, 0, -s5, 0; 
    s5, 0, c5, 0; 
    0, -1, 0, 0; 
    0, 0, 0, 1];

A6 = [c6, -s6, 0, 0; 
    s6, c6, 0 0; 
    0, 0, 1, l4; 
    0, 0, 0, 1];

T0 = A0;
T1 = T0*A1;
T2 = T1*A2;
T3 = T2*A3;
T4 = T3*A4;
T5 = T4*A5;
T6 = T5*A6;

T7 = T2*T3*T4*T5*T6;

x0 = T0(1,4);
x1 = T1(1,4); 
x2 = T2(1,4);  
x3 = T3(1,4);
x4 = T4(1,4);
x5 = T5(1,4);
x6 = T6(1,4);
 
y0 = T0(2,4);
y1 = T1(2,4);
y2 = T2(2,4);
y3 = T3(2,4);
y4 = T4(2,4);
y5 = T5(2,4);
y6 = T6(2,4);
 
z0 = T0(3,4);
z1 = T1(3,4);
z2 = T2(3,4);
z3 = T3(3,4);
z4 = T4(3,4);
z5 = T5(3,4);
z6 = T6(3,4);

x = [0,x0,x1,x2,x3,x4,x5,x6];
y = [0,y0,y1,y2,y3,y4,y5,y6];
z = [0,z0,z1,z2,z3,z4,z5,z6];

plot3(x,y,z);

axis([-10,15,-10,15,0,20]);
title('3축 로봇 역기구학와 순기구학을 Matlab으로 제어');
xlabel('x축 (m)');
ylabel('y축 (m)');
zlabel('z축 (m)');
grid

