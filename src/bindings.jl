
# qhT* new_qhull_handler();
function new_qhull_handler()
    @check_if_loaded
    ccall(new_qhull_handler_ptr[], Ptr{Cvoid}, (),)
end

# int delaunay_init_and_compute( int dim, int numpoints, coordT *points, int* numcells);
function delaunay_init_and_compute(qh::Ptr{Cvoid}, dim::Int32, numpoints::Int32, points::Array{Float64}, numcells::Ref{Int32})
    @check_if_loaded
    ccall(delaunay_init_and_compute_ptr[], 
        Cint, (
            Ptr{Cvoid},
            Cint, 
            Cint,
            Ptr{Cdouble},
            Ptr{Cint}
            ), 
        qh,
        dim, 
        numpoints, 
        points, 
        numcells
        )
end


# int delaunay_fill_cells(int dim, int num_cells, int *cells);
function delaunay_fill_cells(qh::Ptr{Cvoid}, dim::Int32, numcells::Int32, cells::Array{Int32})
    @check_if_loaded
    ccall(delaunay_fill_cells_ptr[], 
        Cint, (
            Ptr{Cvoid},
            Cint, 
            Cint,
            Ptr{Cint}
            ), 
        qh,
        dim, 
        numcells,
        cells)
end

#int delaunay_free()
function delaunay_free(qh::Ptr{Cvoid})
    @check_if_loaded
    ccall(delaunay_free_ptr[], Cint, (Ptr{Cvoid},),qh)
end


