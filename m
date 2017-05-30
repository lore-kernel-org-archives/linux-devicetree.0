From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/5] dt-bindings: mtd: atmel-nand: Document the nfc-io bindings
Date: Tue, 30 May 2017 10:32:46 +0200
Message-ID: <1496133171-4787-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1496133171-4787-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496133171-4787-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

SAMA5 SoCs embed an advanced NAND controller logic to automate READ/WRITE
page accesses. This advanced logic is exposed through a separate I/O mem
range and is thus represented in a different node with its own compatible.

Document the bindings of this nfc-io block.

Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/atmel-nand.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index f6bee57e453a..9bb66e476672 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -59,8 +59,22 @@ Required properties:
 - reg: should contain 2 register ranges. The first one is pointing to the PMECC
        block, and the second one to the PMECC_ERRLOC block.
 
+* SAMA5 NFC I/O bindings:
+
+SAMA5 SoCs embed an advanced NAND controller logic to automate READ/WRITE page
+operations. This interface to this logic is placed in a separate I/O range and
+should thus have its own DT node.
+
+- compatible: should be "atmel,sama5d3-nfc-io", "syscon".
+- reg: should contain the I/O range used to interact with the NFC logic.
+
 Example:
 
+	nfc_io: nfc-io@70000000 {
+		compatible = "atmel,sama5d3-nfc-io", "syscon";
+		reg = <0x70000000 0x8000000>;
+	};
+
 	pmecc: ecc-engine@ffffc070 {
 		compatible = "atmel,at91sam9g45-pmecc";
                 reg = <0xffffc070 0x490>,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
