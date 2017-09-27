From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 01/12] usb: mtu3: fix error return code in ssusb_gadget_init()
Date: Wed, 27 Sep 2017 18:58:30 +0800
Message-ID: <fe8df8503f602586bcea4b1598eb09678b1525e3.1506509658.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

When fail to get irq number, platform_get_irq() may return
-EPROBE_DEFER, but we ignore it and always return -ENODEV,
so fix it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 99c65b0..9475798 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -774,9 +774,9 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 		return -ENOMEM;
 
 	mtu->irq = platform_get_irq(pdev, 0);
-	if (mtu->irq <= 0) {
+	if (mtu->irq < 0) {
 		dev_err(dev, "fail to get irq number\n");
-		return -ENODEV;
+		return mtu->irq;
 	}
 	dev_info(dev, "irq %d\n", mtu->irq);
 
-- 
1.7.9.5
