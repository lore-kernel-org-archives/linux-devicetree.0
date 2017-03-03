From: Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] arm64: dts: rockchip: add dmac nodes for rk3368 SoCs
Date: Fri,  3 Mar 2017 17:49:09 +0800
Message-ID: <1488534549-26175-1-git-send-email-huibin.hong@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Addd dmac bus and dmac peri dts nodes for peripherals,
such as I2S, SPI, UART and so on.

Signed-off-by: Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index a635adc..c9be1b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -204,6 +204,37 @@
 				     <&cpu_b2>, <&cpu_b3>;
 	};
 
+	amba {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		dmac_peri: dma-controller@ff250000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x0 0xff250000 0x0 0x4000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&cru ACLK_DMAC_PERI>;
+			clock-names = "apb_pclk";
+			arm,pl330-broken-no-flushp;
+			peripherals-req-type-burst;
+		};
+
+		dmac_bus: dma-controller@ff600000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x0 0xff600000 0x0 0x4000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&cru ACLK_DMAC_BUS>;
+			clock-names = "apb_pclk";
+			arm,pl330-broken-no-flushp;
+			peripherals-req-type-burst;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
