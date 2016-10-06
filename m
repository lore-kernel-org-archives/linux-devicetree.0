From: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Subject: [PATCH v2] auxdisplay: ht16k33: Keyscan function is now optional
Date: Thu,  6 Oct 2016 14:41:58 +0200
Message-ID: <1475757718-3044-1-git-send-email-robin@protonic.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
---
Changes in v2:
	- Removed the trailing dot in the patch subject

 .../devicetree/bindings/display/ht16k33.txt        |  15 ++-
 drivers/auxdisplay/ht16k33.c                       | 126 +++++++++++----------
 2 files changed, 73 insertions(+), 68 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ht16k33.txt b/Documentation/devicetree/bindings/display/ht16k33.txt
index 8e5b30b..e2c9048 100644
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
index 9c09bbc..5cf8fb4 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -334,15 +334,71 @@ static struct fb_ops ht16k33_fb_ops = {
 	.fb_mmap = ht16k33_mmap,
 };
 
+static int ht16k33_register_keypad(struct ht16k33_priv *priv)
+{
+	int rows, cols, err;
+	struct ht16k33_keypad *keypad = &priv->keypad;
+	struct device *dev = &priv->client->dev;
+
+	keypad->dev = devm_input_allocate_device(dev);
+	if (!keypad->dev)
+		return -ENOMEM;
+
+	keypad->dev->name = dev_name(dev);
+	keypad->dev->id.bustype = BUS_I2C;
+	keypad->dev->open = ht16k33_keypad_start;
+	keypad->dev->close = ht16k33_keypad_stop;
+
+	if (!of_get_property(dev->of_node, "linux,no-autorepeat", NULL))
+		__set_bit(EV_REP, keypad->dev->evbit);
+
+	err = of_property_read_u32(dev->of_node, "debounce-delay-ms",
+				   &keypad->debounce_ms);
+	if (err) {
+		dev_err(dev, "key debounce delay not specified\n");
+		return err;
+	}
+
+	err = devm_request_threaded_irq(dev, priv->client->irq, NULL,
+					ht16k33_irq_thread,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					DRIVER_NAME, priv);
+	if (err) {
+		dev_err(dev, "Failed to request irq %i\n", priv->client->irq);
+		return err;
+	}
+
+	disable_irq_nosync(priv->client->irq);
+	rows = HT16K33_MATRIX_KEYPAD_MAX_ROWS;
+	cols = HT16K33_MATRIX_KEYPAD_MAX_COLS;
+	err = matrix_keypad_parse_of_params(dev, &rows, &cols);
+	if (err)
+		return err;
+
+	err = matrix_keypad_build_keymap(NULL, NULL, rows, cols, NULL,
+					 keypad->dev);
+	if (err) {
+		dev_err(dev, "failed to build keymap\n");
+		return err;
+	}
+
+	input_set_drvdata(keypad->dev, priv);
+	keypad->rows = rows;
+	keypad->cols = cols;
+	keypad->row_shift = get_count_order(cols);
+	INIT_DELAYED_WORK(&keypad->work, ht16k33_keypad_scan);
+
+	return input_register_device(keypad->dev);
+}
+
 static int ht16k33_probe(struct i2c_client *client,
 				  const struct i2c_device_id *id)
 {
 	int err;
-	uint32_t rows, cols, dft_brightness;
+	uint32_t dft_brightness;
 	struct backlight_device *bl;
 	struct backlight_properties bl_props;
 	struct ht16k33_priv *priv;
-	struct ht16k33_keypad *keypad;
 	struct ht16k33_fbdev *fbdev;
 	struct device_node *node = client->dev.of_node;
 	const char *dev_id = dev_name(&client->dev);
@@ -352,11 +408,6 @@ static int ht16k33_probe(struct i2c_client *client,
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
@@ -364,7 +415,6 @@ static int ht16k33_probe(struct i2c_client *client,
 	priv->client = client;
 	i2c_set_clientdata(client, priv);
 	fbdev = &priv->fbdev;
-	keypad = &priv->keypad;
 
 	priv->workqueue = create_singlethread_workqueue(dev_id);
 	if (priv->workqueue == NULL)
@@ -417,61 +467,12 @@ static int ht16k33_probe(struct i2c_client *client,
 		goto err_fbdev_info;
 
 	/* Keypad */
-	keypad->dev = devm_input_allocate_device(&client->dev);
-	if (!keypad->dev) {
-		err = -ENOMEM;
-		goto err_fbdev_unregister;
-	}
-
-	keypad->dev->name = dev_id;
-	keypad->dev->id.bustype = BUS_I2C;
-	keypad->dev->open = ht16k33_keypad_start;
-	keypad->dev->close = ht16k33_keypad_stop;
-
-	if (!of_get_property(node, "linux,no-autorepeat", NULL))
-		__set_bit(EV_REP, keypad->dev->evbit);
-
-	err = of_property_read_u32(node, "debounce-delay-ms",
-				   &keypad->debounce_ms);
-	if (err) {
-		dev_err(&client->dev, "key debounce delay not specified\n");
-		goto err_fbdev_unregister;
+	if (client->irq > 0) {
+		err = ht16k33_register_keypad(priv);
+		if (err)
+			goto err_fbdev_unregister;
 	}
 
-	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-					ht16k33_irq_thread,
-					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-					DRIVER_NAME, priv);
-	if (err) {
-		dev_err(&client->dev, "irq request failed %d, error %d\n",
-			client->irq, err);
-		goto err_fbdev_unregister;
-	}
-
-	disable_irq_nosync(client->irq);
-	rows = HT16K33_MATRIX_KEYPAD_MAX_ROWS;
-	cols = HT16K33_MATRIX_KEYPAD_MAX_COLS;
-	err = matrix_keypad_parse_of_params(&client->dev, &rows, &cols);
-	if (err)
-		goto err_fbdev_unregister;
-
-	err = matrix_keypad_build_keymap(NULL, NULL, rows, cols, NULL,
-					 keypad->dev);
-	if (err) {
-		dev_err(&client->dev, "failed to build keymap\n");
-		goto err_fbdev_unregister;
-	}
-
-	input_set_drvdata(keypad->dev, priv);
-	keypad->rows = rows;
-	keypad->cols = cols;
-	keypad->row_shift = get_count_order(cols);
-	INIT_DELAYED_WORK(&keypad->work, ht16k33_keypad_scan);
-
-	err = input_register_device(keypad->dev);
-	if (err)
-		goto err_fbdev_unregister;
-
 	/* Backlight */
 	memset(&bl_props, 0, sizeof(struct backlight_properties));
 	bl_props.type = BACKLIGHT_RAW;
@@ -504,7 +505,8 @@ static int ht16k33_probe(struct i2c_client *client,
 	return 0;
 
 err_keypad_unregister:
-	input_unregister_device(keypad->dev);
+	if (priv->keypad.dev)
+		input_unregister_device(priv->keypad.dev);
 err_fbdev_unregister:
 	unregister_framebuffer(fbdev->info);
 err_fbdev_info:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
