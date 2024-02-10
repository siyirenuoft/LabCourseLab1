% Define the list of variables to plot
variables = {'axial', 'disp', 'force', 'lateral', 'axial_unload', 'disp_unload', 'force_unload', 'lateral_unload', 'stress_unload'};

% Define the export directory
exportDir = 'C:\Users\xiaom\Desktop\LabCourseLab1\LabCourseLab1\raw_plot';

% Check if the export directory exists, if not, create it
if ~exist(exportDir, 'dir')
    mkdir(exportDir);
end

% Loop over each file
for i = 1:5
    % Loop over each variable
    for j = 1:length(variables)
        % Construct the variable name
        varName = sprintf('F%d_%s', i, variables{j});

        % Check if the variable exists in the workspace
        if evalin('base', sprintf('exist(''%s'', ''var'')', varName))
            % Access the variable data
            varData = evalin('base', varName);

            % Create a figure and plot the variable
            fig = figure;
            plot(varData);
            title(sprintf('%s for F%d', variables{j}, i));
            xlabel('Index');
            ylabel(variables{j});

            % Construct the file name for saving the plot
            saveFileName = fullfile(exportDir, sprintf('%s_F%d.png', variables{j}, i));

            % Save the plot to the specified directory
            saveas(fig, saveFileName);

            % Close the figure
            close(fig);
        end
    end
end
