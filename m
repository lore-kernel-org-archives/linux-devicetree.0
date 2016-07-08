From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 03/15] ARM: dts: sun5i: Rename sun5i-q8-common.dtsi sun5i-reference-design-tablet.dtsi
Date: Fri,  8 Jul 2016 18:05:44 +0200
Message-ID: <1467993956-19535-4-git-send-email-hdegoede@redhat.com>
References: <1467993956-19535-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467993956-19535-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rename sun5i-q8-common.dtsi to sun5i-reference-design-tablet.dtsi. This
is part of renaming all the sun?i-q8-common.dtsi files to
sun?i-reference-design-tablet.dtsi since most of the hw-config in there
is shared by all sunxi tablets.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a13-q8-tablet.dts                               | 2 +-
 .../dts/{sun5i-q8-common.dtsi => sun5i-reference-design-tablet.dtsi}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm/boot/dts/{sun5i-q8-common.dtsi => sun5i-reference-design-tablet.dtsi} (100%)

diff --git a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
index afe14f7..a89f29fa 100644
--- a/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
+++ b/arch/arm/boot/dts/sun5i-a13-q8-tablet.dts
@@ -42,7 +42,7 @@
 
 /dts-v1/;
 #include "sun5i-a13.dtsi"
-#include "sun5i-q8-common.dtsi"
+#include "sun5i-reference-design-tablet.dtsi"
 
 / {
 	model = "Q8 A13 Tablet";
diff --git a/arch/arm/boot/dts/sun5i-q8-common.dtsi b/arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
similarity index 100%
rename from arch/arm/boot/dts/sun5i-q8-common.dtsi
rename to arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
