Return-Path: <SRS0=Tq4V=PY=linux.intel.com=thor.thayer@kernel.org>
From: thor.thayer@linux.intel.com
Subject: [PATCH 3/4] EDAC, altera: Add Stratix10 OCRAM ECC support
Date: Wed, 16 Jan 2019 17:11:53 -0600
Message-Id: <1547680314-31045-4-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1547680314-31045-1-git-send-email-thor.thayer@linux.intel.com>
References: <1547680314-31045-1-git-send-email-thor.thayer@linux.intel.com>
To: bp@alien8.de, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thor Thayer <thor.thayer@linux.intel.com>

Use the newer ECC error injection method for Arria10 and
Stratix10 OCRAM.
OCRAM can't call the common peripheral init routine since
OCRAM is being used. An OCRAM specific init routine ensures
the OCRAM ECC is setup without clearing memory.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/edac/altera_edac.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 56af98d18645..6a8993e6a278 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1216,8 +1216,26 @@ static const struct edac_device_prv_data ocramecc_data = {
 	.inject_fops = &altr_edac_device_inject_fops,
 };
 
+static int __maybe_unused
+altr_a10_check_ecc_deps_init(struct altr_edac_device_dev *device)
+{
+	void __iomem  *base = device->base;
+	int ret;
+
+	ret = altr_check_ecc_deps(device);
+	if (ret)
+		return ret;
+
+	/* Enable IRQ on Single Bit Error */
+	writel(ALTR_A10_ECC_SERRINTEN, (base + ALTR_A10_ECC_ERRINTENS_OFST));
+	/* Ensure all writes complete */
+	wmb();
+
+	return 0;
+}
+
 static const struct edac_device_prv_data a10_ocramecc_data = {
-	.setup = altr_check_ecc_deps,
+	.setup = altr_a10_check_ecc_deps_init,
 	.ce_clear_mask = ALTR_A10_ECC_SERRPENA,
 	.ue_clear_mask = ALTR_A10_ECC_DERRPENA,
 	.irq_status_mask = A10_SYSMGR_ECC_INTSTAT_OCRAM,
@@ -1227,7 +1245,7 @@ static const struct edac_device_prv_data a10_ocramecc_data = {
 	.ue_set_mask = ALTR_A10_ECC_TDERRA,
 	.set_err_ofst = ALTR_A10_ECC_INTTEST_OFST,
 	.ecc_irq_handler = altr_edac_a10_ecc_irq,
-	.inject_fops = &altr_edac_a10_device_inject_fops,
+	.inject_fops = &altr_edac_a10_device_inject2_fops,
 	/*
 	 * OCRAM panic on uncorrectable error because sleep/resume
 	 * functions and FPGA contents are stored in OCRAM. Prefer
-- 
2.7.4
