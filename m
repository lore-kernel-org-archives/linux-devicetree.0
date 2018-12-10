From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 3/4] irqchip: gic-v3: Add quirk for msm8996 secured registers
Date: Mon, 10 Dec 2018 10:23:08 +0000
Message-ID: <20181210102309.8207-4-srinivas.kandagatla@linaro.org>
References: <20181210102309.8207-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210102309.8207-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com
Cc: sudeep.holla@arm.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, bjorn.andersson@linaro.org, nicolas.dechesne@linaro.org, ctatlor97@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Access to GICR_WAKER is restricted on msm8996 SoC in Hypervisor.
Its been more than 2+ years of wait for this to be fixed, which has
no hopes to be fixed. This change was introduced for the "lead device"
on msm8996 platform. It looks like all publicly available msm8996 and
other Qualcomm SoCs have this implementation.

So add a quirk to not access this register on msm8996.

With this quirk MSM8996 can at least boot out of mainline,
which can help community to work with boards based on MSM8996 and other
SoCs with have this restrictions. This Quirk is based on device tree
compatible string.

Without this patch Qualcomm DB820c board reboots when GICR_WAKER
is accessed.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/irqchip/irq-gic-v3.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index c95796fa4de6..1a2fa62a52f0 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -41,6 +41,8 @@
 
 #include "irq-gic-common.h"
 
+#define FLAGS_WORKAROUND_GICR_WAKER_MSM8996	(1ULL << 0)
+
 struct redist_region {
 	void __iomem		*redist_base;
 	phys_addr_t		phys_base;
@@ -55,6 +57,7 @@ struct gic_chip_data {
 	struct irq_domain	*domain;
 	u64			redist_stride;
 	u32			nr_redist_regions;
+	u64			flags;
 	bool			has_rss;
 	unsigned int		irq_nr;
 	struct partition_desc	*ppi_descs[16];
@@ -139,6 +142,9 @@ static void gic_enable_redist(bool enable)
 	u32 count = 1000000;	/* 1s! */
 	u32 val;
 
+	if (gic_data.flags & FLAGS_WORKAROUND_GICR_WAKER_MSM8996)
+		return;
+
 	rbase = gic_data_rdist_rd_base();
 
 	val = readl_relaxed(rbase + GICR_WAKER);
@@ -1067,6 +1073,15 @@ static const struct irq_domain_ops partition_domain_ops = {
 	.select = gic_irq_domain_select,
 };
 
+static bool gic_enable_quirk_msm8996(void *data)
+{
+	struct gic_chip_data *d = data;
+
+	d->flags |= FLAGS_WORKAROUND_GICR_WAKER_MSM8996;
+
+	return true;
+}
+
 static int __init gic_init_bases(void __iomem *dist_base,
 				 struct redist_region *rdist_regs,
 				 u32 nr_redist_regions,
@@ -1272,6 +1287,11 @@ static void __init gic_of_setup_kvm_info(struct device_node *node)
 }
 
 static const struct gic_quirk gic_quirks[] = {
+	{
+		.desc	= "GICv3: Qualcomm MSM8996 broken firmware",
+		.compatible = "qcom,msm8996-gic-v3",
+		.init	= gic_enable_quirk_msm8996,
+	}
 };
 
 static int __init gic_of_init(struct device_node *node, struct device_node *parent)
-- 
2.19.2
