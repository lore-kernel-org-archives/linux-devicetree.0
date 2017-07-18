From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] microblaze: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:42:44 -0500
Message-ID: <20170718214339.7774-4-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
---
 arch/microblaze/kernel/timer.c   |  2 +-
 arch/microblaze/pci/pci-common.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/microblaze/kernel/timer.c b/arch/microblaze/kernel/timer.c
index ea2d83f1f4bb..7de941cbbd94 100644
--- a/arch/microblaze/kernel/timer.c
+++ b/arch/microblaze/kernel/timer.c
@@ -293,7 +293,7 @@ static int __init xilinx_timer_init(struct device_node *timer)
 		return -EINVAL;
 	}

-	pr_info("%s: irq=%d\n", timer->full_name, irq);
+	pr_info("%pOF: irq=%d\n", timer, irq);

 	clk = of_clk_get(timer, 0);
 	if (IS_ERR(clk)) {
diff --git a/arch/microblaze/pci/pci-common.c b/arch/microblaze/pci/pci-common.c
index 404fb38d06b7..180f4755ca66 100644
--- a/arch/microblaze/pci/pci-common.c
+++ b/arch/microblaze/pci/pci-common.c
@@ -508,8 +508,8 @@ void pci_process_bridge_OF_ranges(struct pci_controller *hose,
 	struct of_pci_range range;
 	struct of_pci_range_parser parser;

-	pr_info("PCI host bridge %s %s ranges:\n",
-	       dev->full_name, primary ? "(primary)" : "");
+	pr_info("PCI host bridge %pOF %s ranges:\n",
+	       dev, primary ? "(primary)" : "");

 	/* Check for ranges property */
 	if (of_pci_range_parser_init(&parser, dev))
@@ -1219,8 +1219,8 @@ static void pcibios_setup_phb_resources(struct pci_controller *hose,

 	if (!res->flags) {
 		pr_warn("PCI: I/O resource not set for host ");
-		pr_cont("bridge %s (domain %d)\n",
-			hose->dn->full_name, hose->global_number);
+		pr_cont("bridge %pOF (domain %d)\n",
+			hose->dn, hose->global_number);
 		/* Workaround for lack of IO resource only on 32-bit */
 		res->start = (unsigned long)hose->io_base_virt - isa_io_base;
 		res->end = res->start + IO_SPACE_LIMIT;
@@ -1241,8 +1241,8 @@ static void pcibios_setup_phb_resources(struct pci_controller *hose,
 			if (i > 0)
 				continue;
 			pr_err("PCI: Memory resource 0 not set for ");
-			pr_cont("host bridge %s (domain %d)\n",
-				hose->dn->full_name, hose->global_number);
+			pr_cont("host bridge %pOF (domain %d)\n",
+				hose->dn, hose->global_number);

 			/* Workaround for lack of MEM resource only on 32-bit */
 			res->start = hose->pci_mem_offset;
@@ -1270,7 +1270,7 @@ static void pcibios_scan_phb(struct pci_controller *hose)
 	struct pci_bus *bus;
 	struct device_node *node = hose->dn;

-	pr_debug("PCI: Scanning PHB %s\n", of_node_full_name(node));
+	pr_debug("PCI: Scanning PHB %pOF\n", node);

 	pcibios_setup_phb_resources(hose, &resources);

--
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
