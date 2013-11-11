From: "Khoronzhuk, Ivan" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 09/12] mtd: nand: davinci: reuse driver for Keystone arch
Date: Mon, 11 Nov 2013 17:09:59 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D46@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,<1384187188-5776-10-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384187188-5776-10-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Shilimkar, Santosh" <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Keystone arch has compatible nand device, so reuse it.
In case with Keystone it depends on TI_DAVINCI_AEMIF because AEMIF
driver is responsible to set timings.

See http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/mtd/davinci-nand.txt       |    8 +++++---
 drivers/mtd/nand/Kconfig                           |    6 +++---
 drivers/mtd/nand/davinci_nand.c                    |    1 +
 3 files changed, 9 insertions(+), 6 deletions(-)

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

 - compatible:                  "ti,davinci-nand"
+                               "ti,keystone-nand"

 - reg:                         Contains 2 offset/length values:
                                - offset and length for the access window.
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index d885298..62dbcd5 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -492,11 +492,11 @@ config MTD_NAND_SH_FLCTL
          for NAND Flash using FLCTL.

 config MTD_NAND_DAVINCI
-        tristate "Support NAND on DaVinci SoC"
-        depends on ARCH_DAVINCI
+        tristate "Support NAND on DaVinci/Keystone SoC"
+        depends on ARCH_DAVINCI || (ARCH_KEYSTONE && TI_DAVINCI_AEMIF)
         help
          Enable the driver for NAND flash chips on Texas Instruments
-         DaVinci processors.
+         DaVinci/Keystone processors.

 config MTD_NAND_TXX9NDFMC
        tristate "NAND Flash support for TXx9 SoC"
diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 78b8d66..4705214 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -523,6 +523,7 @@ static struct nand_ecclayout hwecc4_2048 __initconst = {
 #if defined(CONFIG_OF)
 static const struct of_device_id davinci_nand_of_match[] = {
        {.compatible = "ti,davinci-nand", },
+       {.compatible = "ti,keystone-nand", },
        {},
 };
 MODULE_DEVICE_TABLE(of, davinci_nand_of_match);
--
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
