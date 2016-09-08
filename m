From: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4] dt-bindings: Add jdi lt070me05000 panel bindings
Date: Thu,  8 Sep 2016 10:44:22 +0530
Message-ID: <1473311672-20782-1-git-send-email-simhavcs@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Archit Taneja <archit.taneja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation for lt070me05000 panel

Cc: Archit Taneja <archit.taneja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sumit Semwal <sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

---
v2:
 * incorporated rob herring and thierry reviews
   gpio to gpios, gpio to regulator using fixed regulators
   and pwm backlight is removed, since it is controlled by
   dcs commands

v3:
 * incorporated thierry reviews
   - Added gpio polarity details for reset-gpios
   - proper naming conventions and sequence wrt panel datasheet
     (vddp-supply, iovcc-supply,
      enable-gpios, reset-gpios, dcdc-en-gpios)
v4:
 * pinctrl-names, pinctrl-0 removed, not required for
   reset-gpios
---
 .../bindings/display/panel/jdi,lt070me05000.txt    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
new file mode 100644
index 0000000..4989c91d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
@@ -0,0 +1,31 @@
+JDI model LT070ME05000 1200x1920 7" DSI Panel
+
+Required properties:
+- compatible: should be "jdi,lt070me05000"
+- vddp-supply: phandle of the regulator that provides the supply voltage
+  Power IC supply (3-5V)
+- iovcc-supply: phandle of the regulator that provides the supply voltage
+  IOVCC , power supply for LCM (1.8V)
+- enable-gpios: phandle of gpio for enable line
+  LED_EN, LED backlight enable, High active
+- reset-gpios: phandle of gpio for reset line
+  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
+  XRES, Reset, Low active
+- dcdc-en-gpios: phandle of the gpio for power ic line
+  Power IC supply enable, High active
+
+Example:
+
+	dsi0: qcom,mdss_dsi@4700000 {
+		panel@0 {
+			compatible = "jdi,lt070me05000";
+			reg = <0>;
+
+			vddp-supply = <&pm8921_l17>;
+			iovcc-supply = <&pm8921_lvs7>;
+
+			enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
+			reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
+			dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
+		};
+	};
-- 
2.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
