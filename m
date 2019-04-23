From: thor.thayer@linux.intel.com
Subject: [PATCH 1/4] EDAC, altera: Add Stratix10 OCRAM ECC support
Date: Tue, 23 Apr 2019 09:36:34 -0500
Message-ID: <1556030197-24534-2-git-send-email-thor.thayer@linux.intel.com>
References: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556030197-24534-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thor.thayer@linux.intel.com, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Use the newer ECC error injection method for Arria10 and
Stratix10 OCRAM.
If OCRAM has already been initialized during the boot and
OCRAM ECC is enabled, ensure the Single Bit Error IRQ is
enabled.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/edac/altera_edac.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 8816f74a22b4..b7bc8f020df8 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1223,8 +1223,31 @@ static const struct edac_device_prv_data ocramecc_data = {
 	.inject_fops = &altr_edac_device_inject_fops,
 };
 
+static int __maybe_unused
+altr_check_ocram_deps_init(struct altr_edac_device_dev *device)
+{
+	void __iomem  *base = device->base;
+	int ret;
+
+	ret = altr_check_ecc_deps(device);
+	if (ret)
+		return ret;
+
+	/* Verify OCRAM has been initialized */
+	if (!ecc_test_bits(ALTR_A10_ECC_INITCOMPLETEA,
+			   (base + ALTR_A10_ECC_INITSTAT_OFST)))
+		return -ENODEV;
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
+	.setup = altr_check_ocram_deps_init,
 	.ce_clear_mask = ALTR_A10_ECC_SERRPENA,
 	.ue_clear_mask = ALTR_A10_ECC_DERRPENA,
 	.irq_status_mask = A10_SYSMGR_ECC_INTSTAT_OCRAM,
@@ -1234,7 +1257,7 @@ static const struct edac_device_prv_data a10_ocramecc_data = {
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
