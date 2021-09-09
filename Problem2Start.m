%% Do not edit this part

% It reads the matrix from the excel file and creates your x and y arrays
a = readmatrix('problem2.csv');
x = a(:,1);
y = a(:,2);
plot(x,y,'o') % plots the original data, do not edit
hold on
%% Write your code here to calculate the MLS for a 3rd-order polynomial.
% The system must be solved by any method you programmed (please note if
% reusing code from another assignment, such as the take-home midterm).

%plotting line of best fit at the beginning
for i = (1:500)
y9(i) = 8.0015+(1.8956.*x(i))+(4.0345.*(x(i).^2));
end
plot(x,y9,'linewidth',2)
hold off

%%finding the answer
%sum of x values 
x_sum =0; 
for e = (1:500)
    x_sum = x_sum +x(e);
end 

%sum of x squared
x_squared = 0;
for i = (1:500)
    x1(i) = (x(i).^2);
    x_squared = x_squared + x1(i);
end

%sum of x cubed
x_cube=0;
for j = (1:500)
    x2(j) = (x(j).^3);
    x_cube = x_cube + x2(j);
end

%sum of x to the forth
x_forth=0;
for k = (1:500)
    x3(k) = (x(k).^4);
    x_forth = x_forth + x3(k);
end

%sum of y values 
y_sum = 0;
for g = (1:500)
    y_sum = y_sum +y(g);
end

%sum of xy
xy = 0;
for s = (1:500)
    xy = xy + (x(s).*y(s));
end

%sum of x squared y 
x_squaredy=0;
for u = (1:500)
    x_squaredy = x_squaredy + ((x(u).^2).*y(u));
end


%used homework and last take home exam code to solve system 
Aug = [500 x_sum x_squared y_sum;
       x_sum x_squared x_cube xy;
       x_squared x_cube x_forth x_squaredy];
   
  Aug2 = Aug; 
  
  n=3;
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
c = sol(:,4)';

disp(c); 



%% This section plots the original data and your result on a plot that must be submitted.
legend('Given data','Fit polynomial') % leave this line
text(.1,70,char(java.lang.System.getProperty('user.name'))) % leave this line, proves your work
text(.1,65,char(java.net.InetAddress.getLocalHost.getHostName)) % leave this line, proves your work