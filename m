From: Clement Perrochaud <clement.perrochaud-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v3 1/2] NFC: pn544_i2c: Add device-tree (Open Firmware)
 support to PN544
Date: Mon, 31 Mar 2014 12:21:44 +0000
Message-ID: <92d1a06e7bda4a46a0b6a28ba6ede55b@AMXPR04MB136.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Clement Perrochaud <clement.perrochaud-3arQi8VN3Tc@public.gmane.org>, "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add functions to recover hardware resources from the device-tree
when not provided by the platform data.

Signed-off-by: Cl=E9ment Perrochaud <clement.perrochaud-3arQi8VN3Tc@public.gmane.org>
---
 drivers/nfc/pn544/i2c.c | 162 ++++++++++++++++++++++++++++++++++++++++=
+++-----
 1 file changed, 145 insertions(+), 17 deletions(-)

diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index f2acd85..942abea 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -22,6 +22,8 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
+#include <linux/of_platform.h>
+#include <linux/of_gpio.h>
 #include <linux/miscdevice.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
@@ -857,6 +859,108 @@ exit_state_wait_secure_write_answer:
 	}
 }
=20
+#ifdef CONFIG_OF
+
+static int pn544_hci_i2c_of_request_resources(struct i2c_client *clien=
t)
+{
+	struct pn544_i2c_phy *phy =3D i2c_get_clientdata(client);
+	struct device_node *pp;
+	int gpio[3];
+	int irq;
+	int ret;
+	int i;
+
+	pp =3D client->dev.of_node;
+	if (!pp) {
+		ret =3D -ENODEV;
+		goto err_dt;
+	}
+
+	/* Get GPIO from device tree */
+	gpio[NFC_GPIO_ENABLE] =3D of_get_named_gpio(pp, "en", 0);
+	gpio[NFC_GPIO_FW_RESET] =3D of_get_named_gpio(pp, "fw", 0);
+	gpio[NFC_GPIO_IRQ] =3D of_get_named_gpio(pp, "irq", 0);
+	for (i =3D 0; i < 3; i++) {
+		if (gpio[i] < 0) {
+			ret =3D gpio[i];
+			if (ret !=3D -EPROBE_DEFER)
+				nfc_err(&client->dev, "Failed to get gpio %d, error: %d\n", i, ret=
);
+			goto err_dt;
+		}
+	}
+
+	/* GPIO request and configuration */
+	ret =3D gpio_request(gpio[NFC_GPIO_FW_RESET], "pn544_fw");
+	if (ret) {
+		nfc_err(&client->dev, "Fail FW pin\n");
+		goto err_dt;
+	}
+	ret =3D gpio_direction_output(gpio[NFC_GPIO_FW_RESET], 0);
+	if (ret) {
+		nfc_err(&client->dev, "Fail FW pin direction\n");
+		goto err_gpio_en;
+	}
+
+	ret =3D gpio_request(gpio[NFC_GPIO_ENABLE], "pn544_en");
+	if (ret) {
+		nfc_err(&client->dev, "Fail EN pin\n");
+		goto err_gpio_en;
+	}
+	ret =3D gpio_direction_output(gpio[NFC_GPIO_ENABLE], 0);
+	if (ret) {
+		nfc_err(&client->dev, "Fail EN pin direction\n");
+		goto err_gpio_irq;
+	}
+
+	ret =3D gpio_request(gpio[NFC_GPIO_IRQ], "pn544_irq");
+	if (ret) {
+		nfc_err(&client->dev, "Fail IRQ pin\n");
+		goto err_gpio_irq;
+	}
+	ret =3D gpio_direction_input(gpio[NFC_GPIO_IRQ]);
+	if (ret) {
+		nfc_err(&client->dev, "Fail IRQ pin direction\n");
+		goto err_irq;
+	}
+
+	/* GPIO assignation */
+	phy->gpio_en =3D gpio[NFC_GPIO_ENABLE];
+	phy->gpio_fw =3D gpio[NFC_GPIO_FW_RESET];
+	phy->gpio_irq =3D gpio[NFC_GPIO_IRQ];
+
+	/* IRQ */
+	irq =3D gpio_to_irq(gpio[NFC_GPIO_IRQ]);
+	if (irq < 0) {
+		ret =3D irq;
+		nfc_err(&client->dev,
+			"Unable to get irq number for GPIO %d, error %d\n",
+			gpio[NFC_GPIO_IRQ],
+			ret);
+		goto err_irq;
+	}
+	client->irq =3D irq;
+
+	return 0;
+
+err_irq:
+	gpio_free(gpio[NFC_GPIO_IRQ]);
+err_gpio_irq:
+	gpio_free(gpio[NFC_GPIO_ENABLE]);
+err_gpio_en:
+	gpio_free(gpio[NFC_GPIO_FW_RESET]);
+err_dt:
+	return ret;
+}
+
+#else
+
+static int pn544_hci_i2c_of_request_resources(struct i2c_client *clien=
t)
+{
+	return -ENODEV;
+}
+
+#endif
+
 static int pn544_hci_i2c_probe(struct i2c_client *client,
 			       const struct i2c_device_id *id)
 {
@@ -887,25 +991,32 @@ static int pn544_hci_i2c_probe(struct i2c_client =
*client,
 	i2c_set_clientdata(client, phy);
=20
 	pdata =3D client->dev.platform_data;
-	if (pdata =3D=3D NULL) {
-		nfc_err(&client->dev, "No platform data\n");
-		return -EINVAL;
-	}
=20
-	if (pdata->request_resources =3D=3D NULL) {
-		nfc_err(&client->dev, "request_resources() missing\n");
-		return -EINVAL;
-	}
+	/* No platform data, using device tree. */
+	if (!pdata && client->dev.of_node) {
+		r =3D pn544_hci_i2c_of_request_resources(client);
+		if (r) {
+			nfc_err(&client->dev, "No DT data\n");
+			return r;
+		}
+	/* Using platform data. */
+	} else {
=20
-	r =3D pdata->request_resources(client);
-	if (r) {
-		nfc_err(&client->dev, "Cannot get platform resources\n");
-		return r;
-	}
+		if (pdata->request_resources =3D=3D NULL) {
+			nfc_err(&client->dev, "request_resources() missing\n");
+			return -EINVAL;
+		}
+
+		r =3D pdata->request_resources(client);
+		if (r) {
+			nfc_err(&client->dev, "Cannot get platform resources\n");
+			return r;
+		}
=20
-	phy->gpio_en =3D pdata->get_gpio(NFC_GPIO_ENABLE);
-	phy->gpio_fw =3D pdata->get_gpio(NFC_GPIO_FW_RESET);
-	phy->gpio_irq =3D pdata->get_gpio(NFC_GPIO_IRQ);
+		phy->gpio_en =3D pdata->get_gpio(NFC_GPIO_ENABLE);
+		phy->gpio_fw =3D pdata->get_gpio(NFC_GPIO_FW_RESET);
+		phy->gpio_irq =3D pdata->get_gpio(NFC_GPIO_IRQ);
+	}
=20
 	pn544_hci_i2c_platform_init(phy);
=20
@@ -953,15 +1064,32 @@ static int pn544_hci_i2c_remove(struct i2c_clien=
t *client)
 		pn544_hci_i2c_disable(phy);
=20
 	free_irq(client->irq, phy);
-	if (pdata->free_resources)
+
+	/* No platform data, GPIOs have been requested by this driver */
+	if (!pdata) {
+		gpio_free(phy->gpio_en);
+		gpio_free(phy->gpio_fw);
+		gpio_free(phy->gpio_irq);
+
+	/* Using platform data */
+	} else if (pdata->free_resources) {
 		pdata->free_resources();
+	}
=20
 	return 0;
 }
=20
+static const struct of_device_id of_pn544_i2c_match[] =3D {
+	{ .compatible =3D "nxp,pn544_i2c", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_pn544_i2c_match);
+
 static struct i2c_driver pn544_hci_i2c_driver =3D {
 	.driver =3D {
 		   .name =3D PN544_HCI_I2C_DRIVER_NAME,
+		   .owner  =3D THIS_MODULE,
+		   .of_match_table =3D of_match_ptr(of_pn544_i2c_match),
 		  },
 	.probe =3D pn544_hci_i2c_probe,
 	.id_table =3D pn544_hci_i2c_id_table,
--=20
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
