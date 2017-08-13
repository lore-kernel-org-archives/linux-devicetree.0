From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] drm/panel: Add DT bindings for Ilitek ILI9322
Date: Sun, 13 Aug 2017 13:44:47 +0200
Message-ID: <20170813114448.20179-2-linus.walleij@linaro.org>
References: <20170813114448.20179-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170813114448.20179-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Ilitek ILI9322
320x240 TFT panel driver.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/display/panel/ilitek,ili9322.txt      | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
new file mode 100644
index 000000000000..d619b1ad14a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.txt
@@ -0,0 +1,120 @@
+Ilitek ILI9322 TFT panel driver with SPI control bus
+
+This is a driver for 320x240 TFT panels, accepting a variety of input
+streams that get adapted and scaled to the panel. The panel output has
+960 TFT source driver pins and 240 TFT gate driver pins, VCOM, VCOML and
+VCOMH outputs.
+
+Required properties:
+  - compatible: "ilitek,ili9322"
+  - reg: address of the panel on the SPI bus
+
+Optional properties:
+  - width-mm: physical panel width [mm]
+  - height-mm: physical panel height [mm]
+  - vcc-supply: core voltage supply, see regulator/regulator.txt
+  - iovcc-supply: voltage supply for the interface input/output signals,
+    see regulator/regulator.txt
+  - vci-supply: voltage supply for analog parts, see regulator/regulator.txt
+  - reset-gpios: a GPIO spec for the reset pin, see gpio/gpio.txt
+  - ilitek,vreg1out-microvolt: the output in microvolts for the VREGOUT1
+    regulator used to drive the physical display. Valid ranges are 3600 thru
+    6000 in 100 microvolt increments. If not specified, hardware defaults will
+    be used (4.5V).
+  - ilitek,vcom-amplitude-percent: the percentage of VREGOUT1 used for the
+    peak-to-peak amplitude of the communcation signals to the physical display.
+    Valid ranges are 70 thru 132 percent in increments if two percent. Odd
+    percentages will be truncated. If not specified, hardware defaults will be
+    used (114%).
+  - ilitek,vcom-high-percent: the percentage of VREGOUT1 used for the peak
+    voltage on the communications link. Valid ranges are 37 thru 100 percent.
+    If not specified, hardware defaults will be used (91%).
+  - ilitek,gamma-correction-neg: a set of 8 nybbles describing negative
+    gamma correction for voltages V1 thru V8. Valid range 0..15
+  - ilitek,gamma-correction-pos: a set of 8 nybbles describing positive
+    gamma correction for voltages V1 thru V8. Valid range 0..15
+    These adjust what grayscale voltage will be output for input data V1 = 0,
+    V2 = 16, V3 = 48, V4 = 96, V5 = 160, V6 = 208, V7 = 240 and V8 = 255.
+    The curve is shaped like this:
+
+    ^
+    |                                                        V8
+    |                                                   V7
+    |                                          V6
+    |                               V5
+    |                    V4
+    |            V3
+    |     V2
+    | V1
+    +----------------------------------------------------------->
+      0   16     48      96         160        208      240  255
+
+    The negative and postive gamma values adjust the V1 thru V8 up/down
+    according to the datasheet specifications. This is a property of the
+    physical display connected to the display controller and may vary.
+    If defined, both arrays must be supplied in full. If the properties
+    are not supplied, hardware defaults will be used.
+
+  - ilitek,entry-mode: the panel can be connected to various input streams
+    and four of them can be selected by electronic straps on the display.
+    However it is possible to select another mode or override the
+    electronic default with this property. Valid values:
+    0: 8 bit serial RGB through
+    1: 8 bit serial RGB aligned
+    2: 8 bit serial RGB dummy 320x240
+    3: 8 bit serial RGB dummy 360x240
+    4: disabled
+    5: 24 bit parallel RGB through
+    6: 24 bit parallel RGB aligned
+    7: 24 bit YUV 640Y 320CbCr
+    8: 24 bit YUV 720Y 360CbCr
+    9: disabled
+    10: 8 bit ITU-R BT.656 720Y 360CbCr
+    11: 8 bit ITU-R BT.656 640Y 320CbCr
+
+  The following optional properties only apply to RGB and YUV input modes and
+  can be omitted for BT.656 input modes:
+
+  - flip-horizontal: flip the image horizontally (right-to-left scan)
+  - flip-vertical: flip the image vertically (down-to-up scan)
+  - pixelclk-active: see display/panel/display-timing.txt
+  - de-active: see display/panel/display-timing.txt
+  - hsync-active: see display/panel/display-timing.txt
+  - vsync-active: see display/panel/display-timing.txt
+
+The panel must obey the rules for a SPI slave device as specified in
+spi/spi-bus.txt
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in
+media/video-interfaces.txt. This node should describe panel's video bus.
+
+Example:
+
+panel: display@0 {
+	compatible = "ilitek,ili9322";
+	reg = <0>;
+	/* 50 ns min period = 20 MHz */
+	spi-max-frequency = <20000000>;
+	spi-cpol; /* Clock active low */
+	/* Panel LM918A01-1A SY-B4-091116-E0199 */
+	width-mm = <65>;
+	height-mm = <50>;
+	ilitek,entry-mode = <11>;
+	ilitek,vreg1out-microvolt = <4600>;
+	ilitek,vcom-high-percent = <91>;
+	ilitek,vcom-amplitude-percent = <114>;
+	ilitek,gamma-correction-neg = <0xa>, <0x5>, <0x7>,
+		<0x7>, <0x7>, <0x5>, <0x1>, <0x6>;
+	ilitek,gamma-correction-pos = <0x7>, <0x7>, <0x3>,
+		<0x2>, <0x3>, <0x5>, <0x7>, <0x2>;
+	vcc-supply = <&vdisp>;
+	iovcc-supply = <&vdisp>;
+	vci-supply = <&vdisp>;
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&display_out>;
+		};
+	};
+};
-- 
2.13.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
