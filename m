From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 2/4] irqchip/gic: common: add support to device tree based quirks
Date: Mon, 10 Dec 2018 10:23:07 +0000
Message-ID: <20181210102309.8207-3-srinivas.kandagatla@linaro.org>
References: <20181210102309.8207-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210102309.8207-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com
Cc: sudeep.holla@arm.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, bjorn.andersson@linaro.org, nicolas.dechesne@linaro.org, ctatlor97@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds support to device tree based quirks based on
device tree compatible string.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/irqchip/irq-gic-common.c | 12 ++++++++++++
 drivers/irqchip/irq-gic-common.h |  3 +++
 drivers/irqchip/irq-gic-v3.c     |  5 +++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq-gic-common.c
index 01e673c680cd..3c93c6f4d1f1 100644
--- a/drivers/irqchip/irq-gic-common.c
+++ b/drivers/irqchip/irq-gic-common.c
@@ -36,6 +36,18 @@ void gic_set_kvm_info(const struct gic_kvm_info *info)
 	gic_kvm_info = info;
 }
 
+void gic_enable_of_quirks(const struct device_node *np,
+			  const struct gic_quirk *quirks, void *data)
+{
+	for (; quirks->desc; quirks++) {
+		if (!of_device_is_compatible(np, quirks->compatible))
+			continue;
+		if (quirks->init(data))
+			pr_info("GIC: enabling workaround for %s\n",
+				quirks->desc);
+	}
+}
+
 void gic_enable_quirks(u32 iidr, const struct gic_quirk *quirks,
 		void *data)
 {
diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq-gic-common.h
index 3919cd7c5285..97e58fb6c232 100644
--- a/drivers/irqchip/irq-gic-common.h
+++ b/drivers/irqchip/irq-gic-common.h
@@ -23,6 +23,7 @@
 
 struct gic_quirk {
 	const char *desc;
+	const char *compatible;
 	bool (*init)(void *data);
 	u32 iidr;
 	u32 mask;
@@ -35,6 +36,8 @@ void gic_dist_config(void __iomem *base, int gic_irqs,
 void gic_cpu_config(void __iomem *base, void (*sync_access)(void));
 void gic_enable_quirks(u32 iidr, const struct gic_quirk *quirks,
 		void *data);
+void gic_enable_of_quirks(const struct device_node *np,
+			  const struct gic_quirk *quirks, void *data);
 
 void gic_set_kvm_info(const struct gic_kvm_info *info);
 
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 29e9d47be97d..c95796fa4de6 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1271,6 +1271,9 @@ static void __init gic_of_setup_kvm_info(struct device_node *node)
 	gic_set_kvm_info(&gic_v3_kvm_info);
 }
 
+static const struct gic_quirk gic_quirks[] = {
+};
+
 static int __init gic_of_init(struct device_node *node, struct device_node *parent)
 {
 	void __iomem *dist_base;
@@ -1318,6 +1321,8 @@ static int __init gic_of_init(struct device_node *node, struct device_node *pare
 	if (of_property_read_u64(node, "redistributor-stride", &redist_stride))
 		redist_stride = 0;
 
+	gic_enable_of_quirks(node, gic_quirks, &gic_data);
+
 	err = gic_init_bases(dist_base, rdist_regs, nr_redist_regions,
 			     redist_stride, &node->fwnode);
 	if (err)
-- 
2.19.2
