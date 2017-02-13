From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 4/7] dt-bindings: rockchip,pinctrl: rename RK1108 to RV1108
Date: Mon, 13 Feb 2017 19:06:23 +0800
Message-ID: <1486983983-32506-1-git-send-email-andy.yan@rock-chips.com>
References: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486983566-32265-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rockchip finally named the SOC as RV1108, so change it.
Also move the compatible list to one compatible per line.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 .../devicetree/bindings/pinctrl/rockchip,pinctrl.txt     | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index 4722bc6..a4f3ef2 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -19,11 +19,17 @@ The pins are grouped into up to 5 individual pin banks which need to be
 defined as gpio sub-nodes of the pinmux controller.
 
 Required properties for iomux controller:
-  - compatible: one of "rockchip,rk1108-pinctrl", "rockchip,rk2928-pinctrl"
-		       "rockchip,rk3066a-pinctrl", "rockchip,rk3066b-pinctrl"
-		       "rockchip,rk3188-pinctrl", "rockchip,rk3228-pinctrl"
-		       "rockchip,rk3288-pinctrl", "rockchip,rk3368-pinctrl"
-		       "rockchip,rk3399-pinctrl"
+  - compatible: should be
+		"rockchip,rv1108-pinctrl":  for Rockchip RV1108
+		"rockchip,rk2928-pinctrl":  for Rockchip RK2928
+		"rockchip,rk3066a-pinctrl": for Rockchip RK3066a
+		"rockchip,rk3066b-pinctrl": for Rockchip RK3066b
+		"rockchip,rk3188-pinctrl":  for Rockchip RK3188
+		"rockchip,rk3228-pinctrl":  for Rockchip RK3228
+		"rockchip,rk3288-pinctrl":  for Rockchip RK3288
+		"rockchip,rk3368-pinctrl":  for Rockchip RK3368
+		"rockchip,rk3399-pinctrl":  for Rockchip RK3399
+
   - rockchip,grf: phandle referencing a syscon providing the
 	 "general register files"
 
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
