From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 06/15] Bluetooth: hci_bcm: Simplify clk_get error handling
Date: Mon, 17 Dec 2018 12:04:40 +0800
Message-ID: <20181217040449.31437-7-wens@csie.org>
References: <20181217040449.31437-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217040449.31437-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Loic Poulain <loic.poulain@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

The driver currently checks the clk pointer for an error condition, as
returned by clk_get, before every invocation of the clk consumer API.
This is redundant if the goal is simply to ignore the errors, thereby
making the clk optional. The clk consumer API already checks if the
pointer is NULL or not.

Simplify the code a bit by assigning NULL to the clk pointer if the
error condition is one we want to ignore, which is every error except
deferred probing.

Tested-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/bluetooth/hci_bcm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 800132369134..ff73ecb8215f 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -214,7 +214,7 @@ static int bcm_gpio_set_power(struct bcm_device *dev, bool powered)
 {
 	int err;
 
-	if (powered && !IS_ERR(dev->clk) && !dev->clk_enabled) {
+	if (powered && !dev->clk_enabled) {
 		err = clk_prepare_enable(dev->clk);
 		if (err)
 			return err;
@@ -228,7 +228,7 @@ static int bcm_gpio_set_power(struct bcm_device *dev, bool powered)
 	if (err)
 		goto err_revert_shutdown;
 
-	if (!powered && !IS_ERR(dev->clk) && dev->clk_enabled)
+	if (!powered && dev->clk_enabled)
 		clk_disable_unprepare(dev->clk);
 
 	dev->clk_enabled = powered;
@@ -238,7 +238,7 @@ static int bcm_gpio_set_power(struct bcm_device *dev, bool powered)
 err_revert_shutdown:
 	dev->set_shutdown(dev, !powered);
 err_clk_disable:
-	if (powered && !IS_ERR(dev->clk) && !dev->clk_enabled)
+	if (powered && !dev->clk_enabled)
 		clk_disable_unprepare(dev->clk);
 	return err;
 }
@@ -911,6 +911,10 @@ static int bcm_get_resources(struct bcm_device *dev)
 	if (dev->clk == ERR_PTR(-EPROBE_DEFER))
 		return PTR_ERR(dev->clk);
 
+	/* Ignore all other errors as before */
+	if (IS_ERR(dev->clk))
+		dev->clk = NULL;
+
 	dev->device_wakeup = devm_gpiod_get_optional(dev->dev, "device-wakeup",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(dev->device_wakeup))
-- 
2.20.0
