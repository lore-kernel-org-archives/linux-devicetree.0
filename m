From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2] misc: cxl: Use device_type helpers to access the node type
Date: Wed,  5 Dec 2018 13:16:55 -0600
Message-ID: <20181205191655.14612-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <andrew.donnellan@au1.ibm.com>
List-Id: devicetree@vger.kernel.org

Remove directly accessing device_type property and use the
of_node_is_type accessor instead. While not using it here, this is
part of eventually removing the struct device_node.type pointer.

Cc: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org
Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
- Reword commit message as this change was using the .type ptr.

 drivers/misc/cxl/pci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
index b66d832d3233..c79ba1c699ad 100644
--- a/drivers/misc/cxl/pci.c
+++ b/drivers/misc/cxl/pci.c
@@ -1718,7 +1718,6 @@ int cxl_slot_is_switched(struct pci_dev *dev)
 {
 	struct device_node *np;
 	int depth = 0;
-	const __be32 *prop;
 
 	if (!(np = pci_device_to_OF_node(dev))) {
 		pr_err("cxl: np = NULL\n");
@@ -1727,8 +1726,7 @@ int cxl_slot_is_switched(struct pci_dev *dev)
 	of_node_get(np);
 	while (np) {
 		np = of_get_next_parent(np);
-		prop = of_get_property(np, "device_type", NULL);
-		if (!prop || strcmp((char *)prop, "pciex"))
+		if (!of_node_is_type(np, "pciex"))
 			break;
 		depth++;
 	}
-- 
2.19.1
