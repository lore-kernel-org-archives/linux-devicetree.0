From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH 2/4] powerpc/mm: create numa nodes for hotplug memory
Date: Mon,  8 Aug 2016 13:27:21 -0500
Message-ID: <1470680843-28702-3-git-send-email-arbab@linux.vnet.ibm.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When scanning the device tree to initialize the system NUMA topology,
process dt elements with compatible id "ibm,hotplug-aperture" to create
memoryless numa nodes.

These nodes will be filled when hotplug occurs within the associated
address range.

Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
---
 arch/powerpc/mm/numa.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 75b9cd6..80d067d 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -708,6 +708,12 @@ static void __init parse_drconf_memory(struct device_node *memory)
 	}
 }
 
+static const struct of_device_id memory_match[] = {
+	{ .type = "memory" },
+	{ .compatible = "ibm,hotplug-aperture" },
+	{ /* sentinel */ }
+};
+
 static int __init parse_numa_properties(void)
 {
 	struct device_node *memory;
@@ -752,7 +758,7 @@ static int __init parse_numa_properties(void)
 
 	get_n_mem_cells(&n_mem_addr_cells, &n_mem_size_cells);
 
-	for_each_node_by_type(memory, "memory") {
+	for_each_matching_node(memory, memory_match) {
 		unsigned long start;
 		unsigned long size;
 		int nid;
@@ -1080,7 +1086,7 @@ static int hot_add_node_scn_to_nid(unsigned long scn_addr)
 	struct device_node *memory;
 	int nid = -1;
 
-	for_each_node_by_type(memory, "memory") {
+	for_each_matching_node(memory, memory_match) {
 		unsigned long start, size;
 		int ranges;
 		const __be32 *memcell_buf;
-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
