From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/9] net: bcmgenet: fix OF child-node lookup
Date: Wed, 22 Aug 2018 12:55:44 +0200
Message-ID: <20180822105547.9634-7-johan@kernel.org>
References: <20180822105547.9634-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822105547.9634-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

Use the new of_get_compatible_child() helper to lookup the mdio child
node instead of using of_find_compatible_node(), which searches the
entire tree and thus can return an unrelated (i.e. non-child) node.

This also addresses a potential use-after-free (e.g. after probe
deferral) as the tree-wide helper drops a reference to its first
argument (i.e. the node of the device being probed).

Fixes: aa09677cba42 ("net: bcmgenet: add MDIO routines")
Cc: stable <stable@vger.kernel.org>     # 3.15
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: David S. Miller <davem@davemloft.net>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index 5333274a283c..87fc65560ceb 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -333,7 +333,7 @@ static struct device_node *bcmgenet_mii_of_find_mdio(struct bcmgenet_priv *priv)
 	if (!compat)
 		return NULL;
 
-	priv->mdio_dn = of_find_compatible_node(dn, NULL, compat);
+	priv->mdio_dn = of_get_compatible_child(dn, compat);
 	kfree(compat);
 	if (!priv->mdio_dn) {
 		dev_err(kdev, "unable to find MDIO bus node\n");
-- 
2.18.0
