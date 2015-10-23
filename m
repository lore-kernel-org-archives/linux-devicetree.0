From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 5/9] NFC: nfcmrvl: add i2c driver
Date: Fri, 23 Oct 2015 14:23:02 +0200
Message-ID: <1445602986-3254-6-git-send-email-cuissard@marvell.com>
References: <1445602986-3254-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445602986-3254-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver adds the support of I2C-based Marvell NFC controller.

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/net/nfc/nfcmrvl.txt        |  34 ++-
 drivers/nfc/nfcmrvl/Kconfig                        |  12 +
 drivers/nfc/nfcmrvl/Makefile                       |   3 +
 drivers/nfc/nfcmrvl/i2c.c                          | 291 +++++++++++++++++++++
 drivers/nfc/nfcmrvl/main.c                         |   9 +-
 drivers/nfc/nfcmrvl/nfcmrvl.h                      |   1 +
 include/linux/platform_data/nfcmrvl.h              |   8 +
 include/net/nfc/nci.h                              |   1 +
 8 files changed, 354 insertions(+), 5 deletions(-)
 create mode 100644 drivers/nfc/nfcmrvl/i2c.c

diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
index 7c4a0cc..0fa20cc 100644
--- a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
+++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
@@ -1,7 +1,9 @@
 * Marvell International Ltd. NCI NFC Controller
 
 Required properties:
-- compatible: Should be "mrvl,nfc-uart".
+- compatible: Should be:
+  - "mrvl,nfc-uart" for UART devices
+  - "mrvl,nfc-i2c" for I2C devices
 
 Optional SoC specific properties:
 - pinctrl-names: Contains only one value - "default".
@@ -13,6 +15,12 @@ Optional UART-based chip specific properties:
 - flow-control: Specifies that the chip is using RTS/CTS.
 - break-control: Specifies that the chip needs specific break management.
 
+Optional I2C-based chip specific properties:
+- i2c-int-falling: Specifies that the chip read event shall be trigged on
+  		   falling edge.
+- i2c-int-rising: Specifies that the chip read event shall be trigged on
+  		  rising edge.
+
 Example (for ARM-based BeagleBoard Black with 88W8887 on UART5):
 
 &uart5 {
@@ -27,3 +35,27 @@ Example (for ARM-based BeagleBoard Black with 88W8887 on UART5):
 		flow-control;
         }
 };
+
+
+Example (for ARM-based BeagleBoard Black with 88W8887 on I2C1):
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	nfcmrvli2c0: i2c@1 {
+		compatible = "mrvl,nfc-i2c";
+
+		reg = <0x8>;
+
+		/* I2C INT configuration */
+		interrupt-parent = <&gpio3>;
+		interrupts = <21 0>;
+
+		/* I2C INT trigger configuration */
+		i2c-int-rising;
+
+		/* Reset IO */
+		reset-n-io = <&gpio3 19 0>;
+	};
+};
diff --git a/drivers/nfc/nfcmrvl/Kconfig b/drivers/nfc/nfcmrvl/Kconfig
index 19ac492..e18a979 100644
--- a/drivers/nfc/nfcmrvl/Kconfig
+++ b/drivers/nfc/nfcmrvl/Kconfig
@@ -30,3 +30,15 @@ config NFC_MRVL_UART
 
 	  Say Y here to compile support for Marvell NFC-over-UART driver
 	  into the kernel or say M to compile it as module.
+
+config NFC_MRVL_I2C
+	tristate "Marvell NFC-over-I2C driver"
+	depends on NFC_MRVL && I2C
+	help
+	  Marvell NFC-over-I2C driver.
+
+	  This driver provides support for Marvell NFC-over-I2C devices.
+
+	  Say Y here to compile support for Marvell NFC-over-I2C driver
+	  into the kernel or say M to compile it as module.
+
diff --git a/drivers/nfc/nfcmrvl/Makefile b/drivers/nfc/nfcmrvl/Makefile
index 4554ee8..895866a 100644
--- a/drivers/nfc/nfcmrvl/Makefile
+++ b/drivers/nfc/nfcmrvl/Makefile
@@ -10,3 +10,6 @@ obj-$(CONFIG_NFC_MRVL_USB) += nfcmrvl_usb.o
 
 nfcmrvl_uart-y += uart.o
 obj-$(CONFIG_NFC_MRVL_UART) += nfcmrvl_uart.o
