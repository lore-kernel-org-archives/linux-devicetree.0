From: <sean.wang@mediatek.com>
Subject: [PATCH v1 4/4] Bluetooth: btmtkuart: add an implementation for clock osc property
Date: Sun, 2 Jun 2019 09:04:17 +0800
Message-ID: <1559437457-26766-5-git-send-email-sean.wang@mediatek.com>
References: <1559437457-26766-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559437457-26766-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Some board requires explicitily control external osscilator via GPIO.
So, add an implementation of a clock property for an external oscillator
to the device.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtkuart.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 1257149cfdc4..e11169ad8247 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -115,8 +115,9 @@ struct btmtk_hci_wmt_params {
 struct btmtkuart_dev {
 	struct hci_dev *hdev;
 	struct serdev_device *serdev;
-	struct clk *clk;
 
+	struct clk *clk;
+	struct clk *osc;
 	struct regulator *vcc;
 	struct gpio_desc *reset;
 	struct gpio_desc *boot;
@@ -912,6 +913,12 @@ static int btmtkuart_parse_dt(struct serdev_device *serdev)
 			return err;
 		}
 
+		bdev->osc = devm_clk_get_optional(&serdev->dev, "osc");
+		if (IS_ERR(bdev->osc)) {
+			err = PTR_ERR(bdev->osc);
+			return err;
+		}
+
 		bdev->boot = devm_gpiod_get_optional(&serdev->dev, "boot",
 						     GPIOD_OUT_LOW);
 		if (IS_ERR(bdev->boot)) {
@@ -1006,6 +1013,10 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 	set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 
 	if (btmtkuart_is_standalone(bdev)) {
+		err = clk_prepare_enable(bdev->osc);
+		if (err < 0)
+			return err;
+
 		if (bdev->boot) {
 			gpiod_set_value_cansleep(bdev->boot, 1);
 		} else {
@@ -1017,8 +1028,10 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 
 		/* Power on */
 		err = regulator_enable(bdev->vcc);
-		if (err < 0)
+		if (err < 0) {
+			clk_disable_unprepare(bdev->osc);
 			return err;
+		}
 
 		/* Reset if the reset-gpios is available otherwise the board
 		 * -level design should be guaranteed.
@@ -1068,8 +1081,10 @@ static void btmtkuart_remove(struct serdev_device *serdev)
 	struct btmtkuart_dev *bdev = serdev_device_get_drvdata(serdev);
 	struct hci_dev *hdev = bdev->hdev;
 
-	if (btmtkuart_is_standalone(bdev))
+	if (btmtkuart_is_standalone(bdev)) {
 		regulator_disable(bdev->vcc);
+		clk_disable_unprepare(bdev->osc);
+	}
 
 	hci_unregister_dev(hdev);
 	hci_free_dev(hdev);
-- 
2.17.1
