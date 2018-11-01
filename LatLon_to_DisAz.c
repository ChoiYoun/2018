#include <math.h>

#ifndef RE
#define RE (6371.00877)
#endif

#ifndef DTOR
#define DTOR (0.01745)
#endif

int LatLon_to_DisAz(float lat0, float lon0, float lat1, float lon1, float *distance, float *azimuth)
{
	float delta_lon, delta_lat;
	float lat1_rad, lat0_rad, lon1_rad, lon0_rad;
	float a, c;

	delta_lon = (lon1 - lon0) * DTOR;
	delta_lat = (lat1 - lat0) * DTOR;

	lat1_rad = lat1 * DTOR;
	lat0_rad = lat0 * DTOR;
	lon1_rad = lon1 * DTOR;
	lon0_rad = lon0 * DTOR;
	
	a = pow(sin(delta_lat / 2.), 2.0) + cos(lat0_rad) * cos(lat1_rad) * pow(sin(delta_lon / 2.0), 2.0);
	c = 2.0 * atan2(sqrt(a), sqrt(1-a)); 

	*distance = RE * c; //Haversine formula
	*azimuth = atan2(sin(delta_lon) * cos(lat1_rad), cos(lat0_rad) * sin(lat1_rad) - sin(lat0_rad) * cos(lat1_rad) * cos(delta_lon));
	*azimuth = 90. * DTOR - *azimuth;
	if (*azimuth < 0)
	{
		*azimuth = *azimuth + 360. * DTOR;
	}
	return 0;
}
