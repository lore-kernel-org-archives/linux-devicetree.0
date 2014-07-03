From: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] devicetree/bindings: Add binding for micron n25q512a memory
Date: Thu, 3 Jul 2014 15:42:56 +0530
Message-ID: <1404382376-3115-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

-Micron n25q512a memory is supported by m25p80 driver.
 Add compatible field required to support n25q512a in m25p80.txt
-Add micron to the vendor-prefixes.txt file

Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/m25p80.txt   |    1 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
index 4611aa8..ce02e81 100644
--- a/Documentation/devicetree/bindings/mtd/m25p80.txt
+++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
@@ -7,6 +7,7 @@ Required properties:
                the DT binding is not Linux-only, but in case of Linux, see the
                "spi_nor_ids" table in drivers/mtd/spi-nor/spi-nor.c for the list
                of supported chips.
+               example: "micron,n25q512a"
 - reg : Chip-Select number
 - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
 
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4d7f375..a44cfee 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -79,6 +79,7 @@ marvell	Marvell Technology Group Ltd.
 maxim	Maxim Integrated Products
 micrel	Micrel Inc.
 microchip	Microchip Technology Inc.
+micron	Micron Technology Inc.
 mosaixtech	Mosaix Technologies, Inc.
 moxa	Moxa
 mpl	MPL AG
-- 
1.7.4.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
