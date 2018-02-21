n=input('length');
for i=1:n
    for j=1:2
        a(i,j)=input('prompt');
    end
end
for i=1:n
    code(i)=0;
end
for i=1:8
    is(i)=0;
end
for i=1:9
    im(i)=0;
end
dist=0;
for i=1:n
    disp(is);
    fprintf("\n");
    for j=1:7
        is(j+1)=is(j);
    end
    is(1)=0;
    im(9)=im(8);
    disp(is);
    for j=1:8
        im(j)=is(j);
    end
    disp(im);
    out1=[im(1)^im(2)^im(4)^im(5)^im(6) im(1)^im(2)^im(3)^im(5)^im(6)];
    is(1)=1;
    im(1)=1;
    out2=[im(1)^im(2)^im(4)^im(5)^im(6) im(1)^im(2)^im(3)^im(5)^im(6)];
    lk=(a(i,1)^out1(1))+(a(i,2)^out1(2));
    m=(a(i,1)^out2(1))+(a(i,2)^out2(2));
    if(lk<m)
        im(1)=0;
        is(1)=0;
        dist=dist+lk;
        code(i)=0;
    else
        dist=dist+m;
        code(i)=1;
    end
    
end
disp(code);


%%codeword conversion
for i=1:4
    for j=1:2
        if (j==1) 
            codeword(i, j) = xor(xor(xor(xor(A(1), A(2)), A(4)), A(5)), A(6));
        else
            codeword(i, j) = xor(xor(xor(xor(A(1), A(2)), A(3)), A(5)), A(6));
        end
    end
end

%OR

for i=1:4
    codeword(i, 1) = xor(xor(xor(xor(A(1), A(2)), A(4)), A(5)), A(6));   
    codeword(i, 2) = xor(xor(xor(xor(A(1), A(2)), A(3)), A(5)), A(6));     
end
