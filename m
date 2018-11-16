From: Rob Herring <robh@kernel.org>
Subject: [PATCH] MIPS: Use device_type helpers to access the node type
Date: Fri, 16 Nov 2018 16:10:58 -0600
Message-ID: <20181116221104.23024-2-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <jhogan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Remove directly accessing device_node.type pointer and use the accessors
instead. This will eventually allow removing the type pointer.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: linux-mips@linux-mips.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/mips/pci/pci-rt3883.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/pci/pci-rt3883.c b/arch/mips/pci/pci-rt3883.c
index 958899ffe99c..bafbf69e7dc4 100644
--- a/arch/mips/pci/pci-rt3883.c
+++ b/arch/mips/pci/pci-rt3883.c
@@ -445,8 +445,7 @@ static int rt3883_pci_probe(struct platform_device *pdev)
 
 	/* find the PCI host bridge child node */
 	for_each_child_of_node(np, child) {
-		if (child->type &&
-		    of_node_cmp(child->type, "pci") == 0) {
+		if (of_node_is_type(child, "pci")) {
 			rpc->pci_controller.of_node = child;
 			break;
 		}
@@ -464,8 +463,7 @@ static int rt3883_pci_probe(struct platform_device *pdev)
 	for_each_available_child_of_node(rpc->pci_controller.of_node, child) {
 		int devfn;
 
-		if (!child->type ||
-		    of_node_cmp(child->type, "pci") != 0)
+		if (!of_node_is_type(child, "pci"))
 			continue;
 
 		devfn = of_pci_get_devfn(child);
-- 
2.19.1
