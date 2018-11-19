PRO main

  lonlat = [126.90214, 37.357256]
  pixel_scale = 1000. ;m
  
  XDIM = 960
  YDIM = 1200
  CLON = 126.0
  CLAT = 38.0
  m_inital = MAP('Lambert Conformal Conic', BUFFER = 1, $
    STANDARD_PAR1 = 30, STANDARD_PAR2 = 60, $
    CENTER_LONGITUDE = FLOAT(CLON), CENTER_LATITUDE = FLOAT(CLAT))
  xy = m_inital.MapForward(lonlat[0], lonlat[1]) / pixel_scale
;  XY = MAP_PROJ_FORWARD(lonlat, MAP_STRUCTURE = map_init)
  cx = 400
  cy = 789
  x = cx + xy[0]
  y = YDIM - (cy + xy[1])
  print, x, y

END 
