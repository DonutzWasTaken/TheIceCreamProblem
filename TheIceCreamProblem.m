% Note, this assumes that equal chance of getting each letter
% Realistically, they might give more E's because WE ARE has 2 E's

clear; clc;

itr = 5000000; % Number of iterations (5 million to be safe)
data = zeros(10000, 1); % Tallies the number it takes to complete the set
%charList = ['a'; 'e', 'r', 'w']; % List of possible characters one can get

for i=1:itr
    tokens = zeros(1, 4);
    % Each column corresponds to A, E, R, and W, respectively
    attempts = 0; % Number of times ice cream was bought before success
    e = 0; % Number of times e has been chosen

    while any(tokens == false) % Loops until all tokens are true
        randomIndex = randi([1 4],1); % Randomly picks a letter: 1 = a, 2 = e, 3 = r, 4 = w
        attempts = attempts + 1;

        if randomIndex == 1
            tokens(1) = true;
        elseif randomIndex == 2 
            if e == 0
                e = e+1; % Does nothing the first time e is chosen
            else
                tokens(2) = true; % E is only true if picked twice
            end
        elseif randomIndex == 3
            tokens(3) = true;
        else
            tokens(4) = true;
        end

    end

    data(attempts) = data(attempts) + 1; % Increments the attempts by 1 success

end

%% 
attempts = zeros(sum(data), 1);
idx = 1;
for i = 1:numel(data)
    attempts(idx:idx+data(i)-1) = i - 1; % Subtract 1 to match index with attempts
    idx = idx + data(i);
end

% Calculate the mean
mean_attempts = sum(attempts) / numel(attempts);

% Calculate the median
median_attempts = median(attempts);

% Calculate the mode
mode_attempts = mode(attempts);

disp(['Mean number of attempts: ', num2str(mean_attempts)]);
disp(['Median number of attempts: ', num2str(median_attempts)]);
disp(['Mode number of attempts: ', num2str(mode_attempts)]);