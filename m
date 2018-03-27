From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [net-next PATCH v2 08/10] net: netcp: ethss: use of_get_phy_mode() to
 support different RGMII modes
Date: Tue, 27 Mar 2018 12:31:47 -0400
Message-ID: <1522168309-12338-9-git-send-email-m-karicheri2@ti.com>
References: <1522168309-12338-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1522168309-12338-1-git-send-email-m-karicheri2@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ssantosh@kernel.org, malat@debian.org, w-kwok2@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, davem@davemloft.net, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The phy used for K2G allows for internal delays to be added optionally
to the clock circuitry based on board desing. To add this support,
enhance the driver to use of_get_phy_mode() to read the phy-mode from
the phy device and pass the same to phy through of_phy_connect().

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 drivers/net/ethernet/ti/netcp_ethss.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index 26ccddb..df163ec 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -21,6 +21,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_mdio.h>
+#include <linux/of_net.h>
 #include <linux/of_address.h>
 #include <linux/if_vlan.h>
 #include <linux/ptp_classify.h>
@@ -700,6 +701,7 @@ struct gbe_slave {
 	u32				link_interface;
 	u32				mac_control;
 	u8				phy_port_t;
+	struct device_node		*node;
 	struct device_node		*phy_node;
 	struct ts_ctl                   ts_ctl;
 	struct list_head		slave_list;
@@ -2317,6 +2319,15 @@ static int gbe_slave_open(struct gbe_intf *gbe_intf)
 		has_phy = true;
 		phy_mode = PHY_INTERFACE_MODE_SGMII;
 		slave->phy_port_t = PORT_MII;
+	} else if (slave->link_interface == RGMII_LINK_MAC_PHY) {
+		has_phy = true;
+		phy_mode = of_get_phy_mode(slave->node);
+		/* if phy-mode is not present, default to
+		 * PHY_INTERFACE_MODE_RGMII
+		 */
+		if (phy_mode < 0)
+			phy_mode = PHY_INTERFACE_MODE_RGMII;
+		slave->phy_port_t = PORT_MII;
 	} else if (slave->link_interface == XGMII_LINK_MAC_PHY) {
 		has_phy = true;
 		phy_mode = PHY_INTERFACE_MODE_NA;
@@ -2942,6 +2953,7 @@ static int init_slave(struct gbe_priv *gbe_dev, struct gbe_slave *slave,
 		slave->link_interface = SGMII_LINK_MAC_PHY;
 	}
 
+	slave->node = node;
 	slave->open = false;
 	if ((slave->link_interface == SGMII_LINK_MAC_PHY) ||
 	    (slave->link_interface == RGMII_LINK_MAC_PHY) ||
-- 
1.9.1
