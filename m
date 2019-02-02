From: Moritz Fischer <mdf@kernel.org>
Subject: [net-next RFC/PATCH] net: nixge: Make mdio child node optional
Date: Fri,  1 Feb 2019 18:50:48 -0800
Message-ID: <20190202025048.14772-1-mdf@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, davem@davemloft.net, alex.williams@ni.com, Moritz Fischer <mdf@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Make MDIO child optional and only instantiate the
MDIO bus if the child is actually present.

There are currently no (in-tree) users of this
binding; all (out-of-tree) users use overlays that
get shipped together with the FPGA images that contain
the IP.

This will significantly increase maintainabilty
of future revisions of this IP.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>
---

Hi Rob, Andrew,

I know generally changing bindings is a no-no. Ultimately
I'm working on adding fixed-link support to this driver,
during the review of that Andrew suggested to drop the wrong
binding if I don't need legacy behavior.

In my case I can pretty much guarantee there's no users,
even out of tree due to how we ship the software with our
devices (overlays & fpga images always go together).

I think in the long this change will make the code easier to
maintain and allow to easier support the different variants.

Thanks,

Moritz

---
 .../devicetree/bindings/net/nixge.txt         | 27 ++++++++++++++++---
 drivers/net/ethernet/ni/nixge.c               | 19 ++++++++-----
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nixge.txt b/Documentation/devicetree/bindings/net/nixge.txt
index e55af7f0881a..5a0072b69ce7 100644
--- a/Documentation/devicetree/bindings/net/nixge.txt
+++ b/Documentation/devicetree/bindings/net/nixge.txt
@@ -10,6 +10,9 @@ Required properties:
 - nvmem-cells: Phandle of nvmem cell containing the MAC address
 - nvmem-cell-names: Should be "address"
 
+Optional properties:
+- mdio subnode to indicate presence of MDIO controller
+
 Examples (10G generic PHY):
 	nixge0: ethernet@40000000 {
 		compatible = "ni,xge-enet-2.00";
@@ -25,8 +28,26 @@ Examples (10G generic PHY):
 		phy-mode = "xgmii";
 		phy-handle = <&ethernet_phy1>;
 
-		ethernet_phy1: ethernet-phy@4 {
-			compatible = "ethernet-phy-ieee802.3-c45";
-			reg = <4>;
+		mdio {
+			ethernet_phy1: ethernet-phy@4 {
+				compatible = "ethernet-phy-ieee802.3-c45";
+				reg = <4>;
+			};
 		};
 	};
+
+Examples (10G generic PHY, no MDIO):
+	nixge0: ethernet@40000000 {
+		compatible = "ni,xge-enet-2.00";
+		reg = <0x40000000 0x6000>;
+
+		nvmem-cells = <&eth1_addr>;
+		nvmem-cell-names = "address";
+
+		interrupts = <0 29 IRQ_TYPE_LEVEL_HIGH>, <0 30 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "rx", "tx";
+		interrupt-parent = <&intc>;
+
+		phy-mode = "xgmii";
+		phy-handle = <&ethernet_phy1>;
+	};
diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 1e408d1a9b5f..93d5263cc57e 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -1230,6 +1230,7 @@ static int nixge_probe(struct platform_device *pdev)
 	struct nixge_priv *priv;
 	struct net_device *ndev;
 	struct resource *dmares;
+	struct device_node *mn;
 	const u8 *mac_addr;
 	int err;
 
@@ -1286,10 +1287,14 @@ static int nixge_probe(struct platform_device *pdev)
 	priv->coalesce_count_rx = XAXIDMA_DFT_RX_THRESHOLD;
 	priv->coalesce_count_tx = XAXIDMA_DFT_TX_THRESHOLD;
 
-	err = nixge_mdio_setup(priv, pdev->dev.of_node);
-	if (err) {
-		netdev_err(ndev, "error registering mdio bus");
-		goto free_netdev;
+	mn = of_get_child_by_name(pdev->dev.of_node, "mdio");
+	if (mn) {
+		err = nixge_mdio_setup(priv, mn);
+		of_node_put(mn);
+		if (err) {
+			netdev_err(ndev, "error registering mdio bus");
+			goto free_netdev;
+		}
 	}
 
 	priv->phy_mode = of_get_phy_mode(pdev->dev.of_node);
@@ -1315,7 +1320,8 @@ static int nixge_probe(struct platform_device *pdev)
 	return 0;
 
 unregister_mdio:
-	mdiobus_unregister(priv->mii_bus);
+	if (priv->mii_bus)
+		mdiobus_unregister(priv->mii_bus);
 
 free_netdev:
 	free_netdev(ndev);
@@ -1330,7 +1336,8 @@ static int nixge_remove(struct platform_device *pdev)
 
 	unregister_netdev(ndev);
 
-	mdiobus_unregister(priv->mii_bus);
+	if (priv->mii_bus)
+		mdiobus_unregister(priv->mii_bus);
 
 	free_netdev(ndev);
 
-- 
2.20.1
