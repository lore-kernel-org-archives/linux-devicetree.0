From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v3 13/20] usb: host: xhci-plat: Add support for the Armada 375
Date: Tue,  6 May 2014 02:14:08 +0200
Message-ID: <1399335255-589-14-git-send-email-gregory.clement@free-electrons.com>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

For the Armada 375 SoC which comes with an xhci controller. Currently
the quirk is the same that the Armada 380/385 one, but by introducing
a new compatible string it will allow to make the driver evolve
seamless.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/usb/host/xhci-plat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index d12ba56f52da..09639962c0bb 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -152,6 +152,10 @@ static int xhci_plat_probe(struct platform_device *pdev)
 					"marvell,armada-380-xhci"))
 		xhci_mvebu_mbus_init_quirk(pdev);
 
+	if (of_device_is_compatible(pdev->dev.of_node,
+					"marvell,armada-375-xhci"))
+		xhci_mvebu_mbus_init_quirk(pdev);
+
 	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
 	ret = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret)
@@ -288,6 +292,7 @@ static const struct of_device_id usb_xhci_of_match[] = {
 	{ .compatible = "generic-xhci" },
 	{ .compatible = "xhci-platform" },
 	{ .compatible = "marvell,armada-380-xhci"},
+	{ .compatible = "marvell,armada-375-xhci"},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, usb_xhci_of_match);
-- 
1.8.1.2
