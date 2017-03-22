From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v2 13/53] mtd: nand: denali_dt: enable HW_ECC_FIXUP for Altera SOCFPGA variant
Date: Wed, 22 Mar 2017 23:07:20 +0900
Message-ID: <1490191680-14481-14-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490191680-14481-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: laurent.monat-1zQW0WpQGTYgLlGVC3PcNw@public.gmane.org, thorsten.christiansson-1zQW0WpQGTYgLlGVC3PcNw@public.gmane.org, Enrico Jorns <ejo-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jason Roberts <jason.e.roberts-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chuanxiao Dong <chuanxiao.dong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen@at>
List-Id: devicetree@vger.kernel.org

There are various customizable parameters, so several variants for
this IP.  A generic compatible like "denali,denali-nand-dt" is
useless.  Moreover, there are multiple things wrong with this string.
(Refer to Rob's comment [1])

The denali_dt.c was split out and this compatible was added by Altera
for the SOCFPGA port.  So, replace it with a more specific string.

The Denali IP on SOCFPGA incorporates the hardware ECC fixup feature.
So, this capability should be associated with the compatible string.

[1] https://lkml.org/lkml/2016/12/1/450

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

Changes in v2:
  - Add caps flag to of_device_id data, not hard-code in driver code
  - Add Altera-specific compatible.

 Documentation/devicetree/bindings/mtd/denali-nand.txt |  5 +++--
 drivers/mtd/nand/denali_dt.c                          | 14 ++++++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b04d03a..6f4ab4c 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -1,7 +1,8 @@
 * Denali NAND controller
 
 Required properties:
-  - compatible : should be "denali,denali-nand-dt"
+  - compatible : should be one of the following:
+      "altr,socfpga-denali-nand"            - for Altera SOCFPGA
   - reg : should contain registers location and length for data and reg.
   - reg-names: Should contain the reg names "nand_data" and "denali_reg"
   - interrupts : The interrupt number.
@@ -15,7 +16,7 @@ Examples:
 nand: nand@ff900000 {
 	#address-cells = <1>;
 	#size-cells = <1>;
-	compatible = "denali,denali-nand-dt";
+	compatible = "altr,socfpga-denali-nand";
 	reg = <0xff900000 0x100000>, <0xffb80000 0x10000>;
 	reg-names = "nand_data", "denali_reg";
 	interrupts = <0 144 4>;
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 293ddb8..9577bfd 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -33,11 +33,17 @@ struct denali_dt_data {
 	unsigned int caps;
 };
 
-static const struct of_device_id denali_nand_dt_ids[] = {
-		{ .compatible = "denali,denali-nand-dt" },
-		{ /* sentinel */ }
-	};
+static const struct denali_dt_data denali_socfpga_data = {
+	.caps = DENALI_CAP_HW_ECC_FIXUP,
+};
 
+static const struct of_device_id denali_nand_dt_ids[] = {
+	{
+		.compatible = "altr,socfpga-denali-nand",
+		.data = &denali_socfpga_data,
+	},
+	{ /* sentinel */ }
+};
 MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
 static u64 denali_dma_mask;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
