clear;
clc;
clf;
close all;

% All units used are SI standard, meters and radians.

end_effector_poses_xy = zeros(2, 100);

%L0 = 1; % Not needed for XY workspace
L1 = 0.5;
L2 = 0.5;

% Robot position WRT world frame
x0 = 0.75;
y0 = 0.6;
theta0 = 40*pi/180;
iterations = 10000;

for i = 1:iterations
    d1 = rand * (0.3 - 0.1) + 0.1;
    %d2 = rand * (0.3 - 0.1) + 0.1; % d2 is irrelevant to x-y workspace.
    theta1 = (rand * 145) * pi / 180;
    theta2 = (rand * (120 - -120) -120) * pi / 180;
    %theta1 = 0;
    %theta2 = -120*pi/180;
    
    end_effector_pos_xy = [
      x0 + L1 * cos(theta1 + theta0) + (L2 + d1) * cos(theta1 + theta2 + theta0);
      y0 + L1 * sin(theta1 + theta0) + (L2 + d1) * sin(theta2 + theta1 + theta0);
    ];

    end_effector_poses_xy(:,i) = end_effector_pos_xy;
end

grid on;
hold on;
xlabel("x (metres)")
ylabel("y (metres)")
title("XY workspace of robot, translated and rotated base to reach points A,B,C")
scatter(end_effector_poses_xy(1,:), end_effector_poses_xy(2,:), "marker", '.', "MarkerEdgeColor", "#808080")
scatter(1.7, 1.3, 'marker', 'x', "MarkerEdgeColor", "r", "SizeData", 125, "LineWidth",2)
scatter(-0.25,1, 'marker', 'x', "MarkerEdgeColor", "g", "SizeData", 125, "LineWidth",2)
scatter(0, 0, 'marker', 'x', "MarkerEdgeColor", "b", "SizeData", 125, "LineWidth",2)
scatter(0, 0, 'marker', 'x', "MarkerEdgeColor", "b", "SizeData", 125, "LineWidth",2)
scatter(x0, y0, 'marker', 'x', "MarkerEdgeColor", "magenta", "SizeData", 125, "LineWidth",2)
legend("Reachable Points", "A", "B", "C", "World Origin", "Robot Origin")
pbaspect([1 1 1])


