From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] dt/irq: add empty of_irq_count for !OF_IRQ
Date: Thu,  7 Nov 2013 12:15:49 -0600
Message-ID: <1383848149-15488-2-git-send-email-robherring2@gmail.com>
References: <1383848149-15488-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383848149-15488-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Add an empty version of of_irq_count for !OF_IRQ. This fixes build error
on sparc in linux-next:

drivers/gpio/gpio-bcm-kona.c:542: undefined reference to `of_irq_count'

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 include/linux/of_irq.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index c0d6dfe..3f23b44 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -37,12 +37,20 @@ extern int of_irq_parse_one(struct device_node *device, int index,
 extern unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data);
 extern int of_irq_to_resource(struct device_node *dev, int index,
 			      struct resource *r);
-extern int of_irq_count(struct device_node *dev);
 extern int of_irq_to_resource_table(struct device_node *dev,
 		struct resource *res, int nr_irqs);
 
 extern void of_irq_init(const struct of_device_id *matches);
 
+#ifdef CONFIG_OF_IRQ
+extern int of_irq_count(struct device_node *dev);
+#else
+static inline int of_irq_count(struct device_node *dev)
+{
+	return 0;
+}
+#endif
+
 #if defined(CONFIG_OF)
 /*
  * irq_of_parse_and_map() is used by all OF enabled platforms; but SPARC
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
