From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2] dt-bindings: gpu: add bindings for the ARM Mali Bifrost GPU
Date: Tue, 12 Feb 2019 17:38:38 +0100
Message-ID: <20190212163838.22644-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel@ffwll.ch
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the bindings for the Bifrost family of ARM Mali GPUs.

The Bifrost GPU architecture is similar to the Midgard family,
but with a different Shader Core & Execution Engine structures.

Bindings are based on the Midgard family bindings, but the inner
architectural changes makes it a separate family needing separate
bindings.

The Bifrost GPUs are present in a number of recent SoCs, like the
Amlogic G12A Family, and many other vendors.
The Amlogic vendor specific compatible is added to handle the
specific IP integration differences and dependencies.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes since v1:
- adding missing G31 and G52
- fixed example

 .../bindings/gpu/arm,mali-bifrost.txt         | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
new file mode 100644
index 000000000000..04a1d63ee578
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
@@ -0,0 +1,96 @@
+ARM Mali Bifrost GPU
+====================
+
+Required properties:
+
+- compatible :
+  * Must contain one of the following:
+    + "arm,mali-g31"
+    + "arm,mali-g51"
+    + "arm,mali-g52"
+    + "arm,mali-g71"
+    + "arm,mali-g72"
+    + "arm,mali-g76"
+  * which must be preceded by one of the following vendor specifics:
+    + "amlogic,meson-g12a-mali"
+
+- reg : Physical base address of the device and length of the register area.
+
+- interrupts : Contains the three IRQ lines required by Mali Bifrost devices.
+
+- interrupt-names : Contains the names of IRQ resources in the order they were
+  provided in the interrupts property. Must contain: "job", "mmu", "gpu".
+
+
+Optional properties:
+
+- clocks : Phandle to clock for the Mali Bifrost device.
+
+- mali-supply : Phandle to regulator for the Mali device. Refer to
+  Documentation/devicetree/bindings/regulator/regulator.txt for details.
+
+- operating-points-v2 : Refer to Documentation/devicetree/bindings/opp/opp.txt
+  for details.
+
+- resets : Phandle of the GPU reset line.
+
+Vendor-specific bindings
+------------------------
+
+The Mali GPU is integrated very differently from one SoC to
+another. In order to accomodate those differences, you have the option
+to specify one more vendor-specific compatible, among:
+
+- "amlogic,meson-g12a-mali"
+  Required properties:
+  - resets : Should contain phandles of :
+    + GPU reset line
+    + GPU APB glue reset line
+
+Example for a Mali-G31:
+
+gpu@ffa30000 {
+	compatible = "amlogic,meson-g12a-mali", "arm,mali-g31";
+	reg = <0xffe40000 0x10000>;
+	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "job", "mmu", "gpu";
+	clocks = <&clk CLKID_MALI>;
+	mali-supply = <&vdd_gpu>;
+	operating-points-v2 = <&gpu_opp_table>;
+	resets = <&reset RESET_DVALIN_CAPB3>, <&reset RESET_DVALIN>;
+};
+
+gpu_opp_table: opp_table0 {
+	compatible = "operating-points-v2";
+
+	opp@533000000 {
+		opp-hz = /bits/ 64 <533000000>;
+		opp-microvolt = <1250000>;
+	};
+	opp@450000000 {
+		opp-hz = /bits/ 64 <450000000>;
+		opp-microvolt = <1150000>;
+	};
+	opp@400000000 {
+		opp-hz = /bits/ 64 <400000000>;
+		opp-microvolt = <1125000>;
+	};
+	opp@350000000 {
+		opp-hz = /bits/ 64 <350000000>;
+		opp-microvolt = <1075000>;
+	};
+	opp@266000000 {
+		opp-hz = /bits/ 64 <266000000>;
+		opp-microvolt = <1025000>;
+	};
+	opp@160000000 {
+		opp-hz = /bits/ 64 <160000000>;
+		opp-microvolt = <925000>;
+	};
+	opp@100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		opp-microvolt = <912500>;
+	};
+};
-- 
2.20.1
