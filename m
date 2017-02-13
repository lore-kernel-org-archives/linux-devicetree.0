From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 6/7] ARM: dts: rename RK1108 to RV1108
Date: Mon, 13 Feb 2017 19:09:50 +0800
Message-ID: <1486984190-32628-1-git-send-email-andy.yan@rock-chips.com>
References: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486983566-32265-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2yhQFI55V6+gNQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rockchip finally named the SOC as RV1108, so change it
for compatible.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi} | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)
 rename arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi} (94%)

diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
similarity index 94%
rename from arch/arm/boot/dts/rk1108.dtsi
rename to arch/arm/boot/dts/rv1108.dtsi
index d770023..f363960 100644
--- a/arch/arm/boot/dts/rk1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -41,13 +41,13 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/rk1108-cru.h>
+#include <dt-bindings/clock/rv1108-cru.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 / {
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
@@ -222,7 +222,7 @@
 	};
 
 	pinctrl: pinctrl {
-		compatible = "rockchip,rk1108-pinctrl";
+		compatible = "rockchip,rv1108-pinctrl";
 		rockchip,grf = <&grf>;
 		rockchip,pmu = <&pmugrf>;
 		#address-cells = <1>;
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
