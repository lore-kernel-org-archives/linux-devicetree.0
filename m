From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: sun6i: Add mmc2_pins_a pinmux setting to sun6i-a31.dtsi
Date: Thu, 15 Oct 2015 16:28:46 +0200
Message-ID: <1444919327-23747-2-git-send-email-hdegoede@redhat.com>
References: <1444919327-23747-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444919327-23747-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thomas Kaiser <Thomas.Kaiser-id7G5ibTm3AZ78jC37dNPg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a pinmux setting for using mmc2 in regular 4 bit mode.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index a97274a8..83c1879 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -691,7 +691,15 @@
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
-			mmc2_8bit_emmc_pins: mmc2@0 {
+			mmc2_pins_a: mmc2@0 {
+				allwinner,pins = "PC6", "PC7", "PC8", "PC9",
+						 "PC10", "PC11";
+				allwinner,function = "mmc2";
+				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+			};
+
+			mmc2_8bit_emmc_pins: mmc2@1 {
 				allwinner,pins = "PC6", "PC7", "PC8", "PC9",
 						 "PC10", "PC11", "PC12",
 						 "PC13", "PC14", "PC15",
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
