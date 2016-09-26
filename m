From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH v3 1/2] dt-bindings: display: Add Sharp LQ150X1LG11 panel binding
Date: Tue, 27 Sep 2016 00:27:11 +0200
Message-ID: <1474928832-8766-2-git-send-email-peda@axentia.se>
References: <1474928832-8766-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1474928832-8766-1-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Gustaf=20Lindstr=C3=B6m?= <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Sharp 15" LQ150X1LG11 panel is an XGA TFT LCD panel.

Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
---
 .../bindings/display/panel/sharp,lq150x1lg11.txt   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
new file mode 100644
index 000000000000..715ff7e332f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt
@@ -0,0 +1,36 @@
+Sharp 15" LQ150X1LG11 XGA TFT LCD panel
+
+Required properties:
+- compatible: should be "sharp,lq150x1lg11"
+- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
+
+Optional properties:
+- backlight: phandle of the backlight device
+- rlud-gpios: a single GPIO for the RL/UD (rotate 180 degrees) pin.
+- lvds-gpios: a single GPIO for the SELLVDS pin.
+
+If lrud-gpios and/or ldvs-gpios are not specified, the RL/UD and/or SELLVDS
+pins are assumed to be handled appropriately by the hardware.
+
+Example:
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 100000>;                      /* VBR */
+
+		brightness-levels = <0 20 40 60 80 100>;
+		default-brightness-level = <2>;
+
+		power-supply = <&vdd_12v_reg>;               /* VDD */
+		enable-gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;  /* XSTABY */
+	};
+
+	panel {
+		compatible = "sharp,lq150x1lg11";
+
+		power-supply = <&vcc_3v3_reg>;               /* VCC */
+
+		backlight = <&backlight>;
+		rlud-gpios = <&gpio 17 GPIO_ACTIVE_HIGH>;    /* RL/UD */
+		lvds-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;    /* SELLVDS */
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
