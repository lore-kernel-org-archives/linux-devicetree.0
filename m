From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: rockchip: add rk3188 dma controllers
Date: Tue, 29 Jul 2014 21:12:08 +0200
Message-ID: <1406661128-7614-5-git-send-email-heiko@sntech.de>
References: <1406661128-7614-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406661128-7614-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add both the cpu and peripheral pl330 dma controllers present in rk3188 socs.
The first dma controller can change between secure and non-secure mode and is
left by the bootloader in secure mode, which gets added here.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3xxx.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index c6f0561..a6c2860 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -28,6 +28,33 @@
 		i2c4 = &i2c4;
 	};
 
+	amba {
+		compatible = "arm,amba-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dmac1: dma@20018000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x20018000 0x4000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&cru ACLK_DMA1>;
+			clock-names = "apb_pclk";
+		};
+
+		dmac2: dma@20078000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x20078000 0x4000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&cru ACLK_DMA2>;
+			clock-names = "apb_pclk";
+		};
+	};
+
 	xin24m: oscillator {
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
