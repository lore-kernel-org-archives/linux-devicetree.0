From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/5] irqdomain: introduce irq_of_phandle_args_to_fwspec
Date: Mon, 23 Nov 2015 11:16:53 +0100
Message-ID: <1448273816-11290-3-git-send-email-carlo@caione.org>
References: <1448273816-11290-1-git-send-email-carlo@caione.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448273816-11290-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

Export of_phandle_args_to_fwspec with a new compliant name.

Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
---
 include/linux/of_irq.h | 2 ++
 kernel/irq/irqdomain.c | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 6f879c6..66bd92e 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -34,6 +34,8 @@ static inline int of_irq_parse_oldworld(struct device_node *device, int index,
 extern int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq);
 extern int of_irq_parse_one(struct device_node *device, int index,
 			  struct of_phandle_args *out_irq);
+extern void irq_of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
+					  struct irq_fwspec *fwspec);
 extern unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data);
 extern int of_irq_to_resource(struct device_node *dev, int index,
 			      struct resource *r);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 22aa961..b2ff223 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -554,7 +554,7 @@ static int irq_domain_translate(struct irq_domain *d,
 	return 0;
 }
 
-static void of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
+void irq_of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
 				      struct irq_fwspec *fwspec)
 {
 	int i;
@@ -565,6 +565,7 @@ static void of_phandle_args_to_fwspec(struct of_phandle_args *irq_data,
 	for (i = 0; i < irq_data->args_count; i++)
 		fwspec->param[i] = irq_data->args[i];
 }
+EXPORT_SYMBOL_GPL(irq_of_phandle_args_to_fwspec);
 
 unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 {
@@ -618,7 +619,7 @@ unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
 {
 	struct irq_fwspec fwspec;
 
-	of_phandle_args_to_fwspec(irq_data, &fwspec);
+	irq_of_phandle_args_to_fwspec(irq_data, &fwspec);
 	return irq_create_fwspec_mapping(&fwspec);
 }
 EXPORT_SYMBOL_GPL(irq_create_of_mapping);
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
