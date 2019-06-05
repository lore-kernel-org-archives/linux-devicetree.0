From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH 3/3] irqchip: al-fic: Introducing support for MSI-X
Date: Wed, 5 Jun 2019 09:54:13 +0300
Message-ID: <1559717653-11258-4-git-send-email-talel@amazon.com>
References: <1559717653-11258-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559717653-11258-1-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com, Talel Shenhar <talel@amazon.com>
List-Id: devicetree@vger.kernel.org

The FIC supports either a (single) wired output, or generation of an MSI-X
interrupt per input (for cases where it is embedded in a PCIe device,
hence, allowing the PCIe drivers to call this API).
This patch introduces the support for allowing the configuration of MSI-X
instead of a wire interrupt.

Signed-off-by: Talel Shenhar <talel@amazon.com>
---
 drivers/irqchip/irq-al-fic.c   | 48 +++++++++++++++++++++++++++++++++++++++---
 include/linux/irqchip/al-fic.h |  2 ++
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d881d42..e49b912 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -19,6 +19,7 @@
 #define AL_FIC_MASK		0x10
 #define AL_FIC_CONTROL		0x28
 
+#define CONTROL_AUTO_CLEAR	BIT(2)
 #define CONTROL_TRIGGER_RISING	BIT(3)
 #define CONTROL_MASK_MSI_X	BIT(5)
 
@@ -193,9 +194,11 @@ struct irq_domain *al_fic_wire_get_domain(struct al_fic *fic)
 }
 EXPORT_SYMBOL_GPL(al_fic_wire_get_domain);
 
-static void al_fic_hw_init(struct al_fic *fic)
+static void al_fic_hw_init(struct al_fic *fic,
+			   int use_msi)
 {
-	u32 control = CONTROL_MASK_MSI_X;
+	u32 control = (use_msi ? (CONTROL_AUTO_CLEAR | CONTROL_TRIGGER_RISING) :
+		       CONTROL_MASK_MSI_X);
 
 	/* mask out all interrupts */
 	writel(0xFFFFFFFF, fic->base + AL_FIC_MASK);
@@ -240,7 +243,7 @@ struct al_fic *al_fic_wire_init(struct device_node *node,
 	fic->parent_irq = parent_irq;
 	fic->name = (name ?: "al-fic-wire");
 
-	al_fic_hw_init(fic);
+	al_fic_hw_init(fic, false);
 
 	ret = al_fic_register(node, fic);
 	if (ret) {
@@ -260,6 +263,45 @@ struct al_fic *al_fic_wire_init(struct device_node *node,
 EXPORT_SYMBOL_GPL(al_fic_wire_init);
 
 /**
+ * al_fic_msi_x_init() - initialize and configure fic in msi-x mode
+ * @base: mmio to fic register
+ * @name: name of the fic
+ *
+ * This API will configure the fic hardware to to work in msi-x mode.
+ * msi-x fic is to be configured for fics that are embedded inside AL PCIE EP.
+ * Those kind of fic are aware of the fact that they live inside PCIE and
+ * familiar with the MSI-X table which is configured as part of
+ * pci_enable_msix_range() and friends.
+ * Interrupt can be generated based on a positive edge or level - configuration
+ * is to be determined based on connected hardware to this fic.
+ *
+ * Returns pointer to fic context or ERR_PTR in case of error.
+ */
+struct al_fic *al_fic_msi_x_init(void __iomem *base,
+				 const char *name)
+{
+	struct al_fic *fic;
+
+	if (!base)
+		return ERR_PTR(-EINVAL);
+
+	fic = kzalloc(sizeof(*fic), GFP_KERNEL);
+	if (!fic)
+		return ERR_PTR(-ENOMEM);
+
+	fic->base = base;
+	fic->name = (name ?: "al-fic-full-fledged");
+
+	al_fic_hw_init(fic, true);
+
+	pr_debug("%s initialized successfully in Full-Fledged mode\n",
+		 fic->name);
+
+	return fic;
+}
+EXPORT_SYMBOL_GPL(al_fic_msi_x_init);
+
+/**
  * al_fic_cleanup() - free all resources allocated by fic
  * @fic: pointer to fic context
  *
diff --git a/include/linux/irqchip/al-fic.h b/include/linux/irqchip/al-fic.h
index 0833749..a2e89ff 100644
--- a/include/linux/irqchip/al-fic.h
+++ b/include/linux/irqchip/al-fic.h
@@ -16,6 +16,8 @@ struct al_fic *al_fic_wire_init(struct device_node *node,
 				void __iomem *base,
 				const char *name,
 				unsigned int parent_irq);
+struct al_fic *al_fic_msi_x_init(void __iomem *base,
+				 const char *name);
 int al_fic_cleanup(struct al_fic *fic);
 
 #endif
-- 
2.7.4
