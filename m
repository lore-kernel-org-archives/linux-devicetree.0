From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 06/13] ARM: dts: rv1108: Add GMAC support
Date: Sun, 25 Nov 2018 19:19:00 -0200
Message-ID: <20181125211907.9895-6-otavio@ossystems.com.br>
References: <20181125211907.9895-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125211907.9895-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add GMAC support for RV1108.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 arch/arm/boot/dts/rv1108.dtsi | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 4f4275599f7a..c7a26f82655b 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -516,6 +516,27 @@
 		status = "disabled";
 	};
 
+	gmac: eth@30200000 {
+		compatible = "rockchip,rv1108-gmac";
+		reg = <0x30200000 0x10000>;
+		rockchip,grf = <&grf>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "macirq", "eth_wake_irq";
+		clocks = <&cru SCLK_MAC>,
+			<&cru SCLK_MAC_RX>, <&cru SCLK_MAC_RX>,
+			<&cru SCLK_MAC_REF>, <&cru SCLK_MAC_REFOUT>,
+			<&cru ACLK_GMAC>, <&cru PCLK_GMAC>;
+		clock-names = "stmmaceth",
+			"mac_clk_rx", "mac_clk_tx",
+			"clk_mac_ref", "clk_mac_refout",
+			"aclk_mac", "pclk_mac";
+		phy-mode = "rmii";
+		pinctrl-names = "default";
+		pinctrl-0 = <&rmii_pins>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@32010000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
@@ -641,6 +662,21 @@
 			input-enable;
 		};
 
+		gmac {
+			rmii_pins: rmii-pins {
+				rockchip,pins =	<1 RK_PC5 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PC3 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PC4 RK_FUNC_2 &pcfg_pull_none>,
+						<1 RK_PB2 RK_FUNC_3 &pcfg_pull_none_drv_12ma>,
+						<1 RK_PB3 RK_FUNC_3 &pcfg_pull_none_drv_12ma>,
+						<1 RK_PB4 RK_FUNC_3 &pcfg_pull_none_drv_12ma>,
+						<1 RK_PB5 RK_FUNC_3 &pcfg_pull_none>,
+						<1 RK_PB6 RK_FUNC_3 &pcfg_pull_none>,
+						<1 RK_PB7 RK_FUNC_3 &pcfg_pull_none>,
+						<1 RK_PC2 RK_FUNC_3 &pcfg_pull_none>;
+			};
+		};
+
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
 				rockchip,pins = <0 RK_PB1 RK_FUNC_1 &pcfg_pull_none_smt>,
-- 
2.19.1
