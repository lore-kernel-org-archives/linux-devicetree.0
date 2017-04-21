From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 3/5] mtd: gpmi: document current clock requirements
Date: Thu, 20 Apr 2017 18:07:53 -0700
Message-ID: <20170421010755.18025-4-stefan@agner.ch>
References: <20170421010755.18025-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170421010755.18025-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The clock requirements are completely missing, add the clocks
currently required by the driver.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index d02acaff3c35..b289ef3c1b7e 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -4,7 +4,12 @@ The GPMI nand controller provides an interface to control the
 NAND flash chips.
 
 Required properties:
-  - compatible : should be "fsl,<chip>-gpmi-nand"
+  - compatible : should be "fsl,<chip>-gpmi-nand", chip can be:
+    * imx23
+    * imx28
+    * imx6q
+    * imx6sx
+    * imx7d
   - reg : should contain registers location and length for gpmi and bch.
   - reg-names: Should contain the reg names "gpmi-nand" and "bch"
   - interrupts : BCH interrupt number.
@@ -13,6 +18,13 @@ Required properties:
     and GPMI DMA channel ID.
     Refer to dma.txt and fsl-mxs-dma.txt for details.
   - dma-names: Must be "rx-tx".
+  - clocks : clocks phandle and clock specifier corresponding to each clock
+    specified in clock-names.
+  - clock-names : The "gpmi_io" clock is always required. Which clocks are
+    exactly required depends on chip:
+    * imx23/imx28 : "gpmi_io"
+    * imx6q/sx : "gpmi_io", "gpmi_apb", "gpmi_bch", "gpmi_bch_apb", "per1_bch"
+    * imx7d : "gpmi_io", "gpmi_bch_apb"
 
 Optional properties:
   - nand-on-flash-bbt: boolean to enable on flash bbt option if not
-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
