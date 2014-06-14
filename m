From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/2] regulator: max1586 add device-tree support
Date: Sat, 14 Jun 2014 16:54:25 +0200
Message-ID: <1402757665-15102-2-git-send-email-robert.jarzmik@free.fr>
References: <1402757665-15102-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402757665-15102-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add max1586 regulator device-tree bindings documentation.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 .../bindings/regulator/max1586-regulator.txt       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/max1586-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/max1586-regulator.txt b/Documentation/devicetree/bindings/regulator/max1586-regulator.txt
new file mode 100644
index 0000000..c050c17
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/max1586-regulator.txt
@@ -0,0 +1,28 @@
+Maxim MAX1586 voltage regulator
+
+Required properties:
+- compatible: must be "maxim,max1586"
+- reg: I2C slave address, usually 0x14
+- v3-gain: integer specifying the V3 gain as per datasheet
+           (1 + R24/R25 + R24/185.5kOhm)
+- any required generic properties defined in regulator.txt
+
+Example:
+
+	i2c_master {
+		max1586@14 {
+			compatible = "maxim,max1586";
+			reg = <0x14>;
+			v3-gain = <1000000>;
+
+			regulators {
+				vcc_core: v3 {
+					regulator-name = "vcc_core";
+					regulator-compatible = "Output_V3";
+					regulator-min-microvolt = <1000000>;
+					regulator-max-microvolt = <1705000>;
+					regulator-always-on;
+				};
+			};
+		};
+	};
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
