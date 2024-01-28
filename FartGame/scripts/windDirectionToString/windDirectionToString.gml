function windDirectionToString(wind_strength, wind_dir){
	if(wind_strength > 0) {
		if(wind_dir >= 0 && wind_dir < 45) return "E";
		if(wind_dir >= 45 && wind_dir < 90) return "NE";
		if(wind_dir >= 90 && wind_dir < 135) return "N";
		if(wind_dir >= 135 && wind_dir < 180) return "NW";
		if(wind_dir >= 180 && wind_dir < 225) return "W";
		if(wind_dir >= 225 && wind_dir < 270) return "SW";
		if(wind_dir >= 270 && wind_dir < 315) return "S";
		if(wind_dir >= 315 && wind_dir < 360) return "SE";
	}
	return "";
}