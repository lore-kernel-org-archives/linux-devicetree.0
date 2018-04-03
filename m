Return-Path: <SRS0=cK7u=GY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-sn1nam01on0084.outbound.protection.outlook.com ([104.47.32.84]:2512
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754855AbeDCGZG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Apr 2018 02:25:06 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCH] usb: gadget: udc-xilinx: Add clock support
Date: Tue, 3 Apr 2018 11:58:07 +0530
Message-ID: <1522736887-17079-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: shubhrajyoti.datta@gmail.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, michal.simek@xilinx.com, balbi@kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Currently the driver depends on the  bootloader to enable the clocks.
Add support for clocking. The patch enables the clock at  probe and
disables them at remove.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 .../devicetree/bindings/usb/udc-xilinx.txt         |  4 ++++
 drivers/usb/gadget/udc/udc-xilinx.c                | 23 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/udc-xilinx.txt b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
index 47b4e39..da2fedc 100644
--- a/Documentation/devicetree/bindings/usb/udc-xilinx.txt
+++ b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
@@ -8,6 +8,10 @@ Required properties:
 			  controller
 - xlnx,has-builtin-dma	: if DMA is included
 
+Optional properties:
+- clock-names		: should be  "s_axi_aclk"
+- clocks		: Input clock specifier. Refer to common clock bindings.
+
 Example:
  		axi-usb2-device@42e00000 {
                         compatible = "xlnx,usb2-device-4.00.a";
diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index 6407e43..8e81171 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -11,6 +11,7 @@
  * USB peripheral controller (at91_udc.c).
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -188,6 +189,7 @@ struct xusb_udc {
 	void __iomem *addr;
 	spinlock_t lock;
 	bool dma_enabled;
+	struct clk *clk;
 
 	unsigned int (*read_fn)(void __iomem *);
 	void (*write_fn)(void __iomem *, u32, u32);
@@ -2094,6 +2096,26 @@ static int xudc_probe(struct platform_device *pdev)
 	udc->gadget.ep0 = &udc->ep[XUSB_EP_NUMBER_ZERO].ep_usb;
 	udc->gadget.name = driver_name;
 
+	udc->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
+	if (IS_ERR(udc->clk)) {
+		if (PTR_ERR(udc->clk) != -ENOENT) {
+			ret = PTR_ERR(udc->clk);
+			goto fail;
+		}
+
+		/*
+		 * Clock framework support is optional, continue on,
+		 * anyways if we don't find a matching clock
+		 */
+		udc->clk = NULL;
+	}
+
+	ret = clk_prepare_enable(udc->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "Unable to enable clock.\n");
+		return ret;
+	}
+
 	spin_lock_init(&udc->lock);
 
 	/* Check for IP endianness */
@@ -2149,6 +2171,7 @@ static int xudc_remove(struct platform_device *pdev)
 	struct xusb_udc *udc = platform_get_drvdata(pdev);
 
 	usb_del_gadget_udc(&udc->gadget);
+	clk_disable_unprepare(udc->clk);
 
 	return 0;
 }
-- 
2.1.1

