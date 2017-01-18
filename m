From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/6] usb: mtu3: add reference clock
Date: Wed, 18 Jan 2017 14:08:23 +0800
Message-ID: <1484719707-12107-2-git-send-email-chunfeng.yun@mediatek.com>
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
 drivers/usb/mtu3/mtu3.h      |    1 +
 drivers/usb/mtu3/mtu3_plat.c |   21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba9df71..aa6fd6a 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -225,6 +225,7 @@ struct ssusb_mtk {
 	/* common power & clock */
 	struct regulator *vusb33;
 	struct clk *sys_clk;
+	struct clk *ref_clk;
 	/* otg */
 	struct otg_switch_mtk otg_switch;
 	enum usb_dr_mode dr_mode;
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 6344859..19a345d 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -123,7 +123,13 @@ static int ssusb_rscs_init(struct ssusb_mtk *ssusb)
 	ret = clk_prepare_enable(ssusb->sys_clk);
 	if (ret) {
 		dev_err(ssusb->dev, "failed to enable sys_clk\n");
-		goto clk_err;
+		goto sys_clk_err;
+	}
+
+	ret = clk_prepare_enable(ssusb->ref_clk);
+	if (ret) {
+		dev_err(ssusb->dev, "failed to enable ref_clk\n");
+		goto ref_clk_err;
 	}
 
 	ret = ssusb_phy_init(ssusb);
@@ -143,8 +149,10 @@ static int ssusb_rscs_init(struct ssusb_mtk *ssusb)
 phy_err:
 	ssusb_phy_exit(ssusb);
 phy_init_err:
+	clk_disable_unprepare(ssusb->ref_clk);
+ref_clk_err:
 	clk_disable_unprepare(ssusb->sys_clk);
-clk_err:
+sys_clk_err:
 	regulator_disable(ssusb->vusb33);
 vusb33_err:
 
@@ -154,6 +162,7 @@ static int ssusb_rscs_init(struct ssusb_mtk *ssusb)
 static void ssusb_rscs_exit(struct ssusb_mtk *ssusb)
 {
 	clk_disable_unprepare(ssusb->sys_clk);
+	clk_disable_unprepare(ssusb->ref_clk);
 	regulator_disable(ssusb->vusb33);
 	ssusb_phy_power_off(ssusb);
 	ssusb_phy_exit(ssusb);
@@ -216,6 +225,12 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		return PTR_ERR(ssusb->sys_clk);
 	}
 
+	ssusb->ref_clk = devm_clk_get(dev, "ref_ck");
+	if (IS_ERR(ssusb->ref_clk)) {
+		dev_err(dev, "failed to get ref clock\n");
+		return PTR_ERR(ssusb->ref_clk);
+	}
+
 	ssusb->num_phys = of_count_phandle_with_args(node,
 			"phys", "#phy-cells");
 	if (ssusb->num_phys > 0) {
@@ -428,6 +443,7 @@ static int __maybe_unused mtu3_suspend(struct device *dev)
 	ssusb_host_disable(ssusb, true);
 	ssusb_phy_power_off(ssusb);
 	clk_disable_unprepare(ssusb->sys_clk);
+	clk_disable_unprepare(ssusb->ref_clk);
 	ssusb_wakeup_enable(ssusb);
 
 	return 0;
@@ -445,6 +461,7 @@ static int __maybe_unused mtu3_resume(struct device *dev)
 
 	ssusb_wakeup_disable(ssusb);
 	clk_prepare_enable(ssusb->sys_clk);
+	clk_prepare_enable(ssusb->ref_clk);
 	ssusb_phy_power_on(ssusb);
 	ssusb_host_enable(ssusb);
 
-- 
1.7.9.5
