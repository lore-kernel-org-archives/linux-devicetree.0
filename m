From: Robin van der Gracht <robin@protonic.nl>
Subject: [PATCH] auxdisplay: ht16k33: Keyscan function should be optional
Date: Wed, 16 Aug 2017 12:28:49 +0200
Message-ID: <20170816102849.25686-1-robin@protonic.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Robin van der Gracht <robin@protonic.nl>
List-Id: devicetree@vger.kernel.org

keyscan should be optional to support simple LED matrix displays (output only).

Reported-by: Michael Kaplan <M.KAPLAN@evva.com>
Signed-off-by: Robin van der Gracht <robin@protonic.nl>
---

 Documentation/devicetree/bindings/display/ht16k33.txt | 15 +++++++++------
 drivers/auxdisplay/ht16k33.c                          | 14 ++++++--------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ht16k33.txt b/Documentation/devicetree/bindings/display/ht16k33.txt
index 8e5b30b87754..e2c9048ed9d4 100644
--- a/Documentation/devicetree/bindings/display/ht16k33.txt
+++ b/Documentation/devicetree/bindings/display/ht16k33.txt
@@ -4,18 +4,21 @@ Holtek ht16k33 RAM mapping 16*8 LED controller driver with keyscan
 Required properties:
 - compatible:		"holtek,ht16k33"
 - reg:			I2C slave address of the chip.
-- interrupt-parent:	A phandle pointing to the interrupt controller
-			serving the interrupt for this chip.
-- interrupts:		Interrupt specification for the key pressed interrupt.
 - refresh-rate-hz:	Display update interval in HZ.
-- debounce-delay-ms:	Debouncing interval time in milliseconds.
-- linux,keymap: 	The keymap for keys as described in the binding
-			document (devicetree/bindings/input/matrix-keymap.txt).
 
 Optional properties:
 - linux,no-autorepeat:	Disable keyrepeat.
 - default-brightness-level: Initial brightness level [0-15] (default: 15).
 
+- Keypad
+ Supply the 'interrupts' property to enable the keyscan feature.
+ - interrupts:		Interrupt specification for the key pressed interrupt.
+ - interrupt-parent:	A phandle pointing to the interrupt controller
+			serving the interrupt for this chip.
+ - debounce-delay-ms:	Debouncing interval time in milliseconds.
+ - linux,keymap: 	The keymap for keys as described in the binding
+			document (devicetree/bindings/input/matrix-keymap.txt).
+
 Example:
 
 &i2c1 {
diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 674a6c0cec2a..14b268388ef9 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -410,11 +410,6 @@ static int ht16k33_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	if (client->irq <= 0) {
-		dev_err(&client->dev, "No IRQ specified\n");
-		return -EINVAL;
-	}
-
 	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -468,9 +463,12 @@ static int ht16k33_probe(struct i2c_client *client,
 	if (err)
 		goto err_fbdev_info;
 
-	err = ht16k33_keypad_probe(client, &priv->keypad);
-	if (err)
-		goto err_fbdev_unregister;
+	/* Keypad */
+	if (client->irq > 0) {
+		err = ht16k33_keypad_probe(client, &priv->keypad);
+		if (err)
+			goto err_fbdev_unregister;
+	}
 
 	/* Backlight */
 	memset(&bl_props, 0, sizeof(struct backlight_properties));
-- 
2.11.0
