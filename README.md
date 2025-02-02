# SIMPLE-MOVING-AVERAGE-CROSS-STRATEGY-AND-DECISION-TREE
COMPUTATIONAL MODELS IN ECONOMICS AND FINANCE

# INTRODUCTION
In the financial analysis and predictive modeling, effective trading strategies play a crucial role in decision making processes. In this task revolves around implementing a moving average trading strategy using MATLAB and justEat 6M stock daily closing prices. The objective is to devise a systematic approach based on the crossing of 7-day and 14- day moving averages to determine buy or sell signals. The implemented strategy aims to optimize investment decisions, maximize returns and manage risk effectively.

# Implementation of Trading Strategy

The calculates of the 7-day and 14-day moving averages (7MA and 14MA) of the closing prices of justEat 6M stock. Moving averages are widely used in technical analysis to price data and identify trends.

### Trading strategy implementation

- The code iterates through the closing prices of the stock.

- For each day it checks if the 7-day moving average crosses the 14- day moving average indicating a buy signal

- If the 7MA crosses the 14MA from below it executes a buy transaction by purchasing shares using the available budget.

- If the 7MA crosses the 14 MA from above it executes a sell transaction by selling all the shares in the portfolio.

- The budget and portfolio variables are adjusted accordingly for after each transaction.

# Calculate Entropy for the Decision Column
The entropy for a binary outcome (buy/sell) can be calculated using the formula: 

𝐸𝑛𝑡𝑟𝑜𝑝𝑦=−𝑝𝑏𝑢𝑦log2 (𝑝𝑏𝑢𝑦)−𝑝𝑠𝑒𝑙𝑙log2(𝑝𝑠𝑒𝑙𝑙)
Where 𝑝𝑏𝑢𝑦 and 𝑝𝑠𝑒𝑙𝑙 are the probabilities of buying and selling, respectively.

### Using the dataset

𝑃𝐵𝑢𝑦=6/8−3/4, 
𝑃𝑠𝑒𝑙𝑙=2/8−1/4, 
Plugging these values into the entropy formula: 𝐸𝑛𝑡𝑟𝑜𝑝𝑦=−(3/4)𝑙𝑜𝑔2(3/4)−(1/4)𝑙𝑜𝑔2(1/4) 𝐸𝑛𝑡𝑟𝑜𝑝𝑦≈0.811.

# Construct the Decision Tree

Starting from the root node, the attribute with the highest information gain to split the dataset. To continue for this process recursively until all instances are correctly classified.

![image](https://github.com/user-attachments/assets/2ca55b76-10db-4e96-bd65-9271842038cd)

- If the stock price is “up” and the decision is to “buy”

- If the stock price is “stable”

- If the market news is “up” and the decision is “negative”

- If the market news is “stable” and the decision is “negative”

- If the market news is “Down” and the decision is “buy”
  
This decision tree captures the decision making processes based on the dataset.

# Output

- Once the maximum value for ‘Minparentsize’ yielding zero classification loss is determined and the code displays the value along with classification loss.

- Subsequenlty the code trains a decision tree (tree 2) with the identified maximum ‘Minparentsize’ value.

- It displays the graphical representation of the decision tree(tree2 )in the graph mode.

![image](https://github.com/user-attachments/assets/b6f3017b-b0d0-4f5f-a42a-e4c7c8dd692d)

# CONCLUSION
In the implementation trading strategy utilizing moving averages in MATLAB provides a structured approach to decision making in financial markets. By analyzing the crossing points of moving averages and the strategy identifies to buy or sell assets and therby potentially enhancing portfolio performance. Through effective use of programming tools and algorithmic techniques, investors can gain insights into market trends and make informed trading decisions and achieve of their investment objectives.


