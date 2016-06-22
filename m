From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCHv5 3/8] EDAC, altera: Make all private data structures static const.
Date: Wed, 22 Jun 2016 08:58:54 -0500
Message-ID: <1466603939-7526-4-git-send-email-tthayer@opensource.altera.com>
References: <1466603939-7526-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466603939-7526-1-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

The device private data structures should be converted from const
struct edac_device_prv_data to static const struct edac_device_prv_data.

Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
v4  New patch added for conversion.
v5  No change
---
 drivers/edac/altera_edac.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 75451bc..dcedc4a 100644
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
