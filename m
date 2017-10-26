From: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Subject: [PATCH v3 1/2] dt-bindings: mfd: Add Spreadtrum SC27xx PMIC documentation
Date: Thu, 26 Oct 2017 09:57:30 +0800
Message-ID: <c92b97145628e5f8db410d1916da46a4c9fecf8c.1508982713.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the binding documentation for Spreadtrum SC27xx series
PMIC device.

Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Changes since v2:
 - Add acked tag from Rob and Lee.

Changes since v1:
 - Add more documentation to introduce Spreadtrum SC27xx series PMICs.
 - Modify compatile string property.
 - Modify reg property.
 - Remove redundant 'pmic' label.
 - Change 'should be' to 'must be' for cells properties.
---
 .../devicetree/bindings/mfd/sprd,sc27xx-pmic.txt   |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt

diff --git a/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt b/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
new file mode 100644
index 0000000..21b9a89
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sprd,sc27xx-pmic.txt
@@ -0,0 +1,40 @@
+Spreadtrum SC27xx Power Management Integrated Circuit (PMIC)
+
+The Spreadtrum SC27xx series PMICs contain SC2720, SC2721, SC2723, SC2730
+and SC2731. The Spreadtrum PMIC belonging to SC27xx series integrates all
+mobile handset power management, audio codec, battery management and user
+interface support function in a single chip. It has 6 major functional
+blocks:
+- DCDCs to support CPU, memory.
+- LDOs to support both internal and external requirement.
+- Battery management system, such as charger, fuel gauge.
+- Audio codec.
+- User interface function, such as indicator, flash LED and so on.
+- IC level interface, such as power on/off control, RTC and typec and so on.
+
+Required properties:
+- compatible: Should be one of the following:
+	"sprd,sc2720"
+	"sprd,sc2721"
+	"sprd,sc2723"
+	"sprd,sc2730"
+	"sprd,sc2731"
+- reg: The address of the device chip select, should be 0.
+- spi-max-frequency: Typically set to 26000000.
+- interrupts: The interrupt line the device is connected to.
+- interrupt-controller: Marks the device node as an interrupt controller.
+- #interrupt-cells: The number of cells to describe an PMIC IRQ, must be 2.
+- #address-cells: Child device offset number of cells, must be 1.
+- #size-cells: Child device size number of cells, must be 0.
+
+Example:
+pmic@0 {
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
