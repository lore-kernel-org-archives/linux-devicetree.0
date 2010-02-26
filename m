From: Dan Carpenter <error27@gmail.com>
Subject: [patch] of: check for IS_ERR()
Date: Fri, 26 Feb 2010 12:49:41 +0300
Message-ID: <20100226094941.GE4912@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "David S. Miller" <davem@davemloft.net>, Jeremy Kerr <jeremy.kerr@canonical.com>, Andy Fleming <afleming@freescale.com>, =?iso-8859-1?B?Suly9G1l?= Pouiller <jezz@sysmic.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

get_phy_device() can return an ERR_PTR()

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I don't have a cross compile environment set up so I can't even compile 
test this.  :/  But err.h is included so it should be OK.

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 18ecae4..b474833 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -69,7 +69,7 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 		}
 
 		phy = get_phy_device(mdio, be32_to_cpup(addr));
-		if (!phy) {
+		if (!phy || IS_ERR(phy)) {
 			dev_err(&mdio->dev, "error probing PHY at address %i\n",
 				*addr);
 			continue;
