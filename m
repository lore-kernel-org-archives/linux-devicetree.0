From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 3/3] of_mdio: use PTR_ERR_OR_ZERO()
Date: Sun, 13 Mar 2016 00:34:58 +0300
Message-ID: <4102374.DztQrXbNvq@wasted.cogentembedded.com>
References: <2682275.WNlbxTfNal@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <2682275.WNlbxTfNal@wasted.cogentembedded.com>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, netdev@vger.kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

PTR_ERR_OR_ZERO() is open coded in of_phy_register_fixed_link(), so just
call it directly...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

---
Changes in version 2:
- added the "Reviewed-by:" tags.

 drivers/of/of_mdio.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: net-next/drivers/of/of_mdio.c
===================================================================
--- net-next.orig/drivers/of/of_mdio.c
+++ net-next/drivers/of/of_mdio.c
@@ -412,7 +412,7 @@ int of_phy_register_fixed_link(struct de
 		if (strcmp(managed, "in-band-status") == 0) {
 			/* status is zeroed, namely its .link member */
 			phy = fixed_phy_register(PHY_POLL, &status, -1, np);
-			return IS_ERR(phy) ? PTR_ERR(phy) : 0;
+			return PTR_ERR_OR_ZERO(phy);
 		}
 	}
 
@@ -434,7 +434,7 @@ int of_phy_register_fixed_link(struct de
 			return -EPROBE_DEFER;
 
 		phy = fixed_phy_register(PHY_POLL, &status, link_gpio, np);
-		return IS_ERR(phy) ? PTR_ERR(phy) : 0;
+		return PTR_ERR_OR_ZERO(phy);
 	}
 
 	/* Old binding */
@@ -446,7 +446,7 @@ int of_phy_register_fixed_link(struct de
 		status.pause = be32_to_cpu(fixed_link_prop[3]);
 		status.asym_pause = be32_to_cpu(fixed_link_prop[4]);
 		phy = fixed_phy_register(PHY_POLL, &status, -1, np);
-		return IS_ERR(phy) ? PTR_ERR(phy) : 0;
+		return PTR_ERR_OR_ZERO(phy);
 	}
 
 	return -ENODEV;
