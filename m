From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH v3] arm: dts: sun7i-a20-bananapi: name the GPIO lines
Date: Sat,  6 May 2017 07:30:38 +0200
Message-ID: <1494048638-24365-1-git-send-email-linux@rempel-privat.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This names the GPIO lines on the Banana Pi board in accordance with
the A20_Banana_Pi v1.4 Specification.

This will make these line names reflect through to user space
so that they can easily be identified and used with the new
character device ABI.

Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-bananapi.dts | 51 ++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index 91f2e5f..6b326b3 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -178,6 +178,57 @@
 };
 
 &pio {
+	gpio-line-names =
+		/* PA */
+		"ERXD3", "ERXD2", "ERXD1", "ERXD0", "ETXD3",
+			"ETXD2", "ETXD1", "ETXD0",
+		"ERXCK", "ERXERR", "ERXDV", "EMDC", "EMDIO",
+			"ETXEN", "ETXCK", "ECRS",
+		"ECOL", "ETXERR", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PB */
+		"PMU-SCK", "PMU-SDA", "", "", "", "", "", "",
+		"", "USB0-DRV", "", "", "", "", "", "",
+		"", "", "", "", "SCL", "SDA", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PC */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PD */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PE */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PF */
+		"SD0-D1", "SD0-D0", "SD0-CLK", "SD0-CMD", "SD0-D3",
+			"SD0-D2", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PG */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PH */
+		"TXD0", "RXD0", "IO-1", "PH3", "USB0-IDDET", "PH5", "", "",
+		"", "", "SD0-DET", "", "", "", "", "",
+		"", "", "", "", "IO-4", "IO-5", "", "EMAC-PWR-EN",
+		"LED1", "", "", "", "", "", "", "",
+		/* PI */
+		"", "", "", "IO-GCLK", "", "", "", "",
+		"", "", "SPI-CE0", "SPI-CLK", "SPI-MOSI",
+			"SPI-MISO", "SPI-CE1", "",
+		"IO-6", "IO-3", "IO-2", "IO-0", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		pins = "PH4";
 		function = "gpio_in";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
