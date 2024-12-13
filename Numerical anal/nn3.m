clear;
n=1000000000;%指定迭代次數
ddn=10;
start=1;%畫圖時開始的次數
dn=floor(n/ddn);%密度
n1=ones(ddn,1);
n2=ones(ddn,1);
n1b=ones(ddn,1);
n1s=ones(ddn,1);
n1bs=ones(ddn,1);
rrrrr=(start:dn:n);

for i=1:ddn
    for j=1:rrrrr(i)
        n1(i)=n1(i)*(4*j^2)/(4*j^2-1);
        n1s(i)=n1s(i)*2*j/(2*j+1);
        n1b(i)=n1b(i)*2*j/(2*j-1);
    end
    for j=rrrrr(i):-1:1
        n2(i)=n2(i)*(4*j^2)/(4*j^2-1);
    end
    n1bs(i)=n1s(i)*n1b(i);
    fprintf("ddn=%2.0f DONE!\n",i);
end
n1=2*n1;
n2=2*n2;
n1bs=2*n1bs;


pis=zeros(ddn,1);
for i=1:ddn
    pis(i)=pi;
end

n1=abs(n1-pis);
n2=abs(n2-pis);
n1bs=abs(n1bs-pis);

figure(1)
plot((start:dn:n),log(n1(1:ddn))/log(10),'r-x','LineWidth',2);
hold on
plot((start:dn:n),log(n2(1:ddn))/log(10),'b-o','LineWidth',2);
plot((start:dn:n),log(n1bs(1:ddn))/log(10),'y-.','LineWidth',2);
legend({"正乘","反乘","分開乘"})
xlabel('迭代次數','FontSize',14)
ylabel('error','FontSize',14)
grid on
hold off