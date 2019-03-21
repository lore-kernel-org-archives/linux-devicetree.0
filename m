From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/3] usb: musb: jz4740: obtain USB PHY from devicetree
Date: Thu, 21 Mar 2019 16:09:56 +0100
Message-ID: <20190321150956.6629-3-paul@crapouillou.net>
References: <20190321150956.6629-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321150956.6629-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Fall back to devm_usb_get_phy() if devicetree is not available.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/jz4740.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index ad35e09f90bd..e4dbf76548c0 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -74,9 +74,14 @@ static struct musb_hdrc_platform_data jz4740_musb_platform_data = {
 
 static int jz4740_musb_init(struct musb *musb)
 {
-	musb->xceiv = usb_get_phy(USB_PHY_TYPE_USB2);
+	struct device *dev = musb->controller->parent;
+
+	if (dev->of_node)
+		musb->xceiv = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
+	else
+		musb->xceiv = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
 	if (IS_ERR(musb->xceiv)) {
-		pr_err("HS UDC: no transceiver configured\n");
+		dev_err(dev, "No transceiver configured\n");
 		return PTR_ERR(musb->xceiv);
 	}
 
@@ -90,13 +95,6 @@ static int jz4740_musb_init(struct musb *musb)
 	return 0;
 }
 
-static int jz4740_musb_exit(struct musb *musb)
-{
-	usb_put_phy(musb->xceiv);
-
-	return 0;
-}
-
 /*
  * DMA has not been confirmed to work with CONFIG_USB_INVENTRA_DMA,
  * so let's not set up the dma function pointers yet.
@@ -105,7 +103,6 @@ static const struct musb_platform_ops jz4740_musb_ops = {
 	.quirks		= MUSB_DMA_INVENTRA | MUSB_INDEXED_EP,
 	.fifo_mode	= 2,
 	.init		= jz4740_musb_init,
-	.exit		= jz4740_musb_exit,
 };
 
 static int jz4740_probe(struct platform_device *pdev)
-- 
2.11.0
