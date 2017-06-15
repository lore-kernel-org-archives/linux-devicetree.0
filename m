From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [RESEND PATCH v6 1/8] dt-bindings: mfd: Add retu/tahvo ASIC chips bindings
Date: Thu, 15 Jun 2017 20:49:21 +0200
Message-ID: <20170615184928.12007-2-javier@dowhile0.org>
References: <20170615184928.12007-1-javier@dowhile0.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170615184928.12007-1-javier@dowhile0.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Javier Martinez Canillas <javier@dowhile0.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

There are Device Tree source files defining a device node for the
retu/tahvo I2C chip, but there isn't a DT binding document for it.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Acked-by: Tony Lindgren <tony@atomide.com>
Acked-by: Lee Jones <lee.jones@linaro.org>

---

Changes in v6:
- Mention CBUS address instead of I2C since that's the bus used (Wolfram Sang).
- Add a "i2c-cbus-gpio" comptible and use cbus0 for parent node (Wolfram Sang).

Changes in v5:
- Add missing properties for interrupts to DT binding doc (Rob Herring).
- Add Rob Herring's Acked-by tag.
- Add Aaro Koskinen's Acked-by tag.
- Add Acked-by: Tony Lindgren <tony@atomide.com>'s Acked-by tag.
- Add Lee Jones <lee.jones@linaro.org>'s Acked-by tag.

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
