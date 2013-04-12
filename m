From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] net/at91_ether: fix error return code in at91ether_probe()
Date: Fri, 12 Apr 2013 10:42:40 +0800
Message-ID: <CAPgLHd_Toj+g36MdPJ2p=Vb+9mHAyZfM3KP=V2vyXV9rA7Vx4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: nicolas.ferre@atmel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0, as returned elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/net/ethernet/cadence/at91_ether.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/at91_ether.c b/drivers/net/ethernet/cadence/at91_ether.c
index 3becdb2..1b3b92b 100644
--- a/drivers/net/ethernet/cadence/at91_ether.c
+++ b/drivers/net/ethernet/cadence/at91_ether.c
@@ -430,7 +430,8 @@ static int __init at91ether_probe(struct platform_device *pdev)
 	if (res)
 		goto err_disable_clock;
 
-	if (macb_mii_init(lp) != 0)
+	res = macb_mii_init(lp);
+	if (res)
 		goto err_out_unregister_netdev;
 
 	/* will be enabled in open() */
