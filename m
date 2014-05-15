From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCHv3 3/3] ARM: mvebu: implement L2/PCIe deadlock workaround
Date: Thu, 15 May 2014 11:18:39 +0200
Message-ID: <1400145519-28530-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400145519-28530-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Marvell Armada 375 and Armada 38x SOCs, which use the Cortex-A9
CPU core, the PL310 cache and the Marvell PCIe hardware block are
affected a L2/PCIe deadlock caused by a system erratum when hardware
I/O coherency is used.

This deadlock can be avoided by mapping the PCIe memory areas as
strongly-ordered (note: MT_UNCACHED is strongly-ordered), and by
removing the outer cache sync done in software. This is done in this
patch, thanks to the new bits of infrastructure added in 'ARM: mm:
allow sub-architectures to override PCI I/O memory type' and 'ARM: mm:
add support for HW coherent systems in PL310' respectively.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-mvebu/board-v7.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/mach-mvebu/board-v7.c b/arch/arm/mach-mvebu/board-v7.c
index 01cfce6..5016c58 100644
--- a/arch/arm/mach-mvebu/board-v7.c
+++ b/arch/arm/mach-mvebu/board-v7.c
@@ -71,6 +71,49 @@ static int armada_375_external_abort_wa(unsigned long addr, unsigned int fsr,
 	return 1;
 }
 
+/*
+ * This ioremap hook is used on Armada 375/38x to ensure that PCIe
+ * memory areas are mapped as MT_MEMORY_RW_SO instead of
+ * MT_DEVICE. This is needed as a workaround for a deadlock issue
+ * between the PCIe interface and the cache controller.
+ */
+static void __iomem *
+armada_pcie_wa_ioremap_caller(phys_addr_t phys_addr, size_t size,
+			      unsigned int mtype, void *caller)
+{
+	struct resource pcie_mem;
+
+	mvebu_mbus_get_pcie_mem_aperture(&pcie_mem);
+
+	if (pcie_mem.start <= phys_addr && (phys_addr + size) <= pcie_mem.end)
+		mtype = MT_UNCACHED;
+
+	return __arm_ioremap_caller(phys_addr, size, mtype, caller);
+}
+
+/*
+ * When we are I/O coherent and we use the PL310 cache controller, we
+ * add the PL310 property "dma-coherent". This makes sure the outer
+ * sync operation is not used, which allows to workaround the system
+ * erratum that causes deadlocks when doing PCIe in an SMP situation
+ * on Armada 375 and Armada 38x.
+ */
+static void __init mvebu_l2x0_pl310_coherent(void)
+{
+	struct device_node *np;
+
+	if (!coherency_available())
+		return;
+
+	for_each_compatible_node(np, NULL, "arm,pl310-cache") {
+		struct property *p;
+
+		p = kzalloc(sizeof(*p), GFP_KERNEL);
+		p->name = kstrdup("dma-coherent", GFP_KERNEL);
+		of_add_property(np, p);
+	}
+}
+
 static void __init mvebu_timer_and_clk_init(void)
 {
 	of_clk_init(NULL);
@@ -78,6 +121,14 @@ static void __init mvebu_timer_and_clk_init(void)
 	mvebu_scu_enable();
 	coherency_init();
 	BUG_ON(mvebu_mbus_dt_init(coherency_available()));
+
+	if (of_machine_is_compatible("marvell,armada375") ||
+	    of_machine_is_compatible("marvell,armada38x")) {
+		arch_ioremap_caller = armada_pcie_wa_ioremap_caller;
+		pci_ioremap_set_mem_type(MT_UNCACHED);
+		mvebu_l2x0_pl310_coherent();
+	}
+
 	l2x0_of_init(0, ~0UL);
 
 	if (of_machine_is_compatible("marvell,armada375"))
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
