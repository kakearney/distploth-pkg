function h = distploth(varargin)
%DISTPLOTH Wrapper to create horizontal distributionPlot
%
% h = distploth(varargin)
%
% This is a simple wrapper function that creates a horizontally-oriented
% distribution plot instead of a vertical one.  Input and output is
% identical to distributionPlot.  

% Copyright 2012 Kelly Kearney

h = distributionPlot(varargin{:});

hpatch  = h{1};
hmm     = h{2};
hax     = h{3};
hspread = h{4};

% Rotate axis labels and limits

props = {'xlim', 'xtick', 'xticklabel', 'ylim', 'ytick', 'yticklabel'};
axprop = get(hax, props);

newpv = [props; axprop(4:end) axprop(1:3)];

set(hax, newpv{:});
set(hax, 'xtickmode', 'auto', 'xticklabelmode', 'auto');

% Rotate objects

hobj = [hpatch; hmm; hspread];
ish = ishandle(hobj);
hobj = hobj(ish);

xydata = get(hobj, {'xdata', 'ydata'});
for io = 1:length(hobj)
    set(hobj(io), 'xdata', xydata{io,2}, 'ydata', xydata{io,1});
end
