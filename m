From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 1/8] dt-bindings: gpu: mali-utgard: Add Rockchip Utgard Malis
Date: Fri, 15 Sep 2017 11:18:05 +0200
Message-ID: <20170915091812.13368-2-heiko@sntech.de>
References: <20170915091812.13368-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915091812.13368-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some (older or lower power) Rockchip socs use Utgard-based Mali-GPUs.
So add the necessary compatibles for them. As the setup is the same for
all of them (needing only the additional reset line), they get added in
a somewhat condensed form, to not inflate the document unnecessary.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
index b4ebd56d03f3..24aacafb2594 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt
@@ -13,6 +13,10 @@ Required properties:
       + allwinner,sun50i-h5-mali
       + amlogic,meson-gxbb-mali
       + amlogic,meson-gxl-mali
+      + rockchip,rk3036-mali
+      + rockchip,rk3066-mali
+      + rockchip,rk3188-mali
+      + rockchip,rk3228-mali
       + stericsson,db8500-mali
 
   - reg: Physical base address and length of the GPU registers
@@ -63,6 +67,10 @@ to specify one more vendor-specific compatible, among:
     Required properties:
       * resets: phandle to the reset line for the GPU
 
+  - Rockchip variants:
+    Required properties:
+      * resets: phandle to the reset line for the GPU
+
   - stericsson,db8500-mali
     Required properties:
       * interrupt-names and interrupts:
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
