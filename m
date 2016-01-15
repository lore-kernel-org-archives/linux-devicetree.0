From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 5/8] dt-bindings: atmel_nand: Reword the documenation
Date: Fri, 15 Jan 2016 11:34:59 +0100
Message-ID: <1452854102-6125-6-git-send-email-romain.izard.pro@gmail.com>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452854102-6125-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Do not mention which chips supporting the PMECC controller, as it a
duplicate of the information in the chips' device trees.

Use common terms when describing the sub-node for the NAND Flash
controller.

Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2: new

 .../devicetree/bindings/mtd/atmel-nand.txt         | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 89b0db9801b0..e68ab404d912 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -21,8 +21,8 @@ Optional properties:
 - nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
   Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
   "soft_bch".
-- atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware.
-  Only supported by at91sam9x5 or later sam9 product.
+- atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
+  capable of BCH encoding and decoding, on devices where it is present.
 - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
   Controller. Supported values are: 2, 4, 8, 12, 24.
 - atmel,pmecc-sector-size : sector size for ECC computation. Supported values
@@ -32,15 +32,16 @@ Optional properties:
   sector size 1024. If not specified, driver will build the table in runtime.
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
-- Nand Flash Controller(NFC) is a slave driver under Atmel nand flash
-  - Required properties:
-    - compatible : "atmel,sama5d3-nfc" or "atmel,sama5d4-nfc".
-    - reg : should specify the address and size used for NFC command registers,
-            NFC registers and NFC Sram. NFC Sram address and size can be absent
-            if don't want to use it.
-    - clocks: phandle to the peripheral clock
-  - Optional properties:
-    - atmel,write-by-sram: boolean to enable NFC write by sram.
+
+Nand Flash Controller(NFC) is an optional sub-node
+Required properties:
+- compatible : "atmel,sama5d3-nfc" or "atmel,sama5d4-nfc".
+- reg : should specify the address and size used for NFC command registers,
+        NFC registers and NFC SRAM. NFC SRAM address and size can be absent
+        if don't want to use it.
+- clocks: phandle to the peripheral clock
+Optional properties:
+- atmel,write-by-sram: boolean to enable NFC write by SRAM.
 
 Examples:
 nand0: nand@40000000,0 {
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
