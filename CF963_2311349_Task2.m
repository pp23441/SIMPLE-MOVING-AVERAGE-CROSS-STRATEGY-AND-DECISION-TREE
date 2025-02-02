%% TASK 2

% Define the dataset
% Define the dataset
data = ["Up"; "Up"; "Up"; "Stable"; "Stable"; "Down"; "Down"; "Down"];

market = ["Down"; "Up"; "Stable"; "Up"; "Stable"; "Stable"; "Down"; "Stable"];

news = ["Impartial"; "Negative"; "Positive"; "Negative"; "Negative"; "Positive"; "Positive"; "Negative"];

decision = ["Buy"; "Buy"; "Buy"; "Buy"; "Buy"; "Buy"; "Sell"; "Sell"];

% Combine data into a table
T = table(data, market, news, decision);

% Convert categorical data to numeric
X = zeros(8, 3); % Features
Y = cell(8, 1); % Labels

for i = 1:8
    % Stock price
    if strcmp(T.data{i}, 'Up')
        X(i, 1) = 1;
    elseif strcmp(T.data{i}, 'Stable')
        X(i, 1) = 2;
    else
        X(i, 1) = 3;
    end
    % Market News
    if strcmp(T.market{i}, 'Up')
        X(i, 2) = 1;
    elseif strcmp(T.market{i}, 'Stable')
        X(i, 2) = 2;
    else
        X(i, 2) = 3;
    end
    % Decision
    Y{i} = T.decision{i};
end

% Train decision tree
tree1 = fitctree(X, Y);

% Display text description of the tree
disp('Decision Tree:');
disp(tree1);

% Display decision tree as a figure with branches
view(tree1, 'Mode', 'graph');


% Define the maximum value for MinParentSize
max_min_parent_size = length(Y);

% Initialize variables
min_min_parent_size = 1;
classification_loss = 1;

% Binary search for the maximum valid value of MinParentSize
while min_min_parent_size <= max_min_parent_size
    mid_min_parent_size = floor((min_min_parent_size + max_min_parent_size) / 2);
    try
        % Train decision tree with current MinParentSize
        tree = fitctree(X, Y, 'MinParentSize', mid_min_parent_size);
        % Calculate classification loss
        loss = resubLoss(tree);
        % Check if classification loss is zero
        if loss == 0
            classification_loss = loss;
            min_min_parent_size = mid_min_parent_size + 1; % Look for larger MinParentSize
        else
            max_min_parent_size = mid_min_parent_size - 1; % Look for smaller MinParentSize
        end
    catch
        % If an error occurs, reduce the maximum value of MinParentSize
        max_min_parent_size = mid_min_parent_size - 1;
    end
end

% Output the result
max_min_parent_size = max_min_parent_size + 1; % Add 1 to get the correct value
disp(['Maximum value for MinParentSize yielding zero classification loss: ', num2str(max_min_parent_size)]);
disp(['Classification loss: ', num2str(classification_loss)]);

% Train decision tree with the max MinParentSize
tree2 = fitctree(X, Y, 'MinParentSize', max_min_parent_size);

% Display decision tree as a figure
view(tree2, 'Mode', 'graph');
