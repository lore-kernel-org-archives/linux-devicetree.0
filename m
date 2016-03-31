From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 3/7] EDAC, altera: Make OCRAM ECC dependency check generic
Date: Thu, 31 Mar 2016 13:48:03 -0500
Message-ID: <1459450087-24792-4-git-send-email-tthayer@opensource.altera.com>
References: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1459450087-24792-1-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer@opensource.altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

In preparation for the Arria10 peripheral ECCs, the OCRAM
ECC dependency check was moved into the general ECC area
since this same function can be used by other memories.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2: No change
---
 drivers/edac/altera_edac.c |   43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index f0a6de7..f7ffc77 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -648,6 +648,26 @@ static ssize_t altr_edac_device_trig(struct file *file,
 	return count;
 }
 
+/*
+ *  Test for memory's ECC dependencies upon entry because platform specific
+ *  startup should have initialized the memory and enabled the ECC.
+ *  Can't turn on ECC here because accessing un-initialized memory will
+ *  cause CE/UE errors possibly causing an ABORT.
+ */
+static int altr_check_ecc_deps(struct altr_edac_device_dev *device)
+{
+	void __iomem  *base = device->base;
+	const struct edac_device_prv_data *prv = device->data;
+
+	if (readl(base + prv->ecc_en_ofst) & prv->ecc_enable_mask)
+		return 0;
+
+	edac_printk(KERN_ERR, EDAC_DEVICE,
+		    "%s: No ECC present or ECC disabled.\n",
+		    device->edac_dev_name);
+	return -ENODEV;
+}
+
 static const struct file_operations altr_edac_device_inject_fops = {
 	.open = simple_open,
 	.write = altr_edac_device_trig,
@@ -853,29 +873,8 @@ static void ocram_free_mem(void *p, size_t size, void *other)
 	gen_pool_free((struct gen_pool *)other, (u32)p, size);
 }
 
-/*
- * altr_ocram_check_deps()
- *	Test for OCRAM cache ECC dependencies upon entry because
- *	platform specific startup should have initialized the
- *	On-Chip RAM memory and enabled the ECC.
- *	Can't turn on ECC here because accessing un-initialized
- *	memory will cause CE/UE errors possibly causing an ABORT.
- */
-static int altr_ocram_check_deps(struct altr_edac_device_dev *device)
-{
-	void __iomem  *base = device->base;
-	const struct edac_device_prv_data *prv = device->data;
-
-	if (readl(base + prv->ecc_en_ofst) & prv->ecc_enable_mask)
-		return 0;
-
-	edac_printk(KERN_ERR, EDAC_DEVICE,
-		    "OCRAM: No ECC present or ECC disabled.\n");
-	return -ENODEV;
-}
-
 const struct edac_device_prv_data ocramecc_data = {
-	.setup = altr_ocram_check_deps,
+	.setup = altr_check_ecc_deps,
 	.ce_clear_mask = (ALTR_OCR_ECC_EN | ALTR_OCR_ECC_SERR),
 	.ue_clear_mask = (ALTR_OCR_ECC_EN | ALTR_OCR_ECC_DERR),
 	.dbgfs_name = "altr_ocram_trigger",
-- 
1.7.9.5

