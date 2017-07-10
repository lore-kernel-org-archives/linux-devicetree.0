From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: rockchip: remove arm,mali-midgard compatible from rk3288
Date: Mon, 10 Jul 2017 14:12:27 +0200
Message-ID: <20170710121227.14264-2-heiko@sntech.de>
References: <20170710121227.14264-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170710121227.14264-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The binding specifies the actual implementations only (mali-t760
for example) but not the arm,mali-midgard used in some vendor kernels.
So drop that compatible property from the rk3288 where it had slipped in.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3288.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index cb1d415d1201..e99d7ff4c939 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1135,7 +1135,7 @@
 	};
 
 	gpu: mali@ffa30000 {
-		compatible = "rockchip,rk3288-mali", "arm,mali-t760", "arm,mali-midgard";
+		compatible = "rockchip,rk3288-mali", "arm,mali-t760";
 		reg = <0xffa30000 0x10000>;
 		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
