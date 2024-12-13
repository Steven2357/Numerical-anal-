clear;
n=10000000000;%指定迭代次數
ddn=10;
start=1;%畫圖時開始的次數
dn=floor(n/ddn);%密度
n1=zeros(ddn,1);
n2=zeros(ddn,1);
rrrrr=(start:dn:n);

for i=1:ddn
    for j=1:rrrrr(i)
        n1(i)=n1(i)+6/j^2;
    end
    for j=rrrrr(i):-1:1
        n2(i)=n2(i)+6/j^2;
    end
    n1(i)=sqrt(n1(i));
    n2(i)=sqrt(n2(i));
    fprintf("ddn=%2.0f DONE!\n",i);
end


pis=zeros(ddn,1);
for i=1:ddn
    pis(i)=pi;
end

n1=abs(n1-pis);
n2=abs(n2-pis);

figure(1)
plot((start:dn:n),log(n1(1:ddn))/log(10),'r-x','LineWidth',2);
hold on
plot((start:dn:n),log(n2(1:ddn))/log(10),'b-.','LineWidth',2);
legend({"正加","反加"})
xlabel('迭代次數','FontSize',14)
ylabel('error','FontSize',14)
grid on
hold off

%%%結論：反加比較好！
% why?