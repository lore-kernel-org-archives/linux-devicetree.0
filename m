From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] dt/irq: add of_irq_domain_add_simple() helper
Date: Fri, 29 Apr 2011 01:35:09 -0600
Message-ID: <20110429073324.17840.37136.stgit@ponder>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_irq_domain_add_simple() is an easy way to generate an irq translation
domain for simple irq controllers.  It assumes a flat 1:1 mapping from
hardware irq number to an offset of the first linux irq number assigned
to the controller

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

Following on from the irq_domain patch series I posted earlier, here is a simple
method for registering a 1:1 translation.

g.

 drivers/of/irq.c       |   44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_irq.h |    2 ++
 2 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 6da0964..641590c 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/string.h>
+#include <linux/slab.h>
 
 /* For archs that don't support NO_IRQ (such as x86), provide a dummy value */
 #ifndef NO_IRQ
@@ -147,6 +148,49 @@ unsigned int irq_create_of_mapping(struct device_node *controller,
 }
 EXPORT_SYMBOL_GPL(irq_create_of_mapping);
 
+/*
+ * A simple irq domain implementation that 1:1 translates hwirqs to an offset
+ * from the irq_start value
+ */
+struct of_irq_domain_simple {
+	struct of_irq_domain domain;
+	int irq_start;
+	int irq_size;
+};
+
+static unsigned int of_irq_domain_simple_map(struct of_irq_domain *domain,
+					     struct device_node *controller,
+					     const u32 *intspec, u32 intsize)
+{
+	struct of_irq_domain_simple *ds;
+
+	ds = container_of(domain, struct of_irq_domain_simple, domain);
+	if (intspec[0] >= ds->irq_size)
+		return NO_IRQ;
+	return ds->irq_start + intspec[0];
+}
+
+/**
+ * of_irq_domain_create_simple() - Set up a 'simple' translation range
+ */
+void of_irq_domain_add_simple(struct device_node *controller,
+			      int irq_start, int irq_size)
+{
+	struct of_irq_domain_simple *sd;
+
+	sd = kzalloc(sizeof(*sd), GFP_KERNEL);
+	if (!sd) {
+		WARN_ON(1);
+		return;
+	}
+
+	sd->irq_start = irq_start;
+	sd->irq_size = irq_size;
+	sd->domain.controller = of_node_get(controller);
+	sd->domain.map = of_irq_domain_simple_map;
+	of_irq_domain_add(&sd->domain);
+}
+
 /**
  * irq_of_parse_and_map - Parse and map an interrupt into linux virq space
  * @device: Device node of the device whose interrupt is to be mapped
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 511dbc3..8e49a0e 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -63,6 +63,8 @@ struct of_irq_domain {
 extern void of_irq_domain_add(struct of_irq_domain *domain);
 extern void of_irq_set_default_domain(struct of_irq_domain *host);
 extern struct of_irq_domain *of_irq_domain_find(struct device_node *controller);
+extern void of_irq_domain_add_simple(struct device_node *controller,
+				     int irq_start, int irq_size);
 
 /*
  * Workarounds only applied to 32bit powermac machines
