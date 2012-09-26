From: Daniel Mack <zonque@gmail.com>
Subject: [PATCH 2/2] net: ti cpsw ethernet: set IFCTL_{A,B} bits for RMII mode
Date: Wed, 26 Sep 2012 19:24:28 +0200
Message-ID: <1348680268-8194-2-git-send-email-zonque@gmail.com>
References: <1348680268-8194-1-git-send-email-zonque@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1348680268-8194-1-git-send-email-zonque@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, Daniel Mack <zonque@gmail.com>, Mugunthan V N <mugunthanvnm@ti.com>, Vaibhav Hiremath <hvaibhav@ti.com>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

For RMII mode operation in 100Mbps, the CPSW needs to set the
IFCTL_A / IFCTL_B bits in the MACCONTROL register.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Cc: Mugunthan V N <mugunthanvnm@ti.com>
Cc: Vaibhav Hiremath <hvaibhav@ti.com>
Cc: David S. Miller <davem@davemloft.net>
---
 drivers/net/ethernet/ti/cpsw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 3d7594e..d88dbfa 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -386,6 +386,12 @@ static void _cpsw_adjust_link(struct cpsw_slave *slave,
 			mac_control |= BIT(7);	/* GIGABITEN	*/
 		if (phy->duplex)
 			mac_control |= BIT(0);	/* FULLDUPLEXEN	*/
+
+		/* set speed_in input in case RMII mode is used in >10Mbps */
+		if (phy->speed > 10 && slave->slave_num < 2 &&
+		    phy->interface == PHY_INTERFACE_MODE_RMII)
+			mac_control |= BIT(15 + slave->slave_num);
+
 		*link = true;
 	} else {
 		mac_control = 0;
-- 
1.7.11.4
