clear;
logn=10;
n=10^logn;%指定迭代次數
start=1;%畫圖時開始的次數
n1=ones(logn,1);
n2=ones(logn,1);
n3=ones(logn,1);
n3b=ones(logn,1);
n3s=ones(logn,1);
n0=zeros(logn,1);

for i=1:logn
    
    for j=1:10^i
        n3s(i)=n3s(i)*2*j/(2*j+1);
        n3b(i)=n3b(i)*2*j/(2*j-1);
        n1(i)=n1(i)*(4*j^2)/(4*j^2-1);
    end
    for j=10^i:-1:1
        n2(i)=n2(i)*(4*j^2)/(4*j^2-1);
    end
    fprintf("n=%2.0f DONE!\n",i);
    n3(i)=n3s(i)*n3b(i);
    n0(i)=1/10^i;
end
n3=2*n3;
n1=2*n1;
n2=2*n2;


pis=zeros(logn,1);
for i=1:logn
    pis(i)=pi;
end

n3=abs(n3-pis);
n2=abs(n2-pis);
n1=abs(n1-pis);
figure(1)
plot((1:logn),log(n1)/log(10),'r-x','LineWidth',2);
hold on
plot((1:logn),log(n2)/log(10),'b-x','LineWidth',2);
plot((1:logn),log(n3)/log(10),'y-x','LineWidth',2);
plot((1:logn),log(n0)/log(10),'black-x','LineWidth',2);
legend({"正乘","反乘","分開乘","1/n"})
xlabel('log N','FontSize',14)
ylabel('log error','FontSize',14)
grid on
hold off


%%%跟估計的一樣，(log(n),log(error1))會成一條直線。