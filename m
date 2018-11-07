From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 08/15] Bluetooth: hci_bcm: Add support for LPO clock
Date: Wed,  7 Nov 2018 18:13:01 +0800
Message-ID: <20181107101308.7626-9-wens@csie.org>
References: <20181107101308.7626-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBQXVRLPQKGQE3KSA5XY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181107101308.7626-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Broadcom Bluetooth controllers support a secondary LPO clock at
32.768 kHz. This external clock provides low power timing, and also
a way to detect the frequency of the main reference clock. On many
designs without NVRAM and a non-default reference clock, this must
be used or the controller will not function correctly.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/bluetooth/hci_bcm.c | 41 ++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 7556f8fac8aa..ab6e527952a9 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -72,7 +72,8 @@
  * @btpu: Apple ACPI method to drive BT_REG_ON pin high ("Bluetooth Power Up")
  * @btpd: Apple ACPI method to drive BT_REG_ON pin low ("Bluetooth Power Down")
  * @txco_clk: external reference frequency clock used by Bluetooth device
- * @clk_enabled: whether @txco_clk is prepared and enabled
+ * @lpo_clk: external LPO clock used by Bluetooth device
+ * @clk_enabled: whether clocks are prepared and enabled
  * @init_speed: default baudrate of Bluetooth device;
  *	the host UART is initially set to this baudrate so that
  *	it can configure the Bluetooth device for @oper_speed
@@ -103,6 +104,7 @@ struct bcm_device {
 #endif
 
 	struct clk		*txco_clk;
+	struct clk		*lpo_clk;
 	bool			clk_enabled;
 
 	u32			init_speed;
@@ -215,21 +217,34 @@ static int bcm_gpio_set_power(struct bcm_device *dev, bool powered)
 	int err;
 
 	if (powered && !dev->clk_enabled) {
-		err = clk_prepare_enable(dev->txco_clk);
+		/* LPO clock needs to be 32.768 kHz */
+		err = clk_set_rate(dev->lpo_clk, 32768);
+		if (err) {
+			dev_err(dev->dev, "Could not set LPO clock rate\n");
+			return err;
+		}
+
+		err = clk_prepare_enable(dev->lpo_clk);
 		if (err)
 			return err;
+
+		err = clk_prepare_enable(dev->txco_clk);
+		if (err)
+			goto err_lpo_clk_disable;
 	}
 
 	err = dev->set_shutdown(dev, powered);
 	if (err)
-		goto err_clk_disable;
+		goto err_txco_clk_disable;
 
 	err = dev->set_device_wakeup(dev, powered);
 	if (err)
 		goto err_revert_shutdown;
 
-	if (!powered && dev->clk_enabled)
+	if (!powered && dev->clk_enabled) {
 		clk_disable_unprepare(dev->txco_clk);
+		clk_disable_unprepare(dev->lpo_clk);
+	}
 
 	dev->clk_enabled = powered;
 
@@ -237,9 +252,12 @@ static int bcm_gpio_set_power(struct bcm_device *dev, bool powered)
 
 err_revert_shutdown:
 	dev->set_shutdown(dev, !powered);
-err_clk_disable:
+err_txco_clk_disable:
 	if (powered && !dev->clk_enabled)
 		clk_disable_unprepare(dev->txco_clk);
+err_lpo_clk_disable:
+	if (powered && !dev->clk_enabled)
+		clk_disable_unprepare(dev->lpo_clk);
 	return err;
 }
 
@@ -934,6 +952,19 @@ static int bcm_get_resources(struct bcm_device *dev)
 	if (IS_ERR(dev->txco_clk))
 		dev->txco_clk = NULL;
 
+	dev->lpo_clk = devm_clk_get(dev->dev, "lpo");
+	if (IS_ERR(dev->lpo_clk) && PTR_ERR(dev->lpo_clk) == -EPROBE_DEFER)
+		return PTR_ERR(dev->lpo_clk);
+
+	if (IS_ERR(dev->lpo_clk))
+		dev->lpo_clk = NULL;
+
+	/* Check if we accidentally fetched the lpo clock twice */
+	if (dev->lpo_clk && clk_is_match(dev->lpo_clk, dev->txco_clk)) {
+		devm_clk_put(dev->dev, dev->txco_clk);
+		dev->txco_clk = NULL;
+	}
+
 	dev->device_wakeup = devm_gpiod_get_optional(dev->dev, "device-wakeup",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(dev->device_wakeup))
-- 
2.19.1
