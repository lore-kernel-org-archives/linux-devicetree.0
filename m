From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] of: of_mdio: Fix some endianness problems.
Date: Wed, 27 Oct 2010 18:03:47 -0700
Message-ID: <1288227827-5447-1-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In of_mdiobus_register(), the __be32 *addr variable is dereferenced.
This will not work on little-endian targets.  Also since it is
unsigned, checking for less than zero is redundant.

Fix these two issues.

Signed-off-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
---
 drivers/of/of_mdio.c |   23 ++++++++++++++---------
 1 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 1fce00e..b370306 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -52,27 +52,32 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 
 	/* Loop over the child nodes and register a phy_device for each one */
 	for_each_child_of_node(np, child) {
-		const __be32 *addr;
+		const __be32 *paddr;
+		u32 addr;
 		int len;
 
 		/* A PHY must have a reg property in the range [0-31] */
-		addr = of_get_property(child, "reg", &len);
-		if (!addr || len < sizeof(*addr) || *addr >= 32 || *addr < 0) {
+		paddr = of_get_property(child, "reg", &len);
+		if (!paddr || len < sizeof(*paddr)) {
+addr_err:
 			dev_err(&mdio->dev, "%s has invalid PHY address\n",
 				child->full_name);
 			continue;
 		}
+		addr = be32_to_cpup(paddr);
+		if (addr >= 32)
+			goto addr_err;
 
 		if (mdio->irq) {
-			mdio->irq[*addr] = irq_of_parse_and_map(child, 0);
-			if (!mdio->irq[*addr])
-				mdio->irq[*addr] = PHY_POLL;
+			mdio->irq[addr] = irq_of_parse_and_map(child, 0);
+			if (!mdio->irq[addr])
+				mdio->irq[addr] = PHY_POLL;
 		}
 
-		phy = get_phy_device(mdio, be32_to_cpup(addr));
+		phy = get_phy_device(mdio, addr);
 		if (!phy || IS_ERR(phy)) {
 			dev_err(&mdio->dev, "error probing PHY at address %i\n",
-				*addr);
+				addr);
 			continue;
 		}
 		phy_scan_fixups(phy);
@@ -91,7 +96,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 		}
 
 		dev_dbg(&mdio->dev, "registered phy %s at address %i\n",
-			child->name, *addr);
+			child->name, addr);
 	}
 
 	return 0;
-- 
1.7.2.3
