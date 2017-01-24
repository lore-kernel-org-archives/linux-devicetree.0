From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: [RFC 2/4] irqchip, gicv3-its:Workaround for HiSilicon erratum
 161010801
Date: Tue, 24 Jan 2017 13:47:57 +0000
Message-ID: <58875B0D.4080303@huawei.com>
References: <5886262C.6070108@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5886262C.6070108@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, mark.rutland@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, john.garry@huawei.com, guohanjun@huawei.com
List-Id: devicetree@vger.kernel.org

The HiSilicon erratum 161010801 describes the limitation of certain
HiSilicon platforms to support the SMMU mappings for MSI transactions.

On these platforms GICv3 ITS translator is presented with the deviceID
by extending the MSI payload data to 64 bits to include the deviceID.
Hence, the PCIe controller on this platforms has to differentiate the
MSI payload against other DMA payload and has to modify the MSI payload.
This basically makes it difficult for this platforms to have a SMMU
translation for MSI. Also these platforms doesn't have a proper IIDR
register to use the existing IIDR based quirk mechanism.

This workaround based on the devicetree binding property, supports
bypassing the SMMU for the MSI transactions on this platforms.

Signed-off-by: shameer <shameerali.kolothum.thodi@huawei.com>
---
 arch/arm64/Kconfig               | 15 ++++++++++++
 drivers/irqchip/irq-gic-common.h |  1 +
 drivers/irqchip/irq-gic-v3-its.c | 52 +++++++++++++++++++++++++++++++++++++++-
 3 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 0ae0427..8d600b0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -485,6 +485,21 @@ config CAVIUM_ERRATUM_27456

 	  If unsure, say Y.

+config HISILICON_ERRATUM_161010801
+	bool "HiSilicon erratum 161010801"
+	default y
+	help
+	  Enable workaround for erratum 161010801.
+
+	  This implements a gicv3-its errata workaround for HiSilicon
+	  platforms Hip05/Hip07. These platforms cannot support the MSI
+	  interrupt remapping and MSI transaction has to be bypassed by SMMU.
+
+	  The fix is to avoid calling the remapping hook into the SMMU
+	  driver from the its_irq_compose_msi_msg().
+
+	  If unsure, say Y.
+
 endmenu


diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq-gic-common.h
index 205e5fd..de0385a 100644
--- a/drivers/irqchip/irq-gic-common.h
+++ b/drivers/irqchip/irq-gic-common.h
@@ -26,6 +26,7 @@ struct gic_quirk {
 	void (*init)(void *data);
 	u32 iidr;
 	u32 mask;
+	const char *erratum;
 };

 int gic_configure_irq(unsigned int irq, unsigned int type,
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index f471939..0a326f6 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -44,6 +44,7 @@
 #define ITS_FLAGS_CMDQ_NEEDS_FLUSHING		(1ULL << 0)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_23144	(1ULL << 2)
+#define ITS_FLAGS_WORKAROUND_HISILICON_161010801	(1ULL << 3)

 #define RDIST_FLAGS_PROPBASE_NEEDS_FLUSHING	(1 << 0)

@@ -659,7 +660,8 @@ static void its_irq_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
 	msg->address_hi		= upper_32_bits(addr);
 	msg->data		= its_get_event_id(d);

-	iommu_dma_map_msi_msg(d->irq, msg);
+	if (!(its->flags & ITS_FLAGS_WORKAROUND_HISILICON_161010801))
+		iommu_dma_map_msi_msg(d->irq, msg);
 }

 static struct irq_chip its_irq_chip = {
@@ -1596,6 +1598,13 @@ static void __maybe_unused its_enable_quirk_cavium_23144(void *data)
 	its->flags |= ITS_FLAGS_WORKAROUND_CAVIUM_23144;
 }

+static void __maybe_unused its_enable_quirk_hisilicon_161010801(void *data)
+{
+	struct its_node *its = data;
+
+	its->flags |= ITS_FLAGS_WORKAROUND_HISILICON_161010801;
+}
+
 static const struct gic_quirk its_quirks[] = {
 #ifdef CONFIG_CAVIUM_ERRATUM_22375
 	{
@@ -1613,15 +1622,54 @@ static void __maybe_unused its_enable_quirk_cavium_23144(void *data)
 		.init	= its_enable_quirk_cavium_23144,
 	},
 #endif
+#ifdef CONFIG_HISILICON_ERRATUM_161010801
+	{
+		.desc	 = "ITS: HISILICON erratum 161010801",
+		.iidr	 = 0xffffffff,	/*invalid, use erratum instead*/
+		.mask	 = 0xffffffff,
+		.erratum = "hisilicon,erratum-161010801",
+		.init	 = its_enable_quirk_hisilicon_161010801,
+	},
+#endif
 	{
 	}
 };

+const struct gic_quirk  *erratum_workarounds[ARRAY_SIZE(its_quirks)] = {};
+
+static void its_enable_erratums(struct its_node *its)
+{
+	int i = 0;
+	const struct gic_quirk  *workarounds;
+
+	while ((workarounds = erratum_workarounds[i])) {
+		workarounds->init(its);
+		pr_info("GIC: enabling workaround for %s\n", workarounds->desc);
+		erratum_workarounds[i++] = NULL;
+	}
+
+}
+
 static void its_enable_quirks(struct its_node *its)
 {
 	u32 iidr = readl_relaxed(its->base + GITS_IIDR);

 	gic_enable_quirks(iidr, its_quirks, its);
+
+	its_enable_erratums(its);
+}
+
+static void of_its_enable_erratum(struct device_node *np)
+{
+	const struct gic_quirk *quirks = its_quirks;
+	int i = 0;
+
+	for (; quirks->desc; quirks++) {
+		const char *erratum = quirks->erratum;
+
+		if ((erratum) && (of_property_read_bool(np, erratum)))
+			erratum_workarounds[i++] = quirks;
+	}
 }

 static int its_init_domain(struct fwnode_handle *handle, struct its_node *its)
@@ -1801,6 +1849,8 @@ static int __init its_of_probe(struct device_node *node)
 			continue;
 		}

+		of_its_enable_erratum(np);
+
 		its_probe_one(&res, &np->fwnode, of_node_to_nid(np));
 	}
 	return 0;
-- 
1.9.1


.
