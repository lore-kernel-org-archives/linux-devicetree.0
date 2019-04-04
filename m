From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/3] usb: musb: jz4740: Let the platform probe the PHY
Date: Thu,  4 Apr 2019 11:47:38 +0200
Message-ID: <20190404094739.23503-2-paul@crapouillou.net>
References: <20190404094739.23503-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404094739.23503-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bin Liu <b-liu@ti.com>
Cc: od@zcrc.me, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

By registering a generic USB PHY from within the driver, we may shadow
the USB PHY registered by the platform, which might be different.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change

 drivers/usb/musb/jz4740.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index a60627bf7be3..ad35e09f90bd 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -74,7 +74,6 @@ static struct musb_hdrc_platform_data jz4740_musb_platform_data = {
 
 static int jz4740_musb_init(struct musb *musb)
 {
-	usb_phy_generic_register();
 	musb->xceiv = usb_get_phy(USB_PHY_TYPE_USB2);
 	if (IS_ERR(musb->xceiv)) {
 		pr_err("HS UDC: no transceiver configured\n");
@@ -183,7 +182,6 @@ static int jz4740_remove(struct platform_device *pdev)
 	struct jz4740_glue	*glue = platform_get_drvdata(pdev);
 
 	platform_device_unregister(glue->musb);
-	usb_phy_generic_unregister(pdev);
 	clk_disable_unprepare(glue->clk);
 
 	return 0;
-- 
2.11.0
