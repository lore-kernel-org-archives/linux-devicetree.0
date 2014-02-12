From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC v7 6/6] HACK mmc: mxcmmc: enable clocks for the MPC512x
Date: Wed, 12 Feb 2014 17:25:08 +0400
Message-ID: <1392211508-23615-7-git-send-email-a13xp0p0v88@gmail.com>
References: <1392211508-23615-1-git-send-email-a13xp0p0v88@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392211508-23615-1-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>

Q&D HACK to enable SD card support without correct COMMON_CLK support,
best viewed with 'git diff -w -b', NOT acceptable for mainline (NAKed)

Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
[ a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: resolve little patch conflict ]
---
 drivers/mmc/host/mxcmmc.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index f7199c8..ddefa60 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -1123,20 +1123,29 @@ static int mxcmci_probe(struct platform_device *pdev)
 	host->res = r;
 	host->irq = irq;
 
-	host->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
-	if (IS_ERR(host->clk_ipg)) {
-		ret = PTR_ERR(host->clk_ipg);
-		goto out_iounmap;
-	}
+	if (!is_mpc512x_mmc(host)) {
+		host->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
+		if (IS_ERR(host->clk_ipg)) {
+			ret = PTR_ERR(host->clk_ipg);
+			goto out_iounmap;
+		}
 
-	host->clk_per = devm_clk_get(&pdev->dev, "per");
-	if (IS_ERR(host->clk_per)) {
-		ret = PTR_ERR(host->clk_per);
-		goto out_iounmap;
+		host->clk_per = devm_clk_get(&pdev->dev, "per");
+		if (IS_ERR(host->clk_per)) {
+			ret = PTR_ERR(host->clk_per);
+			goto out_iounmap;
+		}
+	} else {
+		host->clk_per = devm_clk_get(&pdev->dev, "sdhc_clk");
+		if (IS_ERR(host->clk_per)) {
+			ret = PTR_ERR(host->clk_per);
+			goto out_iounmap;
+		}
 	}
 
 	clk_prepare_enable(host->clk_per);
-	clk_prepare_enable(host->clk_ipg);
+	if (host->clk_ipg)
+		clk_prepare_enable(host->clk_ipg);
 
 	mxcmci_softreset(host);
 
@@ -1206,7 +1215,8 @@ out_free_dma:
 		dma_release_channel(host->dma);
 out_clk_put:
 	clk_disable_unprepare(host->clk_per);
-	clk_disable_unprepare(host->clk_ipg);
+	if (host->clk_ipg)
+		clk_disable_unprepare(host->clk_ipg);
 out_iounmap:
 	iounmap(host->base);
 out_free:
@@ -1236,7 +1246,8 @@ static int mxcmci_remove(struct platform_device *pdev)
 		dma_release_channel(host->dma);
 
 	clk_disable_unprepare(host->clk_per);
-	clk_disable_unprepare(host->clk_ipg);
+	if (host->clk_ipg)
+		clk_disable_unprepare(host->clk_ipg);
 
 	release_mem_region(host->res->start, resource_size(host->res));
 
@@ -1252,7 +1263,9 @@ static int mxcmci_suspend(struct device *dev)
 	struct mxcmci_host *host = mmc_priv(mmc);
 
 	clk_disable_unprepare(host->clk_per);
-	clk_disable_unprepare(host->clk_ipg);
+	if (host->clk_ipg)
+		clk_disable_unprepare(host->clk_ipg);
+
 	return 0;
 }
 
@@ -1262,7 +1275,8 @@ static int mxcmci_resume(struct device *dev)
 	struct mxcmci_host *host = mmc_priv(mmc);
 
 	clk_prepare_enable(host->clk_per);
-	clk_prepare_enable(host->clk_ipg);
+	if (host->clk_ipg)
+		clk_prepare_enable(host->clk_ipg);
 	return 0;
 }
 
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
