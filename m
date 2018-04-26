From: Moritz Fischer <mdf@kernel.org>
Subject: [RFC/PATCH] net: ethernet: nixge: Use of_get_mac_address()
Date: Thu, 26 Apr 2018 14:57:42 -0700
Message-ID: <20180426215742.18966-1-mdf@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

Make nixge driver work with 'mac-address' property instead of
'address' property. There are currently no in-tree users and
the only users of this driver are devices that use overlays
we control to instantiate the device together with the corresponding
FPGA images.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
---

Hi David, Rob,

with Mike's change that enable the generic 'mac-address'
binding that I barely missed with the submission of this
driver I was wondering if we can still change the binding.

I'm aware that this generally is a nonono case, since the binding
is considered API, but since there are no users outside of our
devicetree overlays that we ship with our devices I thought I'd ask.

If you don't think that's a good idea do you think supporting both
would be worthwhile?

Thanks,

Moritz

---
 .../devicetree/bindings/net/nixge.txt         |  4 ++--
 drivers/net/ethernet/ni/nixge.c               | 20 ++-----------------
 2 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/nixge.txt b/Documentation/devicetree/bindings/net/nixge.txt
index e55af7f0881a..9bc1ecfb6762 100644
--- a/Documentation/devicetree/bindings/net/nixge.txt
+++ b/Documentation/devicetree/bindings/net/nixge.txt
@@ -8,7 +8,7 @@ Required properties:
 - phy-mode: See ethernet.txt file in the same directory.
 - phy-handle: See ethernet.txt file in the same directory.
 - nvmem-cells: Phandle of nvmem cell containing the MAC address
-- nvmem-cell-names: Should be "address"
+- nvmem-cell-names: Should be "mac-address"
 
 Examples (10G generic PHY):
 	nixge0: ethernet@40000000 {
@@ -16,7 +16,7 @@ Examples (10G generic PHY):
 		reg = <0x40000000 0x6000>;
 
 		nvmem-cells = <&eth1_addr>;
-		nvmem-cell-names = "address";
+		nvmem-cell-names = "mac-address";
 
 		interrupts = <0 29 IRQ_TYPE_LEVEL_HIGH>, <0 30 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "rx", "tx";
diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 27364b7572fc..7918c7b7273b 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -1162,22 +1162,6 @@ static int nixge_mdio_setup(struct nixge_priv *priv, struct device_node *np)
 	return of_mdiobus_register(bus, np);
 }
 
-static void *nixge_get_nvmem_address(struct device *dev)
-{
-	struct nvmem_cell *cell;
-	size_t cell_size;
-	char *mac;
-
-	cell = nvmem_cell_get(dev, "address");
-	if (IS_ERR(cell))
-		return cell;
-
-	mac = nvmem_cell_read(cell, &cell_size);
-	nvmem_cell_put(cell);
-
-	return mac;
-}
-
 static int nixge_probe(struct platform_device *pdev)
 {
 	struct nixge_priv *priv;
@@ -1201,8 +1185,8 @@ static int nixge_probe(struct platform_device *pdev)
 	ndev->min_mtu = 64;
 	ndev->max_mtu = NIXGE_JUMBO_MTU;
 
-	mac_addr = nixge_get_nvmem_address(&pdev->dev);
-	if (mac_addr && is_valid_ether_addr(mac_addr))
+	mac_addr = of_get_mac_address(np);
+	if (mac_addr)
 		ether_addr_copy(ndev->dev_addr, mac_addr);
 	else
 		eth_hw_addr_random(ndev);
-- 
2.17.0
