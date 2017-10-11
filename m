From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: [PATCH 1/2] dt-bindings: mfd: Add Spreadtrum SC27xx PMIC documentation
Date: Wed, 11 Oct 2017 20:17:44 +0800
Message-ID: <73965e7fb34d6a96529589cdf48e54e95ed666b8.1507723345.git.baolin.wang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org, baolin.wang@spreadtrum.com
List-Id: devicetree@vger.kernel.org

This patch adds the binding documentation for Spreadtrum SC27xx series
PMIC device.

Signed-off-by: Baolin Wang <baolin.wang@spreadtrum.com>
---
 .../devicetree/bindings/mfd/sprd,sc27xx-pmic.txt   |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt

diff --git a/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt b/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
new file mode 100644
index 0000000..333c818
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
@@ -0,0 +1,23 @@
+Spreadtrum SC27xx Power Management Integrated Circuit (PMIC)
+
+Required properties:
+- compatible: Should be "sprd,sc2731".
+- reg: SPI chip select.
+- spi-max-frequency: Typically set to 26000000.
+- interrupts: The interrupt line the device is connected to.
+- interrupt-controller: Marks the device node as an interrupt controller.
+- #interrupt-cells: The number of cells to describe an PMIC IRQ, should be 2.
+- #address-cells: Child device offset number of cells, should be 1.
+- #size-cells: Child device size number of cells, should be 0.
+
+Example:
+pmic: pmic@0 {
+	compatible = "sprd,sc2731";
+	reg = <0>;
+	spi-max-frequency = <26000000>;
+	interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+};
-- 
1.7.9.5
