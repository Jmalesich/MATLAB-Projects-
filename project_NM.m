%%Initialize Variables 
clear all 
P=1;
BC=0;
L=1;
A=1;
B=-2;
C=1;

n=101;

dy = L/(n-1);
y = 0:dy:L;
y1 = (-2.*P.*(dy.^2));

Aug = zeros(n,n+1); 
Aug(1,1)= 1; 
Aug(1,n+1) = 0; 

for i=2:n-1 
   Aug(i,i-1) = A ;
   Aug(i,i)   = B;
   Aug(i,i+1) = C;
end

for i=2:n-1
    Aug(i,n+1) = y1;
end

Aug(n,n) = 1;
Aug(n,n+1) = BC;

Aug_2 = Aug;

q =rand(n);
[m, n] = size(q); 
c = zeros(1,n + 1); 

w = rref(Aug);

for x = 1:m-1
    for p = 1:n 
    [g ,j] = max(abs(Aug(p:n,p)));
    c = Aug(p,:);
    Aug(p,:) = Aug(j + p-1,:);
    Aug(j + p-1,:) = c;
             if Aug(p,p) ==0
                  disp('aug was singular. No unique solution');
             end 
    end
 for d = x+1:m
    Aug (d,:)=Aug(d,:)-Aug(x,:).*Aug(d,x)./Aug(x,x);
 end
end
for x = m:-1:2
    for d = x-1:-1:1
         Aug (d,:)=Aug(d,:)-Aug(x,:).*Aug(d,x)./Aug(x,x);
    end 
end
for k = 1:m
    Aug(k,:)=Aug(k,:)./Aug(k,k);
end 
sol = Aug;
u = sol(:,n+1)';




plot(y,u)
title('y vs u');
xlabel('y');
ylabel('u');
%hold on 

%%Finding Tau (wall shear stress) 
tau = ((-3.*u(1)+(4.*u(2))-u(3)))./(2.*dy);

V_tot = 0;
%Velocity via trap rule  
for i = (2:n-1)
    V(i)=((u(i)+u(i+1))./2).*(dy);
    V_tot = V_tot + V(i);
end

%%Code used to calculate and plot analytical data 
y1 = (0:0.01:1);
for i = (1:100)
    k(i)= y1(i) - y1(i).^2;
    o(i) = y1(i);
end 

%uncomment to see analytical plot 
%plot(o,k);
%hold off
%title('Analytical plot');
%xlabel('y');
%ylabel('u');


