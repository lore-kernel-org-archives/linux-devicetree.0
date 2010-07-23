From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 4/9] drivers/of: Allow IRQ code to work properly on
	architectures without NO_IRQ
Date: Fri, 23 Jul 2010 15:15:12 -0700
Message-ID: <11fcb9aa-72df-45bb-b79f-3e463c32dc71@SG2EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sane architectures don't rely on NO_IRQ.  The device tree code shouldn't
require it either.
---
 drivers/of/irq.c       |    4 ++--
 drivers/of/platform.c  |    4 ++--
 include/linux/of_irq.h |    6 ++++++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 6cfb307..438b761 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -37,7 +37,7 @@ unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
 	struct of_irq oirq;
 
 	if (of_irq_map_one(dev, index, &oirq))
-		return NO_IRQ;
+		return OF_NO_IRQ;
 
 	return irq_create_of_mapping(oirq.controller, oirq.specifier,
 				     oirq.size);
@@ -337,7 +337,7 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
 
 	/* Only dereference the resource if both the
 	 * resource and the irq are valid. */
-	if (r && irq != NO_IRQ) {
+	if (r && irq != OF_NO_IRQ) {
 		r->start = r->end = irq;
 		r->flags = IORESOURCE_IRQ;
 		r->name = dev->full_name;
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 9d3d932..cb305ae 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -488,7 +488,7 @@ struct of_device *of_device_alloc(struct device_node *np,
 	/* First count how many resources are needed */
 	while (of_address_to_resource(np, num_reg, &temp_res) == 0)
 		num_reg++;
-	while (of_irq_to_resource(np, num_irq, &temp_res) != NO_IRQ)
+	while (of_irq_to_resource(np, num_irq, &temp_res) != OF_NO_IRQ)
 		num_irq++;
 
 	/* Allocate memory for both the struct device and the resource table */
@@ -508,7 +508,7 @@ struct of_device *of_device_alloc(struct device_node *np,
 		}
 		for (i = 0; i < num_irq; i++, res++) {
 			rc = of_irq_to_resource(np, i, res);
-			WARN_ON(rc == NO_IRQ);
+			WARN_ON(rc == OF_NO_IRQ);
 		}
 	}
 
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 5929781..69e8a71 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -8,6 +8,12 @@ struct of_irq;
 #include <linux/ioport.h>
 #include <linux/of.h>
 
+#ifdef NO_IRQ
+#define OF_NO_IRQ NO_IRQ
+#else
+#define OF_NO_IRQ 0
+#endif
+
 /*
  * irq_of_parse_and_map() is used ba all OF enabled platforms; but SPARC
  * implements it differently.  However, the prototype is the same for all,
-- 
1.5.6.6



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
