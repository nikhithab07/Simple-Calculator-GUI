
function simple_calculator_gui
    % Create a figure window
    f = figure('Position', [500 300 300 300], 'Name', 'Simple Calculator');

    % Input fields
    uicontrol('Style', 'text', 'Position', [30 240 100 20], 'String', 'Enter Number 1:');
    num1 = uicontrol('Style', 'edit', 'Position', [150 240 100 20]);

    uicontrol('Style', 'text', 'Position', [30 200 100 20], 'String', 'Enter Number 2:');
    num2 = uicontrol('Style', 'edit', 'Position', [150 200 100 20]);

    % Result display
    uicontrol('Style', 'text', 'Position', [30 160 100 20], 'String', 'Result:');
    result = uicontrol('Style', 'text', 'Position', [150 160 100 20], 'String', '');

    % Buttons for operations
    uicontrol('Style', 'pushbutton', 'String', '+', 'Position', [30 100 50 30], ...
        'Callback', @(~,~) calculate('+'));
    uicontrol('Style', 'pushbutton', 'String', '-', 'Position', [90 100 50 30], ...
        'Callback', @(~,~) calculate('-'));
    uicontrol('Style', 'pushbutton', 'String', '*', 'Position', [150 100 50 30], ...
        'Callback', @(~,~) calculate('*'));
    uicontrol('Style', 'pushbutton', 'String', '/', 'Position', [210 100 50 30], ...
        'Callback', @(~,~) calculate('/'));

    % Function to calculate result
    function calculate(op)
        n1 = str2double(get(num1, 'String'));
        n2 = str2double(get(num2, 'String'));
        if isnan(n1) || isnan(n2)
            set(result, 'String', 'Invalid input');
            return;
        end

        switch op
            case '+'
                res = n1 + n2;
            case '-'
                res = n1 - n2;
            case '*'
                res = n1 * n2;
            case '/'
                if n2 == 0
                    res = 'Error';
                else
                    res = n1 / n2;
                end
        end
        set(result, 'String', num2str(res));
    end
end
