From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 1/8] dt-bindings: mfd: Add retu/tahvo ASIC chips bindings
Date: Thu,  4 May 2017 01:21:00 -0400
Message-ID: <20170504052107.18995-2-javier@dowhile0.org>
References: <20170504052107.18995-1-javier@dowhile0.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504052107.18995-1-javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There are Device Tree source files defining a device node for the
retu/tahvo I2C chip, but there isn't a DT binding document for it.

Signed-off-by: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

---

Changes in v6:
- Mention CBUS address instead of I2C since that's the bus used (Wolfram Sang).
- Add a "i2c-cbus-gpio" comptible and use cbus0 for parent node (Wolfram Sang).

Changes in v5:
- Add missing properties for interrupts to DT binding doc (Rob Herring).
- Add Rob Herring's Acked-by tag.
- Add Aaro Koskinen's Acked-by tag.
- Add Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>'s Acked-by tag.
- Add Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>'s Acked-by tag.

Changes in v4:
- Use "dt-bindings: mfd:" prefix in subject line (Rob Herring).
- Add information about what functions the device serve (Lee Jones).
- Avoid using MFD in Device Tree (Lee Jones).

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/mfd/retu.txt | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/retu.txt

diff --git a/Documentation/devicetree/bindings/mfd/retu.txt b/Documentation/devicetree/bindings/mfd/retu.txt
new file mode 100644
index 000000000000..876242394a16
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/retu.txt
@@ -0,0 +1,25 @@
+* Device tree bindings for Nokia Retu and Tahvo multi-function device
+
+Retu and Tahvo are a multi-function devices found on Nokia Internet
+Tablets (770, N800 and N810). The Retu chip provides watchdog timer
+and power button control functionalities while Tahvo chip provides
+USB transceiver functionality.
+
+Required properties:
+- compatible:		"nokia,retu" or "nokia,tahvo"
+- reg:			Specifies the CBUS slave address of the ASIC chip
+- interrupts: 		The interrupt line the device is connected to
+- interrupt-parent:	The parent interrupt controller
+
+Example:
+
+cbus0 {
+	compatible = "i2c-cbus-gpio";
+	...
+	retu: retu@1 {
+		compatible = "nokia,retu";
+		interrupt-parent = <&gpio4>;
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x1>;
+	};
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
