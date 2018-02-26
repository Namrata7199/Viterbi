function y = decoding(codew)
code=codew;
state=[0 0 0 0 0 0 0 0];    %state
mem=[0 0 0 0 0 0 0 0 0 0];  %memory
path=0;     %path matrix
data=[0 0 0 0];
for j=1:4
    for i=8:-1:1
        mem(i+1)=mem(i);    %shifting by one bit
    end
    for i=1:8
           state(i)=mem(i);
    end
    %%disp(mem);
    state(1)=0;     %introduce 0
    mem(1)=0;
    out1=[bitxor(bitxor(bitxor(bitxor(mem(1),mem(2)),mem(4)),mem(5)),mem(6)) bitxor(bitxor(bitxor(bitxor(mem(1),mem(2)),mem(3)),mem(5)),mem(6))];
    %%disp(out1);    %output with 0
    state(1)=1;     %introduce 1
    mem(1)=1;
    out2=[bitxor(bitxor(bitxor(bitxor(mem(1),mem(2)),mem(4)),mem(5)),mem(6)) bitxor(bitxor(bitxor(bitxor(mem(1),mem(2)),mem(3)),mem(5)),mem(6))];
    %%disp(out2);    %output with 1
    l=bitxor(code(j,1),out1(1))+bitxor(code(j,2),out1(2));  %hamming distance with out1
    m=bitxor(code(j,1),out2(1))+bitxor(code(j,2),out2(2));  %hamming distance with out2
    if(l<m)     %consider with minimum hamming distance
        path=path+l;
        state(1)=0;
        mem(1)=0;
        data(j)=0;
    else
        path=path+m;
        data(j)=1;
    end
    %%disp(path);
end
y=data; %return

