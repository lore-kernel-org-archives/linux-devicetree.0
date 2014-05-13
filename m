From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] NFC: dts: st21nfca: Add device-tree (Open Firmware) support to st21nfca
Date: Tue, 13 May 2014 22:03:39 +0200
Message-ID: <1400011422-10999-2-git-send-email-christophe-h.ricard@st.com>
References: <1400011422-10999-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400011422-10999-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add functions to recover hardware resources from the device-tree
when not provided by the platform data.

Based on pn544 devicetree implementation

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/i2c.c | 106 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 19 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 2337737..3f954ed 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -21,6 +21,8 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
 #include <linux/miscdevice.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
@@ -502,11 +504,65 @@ static struct nfc_phy_ops i2c_phy_ops = {
 	.disable = st21nfca_hci_i2c_disable,
 };
 
+#ifdef CONFIG_OF
+static int st21nfca_hci_i2c_of_request_resources(struct i2c_client *client)
+{
+	struct st21nfca_i2c_phy *phy = i2c_get_clientdata(client);
+	struct device_node *pp;
+	int gpio;
+	int r;
+
+	pp = client->dev.of_node;
+	if (!pp)
+		return -ENODEV;
+
+	/* Get GPIO from device tree */
+	gpio = of_get_named_gpio(pp, "enable-gpios", 0);
+	if (gpio < 0) {
+		nfc_err(&client->dev, "Failed to retrieve enable-gpios from device tree\n");
+		return gpio;
+	}
+
+	/* GPIO request and configuration */
+	r = devm_gpio_request(&client->dev, gpio, "clf_enable");
+	if (r) {
+		nfc_err(&client->dev, "Failed to request enable pin\n");
+		return -ENODEV;
+	}
+
+	r = gpio_direction_output(gpio, 1);
+	if (r) {
+		nfc_err(&client->dev, "Failed to set enable pin direction as output\n");
+		return -ENODEV;
+	}
+	phy->gpio_ena = gpio;
+
+	/* IRQ */
+	r = irq_of_parse_and_map(pp, 0);
+	if (r < 0) {
+		nfc_err(&client->dev,
+				"Unable to get irq, error: %d\n", r);
+		return r;
+	}
+
+	phy->irq_polarity = irq_get_trigger_type(r);
+	client->irq = r;
+
+	return 0;
+}
+#else
+static int st21nfca_hci_i2c_of_request_resources(struct i2c_client *client)
+{
+	return -ENODEV;
+}
+#endif
+
 static int st21nfca_hci_i2c_request_resources(struct i2c_client *client)
 {
 	struct st21nfca_nfc_platform_data *pdata;
 	struct st21nfca_i2c_phy *phy = i2c_get_clientdata(client);
 	int r;
+	int irq;
 
 	pdata = client->dev.platform_data;
 	if (pdata == NULL) {
@@ -547,6 +603,16 @@ static int st21nfca_hci_i2c_request_resources(struct i2c_client *client)
 		}
 	}
 
+	/* IRQ */
+	irq = gpio_to_irq(phy->gpio_irq);
+	if (irq < 0) {
+		nfc_err(&client->dev,
+				"Unable to get irq number for GPIO %d error %d\n",
+				phy->gpio_irq, r);
+		return -ENODEV;
+	}
+	client->irq = irq;
+
 	return 0;
 }
 
@@ -556,7 +622,6 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *client,
 	struct st21nfca_i2c_phy *phy;
 	struct st21nfca_nfc_platform_data *pdata;
 	int r;
-	int irq;
 
 	dev_dbg(&client->dev, "%s\n", __func__);
 	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
@@ -585,26 +650,22 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, phy);
 
 	pdata = client->dev.platform_data;
-	if (!pdata) {
-		nfc_err(&client->dev, "No platform data\n");
-		return -EINVAL;
-	}
-
-	r = st21nfca_hci_i2c_request_resources(client);
-	if (r) {
-		nfc_err(&client->dev, "Cannot get platform resources\n");
-		return r;
-	}
-
-	/* IRQ */
-	irq = gpio_to_irq(phy->gpio_irq);
-	if (irq < 0) {
-		nfc_err(&client->dev,
-				"Unable to get irq number for GPIO %d error %d\n",
-				phy->gpio_irq, r);
+	if (!pdata && client->dev.of_node) {
+		r = st21nfca_hci_i2c_of_request_resources(client);
+		if (r) {
+			nfc_err(&client->dev, "No platform data\n");
+			return r;
+		}
+	} else if (pdata) {
+		r = st21nfca_hci_i2c_request_resources(client);
+		if (r) {
+			nfc_err(&client->dev, "Cannot get platform resources\n");
+			return r;
+		}
+	} else {
+		nfc_err(&client->dev, "st21nfca platform resources not available\n");
 		return -ENODEV;
 	}
-	client->irq = irq;
 
 	r = st21nfca_hci_platform_init(phy);
 	if (r < 0) {
@@ -640,10 +701,17 @@ static int st21nfca_hci_i2c_remove(struct i2c_client *client)
 	return 0;
 }
 
+static const struct of_device_id of_st21nfca_i2c_match[] = {
+	{ .compatible = "st,st21nfca_i2c", },
+	{}
+};
+
 static struct i2c_driver st21nfca_hci_i2c_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
 		.name = ST21NFCA_HCI_I2C_DRIVER_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(of_st21nfca_i2c_match),
 	},
 	.probe = st21nfca_hci_i2c_probe,
 	.id_table = st21nfca_hci_i2c_id_table,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
