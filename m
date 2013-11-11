From: "Khoronzhuk, Ivan" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 05/12] mtd: nand: davinci: extend description of bindings
Date: Mon, 11 Nov 2013 16:58:54 +0000
Message-ID: <4F5844B3A985794BA902E12C070812375F8D14@DNCE04.ent.ti.com>
References: <1384187188-5776-1-git-send-email-ivan.khoronzhuk@ti.com>,<1384187188-5776-6-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384187188-5776-6-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Shilimkar, Santosh" <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "Strashko, Grygorii" <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Extend bindings for davinci_nand driver to be more clear.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/mtd/davinci-nand.txt       |   77 ++++++++++++=
++------
 1 file changed, 54 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/davinci-nand.txt b/D=
ocumentation/devicetree/bindings/mtd/davinci-nand.txt
index 3545ea7..d2a3fc0 100644
--- a/Documentation/devicetree/bindings/mtd/davinci-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
@@ -1,36 +1,67 @@
-* Texas Instruments Davinci NAND
+Device tree bindings for Texas instruments Davinci NAND controller

-This file provides information, what the device node for the
-davinci nand interface contain.
+This file provides information, what the device node for the davinci N=
AND
+interface contains.
+
+Documentation:
+Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf

 Required properties:
-- compatible: "ti,davinci-nand";
-- reg : contain 2 offset/length values:
-        - offset and length for the access window
-        - offset and length for accessing the aemif control registers
-- ti,davinci-chipselect: Indicates on the davinci_nand driver which
-                         chipselect is used for accessing the nand.
+
+- compatible:                  "ti,davinci-nand"
+
+- reg:                         Contains 2 offset/length values:
+                               - offset and length for the access wind=
ow.
+                               - offset and length for accessing the A=
EMIF
+                               control registers.
+
+- ti,davinci-chipselect:       number of chipselect. Indicates on the
+                               davinci_nand driver which chipselect is=
 used
+                               for accessing the nand.
+                               Can be in the range [0-3].

 Recommended properties :
-- ti,davinci-mask-ale: mask for ale
-- ti,davinci-mask-cle: mask for cle
-- ti,davinci-mask-chipsel: mask for chipselect
-- ti,davinci-ecc-mode: ECC mode valid values for davinci driver:
-               - "none"
-               - "soft"
-               - "hw"
-- ti,davinci-ecc-bits: used ECC bits, currently supported 1 or 4.
-- ti,davinci-nand-buswidth: buswidth 8 or 16
-- ti,davinci-nand-use-bbt: use flash based bad block table support.
-
-nand device bindings may contain additional sub-nodes describing
-partitions of the address space. See partition.txt for more detail.
+
+- ti,davinci-mask-ale:         mask for ALE. Needed for executing addr=
ess
+                               phase. These offset will be added to th=
e base
+                               address for the chip select space the N=
AND Flash
+                               device is connected to.
+                               If not set equal to 0x08.
+
+- ti,davinci-mask-cle:         mask for CLE. Needed for executing comm=
and
+                               phase. These offset will be added to th=
e base
+                               address for the chip select space the N=
AND Flash
+                               device is connected to.
+                               If not set equal to 0x10.
+
+- ti,davinci-mask-chipsel:     mask for chipselect address. Needed to =
mask
+                               addresses for given chipselect.
+
+- ti,davinci-ecc-mode:         operation mode of the NAND ecc mode. EC=
C mode
+                               valid values for davinci driver:
+                               - "none"
+                               - "soft"
+                               - "hw"
+
+- ti,davinci-ecc-bits:         used ECC bits, currently supported 1 or=
 4.
+
+- ti,davinci-nand-buswidth:    buswidth 8 or 16.
+
+- ti,davinci-nand-use-bbt:     use flash based bad block table support=
=2E OOB
+                               identifier is saved in OOB area.
+
+Nand device bindings may contain additional sub-nodes describing parti=
tions of
+the address space. See partition.txt for more detail. The NAND Flash t=
iming
+values must be programmed in the chip select=92s node of AEMIF
+memory-controller (see Documentation/devicetree/bindings/memory-contro=
llers/
+davinci-aemif.txt).

 Example(da850 EVM ):
+
 nand_cs3@62000000 {
        compatible =3D "ti,davinci-nand";
        reg =3D <0x62000000 0x807ff
-               0x68000000 0x8000>;
+              0x68000000 0x8000>;
        ti,davinci-chipselect =3D <1>;
        ti,davinci-mask-ale =3D <0>;
        ti,davinci-mask-cle =3D <0>;
--
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
