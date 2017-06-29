From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3] 1/2] input: keyboard: Add devicetree support for lm8333
Date: Thu, 29 Jun 2017 10:18:54 +0200
Message-ID: <20170629081855.16034-3-gordan.markus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds LM8333 devicetree parsing for the keypad part. Optional
properties to specify the keypad driver active time and debounce time.

Signed-off-by: Gordan Markuš <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/input/keyboard/lm8333.c | 54 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/input/keyboard/lm8333.c b/drivers/input/keyboard/lm8333.c
index c717e8f..f1508c5 100644
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
+	if (!of_property_read_u32(np, "ti,active-time-ms", &prop))
+		pdata->active_time = prop;
+
+	if (!of_property_read_u32(np, "debounce-delay-ms", &prop))
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
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
