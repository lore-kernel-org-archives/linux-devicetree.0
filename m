From: Rob Herring <robh@kernel.org>
Subject: [PATCH] PCI: Use of_node_name_eq for node name comparisons
Date: Wed,  5 Dec 2018 13:50:34 -0600
Message-ID: <20181205195050.4759-18-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Convert string compares of DT node names to use of_node_name_eq helper
instead. This removes direct access to the node name pointer.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/hotplug/rpaphp_core.c | 2 +-
 drivers/pci/of.c                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index bcd5d357ca23..7697d9c92b98 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -354,7 +354,7 @@ int rpaphp_add_slot(struct device_node *dn)
 	const int *indexes, *names, *types, *power_domains;
 	char *name, *type;
 
-	if (!dn->name || strcmp(dn->name, "pci"))
+	if (!of_node_name_eq(dn, "pci"))
 		return 0;
 
 	/* If this is not a hotplug slot, return without doing anything. */
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 4c4217d0c3f1..3d32da15c215 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -113,7 +113,7 @@ struct device_node *of_pci_find_child_device(struct device_node *parent,
 		 * a fake root for all functions of a multi-function
 		 * device we go down them as well.
 		 */
-		if (!strcmp(node->name, "multifunc-device")) {
+		if (of_node_name_eq(node, "multifunc-device")) {
 			for_each_child_of_node(node, node2) {
 				if (__of_pci_pci_compare(node2, devfn)) {
 					of_node_put(node);
-- 
2.19.1
