From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: rockchip: Define GPIO banks 7 and 8
Date: Sat, 12 Sep 2015 00:36:44 +0200
Message-ID: <1442011005-4828-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rockchip RK3288 has 9 GPIO banks (0 to 8) add definitions for the last
two.

Signed-off-by: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---

 include/dt-bindings/pinctrl/rockchip.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/pinctrl/rockchip.h b/include/dt-bindings/pinctrl/rockchip.h
index 743e66a..efc57cf 100644
--- a/include/dt-bindings/pinctrl/rockchip.h
+++ b/include/dt-bindings/pinctrl/rockchip.h
@@ -24,6 +24,8 @@
 #define RK_GPIO3	3
 #define RK_GPIO4	4
 #define RK_GPIO6	6
+#define RK_GPIO7	7
+#define RK_GPIO8	8
 
 #define RK_FUNC_GPIO	0
 #define RK_FUNC_1	1
-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
