%%Problem 4.5
%parameters 
A = exp(21.6);
T = 400;
B = -2420;
P400 = A.*exp(B./T);

%differentiation up to 4 terms 
F_prime = (-B./T.^2).*(exp(B./T));
F2_prime = ((B.^2./T^4)+(2.*B./T.^3)).*exp(B./T);
F3_prime = ((-B.^3/T.^6)-(6.*B/T.^5)-(6.*B/T.^4)).*exp(B./T);

%time to set up the equations at each temp and compare to exact value 
delta3 = 410-400;
P410 = P400 + (delta3.*(A.*F_prime)) + ((delta3.^2/factorial(2)).*(A.*F2_prime))+((delta3.^3/factorial(3)).*(A.*F3_prime));
exact1= A.*exp(-2420/410); 
error1 = P410 - exact1;

delta2= 420-400;
P420 = P400 + (delta2.*(A.*F_prime)) + ((delta2.^2/factorial(2)).*(A.*F2_prime))+((delta2.^3/factorial(3)).*(A.*F3_prime));
exact2= A.*exp(-2420/420); 
error2 = P420 - exact2;

delta3 = 450-400;
P450 = P400 + (delta3.*(A.*F_prime)) + ((delta3.^2/factorial(2)).*(A.*F2_prime))+((delta3.^3/factorial(3)).*(A.*F3_prime));
exact3= A.*exp(-2420/450); 
error3 = P450 - exact3;

%the error is increasing with the deviation from the original because it is
%the same amount of terms with a bigger delta_t 

%%Problem 4.12
%Forward difference with 2nd order accuracy 
%in this problem I will use step sizes 0.01 0.001 and 0.0001
%0.01
for i = [0.01 0.001 0.0001]
x = 0;
step_size2 = i.*2;
step_size3 = i.*3;
Tx = (15.5 + 68.2.*(1-((exp(-(x)/2.7)/(1+(x).^2)))));
Tx_plus = (15.5 + 68.2.*(1-((exp(-(i)./2.7)/(1+(i).^2)))));
Tx_plus2 = (15.5 + 68.2.*(1-((exp(-(step_size2)./2.7)/(1+(step_size2).^2)))));
Tx_plus3 = (15.5 + 68.2.*(1-((exp(-(step_size3)./2.7)/(1+(step_size3).^2)))));

Fprime_1 = (-Tx_plus2 + 4.*Tx_plus - 3.*Tx)/step_size2;
Fprime_2 = (2.*Tx - 5.*Tx_plus + 4.*Tx_plus2 - Tx_plus3)/(i.^2);
disp(Tx);
disp(Fprime_1);
disp(Fprime_2);
end

%%4.15
%second order central difference
for j = [0.05 0.1 0.2]
    y = 0.5;
    y_plus = y + j;
    y_minus = y - j;
    
    y1 = -(y.^1.3);
    y2 = -(y.^0.7);
    y3 = -(y_plus.^1.3);
    y4 = -(y_plus.^0.7);
    y5 = -(y_minus.^1.3);
    y6 = -(y_minus.^0.7);
    
    z = ((y.^2)/(3.*pi));
    z1 = ((y_plus.^2)/(3.*pi));
    z2 = ((y_minus.^2)/(3.*pi)); 
    
    shear1 = 1.1.*exp(y1).*cos(z);
    shear2 = 0.9.*exp(y2).*sin(z);
    shear_tot = shear1 + shear2;
    disp(shear_tot);
    
    shear1_plus =  1.1.*exp(y3).*cos(z1);
    shear2_plus = 0.9.*exp(y4).*sin(z1);
    shearplus_tot = shear1_plus + shear2_plus;
    disp(shearplus_tot);
    
    shear1_minus = 1.1.*exp(y5).*cos(z2);
    shear2_minus = 0.9.*exp(y6).*sin(z2);
    shearminus_tot = shear1_minus + shear2_minus;
    disp(shearminus_tot);
    
    shearprime1 = (shearplus_tot - shearminus_tot)./(2.*j);
    shearprime2 = (shearminus_tot + shearplus_tot - (2.*shear_tot))./(j.^2);
    
    disp(shearprime1);
    disp(shearprime2);
end

%%Problem 4.17
%for this problem I will use RRef to solve the system of equations and
%solve A0 = 0
a = [1 1 1 1.7; 1.5 2.25 3.375 3.3; 2 4 8 5.6];

rref(a);

%the output will give the A values for the derrivative equation
% output this program gives is a1=1 a2=0.5 a3=0.2
%DE/DV = a1+2a2+3a3
v = 0;
DE = 1 + 1.*v + 0.6.*v;
disp(DE);
%we then get that the gradient at v = 0 is 1 






