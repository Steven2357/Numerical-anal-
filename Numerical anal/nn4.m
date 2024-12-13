clear;
n=1000000000;%指定迭代次數
ddn=10;
start=1;%畫圖時開始的次數
dn=floor(n/ddn);%密度
n1=zeros(ddn,1);
n1p=zeros(ddn,1);
n1n=zeros(ddn,1);
n1pn=zeros(ddn,1);
n2=zeros(ddn,1);
rrrrr=(start:dn:n);

for i=1:ddn
    for j=1:rrrrr(i)
        n1(i)=n1(i)+(-1)^(j-1)/(2*j-1);
    end
    for j=rrrrr(i):-1:1
        n2(i)=n2(i)+(-1)^(j-1)/(2*j-1);
    end
    for j=1:2:rrrrr(i)
        n1p(i)=n1p(i)+1/(2*j-1);
    end
    for j=2:2:rrrrr(i)
        n1n(i)=n1n(i)-1/(2*j-1);
    end
    n1pn(i)=n1p(i)+n1n(i);
    fprintf("ddn=%2.0f DONE!\n",i);
end
n1=4*n1;
n1pn=4*n1pn;
n2=4*n2;


pis=zeros(ddn,1);
for i=1:ddn
    pis(i)=pi;
end

n1=abs(n1-pis);
n1pn=abs(n1pn-pis);
n2=abs(n2-pis);

figure(1)
plot((start:dn:n),log(n1(1:ddn))/log(10),'r-x','LineWidth',2);
hold on
plot((start:dn:n),log(n2(1:ddn))/log(10),'b-.','LineWidth',2);
plot((start:dn:n),log(n1pn(1:ddn))/log(10),'y-.','LineWidth',2);
legend({"正加","反加","分開加"})
xlabel('迭代次數','FontSize',14)
ylabel('error','FontSize',14)
grid on
hold off