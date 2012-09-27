From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] netdev: pasemi: fix return value check in pasemi_mac_phy_init()
Date: Thu, 27 Sep 2012 13:51:58 +0800
Message-ID: <CAPgLHd8hJjj1HkV7gc8QH2p9rDJQedkc+vCUpFJMgyXQua4LGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: olof@lixom.net, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function of_phy_connect() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test.

dpatch engine is used to auto generate this patch.
(https://github.com/weiyj/dpatch)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/net/ethernet/pasemi/pasemi_mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/pasemi/pasemi_mac.c b/drivers/net/ethernet/pasemi/pasemi_mac.c
index e559dfa..6fa74d5 100644
--- a/drivers/net/ethernet/pasemi/pasemi_mac.c
+++ b/drivers/net/ethernet/pasemi/pasemi_mac.c
@@ -1101,9 +1101,9 @@ static int pasemi_mac_phy_init(struct net_device *dev)
 	phydev = of_phy_connect(dev, phy_dn, &pasemi_adjust_link, 0,
 				PHY_INTERFACE_MODE_SGMII);
 
-	if (IS_ERR(phydev)) {
+	if (!phydev) {
 		printk(KERN_ERR "%s: Could not attach to phy\n", dev->name);
-		return PTR_ERR(phydev);
+		return -ENODEV;
 	}
 
 	mac->phydev = phydev;
