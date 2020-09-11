% declaration: fmine=@(t,X,P) [ X(2) -X(1)-.2*X(2)]; % se define la función en la forma anónima

% another declaration: function s=fyo(t,X,P)
% s(1)=X(2);
% s(2)=-P(1)*X(1)-P(2)*X(2)+P(3)*(t>=P(4));
% end

% invocation: [t,X]=rk4p(fmine,0,20,[1 0],1000,[]); % se invoca la función con su nombre
% plot: plot(t,X)

function [T Y]=rk4p(f,a,b,ya,M,P)
h=(b-a)/M;
T=zeros(M+1,1);
Y=zeros(M+1,length(ya));
T(1)=a;
Y(1,:)=ya;
for j=1:M
T(j+1)=T(j)+h;
K1=h*feval(f,T(j),Y(j,:),P);
K2=h*feval(f,T(j)+h/2,Y(j,:)+K1/2,P);
K3=h*feval(f,T(j)+h/2,Y(j,:)+K2/2,P);
K4=h*feval(f,T(j+1),Y(j,:)+K3,P);
Y(j+1,:)=Y(j,:)+(K1+2*K2+2*K3+K4)/6;
end
