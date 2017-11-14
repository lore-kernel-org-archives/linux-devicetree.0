From: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: add document for rk3126-vop
Date: Tue, 14 Nov 2017 19:27:34 +0800
Message-ID: <1510658855-90223-1-git-send-email-hjc@rock-chips.com>
References: <1510658851-90160-1-git-send-email-hjc@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510658851-90160-1-git-send-email-hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
index 5d835d9..eeda359 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
@@ -7,6 +7,7 @@ buffer to an external LCD interface.
 Required properties:
 - compatible: value should be one of the following
 		"rockchip,rk3036-vop";
+		"rockchip,rk3126-vop";
 		"rockchip,rk3288-vop";
 		"rockchip,rk3368-vop";
 		"rockchip,rk3366-vop";
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
