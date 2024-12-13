clear;
n=1000;%指定迭代次數
start=1;%畫圖時開始的次數
dn=floor(n/200);%密度

n1=zeros(n,1);
n2=zeros(n,1);
n2_1=zeros(n,1);
n3=zeros(n,1);
n4=zeros(n,1);
n5=zeros(n,1);
err1=zeros(n-1,1);
err2=zeros(n-1,1);
err3=zeros(n-1,1);
err4=zeros(n-1,1);
err5=zeros(n-1,1);

n1(1)=6;
n2(1)=2;
n2_1(1)=1;
n3(1)=8/3;
n4(1)=4;
n5(1)=4*(4*(1/5)-1/239);

i=2;

while i<=n
    n1(i)=n1(i-1)+6/i^2;
    n2_1(i)=n2_1(i-1)*(i-1)/(2*i-1);
    n2(i)=n2(i-1)+2*n2_1(i);
    n3(i)=n3(i-1)*2*i*2*i/(2*i-1)/(2*i+1);
    n4(i)=n4(i-1)+4*(-1)^(i-1)/(2*i-1);
    n5(i)=n5(i-1)+4*(4*(-1)^(i-1)*(1/5)^(2*i-1)/(2*i-1)-(-1)^(i-1)*(1/239)^(2*i-1)/(2*i-1));
    i=i+1;
end

n1=sqrt(n1);

fprintf("%f\n",n1(n));
fprintf("%f\n",n2(n));
fprintf("%f\n",n3(n));
fprintf("%f\n",n4(n));
fprintf("%f\n",n5(n));

pis=zeros(n,1);
for i=1:n
    pis(i)=pi;
end
%這些是誤差
n1=abs(n1-pis);
n2=abs(n2-pis);
n3=abs(n3-pis);
n4=abs(n4-pis);
n5=abs(n5-pis);

for i=1:n-1
    err1(i)=n1(i+1)/n1(i)^1;
    err2(i)=n2(i+1)/n2(i);
    err3(i)=n3(i+1)/n3(i);
    err4(i)=abs(n4(i+1)/n4(i));
    err5(i)=n5(i+1)/n5(i);
end

figure(1)

%h1=plot((start:dn:n),n1(start:dn:n),'b-.o','LineWidth',2);
%hold on
%h2=plot((start:dn:n),n2(start:dn:n),'r-x','LineWidth',2);
%h3=plot((start:dn:n),n3(start:dn:n),'y-+','LineWidth',2);
%h4=plot((start:dn:n),n4(start:dn:n),'g-o','LineWidth',2);
%h5=plot((start:dn:n),n5(start:dn:n),'black-x','LineWidth',2);
%legend([h1(1) h2(1) h3(1) h4(1) h5(1)],{"n1","n2","n3","n4","n5"})
plot((start:dn:n),log(n1(start:dn:n))/log(10),'b-.');
hold on
plot((start:dn:n),log(n3(start:dn:n))/log(10),'y-+');
plot((start:dn:n),log(n4(start:dn:n))/log(10),'g-x');
legend({"n1","n3","n4"})
xlabel('迭代次數','FontSize',14)
ylabel('與pi的誤差值(取log以10為底)','FontSize',14)
grid on
hold off
endn2=45;%最後一項
endn5=8;

figure(2)
plot((1:endn2),log(n2(1:endn2))/log(10),'r-x','LineWidth',2);
legend({"n2"})
xlabel('迭代次數','FontSize',14)
ylabel('數列2與pi的誤差值(取log以10為底)','FontSize',14)
grid on
hold off

figure(3)
plot((1:endn5),log(n5(1:endn5))/log(10),'black-x','LineWidth',2);
legend({"n5"})
xlabel('迭代次數','FontSize',14)
ylabel('數列5與pi的誤差值(取log以10為底)','FontSize',14)
grid on
hold off

figure(4)
plot((1:endn2),(err2(1:endn2)),'r-x','LineWidth',2);
legend({"n2"},'Location','southeast')
xlabel('迭代次數','FontSize',14)
ylabel('數列2 後項誤差/前項誤差','FontSize',14)
grid on
hold off

figure(5)
plot((1:endn5),(err5(1:endn5)),'black-x','LineWidth',2);
legend({"n5"},'Location','southeast')
xlabel('迭代次數','FontSize',14)
ylabel('數列5 後項誤差/前項誤差','FontSize',14)
grid on
hold off

%try to use alpha/n to estimate n1
y=zeros(n,1);
for i=1:n
    y(i)=1/i;
end

alpha=((1:n)*n1)^(1/n);
y=alpha*y;
fprintf("%2.6e",alpha);

figure(6)
plot((start:dn:n),log(n1(start:dn:n))/log(10),'b-.');
hold on
plot((start:dn:n),log(y(start:dn:n))/log(10),'y-+');
legend({"n1","1/n"})
xlabel('迭代次數','FontSize',14)
ylabel('與pi的誤差值(取log以10為底)','FontSize',14)
grid on
hold off

figure(7)
plot((1:endn2),log(n2(1:endn2))/log(10),'r-x','LineWidth',2);
hold on
plot((1:endn5),log(n5(1:endn5))/log(10),'black-x','LineWidth',2);
legend({"n2","n5"})
xlabel('迭代次數','FontSize',14)
ylabel('數列與pi的誤差值(取log以10為底)','FontSize',14)
grid on
hold off

figure(8)

%h1=plot((start:dn:n),n1(start:dn:n),'b-.o','LineWidth',2);
%hold on
%h2=plot((start:dn:n),n2(start:dn:n),'r-x','LineWidth',2);
%h3=plot((start:dn:n),n3(start:dn:n),'y-+','LineWidth',2);
%h4=plot((start:dn:n),n4(start:dn:n),'g-o','LineWidth',2);
%h5=plot((start:dn:n),n5(start:dn:n),'black-x','LineWidth',2);
%legend([h1(1) h2(1) h3(1) h4(1) h5(1)],{"n1","n2","n3","n4","n5"})
plot((start:dn:n),log(n1(start:dn:n))/log(10),'black-.');
hold on
plot((start:dn:n),log(n2(start:dn:n))/log(10),'b-.');
plot((start:dn:n),log(n3(start:dn:n))/log(10),'black-.');
plot((start:dn:n),log(n4(start:dn:n))/log(10),'black-.');
plot((start:dn:n),log(n5(start:dn:n))/log(10),'r-.');
legend({"n1","n2","n3","n4","n5"},"location","east")
xlabel('迭代次數','FontSize',14)
ylabel('與pi的誤差值(取log以10為底)','FontSize',14)
grid on
hold off
endn2=45;%最後一項
endn5=8;