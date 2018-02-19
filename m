Return-Path: <SRS0=kFSR=FN=gmail.com=joel.stan@kernel.org>
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 2/3] misc: aspeed-lpc: Request and enable LPC clock
Date: Mon, 19 Feb 2018 17:54:21 +1030
Message-Id: <20180219072422.22733-3-joel@jms.id.au>
In-Reply-To: <20180219072422.22733-1-joel@jms.id.au>
References: <20180219072422.22733-1-joel@jms.id.au>
To: Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Cyril Bur <cyrilbur@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Lei YU <mine260309@gmail.com>
List-ID: <devicetree@vger.kernel.org>

The LPC device needs to ensure it's clock is enabled before it can do
anything.

In the past the clock was enabled and left running by u-boot, however
Linux now has an upstream clock driver that disables unused clocks.

Tested-by: Lei YU <mine260309@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/misc/aspeed-lpc-ctrl.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/misc/aspeed-lpc-ctrl.c
index b5439643f54b..1827b7aa6674 100644
--- a/drivers/misc/aspeed-lpc-ctrl.c
+++ b/drivers/misc/aspeed-lpc-ctrl.c
@@ -7,6 +7,7 @@
  * 2 of the License, or (at your option) any later version.
  */
 
+#include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/miscdevice.h>
 #include <linux/mm.h>
@@ -26,6 +27,7 @@
 struct aspeed_lpc_ctrl {
 	struct miscdevice	miscdev;
 	struct regmap		*regmap;
+	struct clk		*clk;
 	phys_addr_t		mem_base;
 	resource_size_t		mem_size;
 	u32		pnor_size;
@@ -221,16 +223,33 @@ static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	lpc_ctrl->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(lpc_ctrl->clk)) {
+		dev_err(dev, "couldn't get clock\n");
+		return PTR_ERR(lpc_ctrl->clk);
+	}
+	rc = clk_prepare_enable(lpc_ctrl->clk);
+	if (rc) {
+		dev_err(dev, "couldn't enable clock\n");
+		return rc;
+	}
+
 	lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
 	lpc_ctrl->miscdev.name = DEVICE_NAME;
 	lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
 	lpc_ctrl->miscdev.parent = dev;
 	rc = misc_register(&lpc_ctrl->miscdev);
-	if (rc)
+	if (rc) {
 		dev_err(dev, "Unable to register device\n");
-	else
-		dev_info(dev, "Loaded at %pr\n", &resm);
+		goto err;
+	}
+
+	dev_info(dev, "Loaded at %pr\n", &resm);
+
+	return 0;
 
+err:
+	clk_disable_unprepare(lpc_ctrl->clk);
 	return rc;
 }
 
@@ -239,6 +258,7 @@ static int aspeed_lpc_ctrl_remove(struct platform_device *pdev)
 	struct aspeed_lpc_ctrl *lpc_ctrl = dev_get_drvdata(&pdev->dev);
 
 	misc_deregister(&lpc_ctrl->miscdev);
+	clk_disable_unprepare(lpc_ctrl->clk);
 
 	return 0;
 }
-- 
2.15.1
