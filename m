From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 6/9] usb: xhci-mtk: add optional mcu and dma bus clocks
Date: Fri, 13 Oct 2017 16:26:38 +0800
Message-ID: <3f81e076f513ef7d3e3e20ba2f752ed5bd48c9a2.1507882470.git.chunfeng.yun@mediatek.com>
References: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1507882470.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1507882470.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

There are mcu_bus and dma_bus clocks needed to be controlled by
driver on some SoCs, so add them as optional ones

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/host/xhci-mtk.c |   79 ++++++++++++++++++++++++++++++++-----------
 drivers/usb/host/xhci-mtk.h |    2 ++
 2 files changed, 62 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index d60463c..e5caabe 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -221,6 +221,44 @@ static int xhci_mtk_ssusb_config(struct xhci_hcd_mtk *mtk)
 	return xhci_mtk_host_enable(mtk);
 }
 
+/* ignore the error if the clock does not exist */
+static struct clk *optional_clk_get(struct device *dev, const char *id)
+{
+	struct clk *opt_clk;
+
+	opt_clk = devm_clk_get(dev, id);
+	/* ignore error number except EPROBE_DEFER */
+	if (IS_ERR(opt_clk) && (PTR_ERR(opt_clk) != -EPROBE_DEFER))
+		opt_clk = NULL;
+
+	return opt_clk;
+}
+
+static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
+{
+	struct device *dev = mtk->dev;
+
+	mtk->sys_clk = devm_clk_get(dev, "sys_ck");
+	if (IS_ERR(mtk->sys_clk)) {
+		dev_err(dev, "fail to get sys_ck\n");
+		return PTR_ERR(mtk->sys_clk);
+	}
+
+	mtk->ref_clk = optional_clk_get(dev, "ref_ck");
+	if (IS_ERR(mtk->ref_clk))
+		return PTR_ERR(mtk->ref_clk);
+
+	mtk->mcu_clk = optional_clk_get(dev, "mcu_ck");
+	if (IS_ERR(mtk->mcu_clk))
+		return PTR_ERR(mtk->mcu_clk);
+
+	mtk->dma_clk = optional_clk_get(dev, "dma_ck");
+	if (IS_ERR(mtk->dma_clk))
+		return PTR_ERR(mtk->dma_clk);
+
+	return 0;
+}
+
 static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 {
 	int ret;
@@ -237,16 +275,34 @@ static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 		goto sys_clk_err;
 	}
 
+	ret = clk_prepare_enable(mtk->mcu_clk);
+	if (ret) {
+		dev_err(mtk->dev, "failed to enable mcu_clk\n");
+		goto mcu_clk_err;
+	}
+
+	ret = clk_prepare_enable(mtk->dma_clk);
+	if (ret) {
+		dev_err(mtk->dev, "failed to enable dma_clk\n");
+		goto dma_clk_err;
+	}
+
 	return 0;
 
+dma_clk_err:
+	clk_disable_unprepare(mtk->mcu_clk);
+mcu_clk_err:
+	clk_disable_unprepare(mtk->sys_clk);
 sys_clk_err:
 	clk_disable_unprepare(mtk->ref_clk);
 ref_clk_err:
-	return -EINVAL;
+	return ret;
 }
 
 static void xhci_mtk_clks_disable(struct xhci_hcd_mtk *mtk)
 {
+	clk_disable_unprepare(mtk->dma_clk);
+	clk_disable_unprepare(mtk->mcu_clk);
 	clk_disable_unprepare(mtk->sys_clk);
 	clk_disable_unprepare(mtk->ref_clk);
 }
@@ -529,24 +585,9 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return PTR_ERR(mtk->vusb33);
 	}
 
-	mtk->sys_clk = devm_clk_get(dev, "sys_ck");
-	if (IS_ERR(mtk->sys_clk)) {
-		dev_err(dev, "fail to get sys_ck\n");
-		return PTR_ERR(mtk->sys_clk);
-	}
-
-	/*
-	 * reference clock is usually a "fixed-clock", make it optional
-	 * for backward compatibility and ignore the error if it does
-	 * not exist.
-	 */
-	mtk->ref_clk = devm_clk_get(dev, "ref_ck");
-	if (IS_ERR(mtk->ref_clk)) {
-		if (PTR_ERR(mtk->ref_clk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
