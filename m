From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v5 1/8] dt-bindings: mfd: Add retu/tahvo ASIC chips bindings
Date: Wed, 12 Apr 2017 14:27:52 -0300
Message-ID: <20170412172800.23035-2-javier@osg.samsung.com>
References: <20170412172800.23035-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170412172800.23035-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

There are Device Tree source files defining a device node for the
retu/tahvo I2C chip, but there isn't a DT binding document for it.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Acked-by: Tony Lindgren <tony@atomide.com>
Acked-by: Lee Jones <lee.jones@linaro.org>

---

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

 Documentation/devicetree/bindings/mfd/retu.txt | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/retu.txt

diff --git a/Documentation/devicetree/bindings/mfd/retu.txt b/Documentation/devicetree/bindings/mfd/retu.txt
new file mode 100644
index 000000000000..e1ea3a36a038
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/retu.txt
@@ -0,0 +1,23 @@
+* Device tree bindings for Nokia Retu and Tahvo multi-function device
+
+Retu and Tahvo are a multi-function devices found on Nokia Internet
+Tablets (770, N800 and N810). The Retu chip provides watchdog timer
+and power button control functionalities while Tahvo chip provides
+USB transceiver functionality.
+
+Required properties:
+- compatible:		"nokia,retu" or "nokia,tahvo"
+- reg:			Specifies the I2C slave address of the ASIC chip
+- interrupts: 		The interrupt line the device is connected to
+- interrupt-parent:	The parent interrupt controller
+
+Example:
+
+i2c0 {
+	retu: retu@1 {
+		compatible = "nokia,retu";
+		interrupt-parent = <&gpio4>;
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x1>;
+	};
+};
-- 
2.9.3
