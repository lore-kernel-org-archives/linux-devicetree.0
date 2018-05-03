Return-Path: <SRS0=xgCA=HW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-co1nam03on0073.outbound.protection.outlook.com ([104.47.40.73]:56986
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750969AbeECJAH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 3 May 2018 05:00:07 -0400
From: <shubhrajyoti.datta@gmail.com>
Subject: [PATCH 2/2] gpio: xilinx: Add support for no initialisation at probe
Date: Thu, 3 May 2018 14:35:46 +0530
Message-ID: <1525338346-31684-2-git-send-email-shubhrajyoti.datta@gmail.com>
In-Reply-To: <1525338346-31684-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1525338346-31684-1-git-send-email-shubhrajyoti.datta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, git-dev@xilinx.com
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, michals@xilinx.com, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add a dt property to indicate no initialisation at probe.
In some cases the user may want no initialisation of the
gpios. For example PS only reset the user may not want the
re-initialisation of the ip.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/gpio/gpio-xilinx.c | 44 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index e8ec0e3..06988f1 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -41,6 +41,7 @@
 /**
  * struct xgpio_instance - Stores information about GPIO device
  * @mmchip: OF GPIO chip for memory mapped banks
+ * @no_init: No intitialisation at probe
  * @gpio_width: GPIO width for every channel
  * @gpio_state: GPIO state shadow register
  * @gpio_dir: GPIO direction shadow register
@@ -48,6 +49,7 @@
  */
 struct xgpio_instance {
 	struct of_mm_gpio_chip mmchip;
+	bool no_init;
 	unsigned int gpio_width[2];
 	u32 gpio_state[2];
 	u32 gpio_dir[2];
@@ -257,16 +259,36 @@ static void xgpio_save_regs(struct of_mm_gpio_chip *mm_gc)
 	struct xgpio_instance *chip =
 		container_of(mm_gc, struct xgpio_instance, mmchip);
 
-	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET,	chip->gpio_state[0]);
-	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET, chip->gpio_dir[0]);
-
-	if (!chip->gpio_width[1])
-		return;
-
-	xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OFFSET,
-		       chip->gpio_state[1]);
-	xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFFSET,
-		       chip->gpio_dir[1]);
+	if (chip->no_init) {
+		chip->gpio_state[0] = xgpio_readreg(mm_gc->regs +
+						    XGPIO_DATA_OFFSET);
+		chip->gpio_dir[0] =  xgpio_readreg(mm_gc->regs +
+						   XGPIO_TRI_OFFSET);
+
+		if (!chip->gpio_width[1])
+			return;
+
+		chip->gpio_state[1] = xgpio_readreg(mm_gc->regs +
+						    XGPIO_DATA_OFFSET +
+						    XGPIO_CHANNEL_OFFSET);
+		chip->gpio_dir[1] = xgpio_readreg(mm_gc->regs +
+						   XGPIO_TRI_OFFSET +
+						   XGPIO_CHANNEL_OFFSET);
+
+	} else {
+		xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET,
+			       chip->gpio_state[0]);
+		xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET,
+			       chip->gpio_dir[0]);
+
+		if (!chip->gpio_width[1])
+			return;
+
+		xgpio_writereg(mm_gc->regs + XGPIO_DATA_OFFSET +
+			       XGPIO_CHANNEL_OFFSET, chip->gpio_state[1]);
+		xgpio_writereg(mm_gc->regs + XGPIO_TRI_OFFSET +
+			       XGPIO_CHANNEL_OFFSET, chip->gpio_dir[1]);
+	}
 }
 
 /**
@@ -323,6 +345,8 @@ static int xgpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&chip->gpio_lock[0]);
 
+	chip->no_init = of_property_read_bool(np, "xlnx,no-init");
+
 	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
 		is_dual = 0;
 
-- 
2.1.1

