From: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 1/2] dt-bindings: add Asus Tinker board
Date: Mon,  6 Feb 2017 10:14:46 +0800
Message-ID: <1486347287-31051-2-git-send-email-eddie.cai@rock-chips.com>
References: <1486347287-31051-1-git-send-email-eddie.cai@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486347287-31051-1-git-send-email-eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Tinker board is a credit card size develop board designed by Asus.
Powered by RK3288.

Signed-off-by: Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/rockchip.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
index cc4ace6..226ee91 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.txt
+++ b/Documentation/devicetree/bindings/arm/rockchip.txt
@@ -1,5 +1,8 @@
 Rockchip platforms device tree bindings
 ---------------------------------------
+- Asus Tinker board
+    Required root node properties:
+      - compatible = "asus,rk3288-tinker", "rockchip,rk3288";
 
 - Kylin RK3036 board:
     Required root node properties:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
