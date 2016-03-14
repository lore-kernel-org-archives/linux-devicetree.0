From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: sun8i: Fix wrong Quad core / a33 compat for sun8i-a23-gt90h-v4
Date: Mon, 14 Mar 2016 17:32:23 +0100
Message-ID: <1457973145-26203-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the dts file name already implies sun8i-a23-gt90h-v4.dts is for
an a23 equipped tablet. I don't know how the "Quad Core" or a33
comaptible got in there, likely a copy and paste error.

Regardless this commit fixes this, note this is almost
purely a cosmetical fix, for all things that matter at the
machine compatible level the a23 and a33 are compatible.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts b/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
index d22fa82..db3c859 100644
--- a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
+++ b/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
@@ -50,8 +50,8 @@
 #include <dt-bindings/pwm/pwm.h>
 
 / {
-	model = "Allwinner GT90H Quad Core Tablet (v4)";
-	compatible = "allwinner,gt90h-v4", "allwinner,sun8i-a33";
+	model = "Allwinner GT90H Dual Core Tablet (v4)";
+	compatible = "allwinner,gt90h-v4", "allwinner,sun8i-a23";
 
 	aliases {
 		serial0 = &r_uart;
-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
