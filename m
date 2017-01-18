From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/6] usb: xhci-mtk: add reference clock
Date: Wed, 18 Jan 2017 14:08:24 +0800
Message-ID: <1484719707-12107-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1484719707-12107-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1484719707-12107-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

usually, the reference clock comes from 26M oscillator directly,
but some SoCs are not, add it for compatibility.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/host/xhci-mtk.c |   15 +++++++++++++++
 drivers/usb/host/xhci-mtk.h |    1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 1094ebd..4d75ac5 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -212,6 +212,12 @@ static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 {
 	int ret;
 
+	ret = clk_prepare_enable(mtk->ref_clk);
+	if (ret) {
+		dev_err(mtk->dev, "failed to enable ref_clk\n");
+		goto ref_clk_err;
+	}
+
 	ret = clk_prepare_enable(mtk->sys_clk);
 	if (ret) {
 		dev_err(mtk->dev, "failed to enable sys_clk\n");
@@ -238,6 +244,8 @@ static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 usb_p0_err:
 	clk_disable_unprepare(mtk->sys_clk);
 sys_clk_err:
+	clk_disable_unprepare(mtk->ref_clk);
+ref_clk_err:
 	return -EINVAL;
 }
 
@@ -248,6 +256,7 @@ static void xhci_mtk_clks_disable(struct xhci_hcd_mtk *mtk)
 		clk_disable_unprepare(mtk->wk_deb_p0);
 	}
 	clk_disable_unprepare(mtk->sys_clk);
+	clk_disable_unprepare(mtk->ref_clk);
 }
 
 /* only clocks can be turn off for ip-sleep wakeup mode */
@@ -550,6 +559,12 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return PTR_ERR(mtk->sys_clk);
 	}
 
+	mtk->ref_clk = devm_clk_get(dev, "ref_ck");
+	if (IS_ERR(mtk->ref_clk)) {
+		dev_err(dev, "fail to get ref_ck\n");
+		return PTR_ERR(mtk->ref_clk);
+	}
+
 	mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
 
 	ret = usb_wakeup_of_property_parse(mtk, node);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 2845c49..3aa5e1d 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -124,6 +124,7 @@ struct xhci_hcd_mtk {
 	struct regulator *vusb33;
 	struct regulator *vbus;
 	struct clk *sys_clk;	/* sys and mac clock */
+	struct clk *ref_clk;
 	struct clk *wk_deb_p0;	/* port0's wakeup debounce clock */
 	struct clk *wk_deb_p1;
 	struct regmap *pericfg;
-- 
1.7.9.5
