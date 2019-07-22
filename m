From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8998: Node ordering, address cleanups
Date: Mon, 22 Jul 2019 09:58:23 -0700
Message-ID: <20190722165823.21539-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, bjorn.andersson@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

DT nodes should be ordered by address, then node name, and finally label.
The msm8998 dtsi does not follow this, so clean it up by reordering the
nodes.  While we are at it, extend the addresses to be fully 32-bits wide
so that ordering is easy to determine when adding new nodes.  Also, two
or so nodes had the wrong address value in their node name (did not match
the reg property), so fix those up as well.

Hopefully going forward, things can be maintained so that a cleanup like
this is not needed.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 254 +++++++++++++-------------
 1 file changed, 127 insertions(+), 127 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c13ed7aeb1e0..4b66a1c588f8 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -787,14 +787,22 @@
 		ranges = <0 0 0 0xffffffff>;
 		compatible = "simple-bus";
 
-		rpm_msg_ram: memory@68000 {
+		gcc: clock-controller@100000 {
+			compatible = "qcom,gcc-msm8998";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x00100000 0xb0000>;
+		};
+
+		rpm_msg_ram: memory@778000 {
 			compatible = "qcom,rpm-msg-ram";
-			reg = <0x778000 0x7000>;
+			reg = <0x00778000 0x7000>;
 		};
 
 		qfprom: qfprom@780000 {
 			compatible = "qcom,qfprom";
-			reg = <0x780000 0x621c>;
+			reg = <0x00780000 0x621c>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 
@@ -804,47 +812,10 @@
 			};
 		};
 
-		gcc: clock-controller@100000 {
-			compatible = "qcom,gcc-msm8998";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			reg = <0x100000 0xb0000>;
-		};
-
-		tlmm: pinctrl@3400000 {
-			compatible = "qcom,msm8998-pinctrl";
-			reg = <0x3400000 0xc00000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			#gpio-cells = <0x2>;
-			interrupt-controller;
-			#interrupt-cells = <0x2>;
-		};
-
-		spmi_bus: spmi@800f000 {
-			compatible = "qcom,spmi-pmic-arb";
-			reg =	<0x800f000 0x1000>,
-				<0x8400000 0x1000000>,
-				<0x9400000 0x1000000>,
-				<0xa400000 0x220000>,
-				<0x800a000 0x3000>;
-			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
-			interrupt-names = "periph_irq";
-			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,ee = <0>;
-			qcom,channel = <0>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-			interrupt-controller;
-			#interrupt-cells = <4>;
-			cell-index = <0>;
-		};
-
 		tsens0: thermal@10ab000 {
 			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
-			reg = <0x10ab000 0x1000>, /* TM */
-			      <0x10aa000 0x1000>; /* SROT */
+			reg = <0x010ab000 0x1000>, /* TM */
+			      <0x010aa000 0x1000>; /* SROT */
 
 			#qcom,sensors = <14>;
 			#thermal-sensor-cells = <1>;
@@ -852,8 +823,8 @@
 
 		tsens1: thermal@10ae000 {
 			compatible = "qcom,msm8998-tsens", "qcom,tsens-v2";
-			reg = <0x10ae000 0x1000>, /* TM */
-			      <0x10ad000 0x1000>; /* SROT */
+			reg = <0x010ae000 0x1000>, /* TM */
+			      <0x010ad000 0x1000>; /* SROT */
 
 			#qcom,sensors = <8>;
 			#thermal-sensor-cells = <1>;
@@ -943,16 +914,107 @@
 			};
 		};
 
+		ufshc: ufshc@1da4000 {
+			compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
+			reg = <0x01da4000 0x2500>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufsphy_lanes>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			power-domains = <&gcc UFS_GDSC>;
+			#reset-cells = <1>;
+
+			clock-names =
+				"core_clk",
+				"bus_aggr_clk",
+				"iface_clk",
+				"core_clk_unipro",
+				"ref_clk",
+				"tx_lane0_sync_clk",
+				"rx_lane0_sync_clk",
+				"rx_lane1_sync_clk";
+			clocks =
+				<&gcc GCC_UFS_AXI_CLK>,
+				<&gcc GCC_AGGRE1_UFS_AXI_CLK>,
+				<&gcc GCC_UFS_AHB_CLK>,
+				<&gcc GCC_UFS_UNIPRO_CORE_CLK>,
+				<&rpmcc RPM_SMD_LN_BB_CLK1>,
+				<&gcc GCC_UFS_TX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_RX_SYMBOL_1_CLK>;
+			freq-table-hz =
+				<50000000 200000000>,
+				<0 0>,
+				<0 0>,
+				<37500000 150000000>,
+				<0 0>,
+				<0 0>,
+				<0 0>,
+				<0 0>;
+
+			resets = <&gcc GCC_UFS_BCR>;
+			reset-names = "rst";
+		};
+
+		ufsphy: phy@1da7000 {
+			compatible = "qcom,msm8998-qmp-ufs-phy";
+			reg = <0x01da7000 0x18c>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			clock-names =
+				"ref",
+				"ref_aux";
+			clocks =
+				<&gcc GCC_UFS_CLKREF_CLK>,
+				<&gcc GCC_UFS_PHY_AUX_CLK>;
+
+			reset-names = "ufsphy";
+			resets = <&ufshc 0>;
+
+			ufsphy_lanes: lanes@1da7400 {
+				reg = <0x01da7400 0x128>,
+				      <0x01da7600 0x1fc>,
+				      <0x01da7c00 0x1dc>,
+				      <0x01da7800 0x128>,
+				      <0x01da7a00 0x1fc>;
+				#phy-cells = <0>;
+			};
+		};
+
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
-			reg = <0x1f40000 0x20000>;
+			reg = <0x01f40000 0x20000>;
 		};
 
