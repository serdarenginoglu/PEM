%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation:
% Enginoğlu, S., Çağman, Ç., 2020. Fuzzy Parameterized Fuzzy Soft Matrices 
% and Their Application in Decision-Making. TWMS Journal of Applied and 
% Engineering Mathematics, 10(4), 1105-1115
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abbreviation of Journal Title: TWMS J. App. and Eng. Math.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://jaem.isikun.edu.tr/web/images/articles/vol.10.no.4/25.pdf
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% https://www.researchgate.net/profile/Serdar_Enginoglu2
% https://www.researchgate.net/profile/N-Cagman
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Demo: 
% clc;
% clear all;
% % a is an fpfs-matrix
% % s is a score matrix
% % dm is a decision matrix
% % op is a optimum alternatives' matrix 
% a=rand(5,4); 
% [s,dm,op]=PEM(a);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[s,dm,op]=PEM(a)
%% Step 1
[m,n]=size(a);

%% Step 2
s=zeros(m-1,1);

for i=2:m
    for j=1:n
    s(i-1,1)=s(i-1,1)+((1/(m-1))*sum(a(2:m,j)))*((1/n)*sum(a(i,:)))*a(1,j)*a(i,j);
    end
end

%% Step 3
    for i=1:m-1
        if max(s)~=0
            dm(i,1)=(s(i,1))/max(s);
        else
            dm(i,1)=1;
        end
    end   
%% Step 4
count=1;
    for i=1:m-1        
        if(dm(i,1)==max(dm))
            op(count)=i;
            count=count+1;
        end
    end
end
