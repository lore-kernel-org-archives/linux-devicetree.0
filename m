From: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Subject: [PATCH v2 6/6] [media] dt-bindings: pwm-ir-tx: Add support for PWM IR Transmitter
Date: Fri,  7 Jul 2017 10:52:04 +0100
Message-ID: <e18cec2d3f66cd59d8683cb07fc59e3a2086cf6e.1499419624.git.sean@mess.org>
References: <580c648de65344e9316ff153ba316efd4d527f12.1499419624.git.sean@mess.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <580c648de65344e9316ff153ba316efd4d527f12.1499419624.git.sean-hENCXIMQXOg@public.gmane.org>
In-Reply-To: <cover.1499419624.git.sean-hENCXIMQXOg@public.gmane.org>
References: <cover.1499419624.git.sean-hENCXIMQXOg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the device tree bindings for the PWM IR Transmitter.

Signed-off-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.txt

diff --git a/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.txt b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.txt
new file mode 100644
index 0000000..66e5672
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.txt
@@ -0,0 +1,13 @@
+Device tree bindings for IR LED connected through pwm pin which is used as
+remote controller transmitter.
+
+Required properties:
+	- compatible: should be "pwm-ir-tx".
+	- pwms : PWM property to point to the PWM device (phandle)/port (id)
+	  and to specify the period time to be used: <&phandle id period_ns>;
+
+Example:
+	irled {
+		compatible = "pwm-ir-tx";
+		pwms = <&pwm0 0 10000000>;
+	};
-- 
2.9.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
