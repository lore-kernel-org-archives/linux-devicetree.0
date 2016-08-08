From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 8/8] ARM: dts: sun8i: Add touchscreen node for sun8i-a33-ga10h
Date: Mon,  8 Aug 2016 21:43:18 +0200
Message-ID: <1470685398-14568-8-git-send-email-hdegoede@redhat.com>
References: <1470685398-14568-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470685398-14568-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The ga10h tablet has a gsl3675 touchscreen, add a dt node describing it.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts b/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts
index de6269d..2fea1af 100644
--- a/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts
+++ b/arch/arm/boot/dts/sun8i-a33-ga10h-v1.1.dts
@@ -58,6 +58,15 @@
 	status = "okay";
 };
 
+&gsl1680 {
+	compatible = "silead,gsl3675";
+	touchscreen-fw-name = "silead/gsl3675-ga10h.fw";
+	touchscreen-size-x = <1630>;
+	touchscreen-size-y = <990>;
+	touchscreen-inverted-y;
+	status = "okay";
+};
+
 &lradc {
 	button@600 {
 		label = "Back";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
