ST = 4; // Senkungstiefe 
SD = 6; // Senkungsdurchmesser 
DL = 15; // Durchgangslochlaenge 
DD = 3.5; // Durchgangslochdurchmesser 
LH = 0.2; // Layerhoehe 

difference(){ // Vom ersten Koerper alle folgenden abziehen:
    
    union(){ // Die Grundform des Durchgangslochs mit Senkung
    cylinder(ST+2*LH, d=SD, $fn=64); // Senkung plus zwei Layerhoehen
    translate ([0,0,ST]) cylinder(DL, d=DD, $fn=32); // Durchgangsloch, um Senktiefe in Z-Richtung verschoben 
    };
    
    translate ([-SD/2,DD/2,ST]) cube([SD, (SD-DD)/2, 2*LH+LH]); // um eine Layerhoehe nach oben dicker, damit die Subtraktion gut funktioniert, ohne an der Grenzflaeche Artefakte hervorzurufen
    mirror ([0,1,0]) translate ([-SD/2,DD/2,ST]) cube([SD, (SD-DD)/2, 2*LH+LH]); // dasselbe, nur gespiegelt in Bezug auf die Y-Koordinate 
        
    translate ([DD/2,-SD/2,ST+LH]) cube([(SD-DD)/2, SD, 2*LH]); // um eine Layerhoehe nach oben dicker, damit die Subtraktion gut funktioniert, ohne an der Grenzflaeche Artefakte hervorzurufen
    mirror ([1,0,0]) translate ([DD/2,-SD/2,ST+LH]) cube([(SD-DD)/2, SD, 2*LH]); // dasselbe, nur gespiegelt in Bezug auf die X-Koordinate
};