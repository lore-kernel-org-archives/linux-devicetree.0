From: Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2] ARM: dts: rockchip: rk322x: add spi node and spi pinctrl
Date: Thu,  3 Aug 2017 10:36:49 +0800
Message-ID: <1501727810-31761-1-git-send-email-huibin.hong@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sofia-kernel.list-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add spi node and spi pinctrl for rk322x

Signed-off-by: Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v2:
- Remove the changeid, and add commit for this patch

 arch/arm/boot/dts/rk322x.dtsi | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 678daf7..b47f58e 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -54,6 +54,7 @@
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
+		spi0 = &spi0;
 	};
 
 	cpus {
@@ -401,6 +402,19 @@
 		status = "disabled";
 	};
 
+	spi0: spi@11090000 {
+		compatible = "rockchip,rk3228-spi";
+		reg = <0x11090000 0x1000>;
+		interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&spi0_clk &spi0_tx &spi0_rx &spi0_cs0 &spi0_cs1>;
+		clocks = <&cru SCLK_SPI0>, <&cru PCLK_SPI0>;
+		clock-names = "spiclk", "apb_pclk";
+		status = "disabled";
+	};
+
 	wdt: watchdog@110a0000 {
 		compatible = "rockchip,rk322x-wdt", "snps,dw-wdt";
 		reg = <0x110a0000 0x100>;
@@ -1058,6 +1072,42 @@
 			};
 		};
 
+		spi-0 {
+			spi0_clk: spi0-clk {
+				rockchip,pins = <0 9 RK_FUNC_2 &pcfg_pull_up>;
+			};
+			spi0_cs0: spi0-cs0 {
+				rockchip,pins = <0 14 RK_FUNC_2 &pcfg_pull_up>;
+			};
+			spi0_tx: spi0-tx {
+				rockchip,pins = <0 11 RK_FUNC_2 &pcfg_pull_up>;
+			};
+			spi0_rx: spi0-rx {
+				rockchip,pins = <0 13 RK_FUNC_2 &pcfg_pull_up>;
+			};
+			spi0_cs1: spi0-cs1 {
+				rockchip,pins = <1 12 RK_FUNC_1 &pcfg_pull_up>;
+			};
+		};
+
+		spi-1 {
+			spi1_clk: spi1-clk {
+				rockchip,pins = <0 23 RK_FUNC_2 &pcfg_pull_up>;
+			};
+			spi1_cs0: spi1-cs0 {
+				rockchip,pins = <2 2 RK_FUNC_2 &pcfg_pull_up>;
+			};
+			spi1_rx: spi1-rx {
+				rockchip,pins = <2 0 RK_FUNC_2 &pcfg_pull_up>;
+			};
+			spi1_tx: spi1-tx {
+				rockchip,pins = <2 1 RK_FUNC_2 &pcfg_pull_up>;
+			};
+			spi1_cs1: spi1-cs1 {
+				rockchip,pins = <2 3 RK_FUNC_2 &pcfg_pull_up>;
+			};
+		};
+
 		i2s1 {
 			i2s1_bus: i2s1-bus {
 				rockchip,pins = <0 8 RK_FUNC_1 &pcfg_pull_none>,
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
