From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 5/6] ARM: dts: rockchip: rename core dtsi from RK1108 to RV1108
Date: Fri, 17 Mar 2017 18:18:39 +0100
Message-ID: <20170317171840.4683-6-heiko@sntech.de>
References: <20170317171840.4683-1-heiko@sntech.de>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170317171840.4683-1-heiko@sntech.de>
Sender: linux-clk-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, andy.yan@rock-chips.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

From: Andy Yan <andy.yan@rock-chips.com>

Rockchip finally named the SOC as RV1108, so change it
for compatible.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

[adapt include in rk1108-evb.dts to not introduce errors]
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/boot/dts/rk1108-evb.dts               |  2 +-
 arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi} | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi} (95%)

diff --git a/arch/arm/boot/dts/rk1108-evb.dts b/arch/arm/boot/dts/rk1108-evb.dts
index 3956cff4ca79..88fe0a8c4faa 100644
--- a/arch/arm/boot/dts/rk1108-evb.dts
+++ b/arch/arm/boot/dts/rk1108-evb.dts
@@ -40,7 +40,7 @@
 
 /dts-v1/;
 
-#include "rk1108.dtsi"
+#include "rv1108.dtsi"
 
 / {
 	model = "Rockchip RK1108 Evaluation board";
diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
similarity index 95%
rename from arch/arm/boot/dts/rk1108.dtsi
rename to arch/arm/boot/dts/rv1108.dtsi
index 1297924db6ad..437098b556eb 100644
--- a/arch/arm/boot/dts/rk1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -47,7 +47,7 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	compatible = "rockchip,rk1108";
+	compatible = "rockchip,rv1108";
 
 	interrupt-parent = <&gic>;
 
@@ -113,7 +113,7 @@
 	};
 
 	uart2: serial@10210000 {
-		compatible = "rockchip,rk1108-uart", "snps,dw-apb-uart";
+		compatible = "rockchip,rv1108-uart", "snps,dw-apb-uart";
 		reg = <0x10210000 0x100>;
 		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 		reg-shift = <2>;
@@ -127,7 +127,7 @@
 	};
 
 	uart1: serial@10220000 {
-		compatible = "rockchip,rk1108-uart", "snps,dw-apb-uart";
+		compatible = "rockchip,rv1108-uart", "snps,dw-apb-uart";
 		reg = <0x10220000 0x100>;
 		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 		reg-shift = <2>;
@@ -141,7 +141,7 @@
 	};
 
 	uart0: serial@10230000 {
-		compatible = "rockchip,rk1108-uart", "snps,dw-apb-uart";
+		compatible = "rockchip,rv1108-uart", "snps,dw-apb-uart";
 		reg = <0x10230000 0x100>;
 		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 		reg-shift = <2>;
@@ -155,17 +155,17 @@
 	};
 
 	grf: syscon@10300000 {
-		compatible = "rockchip,rk1108-grf", "syscon";
+		compatible = "rockchip,rv1108-grf", "syscon";
 		reg = <0x10300000 0x1000>;
 	};
 
 	pmugrf: syscon@20060000 {
-		compatible = "rockchip,rk1108-pmugrf", "syscon";
+		compatible = "rockchip,rv1108-pmugrf", "syscon";
 		reg = <0x20060000 0x1000>;
 	};
 
 	cru: clock-controller@20200000 {
-		compatible = "rockchip,rk1108-cru";
+		compatible = "rockchip,rv1108-cru";
 		reg = <0x20200000 0x1000>;
 		rockchip,grf = <&grf>;
 		#clock-cells = <1>;
@@ -173,7 +173,7 @@
 	};
 
 	emmc: dwmmc@30110000 {
-		compatible = "rockchip,rk1108-dw-mshc", "rockchip,rk3288-dw-mshc";
+		compatible = "rockchip,rv1108-dw-mshc", "rockchip,rk3288-dw-mshc";
 		clock-freq-min-max = <400000 150000000>;
 		clocks = <&cru HCLK_EMMC>, <&cru SCLK_EMMC>,
 			 <&cru SCLK_EMMC_DRV>, <&cru SCLK_EMMC_SAMPLE>;
@@ -185,7 +185,7 @@
 	};
 
 	sdio: dwmmc@30120000 {
-		compatible = "rockchip,rk1108-dw-mshc", "rockchip,rk3288-dw-mshc";
+		compatible = "rockchip,rv1108-dw-mshc", "rockchip,rk3288-dw-mshc";
 		clock-freq-min-max = <400000 150000000>;
 		clocks = <&cru HCLK_SDIO>, <&cru SCLK_SDIO>,
 			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
@@ -197,7 +197,7 @@
 	};
 
 	sdmmc: dwmmc@30130000 {
-		compatible = "rockchip,rk1108-dw-mshc", "rockchip,rk3288-dw-mshc";
+		compatible = "rockchip,rv1108-dw-mshc", "rockchip,rk3288-dw-mshc";
 		clock-freq-min-max = <400000 100000000>;
 		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
 			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
-- 
2.11.0

