From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: gpu: drop wrong compatible from midgard binding example
Date: Mon, 10 Jul 2017 14:12:26 +0200
Message-ID: <20170710121227.14264-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The binding rightfully only specifies compatibles for actual implementations
and not for the whole family. In the example an arm,mali-midgard slipped
through from downstream devicetrees though. So drop that to not confuse
people reading (or copying) that example.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index d3b6e1a4713a..5aa5926029ee 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -40,7 +40,7 @@ Optional properties:
 Example for a Mali-T760:
 
 gpu@ffa30000 {
-	compatible = "rockchip,rk3288-mali", "arm,mali-t760", "arm,mali-midgard";
+	compatible = "rockchip,rk3288-mali", "arm,mali-t760";
 	reg = <0xffa30000 0x10000>;
 	interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
 		     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
