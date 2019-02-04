From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/2] r8169: Load MAC address from device tree if present
Date: Mon,  4 Feb 2019 17:42:12 +0100
Message-ID: <20190204164213.30727-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Realtek linux nic maintainers <nic_swsd@realtek.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

If the system was booted using a device tree and if the device tree
contains a MAC address, use it instead of reading one from the EEPROM.
This is useful in situations where the EEPROM isn't properly programmed
or where the firmware wants to override the existing MAC address.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Applies to net-next.

Changes in v2:
- rewrite error check for readability
- initialize mac_addr array

 drivers/net/ethernet/realtek/r8169.c | 36 ++++++++++++++++++----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
index e8a112149a62..501891be7c56 100644
--- a/drivers/net/ethernet/realtek/r8169.c
+++ b/drivers/net/ethernet/realtek/r8169.c
@@ -7110,6 +7110,21 @@ static int rtl_alloc_irq(struct rtl8169_private *tp)
 	return pci_alloc_irq_vectors(tp->pci_dev, 1, 1, flags);
 }
 
+static void rtl_read_mac_address(struct rtl8169_private *tp,
+				 u8 mac_addr[ETH_ALEN])
+{
+	/* Get MAC address */
+	switch (tp->mac_version) {
+	case RTL_GIGA_MAC_VER_35 ... RTL_GIGA_MAC_VER_38:
+	case RTL_GIGA_MAC_VER_40 ... RTL_GIGA_MAC_VER_51:
+		*(u32 *)&mac_addr[0] = rtl_eri_read(tp, 0xe0, ERIAR_EXGMAC);
+		*(u16 *)&mac_addr[4] = rtl_eri_read(tp, 0xe4, ERIAR_EXGMAC);
+		break;
+	default:
+		break;
+	}
+}
+
 DECLARE_RTL_COND(rtl_link_list_ready_cond)
 {
 	return RTL_R8(tp, MCU) & LINK_LIST_RDY;
@@ -7301,6 +7316,7 @@ static int rtl_get_ether_clk(struct rtl8169_private *tp)
 static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct rtl_cfg_info *cfg = rtl_cfg_infos + ent->driver_data;
+	u8 mac_addr[ETH_ALEN] __aligned(4) = {};
 	struct rtl8169_private *tp;
 	struct net_device *dev;
 	int chipset, region, i;
@@ -7403,20 +7419,14 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	u64_stats_init(&tp->rx_stats.syncp);
 	u64_stats_init(&tp->tx_stats.syncp);
 
-	/* Get MAC address */
-	switch (tp->mac_version) {
-		u8 mac_addr[ETH_ALEN] __aligned(4);
-	case RTL_GIGA_MAC_VER_35 ... RTL_GIGA_MAC_VER_38:
-	case RTL_GIGA_MAC_VER_40 ... RTL_GIGA_MAC_VER_51:
-		*(u32 *)&mac_addr[0] = rtl_eri_read(tp, 0xe0, ERIAR_EXGMAC);
-		*(u16 *)&mac_addr[4] = rtl_eri_read(tp, 0xe4, ERIAR_EXGMAC);
+	/* get MAC address */
+	rc = eth_platform_get_mac_address(&pdev->dev, mac_addr);
+	if (rc)
+		rtl_read_mac_address(tp, mac_addr);
+
+	if (is_valid_ether_addr(mac_addr))
+		rtl_rar_set(tp, mac_addr);
 
-		if (is_valid_ether_addr(mac_addr))
-			rtl_rar_set(tp, mac_addr);
-		break;
-	default:
-		break;
-	}
 	for (i = 0; i < ETH_ALEN; i++)
 		dev->dev_addr[i] = RTL_R8(tp, MAC0 + i);
 
-- 
2.19.1
