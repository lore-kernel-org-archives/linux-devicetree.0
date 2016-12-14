Return-Path: <SRS0=Fmo7=X5=bidouilliste.com=manu@kernel.org>
From: Emmanuel Vadot <manu@bidouilliste.com>
Subject: [PATCH] ARM: dts: sunxi: Change node name for pwrseq pin on Olinuxino-lime2-emmc
Date: Wed, 14 Dec 2016 11:08:56 +0100
Message-Id: <20161214100856.23735-1-manu@bidouilliste.com>
To: robh+dt@kernel.org, mark.rutland@arm.com.linux, @armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Emmanuel Vadot <manu@bidouilliste.com>
List-ID: <devicetree@vger.kernel.org>

The node name for the power seq pin is mmc2@0 like the mmc2_pins_a one.
This makes the original node (mmc2_pins_a) scrapped out of the dtb and
result in a unusable eMMC if U-Boot didn't configured the pins to the
correct functions.

Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>
---
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
index 5ea4915..68cb1b5 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts
@@ -56,7 +56,7 @@
 };
 
 &pio {
-	mmc2_pins_nrst: mmc2@0 {
+	mmc2_pins_nrst: mmc2@1 {
 		allwinner,pins = "PC16";
 		allwinner,function = "gpio_out";
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-- 
2.9.2
