From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 1/2] dt-bindings: nvmem: Add Spreadtrum SC27XX efuse controller documentation
Date: Tue, 12 Jun 2018 13:24:01 +0800
Message-ID: <0a5444dd0646f4e1f1d8ce51870afe6cc864219e.1528780670.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: baolin.wang@linaro.org, broonie@kernel.org, freeman.liu@spreadtrum.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the binding documentation for Spreadtrum SC27XX series
PMICs efuse controller device.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 .../devicetree/bindings/nvmem/sc27xx-efuse.txt     |   52 ++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sc27xx-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/sc27xx-efuse.txt b/Documentation/devicetree/bindings/nvmem/sc27xx-efuse.txt
new file mode 100644
index 0000000..586c082
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/sc27xx-efuse.txt
@@ -0,0 +1,52 @@
+= Spreadtrum SC27XX PMIC eFuse device tree bindings =
+
+Required properties:
+- compatible: Should be one of the following.
+	"sprd,sc2720-efuse"
+	"sprd,sc2721-efuse"
+	"sprd,sc2723-efuse"
+	"sprd,sc2730-efuse"
+	"sprd,sc2731-efuse"
+- reg: Specify the address offset of efuse controller.
+- hwlocks: Reference to a phandle of a hwlock provider node.
+
+= Data cells =
+Are child nodes of eFuse, bindings of which as described in
+bindings/nvmem/nvmem.txt
+
+Example:
+
+	sc2731_pmic: pmic@0 {
+		compatible = "sprd,sc2731";
+		reg = <0>;
+		spi-max-frequency = <26000000>;
+		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		efuse@380 {
+			compatible = "sprd,sc2731-efuse";
+			reg = <0x380>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			hwlocks = <&hwlock 12>;
+
+			/* Data cells */
+			thermal_calib: calib@10 {
+				reg = <0x10 0x2>;
+			};
+		};
+	};
+
+= Data consumers =
+Are device nodes which consume nvmem data cells.
+
+Example:
+
+	thermal {
+		...
+		nvmem-cells = <&thermal_calib>;
+		nvmem-cell-names = "calibration";
+	};
-- 
1.7.9.5
