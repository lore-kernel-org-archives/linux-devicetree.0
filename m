From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v3 1/7] mfd: Add Device Tree bindings document for retu/tahvo ASIC chips
Date: Sat,  1 Apr 2017 03:18:48 -0400
Message-ID: <20170401071854.23198-2-javier@osg.samsung.com>
References: <20170401071854.23198-1-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170401071854.23198-1-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

There are Device Tree source files defining a device node for the
retu/tahvo I2C chip, but there isn't a DT binding document for it.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/mfd/retu.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/retu.txt

diff --git a/Documentation/devicetree/bindings/mfd/retu.txt b/Documentation/devicetree/bindings/mfd/retu.txt
new file mode 100644
index 000000000000..2309e599a731
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/retu.txt
@@ -0,0 +1,19 @@
+* Device tree bindings for Nokia Retu and Tahvo multi-function device
+
+Retu and Tahvo are a multi-function devices found on Nokia Internet
+Tablets (770, N800 and N810).
+
+Required properties:
+- compatible:		"nokia,retu-mfd" or "nokia,tahvo-mfd"
+- reg:			Specifies the I2C slave address of the ASIC chip
+
+Example:
+
+i2c0 {
+	retu_mfd: retu@1 {
+		compatible = "nokia,retu-mfd";
+		interrupt-parent = <&gpio4>;
+		interrupts = <12 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x1>;
+	};
+};
-- 
2.9.3
