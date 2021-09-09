
%6.5
% % Enter input data % 
a = [1 0 0;
     0 1 0;
     0 0 1];
    [m, n] = size(a); 
x = zeros(n,1);
c = zeros(1,n + 1); 

aug = [0 1 3 26;
       1 -4 0 -4;
       5 -2 0 16];
 
% % % Partial pivoting and GJ elimination(using book example for help) 
for x = 1:m-1
    for p = 1:n 
    [y ,j] = max(abs(aug(p:n,p)));
    c = aug(p,:);
    aug(p,:) = aug(j + p-1,:);
    aug(j + p-1,:) = c;
             if aug(p,p) ==0
                  disp('aug was singular. No unique solution');
             end 
             disp(aug);
            
    end
 for y = x+1:m
    aug (y,:)=aug(y,:)-aug(x,:).*aug(y,x)./aug(x,x);
 end
end
for x = m:-1:2
    for y = x-1:-1:1
         aug (y,:)=aug(y,:)-aug(x,:).*aug(y,x)./aug(x,x);
    end 
end
for k = 1:m
    aug(k,:)=aug(k,:)./aug(k,k);
end 
disp(aug)

%%6.12
aug2 = [2 2 3 15; 
        1 3 1 10;
        3 -1 2 7];
q = rref(aug2);
disp(q);

%%6.16
a = [ 1 0 0 ;
    0 1 0 ;
    0 0 1];
[m, n] = size(a); 
x = zeros(n,1);
c = zeros(1,n + 1); 

aug3 = [1 2 4 18;
      2 3 -5 -18;
      4 -1 -1 -14];  
 w = rref(aug3);
% % % Partial pivoting and GJ elimination (using book example for help) 
for x = 1:m-1
    for p = 1:n 
    [y ,j] = max(abs(aug3(p:n,p)));
    c = aug3(p,:);
    aug3(p,:) = aug3(j + p-1,:);
    aug3(j + p-1,:) = c;
             if aug3(p,p) ==0
                  disp('aug was singular. No unique solution');
             end 
    end
 for y = x+1:m
    aug3 (y,:)=aug3(y,:)-aug3(x,:).*aug3(y,x)./aug3(x,x);
 end
end
for x = m:-1:2
    for y = x-1:-1:1
         aug3 (y,:)=aug3(y,:)-aug3(x,:).*aug3(y,x)./aug3(x,x);
    end 
end
for k = 1:m
    aug3(k,:)=aug3(k,:)./aug3(k,k);
end 
disp(aug3)
if w == aug3
    disp('correct');
end 



          

