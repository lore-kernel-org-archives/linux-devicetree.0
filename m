From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] net: sun4i-emac: fix a typo in emac_probe()
Date: Mon, 3 Jun 2013 21:36:52 +0800
Message-ID: <CAPgLHd-fXnt9H_CxDD1Ww=C-6nn3COVkYirKY6ucOJVR2Pkwkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@linaro.org, rob.herring@calxeda.com, maxime.ripard@free-electrons.com, davem@davemloft.net, sr@denx.de
Cc: yongjun_wei@trendmicro.com.cn, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Just fixed a typo in emac_probe().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/net/ethernet/allwinner/sun4i-emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index b411344..26083cd 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -821,7 +821,7 @@ static int emac_probe(struct platform_device *pdev)
 	db->membase = of_iomap(np, 0);
 	if (!db->membase) {
 		dev_err(&pdev->dev, "failed to remap registers\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
 		goto out;
 	}
 
