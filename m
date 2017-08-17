From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/panel: Add DT bindings for Ilitek ILI9322
Date: Thu, 17 Aug 2017 15:44:30 -0500
Message-ID: <20170817204424.e2wdkmyp4vyx2qj3@rob-hp-laptop>
References: <20170813114448.20179-1-linus.walleij@linaro.org>
 <20170813114448.20179-2-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170813114448.20179-2-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Aug 13, 2017 at 01:44:47PM +0200, Linus Walleij wrote:
> This adds device tree bindings for the Ilitek ILI9322
> 320x240 TFT panel driver.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/display/panel/ilitek,ili9322.txt      | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
> new file mode 100644
> index 000000000000..d619b1ad14a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
> @@ -0,0 +1,120 @@
> +Ilitek ILI9322 TFT panel driver with SPI control bus
> +
> +This is a driver for 320x240 TFT panels, accepting a variety of input
> +streams that get adapted and scaled to the panel. The panel output has
> +960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
> +VCOMH outputs.
> +
> +Required properties:
> +  - compatible: "ilitek,ili9322"
> +  - reg: address of the panel on the SPI bus
> +
> +Optional properties:
> +  - width-mm: physical panel width [mm]
> +  - height-mm: physical panel height [mm]
> +  - vcc-supply: core voltage supply, see regulator/regulator.txt
> +  - iovcc-supply: voltage supply for the interface input/output signals,
> +    see regulator/regulator.txt
> +  - vci-supply: voltage supply for analog parts, see regulator/regulator.txt
> +  - reset-gpios: a GPIO spec for the reset pin, see gpio/gpio.txt
> +  - ilitek,vreg1out-microvolt: the output in microvolts for the VREGOUT1
> +    regulator used to drive the physical display. Valid ranges are 3600 thru
> +    6000 in 100 microvolt increments. If not specified, hardware defaults will
> +    be used (4.5V).
> +  - ilitek,vcom-amplitude-percent: the percentage of VREGOUT1 used for the
> +    peak-to-peak amplitude of the communcation signals to the physical display.
> +    Valid ranges are 70 thru 132 percent in increments if two percent. Odd
> +    percentages will be truncated. If not specified, hardware defaults will be
> +    used (114%).
> +  - ilitek,vcom-high-percent: the percentage of VREGOUT1 used for the peak
> +    voltage on the communications link. Valid ranges are 37 thru 100 percent.
> +    If not specified, hardware defaults will be used (91%).
> +  - ilitek,gamma-correction-neg: a set of 8 nybbles describing negative
> +    gamma correction for voltages V1 thru V8. Valid range 0..15
> +  - ilitek,gamma-correction-pos: a set of 8 nybbles describing positive
> +    gamma correction for voltages V1 thru V8. Valid range 0..15
> +    These adjust what grayscale voltage will be output for input data V1 = 0,
> +    V2 = 16, V3 = 48, V4 = 96, V5 = 160, V6 = 208, V7 = 240 and V8 = 255.
> +    The curve is shaped like this:
> +
> +    ^
> +    |                                                        V8
> +    |                                                   V7
> +    |                                          V6
> +    |                               V5
> +    |                    V4
> +    |            V3
> +    |     V2
> +    | V1
> +    +----------------------------------------------------------->
> +      0   16     48      96         160        208      240  255
> +
> +    The negative and postive gamma values adjust the V1 thru V8 up/down
> +    according to the datasheet specifications. This is a property of the
> +    physical display connected to the display controller and may vary.
> +    If defined, both arrays must be supplied in full. If the properties
> +    are not supplied, hardware defaults will be used.

Normally, we the physical panel is described which would imply all these 
settings. Are there lots of panels with this controller that would 
justify all these settings?

> +
> +  - ilitek,entry-mode: the panel can be connected to various input streams
> +    and four of them can be selected by electronic straps on the display.
> +    However it is possible to select another mode or override the
> +    electronic default with this property. Valid values:
> +    0: 8 bit serial RGB through
> +    1: 8 bit serial RGB aligned
> +    2: 8 bit serial RGB dummy 320x240
> +    3: 8 bit serial RGB dummy 360x240
> +    4: disabled
> +    5: 24 bit parallel RGB through
> +    6: 24 bit parallel RGB aligned
> +    7: 24 bit YUV 640Y 320CbCr
> +    8: 24 bit YUV 720Y 360CbCr
> +    9: disabled
> +    10: 8 bit ITU-R BT.656 720Y 360CbCr
> +    11: 8 bit ITU-R BT.656 640Y 320CbCr

To some extent, we have some standard bindings to describe this.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
