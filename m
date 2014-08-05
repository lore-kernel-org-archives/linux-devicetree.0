From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=20v1=202/2=5D=20mtd=3A=20nand=3A=20gpio=3A=20improve=20comments=20about=20GPIO=20assisted=20operation?=
Date: Tue,  5 Aug 2014 10:37:26 +0200
Message-ID: <1407227846-3257-2-git-send-email-gsi@denx.de>
References: <1407227846-3257-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407227846-3257-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The drivers/mtd/nand/gpio.c driver does not GPIO bitbang the complete
NAND protocol, but instead is GPIO _assisted_ -- a memory mapped interf=
ace
communicates commands and data, and only few control signals are connec=
ted
to GPIO pins.

Expand comments in the driver source and in the Kconfig description to
better reflect the very nature of the driver.  The previous text could =
be
mistaken for complete GPIO bitbanging.

Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---
 drivers/mtd/nand/Kconfig |    6 ++++--
 drivers/mtd/nand/gpio.c  |    4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f1cf503517fd..0ef8b35b459f 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -75,10 +75,12 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
           boards, the scratch register is at 0xFF108018.
=20
 config MTD_NAND_GPIO
-	tristate "GPIO NAND Flash driver"
+	tristate "GPIO assisted NAND Flash driver"
 	depends on GPIOLIB
 	help
-	  This enables a GPIO based NAND flash driver.
+	  This enables a NAND flash driver where control signals are
+	  connected to GPIO pins, and commands and data are communicated
+	  via a memory mapped interface.
=20
 config MTD_NAND_AMS_DELTA
 	tristate "NAND Flash device on Amstrad E3"
diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 117ce333fdd4..226eda6f2eee 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -8,7 +8,9 @@
  *
  * =C2=A9 2004 Simtec Electronics
  *
- * Device driver for NAND connected via GPIO
+ * Device driver for NAND flash that uses a memory mapped interface to
+ * read/write the NAND commands and data, and GPIO pins for control si=
gnals
+ * (the DT binding refers to this as "GPIO assisted NAND flash")
  *
  * This program is free software; you can redistribute it and/or modif=
y
  * it under the terms of the GNU General Public License version 2 as
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
