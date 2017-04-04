From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v4 6/8] dt-bindings: mfd: Add TI tps6105x chip bindings
Date: Tue,  4 Apr 2017 11:30:34 -0400
Message-ID: <20170404153036.6651-7-javier@osg.samsung.com>
References: <20170404153036.6651-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170404153036.6651-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

There are Device Tree source files defining a device node for the
tps61050/61052 I2C chip but there isn't a binding document for it.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v4:
- Use "dt-bindings: mfd:" prefix in subject line (Rob Herring).
- Add information about what functions the device serve (Lee Jones).

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/mfd/tps6105x.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps6105x.txt

diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
new file mode 100644
index 000000000000..93602c7a19c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/tps6105x.txt
@@ -0,0 +1,17 @@
+* Device tree bindings for TI TPS61050/61052 Boost Converters
+
+The TP61050/TPS61052 is a high-power "white LED driver". The
+device provides LED, GPIO and regulator functionalities.
+
+Required properties:
+- compatible:		"ti,tps61050" or "ti,tps61052"
+- reg:			Specifies the I2C slave address
+
+Example:
+
+i2c0 {
+	tps61052@33 {
+		compatible = "ti,tps61052";
+		reg = <0x33>;
+	};
+};
-- 
2.9.3
