From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 5/8] usb: gadget: bdc: hook a quick Device Tree compatible string
Date: Tue, 27 Jun 2017 14:23:23 -0400
Message-ID: <1498587806-24781-6-git-send-email-alcooperx@gmail.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
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
 drivers/usb/gadget/udc/bdc/bdc_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 621328f..1714bd3 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -533,9 +533,17 @@ static int bdc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id bdc_of_match[] = {
+	{ .compatible = "brcm,bdc-udc-v0.16" },
+	{ .compatible = "brcm,bdc-udc" },
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
