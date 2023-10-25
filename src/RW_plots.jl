using Plots

ALPHA_CHANNEL = 0.42
DPI = 300
RESOLUTION = (1920, 1080)
PLOT_BACKENDS = Dict("JS"=>"Plots.plotlyjs()", "GR"=>"Plots.gr()")

function set_plot_backend(backend::String)
    haskey(PLOT_BACKENDS, backend) || throw(ArgumentError("Please select JS or GR."))
    
    eval(Meta.parse(get(PLOT_BACKENDS, backend, "")))
end

function set_plot_dimensions()
    p = plot(
            grid = false,
            showaxis = false,
            legend = false,
            size = (RESOLUTION[1], RESOLUTION[2]),
            dpi = DPI
            )
    return p;
end

function add_random_walker(current_plot, nsteps; moves = [[0,1],[0,-1], [1,0], [-1,0]])
    walker = random_walk(nsteps, moves = moves)
    plot!(
        current_plot, walker[:,1], walker[:,2],
        linecolor = RGBA(rand(),rand(),rand(),ALPHA_CHANNEL)
        )
end

function add_multiple_walkers(current_plot, nsteps, nwalkers; moves = [[0,1],[0,-1], [1,0], [-1,0]])
    for i in 1:nwalkers
        add_random_walker(current_plot, nsteps, moves = moves)
    end
end