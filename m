From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH] arm: dts: sun7i-a20-bananapi: name the GPIO lines
Date: Fri,  5 Aug 2016 10:05:12 +0200
Message-ID: <1470384312-6604-1-git-send-email-linux@rempel-privat.de>
References: <CACRpkdYnK=7C=F5hZUo-nYv6Z+Pb+eT7vm1e4hL8N-QgJnuLfg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYnK=7C=F5hZUo-nYv6Z+Pb+eT7vm1e4hL8N-QgJnuLfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fixed-term.Oleksij.Rempel-V5te9oGctAVWk0Htik3J/w@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This names the GPIO lines on the Banana Pi board in accordance with
the A20_Banana_Pi v1.4 Specification.

This will make these line names reflect through to userspace
so that they can easily be identified and used with the new
character device ABI.

Some care has been taken to name all lines, not just those used
by the external connectors, also lines that are muxed into some
other function than GPIO: these are named "[FOO]" so that users
can see with lsgpio what all lines are used for.

Ps: most of the text was taken from Linux Wallej patch.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-bananapi.dts | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index 67c8a76..81ecb89 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -178,6 +178,64 @@
 };
 
 &pio {
+	/*
+	 * Legend: proper name = the GPIO line is used as GPIO
+	 *         NC = not connected (not routed from the SoC)
+	 *         "[PER]" = pin is muxed for peripheral (not GPIO)
+	 *         "" = no idea, schematic doesn't say, could be
+	 *              unrouted (not connected to any external pin)
+	 */
+	gpio-line-names =
+		/* PA */
+		"[ERXD3]", "[ERXD2]", "[ERXD1]", "[ERXD0]", "[ETXD3]",
+			"[ETXD2]", "[ETXD1]", "[ETXD0]",
+		"[ERXCK]", "[ERXERR]", "[ERXDV]", "[EMDC]", "[EMDIO]",
+			"[ETXEN]", "[ETXCK]", "[ECRS]",
+		"[ECOL]", "[ETXERR]", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PB */
+		"[PMU-SCK]", "[PMU-SDA]", "", "", "", "NC", "NC", "NC",
+		"NC", "USB0-DRV", "NC", "NC", "NC", "NC", "", "",
+		"", "", "", "", "[SCL]", "[SDA]", "", "",
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
+		"[SD0-D1]", "[SD0-D0]", "[SD0-CLK]", "[SD0-CMD]", "[SD0-D3]",
+			"[SD0-D2]", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PG */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		/* PH */
+		"TXD0", "RXD0", "IO-1", "IO-8", "USB0-IDDET", "IO-7", "", "",
+		"", "", "SD0-DET", "", "", "", "", "",
+		"NC", "", "", "", "IO-4", "IO-5", "NC", "EMAC-PWR-EN",
+		"LED1", "NC", "NC", "NC", "", "", "", "",
+		/* PI */
+		"", "", "", "[IO-GCLK]", "NC", "NC", "NC", "NC",
+		"NC", "NC", "[SPI-CE0]", "[SPI-CLK]", "[SPI-MOSI]",
+			"[SPI-MISO]", "[SPI-CE1]", "NC",
+		"IO-6", "IO-3", "IO-2", "IO-0", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+
 	usb0_id_detect_pin: usb0_id_detect_pin@0 {
 		allwinner,pins = "PH4";
 		allwinner,function = "gpio_in";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
