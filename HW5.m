%%Problem 9.7
clear all
% delta t is one second 
T(1) = 473;
t(1) = 0;
b = 323;
i = 1;
while T(i) > b 
    f(i) = ((-((0.5.*5.67.*(10.^-8).*((T(i).^4)-(298.^4)))+(15.*(T(i)-298))).*0.007854)./235.44);
    q(i)  = f(i) + T(i);
    f2(i) = ((-((0.5.*5.67.*(10.^-8).*((q(i).^4)-(298.^4)))+(15.*(q(i)-298))).*0.007854)./235.44);
    T(i+1) = T(i) + (0.5.*(f(i) + f2(i)));
    i = i + 1; 
    t(i) = i;
end

disp('9.7 one second:');
disp(T(1)-273); %time 0 
disp(T(61)-273); %time 60s
disp(T(121)-273); %time 120s
disp(T(181)-273); %time 180s 
 
tiledlayout(3,1) 
nexttile
plot(t/60 , T);
xlabel('Time(min)');
ylabel('Temperature (K)');
title ('One second');



% delta t is 0.5s 
Y(1) = 473;
y(1) = 0;
j = 1;
while Y(j) > b 
    f3(j) = ((-((0.5.*5.67.*(10.^-8).*((Y(j).^4)-(298.^4)))+(15.*(Y(j)-298))).*0.007854)./235.44);
    p(j)  = f3(j) + Y(j);
    f4(j) = ((-((0.5.*5.67.*(10.^-8).*((p(j).^4)-(298.^4)))+(15.*(p(j)-298))).*0.007854)./235.44);
    Y(j+1) = Y(j) + (0.25.*(f3(j) + f4(j)));
    j = j + 1; 
    y(j) = j;
end

disp('9.7 half second:');
disp(Y(1)-273); %time 0 
disp(Y(121)-273); %time 60s
disp(Y(241)-273); %time 120s
disp(Y(361)-273); %time 180s 

nexttile
plot(y/120 , Y);
xlabel('Time(min)');
ylabel('Temperature (K)');
title ('Half-second');

%%Problem 9.8 
G(1)=473;
g(1) = 0;
k = 1;
while  G(k) > b
    f5(k) = -(3.335.*(10.^-3)).*(G(k)-298);
    f6(k) = G(k) + ((1./2).*f5(k));
    G(k+1) = G(k)-((3.335.*(10.^-3)).*(f6(k)-298)); 
    k = k+1;
    g(k) = k;
end

nexttile
plot(g/120 , G);
xlabel('Time(min)');
ylabel('Temperature (K)');
title ('9.8');


disp('9.8:');
disp(G(121)-273);
disp(G(241)-273);
disp(G(361)-273);

%error
t1= 473-(3.335.*(10.^-3)).*(473-298);
error = G(2)-t1;
disp('error:');
disp(error);
