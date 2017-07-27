From: Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] arm64: dts: rockchip: add rk3368 spdif node
Date: Thu, 27 Jul 2017 15:46:38 +0800
Message-ID: <1501141598-53079-1-git-send-email-sugar.zhang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add the spdif dt node for rk3368 soc.

Signed-off-by: Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 6d5dc05..59c4158 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -700,6 +700,19 @@
 		interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	spdif: spdif@ff880000 {
+		compatible = "rockchip,rk3368-spdif";
+		reg = <0x0 0xff880000 0x0 0x1000>;
+		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SPDIF_8CH>, <&cru HCLK_SPDIF>;
+		clock-names = "mclk", "hclk";
+		dmas = <&dmac_bus 3>;
+		dma-names = "tx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&spdif_tx>;
+		status = "disabled";
+	};
+
 	i2s_2ch: i2s-2ch@ff890000 {
 		compatible = "rockchip,rk3368-i2s", "rockchip,rk3066-i2s";
 		reg = <0x0 0xff890000 0x0 0x1000>;
@@ -1024,6 +1037,12 @@
 			};
 		};
 
+		spdif {
+			spdif_tx: spdif-tx {
+				rockchip,pins =	<2 23 RK_FUNC_1 &pcfg_pull_none>;
+			};
+		};
+
 		spi0 {
 			spi0_clk: spi0-clk {
 				rockchip,pins = <1 29 RK_FUNC_2 &pcfg_pull_up>;
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
