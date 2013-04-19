From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] mmc: mxs-mmc: fix error return code in mxs_mmc_probe()
Date: Fri, 19 Apr 2013 10:11:11 +0800
Message-ID: <CAPgLHd8+rdPX-B8raEjF0ygrG1QC2OFkuTzXw1eeaWsO0dHmcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: cjb@laptop.org, grant.likely@linaro.org, rob.herring@calxeda.com, shawn.guo@linaro.org, marex@denx.de, fabio.estevam@freescale.com, broonie@opensource.wolfsonmicro.com
Cc: yongjun_wei@trendmicro.com.cn, linux-mmc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return -ENODEV in the request dma error case instead
of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mmc/host/mxs-mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
index 4278a17..a09ba6e 100644
--- a/drivers/mmc/host/mxs-mmc.c
+++ b/drivers/mmc/host/mxs-mmc.c
@@ -639,6 +639,7 @@ static int mxs_mmc_probe(struct platform_device *pdev)
 	if (!ssp->dmach) {
 		dev_err(mmc_dev(host->mmc),
 			"%s: failed to request dma\n", __func__);
+		ret = -ENODEV;
 		goto out_clk_put;
 	}
 