+
+nfcmrvl_i2c-y += i2c.o
+obj-$(CONFIG_NFC_MRVL_I2C) += nfcmrvl_i2c.o
diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
new file mode 100644
index 0000000..acc721f
--- /dev/null
+++ b/drivers/nfc/nfcmrvl/i2c.c
@@ -0,0 +1,291 @@
+/**
+ * Marvell NFC-over-I2C driver: I2C interface related functions
+ *
+ * Copyright (C) 2015, Marvell International Ltd.
+ *
+ * This software file (the "File") is distributed by Marvell International
+ * Ltd. under the terms of the GNU General Public License Version 2, June 1991
+ * (the "License").  You may use, redistribute and/or modify this File in
+ * accordance with the terms and conditions of the License, a copy of which
+ * is available on the worldwide web at
+ * http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
+ *
+ * THE FILE IS DISTRIBUTED AS-IS, WITHOUT WARRANTY OF ANY KIND, AND THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE
+ * ARE EXPRESSLY DISCLAIMED.  The License provides additional details about
+ * this warranty disclaimer.
+ **/
+
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/i2c.h>
+#include <linux/pm_runtime.h>
+#include <linux/nfc.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <net/nfc/nci.h>
+#include <net/nfc/nci_core.h>
+#include "nfcmrvl.h"
+
+struct nfcmrvl_i2c_drv_data {
+	unsigned long flags;
+	struct device *dev;
+	struct i2c_client *i2c;
+	struct nfcmrvl_private *priv;
+};
+
+static int nfcmrvl_i2c_read(struct nfcmrvl_i2c_drv_data *drv_data,
+			    struct sk_buff **skb)
+{
+	int ret;
+	struct nci_ctrl_hdr nci_hdr;
+
+	/* Read NCI header to know the payload size */
+	ret = i2c_master_recv(drv_data->i2c, (u8 *)&nci_hdr, NCI_CTRL_HDR_SIZE);
+	if (ret != NCI_CTRL_HDR_SIZE) {
+		nfc_err(&drv_data->i2c->dev, "cannot read NCI header\n");
+		return -EBADMSG;
+	}
+
+	if (nci_hdr.plen > NCI_MAX_PAYLOAD_SIZE) {
+		nfc_err(&drv_data->i2c->dev, "invalid packet payload size\n");
+		return -EBADMSG;
+	}
+
+	*skb = nci_skb_alloc(drv_data->priv->ndev,
+			     nci_hdr.plen + NCI_CTRL_HDR_SIZE, GFP_KERNEL);
+	if (!*skb)
+		return -ENOMEM;
+
+	/* Copy NCI header into the SKB */
+	memcpy(skb_put(*skb, NCI_CTRL_HDR_SIZE), &nci_hdr, NCI_CTRL_HDR_SIZE);
+
+	if (nci_hdr.plen) {
+		/* Read the NCI payload */
+		ret = i2c_master_recv(drv_data->i2c,
+				      skb_put(*skb, nci_hdr.plen),
+				      nci_hdr.plen);
+
+		if (ret != nci_hdr.plen) {
+			nfc_err(&drv_data->i2c->dev,
+				"Invalid frame payload length: %u"
+				" (expected %u)\n",
+				ret, nci_hdr.plen);
+			kfree_skb(*skb);
+			return -EBADMSG;
+		}
+	}
+
+	return 0;
+}
+
+static irqreturn_t nfcmrvl_i2c_int_irq_thread_fn(int irq, void *drv_data_ptr)
+{
+	struct nfcmrvl_i2c_drv_data *drv_data = drv_data_ptr;
+	struct sk_buff *skb = NULL;
+	int ret;
+
+	if (!drv_data->priv)
+		return IRQ_HANDLED;
+
+	if (test_bit(NFCMRVL_PHY_ERROR, &drv_data->priv->flags))
+		return IRQ_HANDLED;
+
+	ret = nfcmrvl_i2c_read(drv_data, &skb);
+
+	switch (ret) {
+	case -EREMOTEIO:
+		set_bit(NFCMRVL_PHY_ERROR, &drv_data->priv->flags);
+		break;
+	case -ENOMEM:
+	case -EBADMSG:
+		nfc_err(&drv_data->i2c->dev, "read failed %d\n", ret);
+		break;
+	default:
+		if (nfcmrvl_nci_recv_frame(drv_data->priv, skb) < 0)
+			nfc_err(&drv_data->i2c->dev, "corrupted RX packet\n");
+		break;
+	}
+	return IRQ_HANDLED;
+}
+
+static int nfcmrvl_i2c_nci_open(struct nfcmrvl_private *priv)
+{
+	struct nfcmrvl_i2c_drv_data *drv_data = priv->drv_data;
+
+	if (!drv_data)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int nfcmrvl_i2c_nci_close(struct nfcmrvl_private *priv)
+{
+	return 0;
+}
+
+static int nfcmrvl_i2c_nci_send(struct nfcmrvl_private *priv,
+				struct sk_buff *skb)
+{
+	struct nfcmrvl_i2c_drv_data *drv_data = priv->drv_data;
+	int ret;
+
+	if (test_bit(NFCMRVL_PHY_ERROR, &priv->flags))
+		return -EREMOTEIO;
+
+	ret = i2c_master_send(drv_data->i2c, skb->data, skb->len);
+
+	/* Retry if chip was in standby */
+	if (ret == -EREMOTEIO) {
+		nfc_info(drv_data->dev, "chip may sleep, retry\n");
+		usleep_range(6000, 10000);
+		ret = i2c_master_send(drv_data->i2c, skb->data, skb->len);
+	}
+
+	if (ret >= 0) {
+		if (ret != skb->len) {
+			nfc_err(drv_data->dev,
+				"Invalid length sent: %u (expected %u)\n",
+				ret, skb->len);
+			ret = -EREMOTEIO;
+		} else
+			ret = 0;
+		kfree_skb(skb);
+	}
+
+	return ret;
+}
+
+static void nfcmrvl_i2c_nci_update_config(struct nfcmrvl_private *priv,
+					  const void *param)
+{
+}
+
+static struct nfcmrvl_if_ops i2c_ops = {
+	.nci_open = nfcmrvl_i2c_nci_open,
+	.nci_close = nfcmrvl_i2c_nci_close,
+	.nci_send = nfcmrvl_i2c_nci_send,
+	.nci_update_config = nfcmrvl_i2c_nci_update_config,
+};
+
+static int nfcmrvl_i2c_parse_dt(struct device_node *node,
+				struct nfcmrvl_platform_data *pdata)
+{
+	int ret;
+
+	ret = nfcmrvl_parse_dt(node, pdata);
+	if (ret < 0) {
+		pr_err("Failed to get generic entries\n");
+		return ret;
+	}
+
+	if (of_find_property(node, "i2c-int-falling", NULL))
+		pdata->irq_polarity = IRQF_TRIGGER_FALLING;
+	else
+		pdata->irq_polarity = IRQF_TRIGGER_RISING;
+
+	ret = irq_of_parse_and_map(node, 0);
+	if (ret < 0) {
+		pr_err("Unable to get irq, error: %d\n", ret);
+		return ret;
+	}
+	pdata->irq = ret;
+
+	return 0;
+}
+
+static int nfcmrvl_i2c_probe(struct i2c_client *client,
+			     const struct i2c_device_id *id)
+{
+	struct nfcmrvl_i2c_drv_data *drv_data;
+	struct nfcmrvl_platform_data *pdata;
+	struct nfcmrvl_platform_data config;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
+		return -ENODEV;
+	}
+
+	drv_data = devm_kzalloc(&client->dev, sizeof(*drv_data), GFP_KERNEL);
+	if (!drv_data)
+		return -ENOMEM;
+
+	drv_data->i2c = client;
+	drv_data->dev = &client->dev;
+	drv_data->priv = NULL;
+
+	i2c_set_clientdata(client, drv_data);
+
+	pdata = client->dev.platform_data;
+
+	if (!pdata && client->dev.of_node)
+		if (nfcmrvl_i2c_parse_dt(client->dev.of_node, &config) == 0)
+			pdata = &config;
+
+	if (!pdata)
+		return -EINVAL;
+
+	/* Request the read IRQ */
+	ret = devm_request_threaded_irq(&drv_data->i2c->dev, pdata->irq,
+					NULL, nfcmrvl_i2c_int_irq_thread_fn,
+					pdata->irq_polarity | IRQF_ONESHOT,
+					"nfcmrvl_i2c_int", drv_data);
+	if (ret < 0) {
+		nfc_err(&drv_data->i2c->dev,
+			"Unable to register IRQ handler\n");
+		return ret;
+	}
+
+	drv_data->priv = nfcmrvl_nci_register_dev(NFCMRVL_PHY_I2C,
+						  drv_data, &i2c_ops,
+						  &drv_data->i2c->dev, pdata);
+
+	if (IS_ERR(drv_data->priv))
+		return PTR_ERR(drv_data->priv);
+
+	drv_data->priv->support_fw_dnld = true;
+
+	return 0;
+}
+
+static int nfcmrvl_i2c_remove(struct i2c_client *client)
+{
+	struct nfcmrvl_i2c_drv_data *drv_data = i2c_get_clientdata(client);
+
+	nfcmrvl_nci_unregister_dev(drv_data->priv);
+
+	return 0;
+}
+
+
+static const struct of_device_id of_nfcmrvl_i2c_match[] = {
+	{ .compatible = "mrvl,nfc-i2c", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_nfcmrvl_i2c_match);
+
+static struct i2c_device_id nfcmrvl_i2c_id_table[] = {
+	{ "nfcmrvl_i2c", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, nfcmrvl_i2c_id_table);
+
+static struct i2c_driver nfcmrvl_i2c_driver = {
+	.probe = nfcmrvl_i2c_probe,
+	.id_table = nfcmrvl_i2c_id_table,
+	.remove = nfcmrvl_i2c_remove,
+	.driver = {
+		.name		= "nfcmrvl_i2c",
+		.owner		= THIS_MODULE,
+		.of_match_table	= of_match_ptr(of_nfcmrvl_i2c_match),
+	},
+};
+
+module_i2c_driver(nfcmrvl_i2c_driver);
+
+MODULE_AUTHOR("Marvell International Ltd.");
+MODULE_DESCRIPTION("Marvell NFC-over-I2C driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index a24a7ca..0c27de6 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -33,6 +33,9 @@ static int nfcmrvl_nci_open(struct nci_dev *ndev)
 	if (test_and_set_bit(NFCMRVL_NCI_RUNNING, &priv->flags))
 		return 0;
 
+	/* Reset possible fault of previous session */
+	clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
+
 	err = priv->if_ops->nci_open(priv);
 
 	if (err)
@@ -226,10 +229,8 @@ EXPORT_SYMBOL_GPL(nfcmrvl_nci_recv_frame);
 
 void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
 {
-	/*
-	 * This function does not take care if someone is using the device.
-	 * To be improved.
-	 */
+	/* Reset possible fault of previous session */
+	clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
 
 	if (priv->config.reset_n_io) {
 		nfc_info(priv->dev, "reset the chip\n");
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index f82678b..de68ff4 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -25,6 +25,7 @@
 
 /* Define private flags: */
 #define NFCMRVL_NCI_RUNNING			1
+#define NFCMRVL_PHY_ERROR			2
 
 #define NFCMRVL_EXT_COEX_ID			0xE0
 #define NFCMRVL_NOT_ALLOWED_ID			0xE1
diff --git a/include/linux/platform_data/nfcmrvl.h b/include/linux/platform_data/nfcmrvl.h
index ac91707..a6f9d63 100644
--- a/include/linux/platform_data/nfcmrvl.h
+++ b/include/linux/platform_data/nfcmrvl.h
@@ -35,6 +35,14 @@ struct nfcmrvl_platform_data {
 	unsigned int flow_control;
 	/* Tell if firmware supports break control for power management */
 	unsigned int break_control;
+
+
+	/*
+	 * I2C specific
+	 */
+
+	unsigned int irq;
+	unsigned int irq_polarity;
 };
 
 #endif /* _NFCMRVL_PTF_H_ */
diff --git a/include/net/nfc/nci.h b/include/net/nfc/nci.h
index 75d2e18..0fbc647 100644
--- a/include/net/nfc/nci.h
+++ b/include/net/nfc/nci.h
@@ -35,6 +35,7 @@
 #define NCI_MAX_NUM_RF_CONFIGS					10
 #define NCI_MAX_NUM_CONN					10
 #define NCI_MAX_PARAM_LEN					251
+#define NCI_MAX_PAYLOAD_SIZE					255
 #define NCI_MAX_PACKET_SIZE					258
 
 /* NCI Status Codes */
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
