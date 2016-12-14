From: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Subject: [PATCH v2] ARM: dts: sunxi: Change node name for pwrseq pin on Olinuxino-lime2-emmc
Date: Wed, 14 Dec 2016 15:57:24 +0100
Message-ID: <20161214145724.42745-1-manu@bidouilliste.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The node name for the power seq pin is mmc2@0 like the mmc2_pins_a one.
This makes the original node (mmc2_pins_a) scrapped out of the dtb and
result in a unusable eMMC if U-Boot didn't configured the pins to the
correct functions.

Changes since v1:
 * Rename the node mmc2-rst-pin

Signed-off-by: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
index 5ea4915..10d3074 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
@@ -56,7 +56,7 @@
 };
 
 &pio {
-	mmc2_pins_nrst: mmc2@0 {
+	mmc2_pins_nrst: mmc2-rst-pin {
 		allwinner,pins = "PC16";
 		allwinner,function = "gpio_out";
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
