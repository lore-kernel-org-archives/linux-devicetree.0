From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [RESEND PATCH v4 3/4] devicetree: Add ANX7814 SlimPort transmitter binding.
Date: Mon,  2 May 2016 09:54:25 +0200
Message-ID: <1462175666-8891-4-git-send-email-enric.balletbo@collabora.com>
References: <1462175666-8891-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462175666-8891-1-git-send-email-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
designed for portable devices.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since v3:
 - Model v10 as regulator (dvdd10-supply). Received the ack from Rob before the 
   RESEND
Changes since v2:
 - Add Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Changes since v1:
 - Rob Herring:
   - Rename cable-det-gpios for hpd-gpios as is more standard
   - Fix HDMI output for HDMI input

 .../devicetree/bindings/video/bridge/anx7814.txt   | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt

diff --git a/Documentation/devicetree/bindings/video/bridge/anx7814.txt b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
new file mode 100644
index 0000000..b2a22c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
@@ -0,0 +1,40 @@
+Analogix ANX7814 SlimPort (Full-HD Transmitter)
+-----------------------------------------------
+
+The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
+designed for portable devices.
+
+Required properties:
+
+ - compatible		: "analogix,anx7814"
+ - reg			: I2C address of the device
+ - interrupt-parent	: Should be the phandle of the interrupt controller
+			  that services interrupts for this device
+ - interrupts		: Should contain the INTP interrupt
+ - hpd-gpios		: Which GPIO to use for hpd
+ - pd-gpios		: Which GPIO to use for power down
+ - reset-gpios		: Which GPIO to use for reset
+
+Optional properties:
+
+ - dvdd10-supply	: Regulator for 1.0V digital core power.
+ - Video port for HDMI input, using the DT bindings defined in [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	anx7814: anx7814@38 {
+		compatible = "analogix,anx7814";
+		reg = <0x38>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
+		hpd-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
+		pd-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 98 GPIO_ACTIVE_HIGH>;
+		port {
+			anx7814_in: endpoint {
+				remote-endpoint = <&hdmi0_out>;
+			};
+		};
+	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
