From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCHv4 3/3] ARM: mvebu: implement L2/PCIe deadlock workaround
Date: Thu, 15 May 2014 16:59:34 +0200
Message-ID: <1400165974-9059-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1400165974-9059-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400165974-9059-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Marvell Armada 375 and Armada 38x SOCs, which use the Cortex-A9
CPU core, the PL310 cache and the Marvell PCIe hardware block are
affected a L2/PCIe deadlock caused by a system erratum when hardware
I/O coherency is used.

This deadlock can be avoided by mapping the PCIe memory areas as
strongly-ordered (note: MT_UNCACHED is strongly-ordered), and by
removing the outer cache sync done in software. This is implemented in
this patch by:

 * Registering a custom arch_ioremap_caller function that allows to
   make sure PCI memory regions are mapped MT_UNCACHED.

 * Adding at runtime the 'arm,io-coherent' property to the PL310 cache
   controller. This cannot be done permanently in the DT, because the
   hardware I/O coherency can only be enabled when CONFIG_SMP is
   enabled, in the current kernel situation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-mvebu/coherency.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index d5a975b..f6be9c6 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -31,6 +31,7 @@
 #include <linux/clk.h>
 #include <asm/smp_plat.h>
 #include <asm/cacheflush.h>
+#include <asm/mach/map.h>
 #include "armada-370-xp.h"
 #include "coherency.h"
 #include "mvebu-soc-id.h"
@@ -308,9 +309,47 @@ static void __init armada_370_coherency_init(struct device_node *np)
 	set_cpu_coherent();
 }
 
+/*
+ * This ioremap hook is used on Armada 375/38x to ensure that PCIe
+ * memory areas are mapped as MT_UNCACHED instead of MT_DEVICE. This
+ * is needed as a workaround for a deadlock issue between the PCIe
+ * interface and the cache controller.
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
 static void __init armada_375_380_coherency_init(struct device_node *np)
 {
+	struct device_node *cache_dn;
+
 	coherency_cpu_base = of_iomap(np, 0);
+	arch_ioremap_caller = armada_pcie_wa_ioremap_caller;
+
+	/*
+	 * Add the PL310 property "arm,io-coherent". This makes sure the
+	 * outer sync operation is not used, which allows to
+	 * workaround the system erratum that causes deadlocks when
+	 * doing PCIe in an SMP situation on Armada 375 and Armada
+	 * 38x.
+	 */
+	for_each_compatible_node(cache_dn, NULL, "arm,pl310-cache") {
+		struct property *p;
+
+		p = kzalloc(sizeof(*p), GFP_KERNEL);
+		p->name = kstrdup("arm,io-coherent", GFP_KERNEL);
+		of_add_property(cache_dn, p);
+	}
 }
 
 static int coherency_type(void)
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
