vec4 invert(vec4 inputColor) {
    return vec4(1 - inputColor);
}

float maxChannel(vec4 color) {
    return max(max(color.r, color.g), color.b);
}
float minChannel(vec4 color) {
    return min(min(color.r, color.g), color.b);
}

// HSV: HUE LIGHTNESS SATURATION
float colorHue(vec4 color) {
    float cmin = minChannel(color);
    float cmax = maxChannel(color);
    float delta = cmax - cmin;
    float hue;
    if (cmax == cmin) {
        hue = 0.0;
    } else if (cmax == color.r) {
        hue = mod((color.g - color.b) / delta, 6.0) / 6.0;
    } else if (cmax == color.g) {
        hue = (mod((color.b - color.r) / delta + 2.0, 6.0)) / 6.0;
    } else {
        hue = (mod((color.r - color.g) / delta + 4.0, 6.0)) / 6.0;
    }
    return hue;
}
float colorLightness(vec4 color) {
    float cmin = minChannel(color);
    float cmax = maxChannel(color);
    return (cmax + cmin) / 2.0;
}
float colorSaturation(vec4 color) {
    float cmin = minChannel(color);
    float cmax = maxChannel(color);
    return (cmax - cmin) / (1 - abs(2 * colorLightness - 1));
}
