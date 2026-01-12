function [x_opt, z_opt] = myenumeration(A, b, c)
    [m, n] = size(A);

    % Initialize the optimal solution and the optimal objective value
    x_opt = [];
    z_opt = -inf;

    % Generate all possible combinations of m indices (candidate bases)
    % m-element subsets B(k,:) ^= B_k
    all_bases = nchoosek(1:n, m);

    % Iterate over each potential basis
    for k = 1:size(all_bases, 1)
        % Get the indices for the current basis
        basis_indices = all_bases(k, :);

        % Extract the columns from A to form the basis matrix B
        B = A(:, basis_indices);

        % Check if the basis matrix is non-singular (i.e., rank is m)
        if rank(B) == m
            % Solve for the basic variables: B * x_B = b
            x_B = B \ b;

            % Construct the full n-dimensional solution vector x
            x = zeros(n, 1);
            x(basis_indices) = x_B;

            % Check if the solution is feasible (all components >= 0)
            % Using a small tolerance (1e-10) to handle floating-point errors
            if all(x >= -1e-10)
                % Calculate the objective function value for this feasible solution
                z = c' * x;

                % Update the optimal solution if the current z is better
                if z > z_opt
                    z_opt = z;
                    x_opt = x;
                end
            end
        end
    end

    % Check if any feasible solution was found
    if z_opt == -inf
        x_opt = [];
        z_opt = -inf;
        disp('No feasible basic solution found.');
    end
end


%[appendix]{"version":"1.0"}
%---
