From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 6/6] ARM: dts: rockchip: rename RK1108-evb to RV1108-evb
Date: Fri, 17 Mar 2017 18:18:40 +0100
Message-ID: <20170317171840.4683-7-heiko@sntech.de>
References: <20170317171840.4683-1-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170317171840.4683-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Rockchip finally named the SOC as RV1108, so change it
for compatible.

The rk1108/rv1108 is completely new to the market, so there no real
devices exist in the wild, only the Rockchip internal evaluation
board. Therefore we're not breaking any existing devices when
changing compatible values.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

[added paragraph about no real devices existing]
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/rockchip.txt   | 4 ++--
 arch/arm/boot/dts/Makefile                           | 2 +-
 arch/arm/boot/dts/{rk1108-evb.dts => rv1108-evb.dts} | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename arch/arm/boot/dts/{rk1108-evb.dts => rv1108-evb.dts} (95%)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
index cc4ace6397ab..9901cbd6d11a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.txt
+++ b/Documentation/devicetree/bindings/arm/rockchip.txt
@@ -111,9 +111,9 @@ Rockchip platforms device tree bindings
     Required root node properties:
       - compatible = "rockchip,px5-evb", "rockchip,px5", "rockchip,rk3368";
 
-- Rockchip RK1108 Evaluation board
+- Rockchip RV1108 Evaluation board
     Required root node properties:
-      - compatible = "rockchip,rk1108-evb", "rockchip,rk1108";
+      - compatible = "rockchip,rv1108-evb", "rockchip,rv1108";
 
 - Rockchip RK3368 evb:
     Required root node properties:
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 011808490fed..d0d37d028790 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -674,7 +674,7 @@ dtb-$(CONFIG_ARCH_REALVIEW) += \
 	arm-realview-pba8.dtb \
 	arm-realview-pbx-a9.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += \
-	rk1108-evb.dtb \
+	rv1108-evb.dtb \
 	rk3036-evb.dtb \
 	rk3036-kylin.dtb \
 	rk3066a-bqcurie2.dtb \
diff --git a/arch/arm/boot/dts/rk1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
similarity index 95%
rename from arch/arm/boot/dts/rk1108-evb.dts
rename to arch/arm/boot/dts/rv1108-evb.dts
index 88fe0a8c4faa..58cf4ac079c3 100644
--- a/arch/arm/boot/dts/rk1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -43,8 +43,8 @@
 #include "rv1108.dtsi"
 
 / {
-	model = "Rockchip RK1108 Evaluation board";
-	compatible = "rockchip,rk1108-evb", "rockchip,rk1108";
+	model = "Rockchip RV1108 Evaluation board";
+	compatible = "rockchip,rv1108-evb", "rockchip,rv1108";
 
 	memory@60000000 {
 		device_type = "memory";
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
