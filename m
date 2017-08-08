From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/4] usb: xhci-mtk: add generic compatible string
Date: Tue, 8 Aug 2017 13:42:50 +0800
Message-ID: <c90d5a8f0d7e67e277ebd3d4339598e83c044bc5.1502170518.git.chunfeng.yun@mediatek.com>
References: <8f0cb0047b2aa195d818ad686cbbceabb3ad91a0.1502170518.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8f0cb0047b2aa195d818ad686cbbceabb3ad91a0.1502170518.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The xhci-mtk driver is a generic driver for MediaTek xHCI IP, add
a generic compatible to avoid confusion when support new SoCs but
use a compatible with specific SoC's name "mt8173".

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 67d5dc7..d2934b9 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -795,6 +795,7 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 #ifdef CONFIG_OF
 static const struct of_device_id mtk_xhci_of_match[] = {
 	{ .compatible = "mediatek,mt8173-xhci"},
+	{ .compatible = "mediatek,xhci-mtk"},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_xhci_of_match);
-- 
1.7.9.5
