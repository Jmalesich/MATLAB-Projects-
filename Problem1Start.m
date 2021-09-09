%% Do not edit this part
% It reads the matrix from the excel file and creates your x and y arrays
a = readmatrix('problem1.csv');
x = a(:,1);
y = a(:,2);
%% Write your code for the trapezoidal rule for non-uniform data here
integral = 0;
%trap rule code used for project  
for i = (1:999)
    p(i)=((y(i)+y(i+1))./2).*(x(i+1)-x(i));
    integral = integral + p(i);
end




%At the end of your code, you should write out the total value of the
%integral, then copy/paste this solution into your submission document.
disp(integral)
disp(char(java.lang.System.getProperty('user.name'))) % leave this line, proves your work
disp(char(java.net.InetAddress.getLocalHost.getHostName)) % leave this line, proves your work