From: Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: at91: Add pinctrl information to ethernet node.
Date: Fri, 24 Jun 2016 19:01:08 +0530
Message-ID: <1466775069-606-1-git-send-email-raashidmuhammed@zilogic.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add missing pinctrl information to ethernet node.

Signed-off-by: Raashid Muhammed <raashidmuhammed-1MQmoylvZ5VBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Vijay Kumar B. <vijaykumar-NDm7FNP0skFg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/at91-sam9_l9260.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-sam9_l9260.dts b/arch/arm/boot/dts/at91-sam9_l9260.dts
index 349a461..be409f2 100644
--- a/arch/arm/boot/dts/at91-sam9_l9260.dts
+++ b/arch/arm/boot/dts/at91-sam9_l9260.dts
@@ -49,6 +49,7 @@
 			};
 
 			macb0: ethernet@fffc4000 {
+				pinctrl-0 = <&pinctrl_macb_rmii &pinctrl_macb_rmii_mii_alt>;
 				phy-mode = "mii";
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
