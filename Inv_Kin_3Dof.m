x = 10;
y = 10;
z = 0;

a = 3; % rectangle a side
b = 6; % rectangle b side


step1 = [x,y];
step2 = [(x+a),y];
step3 = [(x+a),(y + b)];
step4 = [x, (y+b)];
step5 = [x, y];
umu =  [step1;step2; step3; step4; step5];

L0 = 8.5; 
L1 = 18.0;
L2 = 13.0;

for i = 1:1:5
    if i==1
        xd  = umu(i,1);
        yd  = umu(i,2);
        pause(0.5);
        
    end
    
    if i==2
        xd = umu(i,1);
        yd = umu(i,2); 
        
    end
    
    if i==3
        xd  = umu(i,1);
        yd  = umu(i,2);
        
    end
    
    if i==4
        xd  = umu(i,1);
        yd  = umu(i,2);
        
    end
    
    if i==5
        xd  = umu(i,1);
        yd  = umu(i,2);
    end
    
  
    
    
    zd = 0;

    if (zd > L0)
        d2 = xd .* xd + yd .* yd + (zd - L0) .* (zd - L0);
        d = sqrt(d2);
        qsi = acos((L1 * L1 + L2 * L2 - d2) / (2.0 * L1 * L2));
        th3 = qsi - pi;
        alpha = atan2((zd - L0), sqrt(xd .* xd + yd .* yd));
        beta = acos((L2 .* L2 + d2 - L2 .* L2) / (2.0 .* L1 .* d));
        th2 = alpha + beta;

    else
        d2 = xd .* xd + yd .* yd + (L0 - zd).*(L0 - zd);
        d = sqrt(d2);
        qsi = acos((L1 .* L1 + L2 .* L2 - d2) / (2.0 .* L1 .* L2));
        th3 = qsi - pi;
        alpha = atan2((L0 - zd), sqrt(xd .* xd + yd .* yd));
        beta = acos((L1 .* L1 + d2 - L2 .* L2) / (2.0 .* L1 .* d));
        th2 = beta - alpha;
    end

	th1 = atan2(yd, xd);


    rrx = L1.*cos(th1);
    rry = L1.*sin(th1);
    rrz = L0+L1*sin(th2);
    x = cos(th1).*(L1.*cos(th2)+L2.*cos(th2+th3));
    y = sin(th1).*(L2.*cos(th2+th3)+L1.*cos(th2));
    z = L0+L1.*sin(th2)+L2.*sin(th2+th3);
    
    rx = [0,0,rrx,x];
    ry = [0,0,rry,y];
    rz = [0,L1,rrz,z];
    plot3(rx,ry,rz);
   
    hold on



    axis([-10,30,-10,25,0,50]);
    title('3축  Matlab으로 제어');
    xlabel('x축 (m)');
    ylabel('y축 (m)');
    zlabel('z축 (m)');
    grid
end
hold off

