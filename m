From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] doc: dt: mtd: stop referring to driver code for spi-nor IDs
Date: Mon, 16 Nov 2015 14:34:52 -0800
Message-ID: <1447713292-91525-4-git-send-email-computersforpeace@gmail.com>
References: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447713292-91525-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Pull the supported chip names from drivers/mtd/devices/m25p80.c and stop
pointing readers to Linux code.

Also (although I see this habit repeated throughout the
Documentation/devicetree/bindings/ tree), stop using the title "driver"
in this file, when we're trying explicitly to describe hardware, not
software.

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.txt      | 56 ++++++++++++++++++++--
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 2bee68103b01..2c91c03e7eb0 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -1,15 +1,61 @@
-* MTD SPI driver for ST M25Pxx (and similar) serial flash chips
+* SPI NOR flash: ST M25Pxx (and similar) serial flash chips
 
 Required properties:
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
 - compatible : May include a device-specific string consisting of the
-               manufacturer and name of the chip. Bear in mind the DT binding
-               is not Linux-only, but in case of Linux, see the "m25p_ids"
-               table in drivers/mtd/devices/m25p80.c for the list of supported
-               chips.
+               manufacturer and name of the chip. A list of supported chip
+               names follows.
                Must also include "jedec,spi-nor" for any SPI NOR flash that can
                be identified by the JEDEC READ ID opcode (0x9F).
+
+               Supported chip names:
+                 at25df321a
+                 at25df641
+                 at26df081a
+                 mr25h256
+                 mx25l4005a
+                 mx25l1606e
+                 mx25l6405d
+                 mx25l12805d
+                 mx25l25635e
+                 n25q064
+                 n25q128a11
+                 n25q128a13
+                 n25q512a
+                 s25fl256s1
+                 s25fl512s
+                 s25sl12801
+                 s25fl008k
+                 s25fl064k
+                 sst25vf040b
+                 m25p40
+                 m25p80
+                 m25p16
+                 m25p32
+                 m25p64
+                 m25p128
+                 w25x80
+                 w25x32
+                 w25q32
+                 w25q32dw
+                 w25q80bl
+                 w25q128
+                 w25q256
+
+               The following chip names have been used historically to
+               designate quirky versions of flash chips that do not support the
+               JEDEC READ ID opcode (0x9F):
+                 m25p05-nonjedec
+                 m25p10-nonjedec
+                 m25p20-nonjedec
+                 m25p40-nonjedec
+                 m25p80-nonjedec
+                 m25p16-nonjedec
+                 m25p32-nonjedec
+                 m25p64-nonjedec
+                 m25p128-nonjedec
+
 - reg : Chip-Select number
 - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
 
-- 
2.6.0.rc2.230.g3dd15c0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
