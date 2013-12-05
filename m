From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 8/9] mtd: nand: davinci: reuse driver for Keystone arch
Date: Thu, 5 Dec 2013 19:25:56 +0200
Message-ID: <1386264358-9738-9-git-send-email-ivan.khoronzhuk@ti.com>
References: <1386264358-9738-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386264358-9738-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Keystone arch has compatible nand device, so reuse it.
In case with Keystone it depends on TI_AEMIF because AEMIF
driver is responsible to set timings.

See http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf

Reviewed-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Reviewed-by: Taras Kondratiuk <taras-l0cyMroinI0@public.gmane.org>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/mtd/davinci-nand.txt       |    8 +++++---
 drivers/mtd/nand/Kconfig                           |    6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
index befaa5b..cfb18ab 100644
--- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
@@ -1,14 +1,16 @@
-Device tree bindings for Texas instruments Davinci NAND controller
+Device tree bindings for Texas instruments Davinci/Keystone NAND controller
 
-This file provides information, what the device node for the davinci NAND
-interface contains.
+This file provides information, what the device node for the davinci/keystone
+NAND interface contains.
 
 Documentation:
 Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
+Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
 
 Required properties:
 
 - compatible:			"ti,davinci-nand"
+				"ti,keystone-nand"
 
 - reg:				Contains 2 offset/length values:
 				- offset and length for the access window.
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 93ae6a6..35f3ea3 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -464,11 +464,11 @@ config MTD_NAND_SH_FLCTL
 	  for NAND Flash using FLCTL.
 
 config MTD_NAND_DAVINCI
-        tristate "Support NAND on DaVinci SoC"
-        depends on ARCH_DAVINCI
+        tristate "Support NAND on DaVinci/Keystone SoC"
+        depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_AEMIF)
         help
 	  Enable the driver for NAND flash chips on Texas Instruments
-	  DaVinci processors.
+	  DaVinci/Keystone processors.
 
 config MTD_NAND_TXX9NDFMC
 	tristate "NAND Flash support for TXx9 SoC"
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
