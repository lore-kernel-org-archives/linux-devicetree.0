From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/4] usb: musb: jz4740: Add support for devicetree
Date: Thu, 13 Dec 2018 15:45:53 +0100
Message-ID: <20181213144555.24031-2-paul@crapouillou.net>
References: <20181213144555.24031-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213144555.24031-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add support for probing the driver from devicetree.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/jz4740.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 04d8b2bc205a..9a2cebcac260 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/usb/usb_phy_generic.h>
 
@@ -188,11 +189,17 @@ static int jz4740_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id jz4740_musb_of_match[] = {
+	{ .compatible = "ingenic,jz4740-musb" },
+	{},
+};
+
 static struct platform_driver jz4740_driver = {
 	.probe		= jz4740_probe,
 	.remove		= jz4740_remove,
 	.driver		= {
 		.name	= "musb-jz4740",
+		.of_match_table = of_match_ptr(jz4740_musb_of_match),
 	},
 };
 
-- 
2.11.0
