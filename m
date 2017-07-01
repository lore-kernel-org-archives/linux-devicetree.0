From: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] arm64: dts: rockchip: add ARM Mali GPU node for rk3399
Date: Sat,  1 Jul 2017 20:56:08 +0800
Message-ID: <1498913770-16519-1-git-send-email-jacob-chen@iotwrt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Mali GPU device tree node for the rk3399 SoC.
Tested with rockchip-forwardports repo.

Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 1cbd7a2..e795135 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1443,6 +1443,18 @@
 		status = "disabled";
 	};
 
+	gpu: mali@ff9a0000 {
+		compatible = "rockchip,rk3399-mali", "arm,mali-t860", "arm,mali-midgard";
+		reg = <0x0 0xff9a0000 0x0 0x10000>;
+		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "gpu", "job", "mmu";
+		clocks = <&cru ACLK_GPU>;
+		power-domains = <&power RK3399_PD_GPU>;
+		status = "disabled";
+	};
+
 	pinctrl: pinctrl {
 		compatible = "rockchip,rk3399-pinctrl";
 		rockchip,grf = <&grf>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
