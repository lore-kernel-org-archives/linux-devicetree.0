From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 2/7] EDAC, altera: Add panic flag check to A10 IRQ
Date: Mon, 25 Apr 2016 12:52:43 -0500
Message-ID: <1461606768-14404-3-git-send-email-tthayer@opensource.altera.com>
References: <1461606768-14404-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461606768-14404-1-git-send-email-tthayer@opensource.altera.com>
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
kernel panic on double bit errors. ECCs on buffers
will not cause a kernel panic on DBERRs.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v2  New patch. Add panic flag to IRQ function.
---
 drivers/edac/altera_edac.c |    4 +++-
 drivers/edac/altera_edac.h |    1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index b127e77..d4afecc 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -895,7 +895,8 @@ static irqreturn_t altr_edac_a10_ecc_irq(struct altr_edac_device_dev *dci,
 		writel(ALTR_A10_ECC_DERRPENA,
 		       base + ALTR_A10_ECC_INTSTAT_OFST);
 		edac_device_handle_ue(dci->edac_dev, 0, 0, dci->edac_dev_name);
-		panic("\nEDAC:ECC_DEVICE[Uncorrectable errors]\n");
+		if (dci->data->panic)
+			panic("\nEDAC:ECC_DEVICE[Uncorrectable errors]\n");
 	}
 	return IRQ_HANDLED;
 }
@@ -929,6 +930,7 @@ const struct edac_device_prv_data a10_ocramecc_data = {
 	.set_err_ofst = ALTR_A10_ECC_INTTEST_OFST,
 	.ecc_irq_handler = altr_edac_a10_ecc_irq,
 	.inject_fops = &altr_edac_a10_device_inject_fops,
+	.panic = true,
 };
 
 #endif	/* CONFIG_EDAC_ALTERA_OCRAM */
diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 42090f3..83e621e 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -299,6 +299,7 @@ struct edac_device_prv_data {
 				       bool sb);
 	int trig_alloc_sz;
 	const struct file_operations *inject_fops;
+	bool panic;
 };
 
 struct altr_edac_device_dev {
-- 
1.7.9.5
