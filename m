From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/9] drivers/of: Allow IRQ code to work properly on
	architectures without NO_IRQ
Date: Fri, 23 Jul 2010 13:57:38 -0700
Message-ID: <e07ceaf0-18ef-4a0c-bc5e-6d7ff69fb07b@SG2EHSMHS007.ehs.local>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-4-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1279918663-29960-4-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
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
 drivers/of/irq.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 6cfb307..e85883e 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -24,6 +24,12 @@
 #include <linux/of_irq.h>
 #include <linux/string.h>
 
+#ifdef NO_IRQ
+#define OF_NO_IRQ NO_IRQ
+#else
+#define OF_NO_IRQ 0
+#endif
+
 /**
  * irq_of_parse_and_map - Parse and map an interrupt into linux virq space
  * @device: Device node of the device whose interrupt is to be mapped
@@ -37,7 +43,7 @@ unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
 	struct of_irq oirq;
 
 	if (of_irq_map_one(dev, index, &oirq))
-		return NO_IRQ;
+		return OF_NO_IRQ;
 
 	return irq_create_of_mapping(oirq.controller, oirq.specifier,
 				     oirq.size);
@@ -337,7 +343,7 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
 
 	/* Only dereference the resource if both the
 	 * resource and the irq are valid. */
-	if (r && irq != NO_IRQ) {
+	if (r && irq != OF_NO_IRQ) {
 		r->start = r->end = irq;
 		r->flags = IORESOURCE_IRQ;
 		r->name = dev->full_name;
-- 
1.5.6.6



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
