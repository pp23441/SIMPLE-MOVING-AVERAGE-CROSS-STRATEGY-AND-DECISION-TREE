% Load data from Excel file
data = xlsread('JustEat6M.xlsx');
closing_prices = data(:, 1); % Assuming closing prices are in the first column


%% TASK 1
%% Task 1: Moving Average Trading Strategy

%% Load Data
data = xlsread('JustEat6M.xlsx');
closing_prices = data(:, 1); % Assuming closing prices are in the first column

%% Define Parameters
initial_budget = 1000000; % £1M
portfolio = 0; % Initially no shares are held
total_profit_loss = 0; % Initialize total profit/loss

%% Calculate Moving Averages
window_7 = 7;
window_14 = 14;
ma_7 = movmean(closing_prices, window_7);
ma_14 = movmean(closing_prices, window_14);

%% Implement Trading Strategy
for i = max(window_7, window_14):length(closing_prices)
    % Check if 7MA crosses 14MA from below (Buy)
    if ma_7(i) > ma_14(i) && ma_7(i-1) <= ma_14(i-1)
        num_shares = floor(initial_budget / closing_prices(i));
        portfolio = portfolio + num_shares;
        initial_budget = initial_budget - num_shares * closing_prices(i);
        % Output buy transaction
        disp(['Buy ', num2str(num_shares), ' shares at £', num2str(closing_prices(i)), ' on day ', num2str(i)]);
    % Check if 7MA crosses 14MA from above (Sell)
    elseif ma_7(i) < ma_14(i) && ma_7(i-1) >= ma_14(i-1)
        profit_loss = portfolio * closing_prices(i) - initial_budget;
        total_profit_loss = total_profit_loss + profit_loss;
        initial_budget = initial_budget + portfolio * closing_prices(i);
        % Output sell transaction and profit/loss
        disp(['Sell ', num2str(portfolio), ' shares at £', num2str(closing_prices(i)), ' on day ', num2str(i)]);
        disp(['Profit/Loss for this transaction: £', num2str(profit_loss)]);
        portfolio = 0;
    end
end

%% Final Portfolio Value
final_value = initial_budget + portfolio * closing_prices(end);
total_profit_loss = total_profit_loss + portfolio * closing_prices(end) - 1000000;
% Output final portfolio value and total profit/loss
disp(['Final portfolio value: £', num2str(final_value)]);
disp(['Total Profit/Loss: £', num2str(total_profit_loss)]);