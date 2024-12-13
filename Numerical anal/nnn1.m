clear;
logn=10;
n=10^logn;%指定迭代次數
start=1;%畫圖時開始的次數
n1=zeros(logn,1);
n2=zeros(logn,1);
n0=zeros(logn,1);

for i=1:logn
    
    for j=1:10^i
        n1(i)=n1(i)+6/j^2;
    end
    for j=10^i:-1:1
        n2(i)=n2(i)+6/j^2;
    end
    n1(i)=sqrt(n1(i));
    n2(i)=sqrt(n2(i));
    n0(i)=1/10^i;
    fprintf("n=%2.0f DONE!\n",i);
end


pis=zeros(logn,1);
for i=1:logn
    pis(i)=pi;
end

n1=abs(n1-pis);
n2=abs(n2-pis);

figure(1)
plot((1:logn),log(n1)/log(10),'r-x','LineWidth',2);
hold on
plot((1:logn),log(n2)/log(10),'b-x','LineWidth',2);
plot((1:logn),log(n0)/log(10),'black-x','LineWidth',2);
legend({"正加","反加","1/n"})
xlabel('log N','FontSize',14)
ylabel('log error','FontSize',14)
grid on
hold off


%%%跟估計的一樣，(log(n),log(error1))會成一條直線。
% why?