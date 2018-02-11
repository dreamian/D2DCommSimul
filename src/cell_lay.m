function bs = cell_lay(R)

radius = R;
t = linspace(0,2*pi,1000);

x1 = 0 + radius*cos(t);
y1 = 0 + radius*sin(t);

bs(1,:)=x1;
bs(2,:)=y1;

end
