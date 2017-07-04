function schmid_factor = cal_schmid_factor_slip(x)

euler_angle = x;

%converting degree to radian and storing as phi1,phi,phi2
			phi1 = degtorad(euler_angle(1));
			phi = degtorad(euler_angle(2));
			phi2 = degtorad(euler_angle(3));

			g11 = ((cos(phi1)*cos(phi2))-sin(phi1)*sin(phi2)*cos(phi));
			g12 = (sin(phi1)*cos(phi2))+(cos(phi2)*sin(phi2)*cos(phi));
			g13 = sin(phi2)*sin(phi);

			g21 = (-cos(phi1)*sin(phi2) - sin(phi1)*cos(phi2)*cos(phi));
			g22 = (-sin(phi1)*sin(phi2) + cos(phi1)*cos(phi2)*cos(phi));
			g23 = cos(phi2)*sin(phi);

			g31 = sin(phi1)*sin(phi);
			g32 = (-cos(phi1)*sin(phi));
			g33 = cos(phi);

			%z = [round(g13,1) round(g23,1) round(g33,1)];
			x = [round(g11,1) round(g21,1) round(g31,1)];
			%y = [round(g12,1) round(g22,1) round(g32,1)]; 


%% Slip System of the Cube

plane = [ 1     1     1
     1     1     1
     1     1     1
    -1     1     1
    -1     1     1
    -1     1     1
    -1    -1     1
    -1    -1     1
    -1    -1     1
     1    -1     1
     1    -1     1
     1    -1     1];
direction = [  -2     1     1
     1    -2     1
     1     1    -2
     2     1     1
    -1    -2     1
    -1     1    -2
     2    -1     1
    -1     2     1
    -1    -1    -2
    -2    -1     1
     1     2     1
     1    -1    -2];

for j = 1:1:size(plane,1)
n = plane(j,:);
d = direction(j,:);

LnxLdx(j) = (sum((n.*x))/(sqrt(n*n')*sqrt(x*x')))*(sum((d.*x))/(sqrt(d*d')*sqrt(x*x')));
end

schmid_factor = max(LnxLdx);

end