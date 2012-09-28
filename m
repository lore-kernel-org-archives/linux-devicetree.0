From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] netdev: octeon: fix return value check in octeon_mgmt_init_phy()
Date: Fri, 28 Sep 2012 13:04:21 +0800
Message-ID: <CAPgLHd-Tk9eFL2Sj-7_TZA0ngWejuL69=qzENNG_CrJpaQ_S8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@secretlab.ca, rob.herring@calxeda.com
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
 drivers/net/ethernet/octeon/octeon_mgmt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/octeon/octeon_mgmt.c b/drivers/net/ethernet/octeon/octeon_mgmt.c
index c42bbb1..a688a2d 100644
--- a/drivers/net/ethernet/octeon/octeon_mgmt.c
+++ b/drivers/net/ethernet/octeon/octeon_mgmt.c
@@ -722,10 +722,8 @@ static int octeon_mgmt_init_phy(struct net_device *netdev)
 				   octeon_mgmt_adjust_link, 0,
 				   PHY_INTERFACE_MODE_MII);
 
-	if (IS_ERR(p->phydev)) {
-		p->phydev = NULL;
+	if (!p->phydev)
 		return -1;
-	}
 
 	phy_start_aneg(p->phydev);
 
