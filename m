From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH RFC 12/15] dt-bindings: add Marvell Dove LCD controller
 documentation
Date: Sat, 05 Jul 2014 11:38:53 +0100
Message-ID: <E1X3NMr-0000AU-Ez@rmk-PC.arm.linux.org.uk>
References: <20140705103724.GN21766@n2100.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140705103724.GN21766-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the Marvell Dove LCD controller DT binding documentation.  The
clock names used here are intentionally taken from the specification
for the Dove SoC.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 .../bindings/drm/armada/marvell,dove-lcd.txt       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/armada/marvell,dove-lcd.txt

diff --git a/Documentation/devicetree/bindings/drm/armada/marvell,dove-lcd.txt b/Documentation/devicetree/bindings/drm/armada/marvell,dove-lcd.txt
new file mode 100644
index 000000000000..46525ea3e646
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/armada/marvell,dove-lcd.txt
@@ -0,0 +1,30 @@
+Device Tree bindings for Armada DRM CRTC driver
+
+Required properties:
+ - compatible: value should be "marvell,dove-lcd".
+ - reg: base address and size of the LCD controller
+ - interrupts: single interrupt number for the LCD controller
+ - port: video output port with endpoints, as described by graph.txt
+
+Optional properties:
+
+ - clocks: as described by clock-bindings.txt
+ - clock-names: as described by clock-bindings.txt
+	"axiclk" - axi bus clock for pixel clock
+	"plldivider" - pll divider clock for pixel clock
+	"ext_ref_clk0" - external clock 0 for pixel clock
+	"ext_ref_clk1" - external clock 1 for pixel clock
+
+Note: all clocks are optional but at least one must be specified.
+Further clocks may be added in the future according to requirements of
+different SoCs.
+
+Example:
+
+	lcd0: lcd-controller@820000 {
+		compatible = "marvell,dove-lcd";
+		reg = <0x820000 0x1000>;
+		interrupts = <47>;
+		clocks = <&si5351 0>;
+		clock-names = "ext_ref_clk_1";
+	};
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
