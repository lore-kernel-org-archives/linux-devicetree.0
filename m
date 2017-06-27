From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 4/8] usb: bdc: Small code cleanup
Date: Tue, 27 Jun 2017 14:23:22 -0400
Message-ID: <1498587806-24781-5-git-send-email-alcooperx@gmail.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc_core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 3bd82d2..621328f 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -488,28 +488,29 @@ static int bdc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, bdc);
 	bdc->irq = irq;
 	bdc->dev = dev;
-	dev_dbg(bdc->dev, "bdc->regs: %p irq=%d\n", bdc->regs, bdc->irq);
+	dev_dbg(dev, "bdc->regs: %p irq=%d\n", bdc->regs, bdc->irq);
 
 	temp = bdc_readl(bdc->regs, BDC_BDCSC);
 	if ((temp & BDC_P64) &&
 			!dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64))) {
-		dev_dbg(bdc->dev, "Using 64-bit address\n");
+		dev_dbg(dev, "Using 64-bit address\n");
 	} else {
-		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 		if (ret) {
-			dev_err(bdc->dev, "No suitable DMA config available, abort\n");
+			dev_err(dev,
+				"No suitable DMA config available, abort\n");
 			return -ENOTSUPP;
 		}
-		dev_dbg(bdc->dev, "Using 32-bit address\n");
+		dev_dbg(dev, "Using 32-bit address\n");
 	}
 	ret = bdc_hw_init(bdc);
 	if (ret) {
-		dev_err(bdc->dev, "BDC init failure:%d\n", ret);
+		dev_err(dev, "BDC init failure:%d\n", ret);
 		return ret;
 	}
 	ret = bdc_udc_init(bdc);
 	if (ret) {
-		dev_err(bdc->dev, "BDC Gadget init failure:%d\n", ret);
+		dev_err(dev, "BDC Gadget init failure:%d\n", ret);
 		goto cleanup;
 	}
 	return 0;
-- 
1.9.0.138.g2de3478
