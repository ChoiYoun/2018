PRO beam_propagation

  earth_radius_km = 6371.008777 ;km
  effective_radius = 4. / 3. * earth_radius_km
	
	user_height_km = 0.64
	elev_arr = [-0.17, 0.00, 0.30, 0.80, 1.50, 2.59, 4.39, 7.30,15.0]
	range_arr = 0.1 * FINDGEN(2401)
	n_range = N_ELEMENTS(range_arr)
	n_elev = N_ELEMENTS(elev_arr)
	height_arr = FLTARR(n_range, n_elev)

	for ielev = 0, n_elev - 1 do begin
		elev = elev_arr[ielev]
		height_arr[*, ielev] = effective_radius * (COS(elev * !dtor) / COS(elev * !dtor + range_arr / effective_radius) - 1.) + user_height_km
	endfor

END
