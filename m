From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V2 9/9] usb: bdc: Add support for USB phy
Date: Wed, 19 Jul 2017 15:11:48 -0400
Message-ID: <1500491508-9783-10-git-send-email-alcooperx@gmail.com>
References: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

If a phy is specified in the device tree node, get it and use it.
This was based on a patch by:
"Srinath Mannam <srinath.mannam@broadcom.com>"

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc.h      |  3 ++
 drivers/usb/gadget/udc/bdc/bdc_core.c | 74 ++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 67c5f23..6df0352 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -413,6 +413,9 @@ struct bdc {
 	/* device lock */
 	spinlock_t	lock;
 
+	/* generic phy */
+	struct phy      **phys;
+	int num_phys;
 	/* num of endpoints for a particular instantiation of IP */
 	unsigned int num_eps;
 	/*
diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 2690b6f..7a8af4b 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -24,6 +24,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
 #include <linux/of.h>
+#include <linux/phy/phy.h>
 #include <linux/moduleparam.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
@@ -445,6 +446,43 @@ static int bdc_hw_init(struct bdc *bdc)
 	return 0;
 }
 
+static int bdc_phy_init(struct bdc *bdc)
+{
+	int phy_num;
+	int ret;
+
+	for (phy_num = 0; phy_num < bdc->num_phys; phy_num++) {
+		ret = phy_init(bdc->phys[phy_num]);
+		if (ret)
+			goto err_exit_phy;
+		ret = phy_power_on(bdc->phys[phy_num]);
+		if (ret) {
+			phy_exit(bdc->phys[phy_num]);
+			goto err_exit_phy;
+		}
+	}
+
+	return 0;
+
+err_exit_phy:
+	while (--phy_num >= 0) {
+		phy_power_off(bdc->phys[phy_num]);
+		phy_exit(bdc->phys[phy_num]);
+	}
+
+	return ret;
+}
+
+static void bdc_phy_exit(struct bdc *bdc)
+{
+	int phy_num;
+
+	for (phy_num = 0; phy_num < bdc->num_phys; phy_num++) {
+		phy_power_off(bdc->phys[phy_num]);
+		phy_exit(bdc->phys[phy_num]);
+	}
+}
+
 static int bdc_probe(struct platform_device *pdev)
 {
 	struct bdc *bdc;
@@ -454,6 +492,7 @@ static int bdc_probe(struct platform_device *pdev)
 	u32 temp;
 	struct device *dev = &pdev->dev;
 	struct clk *clk;
+	int phy_num;
 
 	dev_dbg(dev, "%s()\n", __func__);
 
@@ -492,6 +531,35 @@ static int bdc_probe(struct platform_device *pdev)
 	bdc->dev = dev;
 	dev_dbg(dev, "bdc->regs: %p irq=%d\n", bdc->regs, bdc->irq);
 
+	bdc->num_phys = of_count_phandle_with_args(dev->of_node,
+						"phys", "#phy-cells");
+	if (bdc->num_phys > 0) {
+		bdc->phys = devm_kcalloc(dev, bdc->num_phys,
+					sizeof(struct phy *), GFP_KERNEL);
+		if (!bdc->phys)
+			return -ENOMEM;
+	} else {
+		bdc->num_phys = 0;
+	}
+	dev_info(dev, "Using %d phy(s)\n", bdc->num_phys);
+
+	for (phy_num = 0; phy_num < bdc->num_phys; phy_num++) {
+		bdc->phys[phy_num] = devm_of_phy_get_by_index(
+			dev, dev->of_node, phy_num);
+		if (IS_ERR(bdc->phys[phy_num])) {
+			ret = PTR_ERR(bdc->phys[phy_num]);
+			dev_err(bdc->dev,
+				"BDC phy specified but not found:%d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = bdc_phy_init(bdc);
+	if (ret) {
+		dev_err(bdc->dev, "BDC phy init failure:%d\n", ret);
+		return ret;
+	}
+
 	temp = bdc_readl(bdc->regs, BDC_BDCCAP1);
 	if ((temp & BDC_P64) &&
 			!dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64))) {
@@ -508,7 +576,7 @@ static int bdc_probe(struct platform_device *pdev)
 	ret = bdc_hw_init(bdc);
 	if (ret) {
 		dev_err(dev, "BDC init failure:%d\n", ret);
-		return ret;
+		goto phycleanup;
 	}
 	ret = bdc_udc_init(bdc);
 	if (ret) {
@@ -519,7 +587,8 @@ static int bdc_probe(struct platform_device *pdev)
 
 cleanup:
 	bdc_hw_exit(bdc);
-
+phycleanup:
+	bdc_phy_exit(bdc);
 	return ret;
 }
 
@@ -531,6 +600,7 @@ static int bdc_remove(struct platform_device *pdev)
 	dev_dbg(bdc->dev, "%s ()\n", __func__);
 	bdc_udc_exit(bdc);
 	bdc_hw_exit(bdc);
+	bdc_phy_exit(bdc);
 	clk_disable_unprepare(bdc->clk);
 	return 0;
 }
-- 
1.9.0.138.g2de3478
