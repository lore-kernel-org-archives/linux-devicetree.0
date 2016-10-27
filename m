From: Gordan Markus <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] input: keyboard: Add devicetree support for lm8333
Date: Thu, 27 Oct 2016 21:17:34 +0200
Message-ID: <1477595854-9059-1-git-send-email-gordan.markus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds LM8333 devicetree parsing for the keypad part.
Optional properties to specify the keypad driver active
time and debounce time.

Signed-off-by: Gordan Markuš <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/input/ti,lm8333.txt        | 45 ++++++++++++++++++
 drivers/input/keyboard/lm8333.c                    | 54 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/ti,lm8333.txt

diff --git a/Documentation/devicetree/bindings/input/ti,lm8333.txt b/Documentation/devicetree/bindings/input/ti,lm8333.txt
new file mode 100644
index 0000000..4100d48
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,lm8333.txt
@@ -0,0 +1,45 @@
+LM8333 Keypad
+
+Required properties:
+- compatible: Compatible property value should be "ti,lm8333".
+
+- reg: Physical base address of the peripheral and length of memory mapped
+  region.
+
+- interrupts: The interrupt number for the peripheral.
+
+- linux,keymap: The keymap to use
+	(see Documentation/devicetree/bindings/input/matrix-keymap.txt)
+
+Optional properties:
+- ti,active-time: Specify the time during which the keypad is scanned after
+	the last key is released, before entering Halt mode.
+	The active time must be longer than the debounce time.
+	Default 500 ms.
+
+- ti,debounce-time: Specify the keypad debounce time.
+	This can be used for reliable scanning of keyboards with noisy contacts.
+	Default 10 ms.
+
+Example:
+input {
+	compatible = "ti,lm8333";
+	reg = <0x51>;
+	interrupts = <5>;
+
+	ti,active-time = <750>;
+	ti,debounce-time = <20>;
+
+	linux,keymap = <
+			0x0001001e
+			0x00020030
+			0x0003002e
+			0x00040020
+			0x00050012
+			0x00060021
+			0x00070022
+			0x00080023
+			0x01010017
+			0x01020024
+			0x01030025>;
+};
diff --git a/drivers/input/keyboard/lm8333.c b/drivers/input/keyboard/lm8333.c
index c717e8f..adb7d64 100644
--- a/drivers/input/keyboard/lm8333.c
+++ b/drivers/input/keyboard/lm8333.c
@@ -128,6 +128,51 @@ static irqreturn_t lm8333_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static struct lm8333_platform_data *lm8333_parse_dt(struct i2c_client *client)
+{
+	struct device_node *np = client->dev.of_node;
+	struct lm8333_platform_data *pdata;
+	struct matrix_keymap_data *matrix_data;
+	u32 *keymap;
+	u32 prop;
+	int len;
+
+	pdata = devm_kzalloc(&client->dev, sizeof(pdata),
+				GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	if (!of_property_read_u32(np, "ti,active-time", &prop))
+		pdata->active_time = prop;
+
+	if (!of_property_read_u32(np, "ti,debounce-time", &prop))
+		pdata->debounce_time = prop;
+	else
+		pdata->debounce_time = 10;
+
+	if (!of_get_property(np, "linux,keymap", &prop))
+		len = prop / sizeof(u32);
+	else {
+		dev_err(&client->dev, "no keymap data defined\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	keymap = devm_kzalloc(&client->dev, sizeof(len) * len, GFP_KERNEL);
+	matrix_data = devm_kzalloc(&client->dev, sizeof(matrix_data),
+					GFP_KERNEL);
+	if (!matrix_data || !keymap)
+		return ERR_PTR(-ENOMEM);
+
+	if (!of_property_read_u32_array(np, "linux,keymap", keymap, len)) {
+		matrix_data->keymap_size = len;
+		matrix_data->keymap = keymap;
+
+		pdata->matrix_data = matrix_data;
+	}
+
+	return pdata;
+}
+
 static int lm8333_probe(struct i2c_client *client,
 				  const struct i2c_device_id *id)
 {
@@ -137,6 +182,15 @@ static int lm8333_probe(struct i2c_client *client,
 	struct input_dev *input;
 	int err, active_time;
 
+	if (!pdata && client->dev.of_node) {
+		pdata = lm8333_parse_dt(client);
+		if (IS_ERR(pdata)) {
+			dev_err(&client->dev,
+				"could not parse configuration\n");
+			return IS_ERR(pdata);
+		}
+	}
+
 	if (!pdata)
 		return -EINVAL;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
