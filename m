From: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Subject: [RFC 7/8] drivers/of: allow irq direct mapping
Date: Fri, 11 Mar 2016 16:56:14 +0100
Message-ID: <1457711775-6326-8-git-send-email-franck.jullien@odyssee-systemes.fr>
References: <1457711775-6326-1-git-send-email-franck.jullien@odyssee-systemes.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457711775-6326-1-git-send-email-franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Franck Jullien <franck.jullien-EduPiq9onwdphFt5fpzH3laPQRlvutdw@public.gmane.org>
---
 drivers/of/irq.c      |    6 ++++++
 drivers/of/platform.c |    6 +++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e7bfc17..afcbfc9 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -38,6 +38,12 @@
 unsigned int irq_of_parse_and_map(struct device_node *dev, int index)
 {
 	struct of_phandle_args oirq;
+	int irq;
+
+	if (of_find_property(dev, "irq_direct_mapping", NULL)) {
+		of_property_read_u32(dev, "interrupts", &irq);
+		return irq;
+	}
 
 	if (of_irq_parse_one(dev, index, &oirq))
 		return 0;
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 8d103e4..d29f65d 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -118,7 +118,11 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	/* count the io and irq resources */
 	while (of_address_to_resource(np, num_reg, &temp_res) == 0)
 		num_reg++;
-	num_irq = of_irq_count(np);
+	if (of_find_property(np, "irq_direct_mapping", NULL))
+		num_irq = 1;
+	else
+		num_irq = of_irq_count(np);
+
 
 	/* Populate the resource table */
 	if (num_irq || num_reg) {
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
