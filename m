From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 5/9] usb: xhci-mtk: remove dummy wakeup debounce clocks
Date: Wed, 27 Sep 2017 17:23:01 +0800
Message-ID: <ff9ee49a872084b4fc8c7fbabddc820058acb9b7.1506503879.git.chunfeng.yun@mediatek.com>
References: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1506503879.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1506503879.git.chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The wakeup debounce clocks for each ports in fact are not
needed, so remove them.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/host/xhci-mtk.c |   33 ---------------------------------
 drivers/usb/host/xhci-mtk.h |    2 --
 2 files changed, 35 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 97ba51e..d60463c 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -237,25 +237,8 @@ static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 		goto sys_clk_err;
 	}
 
-	if (mtk->wakeup_src) {
-		ret = clk_prepare_enable(mtk->wk_deb_p0);
-		if (ret) {
-			dev_err(mtk->dev, "failed to enable wk_deb_p0\n");
-			goto usb_p0_err;
-		}
-
-		ret = clk_prepare_enable(mtk->wk_deb_p1);
-		if (ret) {
-			dev_err(mtk->dev, "failed to enable wk_deb_p1\n");
-			goto usb_p1_err;
-		}
-	}
 	return 0;
 
-usb_p1_err:
-	clk_disable_unprepare(mtk->wk_deb_p0);
-usb_p0_err:
-	clk_disable_unprepare(mtk->sys_clk);
 sys_clk_err:
 	clk_disable_unprepare(mtk->ref_clk);
 ref_clk_err:
@@ -264,10 +247,6 @@ static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 
 static void xhci_mtk_clks_disable(struct xhci_hcd_mtk *mtk)
 {
-	if (mtk->wakeup_src) {
-		clk_disable_unprepare(mtk->wk_deb_p1);
-		clk_disable_unprepare(mtk->wk_deb_p0);
-	}
 	clk_disable_unprepare(mtk->sys_clk);
 	clk_disable_unprepare(mtk->ref_clk);
 }
@@ -371,18 +350,6 @@ static int usb_wakeup_of_property_parse(struct xhci_hcd_mtk *mtk,
 	if (!mtk->wakeup_src)
 		return 0;
 
-	mtk->wk_deb_p0 = devm_clk_get(dev, "wakeup_deb_p0");
-	if (IS_ERR(mtk->wk_deb_p0)) {
-		dev_err(dev, "fail to get wakeup_deb_p0\n");
-		return PTR_ERR(mtk->wk_deb_p0);
-	}
-
-	mtk->wk_deb_p1 = devm_clk_get(dev, "wakeup_deb_p1");
-	if (IS_ERR(mtk->wk_deb_p1)) {
-		dev_err(dev, "fail to get wakeup_deb_p1\n");
-		return PTR_ERR(mtk->wk_deb_p1);
-	}
-
 	mtk->pericfg = syscon_regmap_lookup_by_phandle(dn,
 						"mediatek,syscon-wakeup");
 	if (IS_ERR(mtk->pericfg)) {
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index db55a12..67783a7 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -126,8 +126,6 @@ struct xhci_hcd_mtk {
 	struct regulator *vbus;
 	struct clk *sys_clk;	/* sys and mac clock */
 	struct clk *ref_clk;
-	struct clk *wk_deb_p0;	/* port0's wakeup debounce clock */
-	struct clk *wk_deb_p1;
 	struct regmap *pericfg;
 	struct phy **phys;
 	int num_phys;
-- 
1.7.9.5
