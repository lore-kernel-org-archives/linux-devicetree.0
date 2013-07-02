From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] net: ethernet: davinci_emac: remove redundant dev_err
 call in davinci_emac_probe()
Date: Tue, 2 Jul 2013 08:57:47 +0800
Message-ID: <CAPgLHd8L_FW1rJLgBiRdof2irA7cWNchxnAJm+nBP4L46UxWMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: grant.likely@linaro.org, rob.herring@calxeda.com, davem@davemloft.net, mugunthanvnm@ti.com, prabhakar.csengg@gmail.com, jiri@resnulli.us, nsekhar@ti.com
Cc: yongjun_wei@trendmicro.com.cn, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/net/ethernet/ti/davinci_emac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index f118d71..07b176b 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -1870,7 +1870,6 @@ static int davinci_emac_probe(struct platform_device *pdev)
 	priv->emac_base_phys = res->start + pdata->ctrl_reg_offset;
 	priv->remap_addr = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(priv->remap_addr)) {
-		dev_err(&pdev->dev, "unable to map IO\n");
 		rc = PTR_ERR(priv->remap_addr);
 		goto no_pdata;
 	}
