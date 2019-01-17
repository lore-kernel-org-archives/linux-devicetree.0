From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 2/4] usb: musb: jz4740: Add support for devicetree
Date: Thu, 17 Jan 2019 19:33:28 -0300
Message-ID: <20190117223330.16631-2-paul@crapouillou.net>
References: <20190117223330.16631-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117223330.16631-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add support for probing the driver from devicetree.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

v2: Add MODULE_DEVICE_TABLE and wrap inside CONFIG_OF

v3: No change

 drivers/usb/musb/jz4740.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index 04d8b2bc205a..a60627bf7be3 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/usb/usb_phy_generic.h>
 
@@ -188,11 +189,20 @@ static int jz4740_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id jz4740_musb_of_match[] = {
+	{ .compatible = "ingenic,jz4740-musb" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, jz4740_musb_of_match);
+#endif
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
