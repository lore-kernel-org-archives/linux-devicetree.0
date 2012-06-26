From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: [PATCH 3/5] usb: gadget: fsl_udc: Propagate devicetree to gadget drivers
Date: Tue, 26 Jun 2012 11:27:11 -0300
Message-ID: <1340720833-781-4-git-send-email-aletes.xgr@gmail.com>
References: <1340720833-781-1-git-send-email-aletes.xgr@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340720833-781-1-git-send-email-aletes.xgr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Yang <leoli@freescale.com>, Alexandre Pereira da Silva <aletes.xgr@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Roland Stigge <stigge@antcom.de>
List-Id: devicetree@vger.kernel.org

Fill dev.of_node of gadget drivers, so they can use devicetree

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 drivers/usb/gadget/fsl_udc_core.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/fsl_udc_core.c b/drivers/usb/gadget/fsl_udc_core.c
index bc6f9bb..a65ca0f 100644
--- a/drivers/usb/gadget/fsl_udc_core.c
+++ b/drivers/usb/gadget/fsl_udc_core.c
@@ -2560,6 +2560,7 @@ static int __init fsl_udc_probe(struct platform_device *pdev)
 	dev_set_name(&udc_controller->gadget.dev, "gadget");
 	udc_controller->gadget.dev.release = fsl_udc_release;
 	udc_controller->gadget.dev.parent = &pdev->dev;
+	udc_controller->gadget.dev.of_node = pdev->dev.of_node;
 	ret = device_register(&udc_controller->gadget.dev);
 	if (ret < 0)
 		goto err_free_irq;
-- 
1.7.10
