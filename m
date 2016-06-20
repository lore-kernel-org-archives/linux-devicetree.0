From: <tthayer@opensource.altera.com>
Subject: [PATCHv4 2/7] EDAC,
 altera: Make all private data structures static const.
Date: Mon, 20 Jun 2016 09:50:47 -0500
Message-ID: <1466434252-26107-3-git-send-email-tthayer@opensource.altera.com>
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

The device private data structures should be converted from const
struct edac_device_prv_data to static const struct edac_device_prv_data.

Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
---
v4  New patch added for conversion.
---
 drivers/edac/altera_edac.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index ced7c55..14c9248 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -550,10 +550,10 @@ module_platform_driver(altr_edac_driver);
  * trigger testing are different for each memory.
  */
 
-const struct edac_device_prv_data ocramecc_data;
-const struct edac_device_prv_data l2ecc_data;
-const struct edac_device_prv_data a10_ocramecc_data;
-const struct edac_device_prv_data a10_l2ecc_data;
+static const struct edac_device_prv_data ocramecc_data;
+static const struct edac_device_prv_data l2ecc_data;
+static const struct edac_device_prv_data a10_ocramecc_data;
+static const struct edac_device_prv_data a10_l2ecc_data;
 
 static irqreturn_t altr_edac_device_handler(int irq, void *dev_id)
 {
@@ -908,7 +908,7 @@ static irqreturn_t altr_edac_a10_ecc_irq(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-const struct edac_device_prv_data ocramecc_data = {
+static const struct edac_device_prv_data ocramecc_data = {
 	.setup = altr_check_ecc_deps,
 	.ce_clear_mask = (ALTR_OCR_ECC_EN | ALTR_OCR_ECC_SERR),
 	.ue_clear_mask = (ALTR_OCR_ECC_EN | ALTR_OCR_ECC_DERR),
@@ -924,7 +924,7 @@ const struct edac_device_prv_data ocramecc_data = {
 	.inject_fops = &altr_edac_device_inject_fops,
 };
 
-const struct edac_device_prv_data a10_ocramecc_data = {
+static const struct edac_device_prv_data a10_ocramecc_data = {
 	.setup = altr_check_ecc_deps,
 	.ce_clear_mask = ALTR_A10_ECC_SERRPENA,
 	.ue_clear_mask = ALTR_A10_ECC_DERRPENA,
@@ -1028,7 +1028,7 @@ static irqreturn_t altr_edac_a10_l2_irq(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-const struct edac_device_prv_data l2ecc_data = {
+static const struct edac_device_prv_data l2ecc_data = {
 	.setup = altr_l2_check_deps,
 	.ce_clear_mask = 0,
 	.ue_clear_mask = 0,
@@ -1043,7 +1043,7 @@ const struct edac_device_prv_data l2ecc_data = {
 	.inject_fops = &altr_edac_device_inject_fops,
 };
 
-const struct edac_device_prv_data a10_l2ecc_data = {
+static const struct edac_device_prv_data a10_l2ecc_data = {
 	.setup = altr_l2_check_deps,
 	.ce_clear_mask = ALTR_A10_L2_ECC_SERR_CLR,
 	.ue_clear_mask = ALTR_A10_L2_ECC_MERR_CLR,
-- 
1.7.9.5
