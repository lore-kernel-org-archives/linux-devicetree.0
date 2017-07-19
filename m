From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V2 5/9] usb: bdc: hook a quick Device Tree compatible string
Date: Wed, 19 Jul 2017 15:11:44 -0400
Message-ID: <1500491508-9783-6-git-send-email-alcooperx@gmail.com>
References: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

From: Florian Fainelli <f.fainelli@gmail.com>

Allows Device Tree probing

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc.h      | 4 ++--
 drivers/usb/gadget/udc/bdc/bdc_core.c | 8 ++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 3664808..f657a4e 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -27,8 +27,8 @@
 #include <linux/usb/gadget.h>
 #include <asm/unaligned.h>
 
-#define BRCM_BDC_NAME "bdc_usb3"
-#define BRCM_BDC_DESC "BDC device controller driver"
+#define BRCM_BDC_NAME "bdc"
+#define BRCM_BDC_DESC "Broadcom USB Device Controller driver"
 
 #define DMA_ADDR_INVALID        (~(dma_addr_t)0)
 
diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index c2bfae2..bc0729b 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -533,9 +533,17 @@ static int bdc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id bdc_of_match[] = {
+	{ .compatible = "brcm,bdc-v0.16" },
+	{ .compatible = "brcm,bdc" },
+	{ /* sentinel */ }
+};
+
 static struct platform_driver bdc_driver = {
 	.driver		= {
 		.name	= BRCM_BDC_NAME,
+		.owner	= THIS_MODULE,
+		.of_match_table	= bdc_of_match,
 	},
 	.probe		= bdc_probe,
 	.remove		= bdc_remove,
-- 
1.9.0.138.g2de3478
