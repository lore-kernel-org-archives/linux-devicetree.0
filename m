From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 2/4] mtd: atmel_nand: Support variable RB_EDGE interrupts
Date: Tue, 12 Jan 2016 15:33:41 +0100
Message-ID: <1452609223-14790-3-git-send-email-romain.izard.pro@gmail.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452609223-14790-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The NFC controller used to accelerate the NAND transfers on SAMA5 chips
can use either RB_EDGE0 or RB_EDGE3 as its ready/busy interrupt bit.

Use the controller's compatible string to select the correct bit.

Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mtd/atmel-nand.txt         |  2 +-
 drivers/mtd/nand/atmel_nand.c                      | 39 +++++++++++++++++-----
 drivers/mtd/nand/atmel_nand_nfc.h                  |  5 ++-
 3 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 7d4c8eb775a5..89b0db9801b0 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -34,7 +34,7 @@ Optional properties:
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
 - Nand Flash Controller(NFC) is a slave driver under Atmel nand flash
   - Required properties:
-    - compatible : "atmel,sama5d3-nfc".
+    - compatible : "atmel,sama5d3-nfc" or "atmel,sama5d4-nfc".
     - reg : should specify the address and size used for NFC command registers,
             NFC registers and NFC Sram. NFC Sram address and size can be absent
             if don't want to use it.
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 9d71f9e6a8de..e5d7e7e63f49 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -67,6 +67,10 @@ struct atmel_nand_caps {
 	bool pmecc_correct_erase_page;
 };
 
+struct atmel_nand_nfc_priv {
+	uint32_t rb_edge;
+};
+
 /* oob layout for large page size
  * bad block info is on bytes 0 and 1
  * the bytes have to be consecutives to avoid
@@ -111,6 +115,7 @@ struct atmel_nfc {
 	/* Point to the sram bank which include readed data via NFC */
 	void			*data_in_sram;
 	bool			will_write_sram;
+	uint32_t		rb_edge;
 };
 static struct atmel_nfc	nand_nfc;
 
@@ -1675,9 +1680,9 @@ static irqreturn_t hsmc_interrupt(int irq, void *dev_id)
 		nfc_writel(host->nfc->hsmc_regs, IDR, NFC_SR_XFR_DONE);
 		ret = IRQ_HANDLED;
 	}
-	if (pending & NFC_SR_RB_EDGE) {
+	if (pending & host->nfc->rb_edge) {
 		complete(&host->nfc->comp_ready);
-		nfc_writel(host->nfc->hsmc_regs, IDR, NFC_SR_RB_EDGE);
+		nfc_writel(host->nfc->hsmc_regs, IDR, host->nfc->rb_edge);
 		ret = IRQ_HANDLED;
 	}
 	if (pending & NFC_SR_CMD_DONE) {
@@ -1695,7 +1700,7 @@ static void nfc_prepare_interrupt(struct atmel_nand_host *host, u32 flag)
 	if (flag & NFC_SR_XFR_DONE)
 		init_completion(&host->nfc->comp_xfer_done);
 
-	if (flag & NFC_SR_RB_EDGE)
+	if (flag & host->nfc->rb_edge)
 		init_completion(&host->nfc->comp_ready);
 
 	if (flag & NFC_SR_CMD_DONE)
@@ -1713,7 +1718,7 @@ static int nfc_wait_interrupt(struct atmel_nand_host *host, u32 flag)
 	if (flag & NFC_SR_XFR_DONE)
 		comp[index++] = &host->nfc->comp_xfer_done;
 
-	if (flag & NFC_SR_RB_EDGE)
+	if (flag & host->nfc->rb_edge)
 		comp[index++] = &host->nfc->comp_ready;
 
 	if (flag & NFC_SR_CMD_DONE)
@@ -1781,7 +1786,7 @@ static int nfc_device_ready(struct mtd_info *mtd)
 		dev_err(host->dev, "Lost the interrupt flags: 0x%08x\n",
 				mask & status);
 
-	return status & NFC_SR_RB_EDGE;
+	return status & host->nfc->rb_edge;
 }
 
 static void nfc_select_chip(struct mtd_info *mtd, int chip)
@@ -1954,8 +1959,8 @@ static void nfc_nand_command(struct mtd_info *mtd, unsigned int command,
 		}
 		/* fall through */
 	default:
-		nfc_prepare_interrupt(host, NFC_SR_RB_EDGE);
-		nfc_wait_interrupt(host, NFC_SR_RB_EDGE);
+		nfc_prepare_interrupt(host, host->nfc->rb_edge);
+		nfc_wait_interrupt(host, host->nfc->rb_edge);
 	}
 }
 
@@ -2318,9 +2323,12 @@ static const struct of_device_id atmel_nand_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, atmel_nand_dt_ids);
 
+static const struct of_device_id atmel_nand_nfc_match[];
+
 static int atmel_nand_nfc_probe(struct platform_device *pdev)
 {
 	struct atmel_nfc *nfc = &nand_nfc;
+	const struct atmel_nand_nfc_priv *priv;
 	struct resource *nfc_cmd_regs, *nfc_hsmc_regs, *nfc_sram;
 	int ret;
 
@@ -2352,6 +2360,12 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
 		}
 	}
 
+	priv = of_match_device(atmel_nand_nfc_match, &pdev->dev)->data;
+	if (NULL == priv)
+		return -ENODEV;
+
+	nfc->rb_edge = priv->rb_edge;
+
 	nfc_writel(nfc->hsmc_regs, IDR, 0xffffffff);
 	nfc_readl(nfc->hsmc_regs, SR);	/* clear the NFC_SR */
 
@@ -2380,8 +2394,17 @@ static int atmel_nand_nfc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct atmel_nand_nfc_priv sama5d3_nfc_priv = {
+	.rb_edge = NFC_SR_RB_EDGE0,
+};
+
+static struct atmel_nand_nfc_priv sama5d4_nfc_priv = {
+	.rb_edge = NFC_SR_RB_EDGE3,
+};
+
 static const struct of_device_id atmel_nand_nfc_match[] = {
-	{ .compatible = "atmel,sama5d3-nfc" },
+	{ .compatible = "atmel,sama5d3-nfc", .data = &sama5d3_nfc_priv },
+	{ .compatible = "atmel,sama5d4-nfc", .data = &sama5d4_nfc_priv },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, atmel_nand_nfc_match);
diff --git a/drivers/mtd/nand/atmel_nand_nfc.h b/drivers/mtd/nand/atmel_nand_nfc.h
index 4d5d26221a7e..2cd9c57b1e53 100644
--- a/drivers/mtd/nand/atmel_nand_nfc.h
+++ b/drivers/mtd/nand/atmel_nand_nfc.h
@@ -42,7 +42,10 @@
 #define		NFC_SR_UNDEF		(1 << 21)
 #define		NFC_SR_AWB		(1 << 22)
 #define		NFC_SR_ASE		(1 << 23)
-#define		NFC_SR_RB_EDGE		(1 << 24)
+#define		NFC_SR_RB_EDGE0		(1 << 24)
+#define		NFC_SR_RB_EDGE1		(1 << 25)
+#define		NFC_SR_RB_EDGE2		(1 << 26)
+#define		NFC_SR_RB_EDGE3		(1 << 27)
 
 #define ATMEL_HSMC_NFC_IER	0x0c
 #define ATMEL_HSMC_NFC_IDR	0x10
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
