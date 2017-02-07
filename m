From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH -next 3/3] usb: xhci-mtk: make the reference clock optional
Date: Tue, 7 Feb 2017 14:13:33 +0800
Message-ID: <1486448013-8784-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1486448013-8784-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486448013-8784-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make the reference clock optional for DTS backward compatibility
and ignore the error if it does not exist.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 4d75ac5..75bae8e 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -559,10 +559,17 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return PTR_ERR(mtk->sys_clk);
 	}
 
+	/*
+	 * reference clock is usually a "fixed-clock", make it optional
+	 * for backward compatibility and ignore the error if it does
+	 * not exist.
+	 */
 	mtk->ref_clk = devm_clk_get(dev, "ref_ck");
 	if (IS_ERR(mtk->ref_clk)) {
-		dev_err(dev, "fail to get ref_ck\n");
-		return PTR_ERR(mtk->ref_clk);
+		if (PTR_ERR(mtk->ref_clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		mtk->ref_clk = NULL;
 	}
 
 	mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
-- 
1.7.9.5