-		apcs_glb: mailbox@9820000 {
-			compatible = "qcom,msm8998-apcs-hmss-global";
-			reg = <0x17911000 0x1000>;
+		tlmm: pinctrl@3400000 {
+			compatible = "qcom,msm8998-pinctrl";
+			reg = <0x03400000 0xc00000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <0x2>;
+			interrupt-controller;
+			#interrupt-cells = <0x2>;
+		};
 
-			#mbox-cells = <1>;
+		spmi_bus: spmi@800f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg =	<0x0800f000 0x1000>,
+				<0x08400000 0x1000000>,
+				<0x09400000 0x1000000>,
+				<0x0a400000 0x220000>,
+				<0x0800a000 0x3000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
 		};
 
 		usb3: usb@a8f8800 {
@@ -1044,7 +1106,7 @@
 
 		sdhc2: sdhci@c0a4900 {
 			compatible = "qcom,sdhci-msm-v4";
-			reg = <0xc0a4900 0x314>, <0xc0a4000 0x800>;
+			reg = <0x0c0a4900 0x314>, <0x0c0a4000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
@@ -1149,6 +1211,16 @@
 			#size-cells = <0>;
 		};
 
+		blsp2_uart1: serial@c1b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x0c1b0000 0x1000>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
 		blsp2_i2c0: i2c@c1b5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c1b5000 0x600>;
@@ -1239,14 +1311,11 @@
 			#size-cells = <0>;
 		};
 
-		blsp2_uart1: serial@c1b0000 {
-			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0xc1b0000 0x1000>;
-			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
-				 <&gcc GCC_BLSP2_AHB_CLK>;
-			clock-names = "core", "iface";
-			status = "disabled";
+		apcs_glb: mailbox@17911000 {
+			compatible = "qcom,msm8998-apcs-hmss-global";
+			reg = <0x17911000 0x1000>;
+
+			#mbox-cells = <1>;
 		};
 
 		timer@17920000 {
@@ -1320,75 +1389,6 @@
 			redistributor-stride = <0x0 0x20000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
-
-		ufshc: ufshc@1da4000 {
-			compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
-			reg = <0x01da4000 0x2500>;
-			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufsphy_lanes>;
-			phy-names = "ufsphy";
-			lanes-per-direction = <2>;
-			power-domains = <&gcc UFS_GDSC>;
-			#reset-cells = <1>;
-
-			clock-names =
-				"core_clk",
-				"bus_aggr_clk",
-				"iface_clk",
-				"core_clk_unipro",
-				"ref_clk",
-				"tx_lane0_sync_clk",
-				"rx_lane0_sync_clk",
-				"rx_lane1_sync_clk";
-			clocks =
-				<&gcc GCC_UFS_AXI_CLK>,
-				<&gcc GCC_AGGRE1_UFS_AXI_CLK>,
-				<&gcc GCC_UFS_AHB_CLK>,
-				<&gcc GCC_UFS_UNIPRO_CORE_CLK>,
-				<&rpmcc RPM_SMD_LN_BB_CLK1>,
-				<&gcc GCC_UFS_TX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>,
-				<&gcc GCC_UFS_RX_SYMBOL_1_CLK>;
-			freq-table-hz =
-				<50000000 200000000>,
-				<0 0>,
-				<0 0>,
-				<37500000 150000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>;
-
-			resets = <&gcc GCC_UFS_BCR>;
-			reset-names = "rst";
-		};
-
-		ufsphy: phy@1da7000 {
-			compatible = "qcom,msm8998-qmp-ufs-phy";
-			reg = <0x01da7000 0x18c>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			clock-names =
-				"ref",
-				"ref_aux";
-			clocks =
-				<&gcc GCC_UFS_CLKREF_CLK>,
-				<&gcc GCC_UFS_PHY_AUX_CLK>;
-
-			reset-names = "ufsphy";
-			resets = <&ufshc 0>;
-
-			ufsphy_lanes: lanes@1da7400 {
-				reg = <0x01da7400 0x128>,
-				      <0x01da7600 0x1fc>,
-				      <0x01da7c00 0x1dc>,
-				      <0x01da7800 0x128>,
-				      <0x01da7a00 0x1fc>;
-				#phy-cells = <0>;
-			};
-		};
 	};
 };
 
-- 
2.17.1
