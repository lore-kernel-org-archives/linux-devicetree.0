From: Kleber Sacilotto de Souza <klebers-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] of: fix PCI bus match for PCIe slots
Date: Thu, 30 Jan 2014 21:29:44 -0200
Message-ID: <1391124584-28847-1-git-send-email-klebers@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Brian King <brking-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kleber Sacilotto de Souza <klebers-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On IBM pseries systems the device_type device-tree property of a PCIe
bridge contains the string "pciex". The of_bus_pci_match() function was
looking only for "pci" on this property, so in such cases the bus
matching code was falling back to the default bus, causing problems on
functions that should be using "assigned-addresses" for region address
translation. This patch fixes the problem by also looking for "pciex" on
the PCI bus match function.

Signed-off-by: Kleber Sacilotto de Souza <klebers-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 drivers/of/address.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index d3dd41c..0da2c0f 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -102,8 +102,8 @@ static int of_bus_pci_match(struct device_node *np)
 	 * "vci" is for the /chaos bridge on 1st-gen PCI powermacs
 	 * "ht" is hypertransport
 	 */
-	return !strcmp(np->type, "pci") || !strcmp(np->type, "vci") ||
-		!strcmp(np->type, "ht");
+	return !strcmp(np->type, "pci") || !strcmp(np->type, "pciex") ||
+		!strcmp(np->type, "vci") || !strcmp(np->type, "ht");
 }
 
 static void of_bus_pci_count_cells(struct device_node *np,
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
