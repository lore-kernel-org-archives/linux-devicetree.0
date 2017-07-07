From: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Subject: [PATCH v2 5/6] [media] dt-bindings: gpio-ir-tx: add support for GPIO IR Transmitter
Date: Fri,  7 Jul 2017 10:52:03 +0100
Message-ID: <580c648de65344e9316ff153ba316efd4d527f12.1499419624.git.sean@mess.org>
References: <cover.1499419624.git.sean@mess.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1499419624.git.sean-hENCXIMQXOg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the device tree bindings for the GPIO Bit Banging IR
Transmitter.

Signed-off-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
---
 Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt

diff --git a/Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt b/Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt
new file mode 100644
index 0000000..bc08d89
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt
@@ -0,0 +1,11 @@
+Device tree bindings for IR LED connected through gpio pin which is used as
+remote controller transmitter.
+
+Required properties:
+	- compatible: should be "gpio-ir-tx".
+
+Example:
+	irled@0 {
+		compatible = "gpio-ir-tx";
+		gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.9.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
