%%Problem 5.13
clear all 
%Plotting function 
t = (350:1:850);
f = ((3.402*(10.^-8)).*((850.^4)-(t.^4))-(40.*(t-350)));


plot(t, f);
xlabel('Time t (sec)');
ylabel('F(t)');
title('F(t) vs t');


%search method
for i =  (1:500)
    j = f(i).*f(i+1); 
       if j < 0 
           x1 = i+349;
           x2 = i+350;
           x3 = 1;
           disp(x1);
           disp(x2);
       end
end


%found that root is between 645 and 646
for u = (1:300) 
r = ((3.402.*(10.^-8)).*((850.^4)-(x1.^4))-(40.*(x1-350)));    
r2 = ((3.402.*(10.^-8)).*((850.^4)-(x2.^4))-(40.*(x2-350)));
x3 = (((x1.*r2)-(x2.*r))./(r2-r));
r3 = ((3.402.*(10.^-8)).*((850.^4)-(x3.^4))-40.*((x3-350)));
k = r.*r3;
    if k < 0
        x2 = x3;
    end
    if k > 0 
        x1 = x3;
    end
end
disp('Regula falsi root:');
disp(x3);

%online roots calculator showed root at 645.92148

%newton-raphson
r1 = 645;
for e = (1:5)
  r9 = ((3.402.*(10.^-8)).*((850.^4)-(r1.^4))-(40.*(r1-350))); 
  f_prime = (-0.00000013.*(r1.^3))-40;
  r3 = r1-(r9./f_prime); 
  r1 = r3;
end
disp('Newton_raphson 5.13:');
disp(r3);

%%Problem 5.15
x = (0:0.001:0.1);
Re_1 = ((x.^(-0.5)))-(2.*log10((10.^4).*(x.^0.5)))+0.8;
Re_2 = ((x.^(-0.5)))-(2.*log10((10.^6).*(x.^0.5)))+0.8;

%search method 
for i =  (1:100)
    s = Re_1(i).*Re_1(i+1); 
       if s < 0 
           f1 = (i-1)./1000;
           f2 = (i)./1000;
          disp('Re 10^4 interval:'); 
           disp(f1);
           disp(f2);
       end
end

for i =  (1:100)
    p = Re_2(i).*Re_2(i+1); 
       if p < 0 
           g1 = (i-1)./1000;
           g2 = (i)./1000; 
           disp('Re 10^6 interval:');
           disp(g1);
           disp(g2);
       end
end


%Newton-Raphson
for u = (1:6)
   Re = ((f1.^(-0.5)))-(2.*log10((10.^4).*(f1.^0.5)))+0.8;
   z = log(10);
   w = (-(1./(f1.*z))-(0.5./(f1^1.5)));
   f3 = f1-(Re./w);
   f1 = f3;
end
disp('Newton method 10^4:');
disp(f3);

for u = (1:6)
   Re = ((g1.^(-0.5)))-(2.*log10((10.^6).*(g1.^0.5)))+0.8;
   z = log(10);
   w = (-(1./(g1.*z))-(0.5./(g1^1.5)));
   f4 = g1-(Re./w);
   g1 = f4;
end
disp('Newton method 10^6:');
disp(f4);

%bisection Method
for v = (1:300)
    l = (0.5.*(f1+f2));
    k1 = ((f1.^(-0.5)))-(2.*log10((10.^4).*(f1.^0.5)))+0.8;
    k2 = ((l.^(-0.5)))-(2.*log10((10.^4).*(l.^0.5)))+0.8;
    d = (k2.*k1);
        if d < 0 
            f2 = l;
        end
        if d > 0
            f1 = l;
        end
end
disp('Bisection method 10^4:');
disp(l);

for v = (1:300)
    s1 = (0.5.*(g1+g2));
    k3 = ((g1.^(-0.5)))-(2.*log10((10.^4).*(g1.^0.5)))+0.8;
    k4 = ((s1.^(-0.5)))-(2.*log10((10.^4).*(s1.^0.5)))+0.8;
    od = (k4.*k3);
        if od < 0 
            g2 = s1;
        end
        if od > 0
            g1 = s1;
        end
end
disp('Bisection method 10^6:');
disp(s1);