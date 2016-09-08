From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] arm64: rockchip: fix i2c resource describe error of rk3368
Date: Thu,  8 Sep 2016 19:03:43 +0800
Message-ID: <1473332623-31951-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

According to the TRM and downstream code from rockchip, the register
address of i2c1 on rk3368 is 0xff660000 and i2c2 is 0xff140000.

This patch fix the i2c1 & i2c2 register address definition error, also
fix the clk and pinctrl reference error.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 0fcb214..2f8e19f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -315,16 +315,16 @@
 		status = "disabled";
 	};
 
-	i2c1: i2c@ff140000 {
+	i2c2: i2c@ff140000 {
 		compatible = "rockchip,rk3368-i2c", "rockchip,rk3288-i2c";
 		reg = <0x0 0xff140000 0x0 0x1000>;
 		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		clock-names = "i2c";
-		clocks = <&cru PCLK_I2C1>;
+		clocks = <&cru PCLK_I2C2>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&i2c1_xfer>;
+		pinctrl-0 = <&i2c2_xfer>;
 		status = "disabled";
 	};
 
@@ -554,16 +554,16 @@
 		status = "disabled";
 	};
 
-	i2c2: i2c@ff660000 {
+	i2c1: i2c@ff660000 {
 		compatible = "rockchip,rk3368-i2c", "rockchip,rk3288-i2c";
 		reg = <0x0 0xff660000 0x0 0x1000>;
 		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		clock-names = "i2c";
-		clocks = <&cru PCLK_I2C2>;
+		clocks = <&cru PCLK_I2C1>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&i2c2_xfer>;
+		pinctrl-0 = <&i2c1_xfer>;
 		status = "disabled";
 	};
 
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
