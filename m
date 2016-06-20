From: <tthayer@opensource.altera.com>
Subject: [PATCHv4 1/7] EDAC, altera: Add panic flag check to A10 IRQ
Date: Mon, 20 Jun 2016 09:50:46 -0500
Message-ID: <1466434252-26107-2-git-send-email-tthayer@opensource.altera.com>
References: <1466434252-26107-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466434252-26107-1-git-send-email-tthayer@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

In preparation for additional memory module ECCs, the
IRQ function will check a panic flag before doing a
kernel panic on double bit errors.

OCRAM uncorrectable errors cause a panic because sleep/resume
functions and FPGA contents during sleep are stored in OCRAM.

ECCs on peripheral FIFO buffers will not cause a kernel panic
on DBERRs because the packet can be retried and therefore
recovered.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2  New patch. Add panic flag to IRQ function.
v3  No change
v4  Add reasons to panic on DBERR in OCRAM.
---
 drivers/edac/altera_edac.c |    9 ++++++++-
 drivers/edac/altera_edac.h |    1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 926bcaf..ced7c55 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -897,7 +897,8 @@ static irqreturn_t altr_edac_a10_ecc_irq(int irq, void *dev_id)
 		writel(ALTR_A10_ECC_DERRPENA,
 		       base + ALTR_A10_ECC_INTSTAT_OFST);
 		edac_device_handle_ue(dci->edac_dev, 0, 0, dci->edac_dev_name);
-		panic("\nEDAC:ECC_DEVICE[Uncorrectable errors]\n");
+		if (dci->data->panic)
+			panic("\nEDAC:ECC_DEVICE[Uncorrectable errors]\n");
 
 		return IRQ_HANDLED;
 	}
@@ -936,6 +937,12 @@ const struct edac_device_prv_data a10_ocramecc_data = {
 	.set_err_ofst = ALTR_A10_ECC_INTTEST_OFST,
 	.ecc_irq_handler = altr_edac_a10_ecc_irq,
 	.inject_fops = &altr_edac_a10_device_inject_fops,
+	/*
+	 * OCRAM panic on uncorrectable error because sleep/resume
+	 * functions and FPGA contents are stored in OCRAM. Prefer
+	 * a kernel panic over executing/loading corrupted data.
+	 */
+	.panic = true,
 };
 
 #endif	/* CONFIG_EDAC_ALTERA_OCRAM */
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 62b0fa0..cf4e8cb 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -298,6 +298,7 @@ struct edac_device_prv_data {
 	irqreturn_t (*ecc_irq_handler)(int irq, void *dev_id);
 	int trig_alloc_sz;
 	const struct file_operations *inject_fops;
+	bool panic;
 };
 
 struct altr_edac_device_dev {
-- 
1.7.9.5
