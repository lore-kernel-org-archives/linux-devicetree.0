From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 1/4] MFD: twl6040: Code cleanup in interrupt initialization
 part
Date: Wed, 16 May 2012 14:11:55 +0300
Message-ID: <1337166718-8458-2-git-send-email-peter.ujfalusi@ti.com>
References: <1337166718-8458-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1337166718-8458-1-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Dmitry Torokhov <dtor-JGs/UdohzUI@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peter.ujfalusi-l0cyMroinI0@public.gmane.org, Misael Lopez Cruz <misael.lopez-l0cyMroinI0@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

No functional change, just to make the code a bit more uniform and
remove wrapped lines.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 drivers/mfd/twl6040-irq.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/twl6040-irq.c b/drivers/mfd/twl6040-irq.c
index b3f8dda..008022c 100644
--- a/drivers/mfd/twl6040-irq.c
+++ b/drivers/mfd/twl6040-irq.c
@@ -138,7 +138,7 @@ static irqreturn_t twl6040_irq_thread(int irq, void *data)
 
 int twl6040_irq_init(struct twl6040 *twl6040)
 {
-	int cur_irq, ret;
+	int i, nr_irqs, ret;
 	u8 val;
 
 	mutex_init(&twl6040->irq_mutex);
@@ -148,21 +148,20 @@ int twl6040_irq_init(struct twl6040 *twl6040)
 	twl6040->irq_masks_cache = TWL6040_ALLINT_MSK;
 	twl6040_reg_write(twl6040, TWL6040_REG_INTMR, TWL6040_ALLINT_MSK);
 
+	nr_irqs = ARRAY_SIZE(twl6040_irqs);
 	/* Register them with genirq */
-	for (cur_irq = twl6040->irq_base;
-	     cur_irq < twl6040->irq_base + ARRAY_SIZE(twl6040_irqs);
-	     cur_irq++) {
-		irq_set_chip_data(cur_irq, twl6040);
-		irq_set_chip_and_handler(cur_irq, &twl6040_irq_chip,
+	for (i = twl6040->irq_base; i < twl6040->irq_base + nr_irqs; i++) {
+		irq_set_chip_data(i, twl6040);
+		irq_set_chip_and_handler(i, &twl6040_irq_chip,
 					 handle_level_irq);
-		irq_set_nested_thread(cur_irq, 1);
+		irq_set_nested_thread(i, 1);
 
 		/* ARM needs us to explicitly flag the IRQ as valid
 		 * and will set them noprobe when we do so. */
 #ifdef CONFIG_ARM
-		set_irq_flags(cur_irq, IRQF_VALID);
+		set_irq_flags(i, IRQF_VALID);
 #else
-		irq_set_noprobe(cur_irq);
+		irq_set_noprobe(i);
 #endif
 	}
 
-- 
1.7.8.6
