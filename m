From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 2/4] ARM: dts: rockchip: fix i2c address L3G4200D on PopMetal-RK3288 board
Date: Sun,  4 Sep 2016 16:34:27 +0800
Message-ID: <1472978067-868-1-git-send-email-andy.yan@rock-chips.com>
References: <1472977937-758-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472977937-758-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The i2c address of the three-axis digital gyroscope L3G4200D should be
0x69 according to hardware design.
Also add power supply reference for L3G3200D and the 3-axis Electronic
Compass AK8963.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm/boot/dts/rk3288-popmetal.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-popmetal.dts b/arch/arm/boot/dts/rk3288-popmetal.dts
index 802216f..706c67c 100644
--- a/arch/arm/boot/dts/rk3288-popmetal.dts
+++ b/arch/arm/boot/dts/rk3288-popmetal.dts
@@ -391,12 +391,16 @@
 		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&comp_int>;
+		vdd-supply = <&vcc_io>;
+		vid-supply = <&vcc_io>;
 	};
 
-	l3g4200d: l3g4200d@68 {
+	l3g4200d: l3g4200d@69 {
 		compatible = "st,l3g4200d-gyro";
 		st,drdy-int-pin = <2>;
-		reg = <0x6b>;
+		reg = <0x69>;
+		vdd-supply = <&vcc_io>;
+		vddio-supply = <&vcc_io>;
 	};
 
 	mma8452: mma8452@1d {
-- 
2.7.4



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
