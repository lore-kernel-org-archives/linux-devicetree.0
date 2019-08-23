From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [RESEND PATCH v2 2/2] usb: xhci-mtk: add an optional xhci_ck clock
Date: Fri, 23 Aug 2019 14:40:25 +0800
Message-ID: <1566542425-20082-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1566542425-20082-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566542425-20082-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some SoCs may have an optional clock xhci_ck (125M or 200M), it
usually uses the same PLL as sys_ck, so support it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2 no changes
---
 drivers/usb/host/xhci-mtk.c | 13 +++++++++++++
 drivers/usb/host/xhci-mtk.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 026fe18972d3..b18a6baef204 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -216,6 +216,10 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
 		return PTR_ERR(mtk->sys_clk);
 	}
 
+	mtk->xhci_clk = devm_clk_get_optional(dev, "xhci_ck");
+	if (IS_ERR(mtk->xhci_clk))
+		return PTR_ERR(mtk->xhci_clk);
+
 	mtk->ref_clk = devm_clk_get_optional(dev, "ref_ck");
 	if (IS_ERR(mtk->ref_clk))
 		return PTR_ERR(mtk->ref_clk);
@@ -244,6 +248,12 @@ static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 		goto sys_clk_err;
 	}
 
+	ret = clk_prepare_enable(mtk->xhci_clk);
+	if (ret) {
+		dev_err(mtk->dev, "failed to enable xhci_clk\n");
+		goto xhci_clk_err;
+	}
+
 	ret = clk_prepare_enable(mtk->mcu_clk);
 	if (ret) {
 		dev_err(mtk->dev, "failed to enable mcu_clk\n");
@@ -261,6 +271,8 @@ static int xhci_mtk_clks_enable(struct xhci_hcd_mtk *mtk)
 dma_clk_err:
 	clk_disable_unprepare(mtk->mcu_clk);
 mcu_clk_err:
+	clk_disable_unprepare(mtk->xhci_clk);
+xhci_clk_err:
 	clk_disable_unprepare(mtk->sys_clk);
 sys_clk_err:
 	clk_disable_unprepare(mtk->ref_clk);
@@ -272,6 +284,7 @@ static void xhci_mtk_clks_disable(struct xhci_hcd_mtk *mtk)
 {
 	clk_disable_unprepare(mtk->dma_clk);
 	clk_disable_unprepare(mtk->mcu_clk);
+	clk_disable_unprepare(mtk->xhci_clk);
 	clk_disable_unprepare(mtk->sys_clk);
 	clk_disable_unprepare(mtk->ref_clk);
 }
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 8be8c5f7ff62..5ac458b7d2e0 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -139,6 +139,7 @@ struct xhci_hcd_mtk {
 	struct regulator *vusb33;
 	struct regulator *vbus;
 	struct clk *sys_clk;	/* sys and mac clock */
+	struct clk *xhci_clk;
 	struct clk *ref_clk;
 	struct clk *mcu_clk;
 	struct clk *dma_clk;
-- 
2.23.0
