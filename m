From: <sean.wang@mediatek.com>
Subject: [PATCH v1 3/4] Bluetooth: btmtkuart: add an implementation for boot-gpios property
Date: Sun, 2 Jun 2019 09:04:16 +0800
Message-ID: <1559437457-26766-4-git-send-email-sean.wang@mediatek.com>
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

Not every platform has the pinctrl device integrates the GPIO the function
such as MT7621 whose pinctrl and GPIO are separate hardware so the driver
adds additional boot-gpios to let the MT766[3,8]U can enter the proper boot
mode by gpiod for such platform.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtkuart.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index f5dbeec8e274..1257149cfdc4 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -119,6 +119,7 @@ struct btmtkuart_dev {
 
 	struct regulator *vcc;
 	struct gpio_desc *reset;
+	struct gpio_desc *boot;
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_runtime;
 	struct pinctrl_state *pins_boot;
@@ -911,6 +912,13 @@ static int btmtkuart_parse_dt(struct serdev_device *serdev)
 			return err;
 		}
 
+		bdev->boot = devm_gpiod_get_optional(&serdev->dev, "boot",
+						     GPIOD_OUT_LOW);
+		if (IS_ERR(bdev->boot)) {
+			err = PTR_ERR(bdev->boot);
+			return err;
+		}
+
 		bdev->pinctrl = devm_pinctrl_get(&serdev->dev);
 		if (IS_ERR(bdev->pinctrl)) {
 			err = PTR_ERR(bdev->pinctrl);
@@ -919,8 +927,10 @@ static int btmtkuart_parse_dt(struct serdev_device *serdev)
 
 		bdev->pins_boot = pinctrl_lookup_state(bdev->pinctrl,
 						       "default");
-		if (IS_ERR(bdev->pins_boot)) {
+		if (IS_ERR(bdev->pins_boot) && !bdev->boot) {
 			err = PTR_ERR(bdev->pins_boot);
+			dev_err(&serdev->dev,
+				"Should assign RXD to LOW at boot stage\n");
 			return err;
 		}
 
@@ -996,8 +1006,14 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 	set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
 
 	if (btmtkuart_is_standalone(bdev)) {
-		/* Switch to the specific pin state for the booting requires */
-		pinctrl_select_state(bdev->pinctrl, bdev->pins_boot);
+		if (bdev->boot) {
+			gpiod_set_value_cansleep(bdev->boot, 1);
+		} else {
+			/* Switch to the specific pin state for the booting
+			 * requires.
+			 */
+			pinctrl_select_state(bdev->pinctrl, bdev->pins_boot);
+		}
 
 		/* Power on */
 		err = regulator_enable(bdev->vcc);
@@ -1017,6 +1033,10 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 		 * mode the device requires for UART transfers.
 		 */
 		msleep(50);
+
+		if (bdev->boot)
+			devm_gpiod_put(&serdev->dev, bdev->boot);
+
 		pinctrl_select_state(bdev->pinctrl, bdev->pins_runtime);
 
 		/* A standalone device doesn't depends on power domain on SoC,
@@ -1037,10 +1057,8 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 	return 0;
 
 err_regulator_disable:
-	if (btmtkuart_is_standalone(bdev))  {
-		pinctrl_select_state(bdev->pinctrl, bdev->pins_boot);
+	if (btmtkuart_is_standalone(bdev))
 		regulator_disable(bdev->vcc);
-	}
 
 	return err;
 }
@@ -1050,10 +1068,8 @@ static void btmtkuart_remove(struct serdev_device *serdev)
 	struct btmtkuart_dev *bdev = serdev_device_get_drvdata(serdev);
 	struct hci_dev *hdev = bdev->hdev;
 
-	if (btmtkuart_is_standalone(bdev))  {
-		pinctrl_select_state(bdev->pinctrl, bdev->pins_boot);
+	if (btmtkuart_is_standalone(bdev))
 		regulator_disable(bdev->vcc);
-	}
 
 	hci_unregister_dev(hdev);
 	hci_free_dev(hdev);
-- 
2.17.1
