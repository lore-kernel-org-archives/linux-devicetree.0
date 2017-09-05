From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 6/7] ARM: dts: rockchip: add gpu nodes on rk3066/rk3188
Date: Tue,  5 Sep 2017 12:57:38 +0200
Message-ID: <20170905105739.8330-7-heiko@sntech.de>
References: <20170905105739.8330-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170905105739.8330-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The old Cortex-A9 socs use Mali400 GPUs with 4 pixel processors.
This adds the core gpu nodes with the per-soc interrupts but sharing
the core node.

Rockchip SoCs use only one clock to supply the GPUs

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3066a.dtsi | 24 ++++++++++++++++++++++++
 arch/arm/boot/dts/rk3188.dtsi  | 24 ++++++++++++++++++++++++
 arch/arm/boot/dts/rk3xxx.dtsi  | 11 +++++++++++
 3 files changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index f50481fd8e5c..b76119dd5733 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -610,6 +610,30 @@
 	};
 };
 
+&gpu {
+	compatible = "rockchip,rk3066-mali", "arm,mali-400";
+	interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "gp",
+			  "gpmmu",
+			  "pp0",
+			  "pp0mmu",
+			  "pp1",
+			  "pp1mmu",
+			  "pp2",
+			  "pp2mmu",
+			  "pp3",
+			  "pp3mmu";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_xfer>;
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 1399bc04ea77..9e24d0ffadac 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -553,6 +553,30 @@
 	interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
 };
 
+&gpu {
+	compatible = "rockchip,rk3188-mali", "arm,mali-400";
+	interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "gp",
+			  "gpmmu",
+			  "pp0",
+			  "pp0mmu",
+			  "pp1",
+			  "pp1mmu",
+			  "pp2",
+			  "pp2mmu",
+			  "pp3",
+			  "pp3mmu";
+};
+
 &i2c0 {
 	compatible = "rockchip,rk3188-i2c";
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 0e718508a3bc..7458047f5fd5 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -117,6 +117,17 @@
 		clock-output-names = "xin24m";
 	};
 
+	gpu: gpu@10090000 {
+		compatible = "arm,mali-400";
+		reg = <0x10090000 0x10000>;
+		clocks = <&cru ACLK_GPU>, <&cru ACLK_GPU>;
+		clock-names = "core", "bus";
+		assigned-clocks = <&cru ACLK_GPU>;
+		assigned-clock-rates = <100000000>;
+		resets = <&cru SRST_GPU>;
+		status = "disabled";
+	};
+
 	L2: l2-cache-controller@10138000 {
 		compatible = "arm,pl310-cache";
 		reg = <0x10138000 0x1000>;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
