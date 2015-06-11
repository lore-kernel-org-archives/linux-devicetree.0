From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 1/2] NFC: nfcmrvl: add platform_data and DT configuration
Date: Thu, 11 Jun 2015 14:00:19 +0200
Message-ID: <1434024020-17048-2-git-send-email-cuissard@marvell.com>
References: <1434024020-17048-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434024020-17048-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Declare nfcmrvl platform_data structure and few DT parameters
for nfcmrvl driver.

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/nfc/nfcmrvl/main.c            | 67 +++++++++++++++++++++++++++--------
 drivers/nfc/nfcmrvl/nfcmrvl.h         | 36 +++++++++++++------
 drivers/nfc/nfcmrvl/usb.c             |  6 +++-
 include/linux/platform_data/nfcmrvl.h | 31 ++++++++++++++++
 4 files changed, 114 insertions(+), 26 deletions(-)
 create mode 100644 include/linux/platform_data/nfcmrvl.h

diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 708aad2..9b53706 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/gpio.h>
 #include <linux/delay.h>
+#include <linux/of_gpio.h>
 #include <linux/nfc.h>
 #include <net/nfc/nci.h>
 #include <net/nfc/nci_core.h>
@@ -65,7 +66,7 @@ static int nfcmrvl_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
 	if (!test_bit(NFCMRVL_NCI_RUNNING, &priv->flags))
 		return -EBUSY;
 
-	if (priv->hci_muxed) {
+	if (priv->config.hci_muxed) {
 		unsigned char *hdr;
 		unsigned char len = skb->len;
 
@@ -92,9 +93,9 @@ static struct nci_ops nfcmrvl_nci_ops = {
 };
 
 struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
-						 struct nfcmrvl_if_ops *ops,
-						 struct device *dev,
-						 unsigned int flags)
+				struct nfcmrvl_if_ops *ops,
+				struct device *dev,
+				struct nfcmrvl_platform_data *pdata)
 {
 	struct nfcmrvl_private *priv;
 	int rc;
@@ -108,23 +109,24 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
 	priv->drv_data = drv_data;
 	priv->if_ops = ops;
 	priv->dev = dev;
-	priv->hci_muxed = (flags & NFCMRVL_DEV_FLAG_HCI_MUXED) ? 1 : 0;
-	priv->reset_n_io = NFCMRVL_DEV_FLAG_GET_RESET_N_IO(flags);
 
-	if (priv->reset_n_io) {
+	memcpy(&priv->config, pdata, sizeof(*pdata));
+
+	if (priv->config.reset_n_io) {
 		rc = devm_gpio_request_one(dev,
-					   priv->reset_n_io,
+					   priv->config.reset_n_io,
 					   GPIOF_OUT_INIT_LOW,
 					   "nfcmrvl_reset_n");
 		if (rc < 0)
 			nfc_err(dev, "failed to request reset_n io\n");
 	}
 
-	if (priv->hci_muxed)
+	if (priv->config.hci_muxed)
 		headroom = NFCMRVL_HCI_EVENT_HEADER_SIZE;
 
 	protocols = NFC_PROTO_JEWEL_MASK
-		| NFC_PROTO_MIFARE_MASK | NFC_PROTO_FELICA_MASK
+		| NFC_PROTO_MIFARE_MASK
+		| NFC_PROTO_FELICA_MASK
 		| NFC_PROTO_ISO14443_MASK
 		| NFC_PROTO_ISO14443_B_MASK
 		| NFC_PROTO_NFC_DEP_MASK;
@@ -169,7 +171,7 @@ EXPORT_SYMBOL_GPL(nfcmrvl_nci_unregister_dev);
 
 int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *skb)
 {
-	if (priv->hci_muxed) {
+	if (priv->config.hci_muxed) {
 		if (skb->data[0] == NFCMRVL_HCI_EVENT_CODE &&
 		    skb->data[1] == NFCMRVL_HCI_NFC_EVENT_CODE) {
 			/* Data packet, let's extract NCI payload */
@@ -200,15 +202,52 @@ void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
 	 * To be improved.
 	 */
 
-	if (priv->reset_n_io) {
+	if (priv->config.reset_n_io) {
 		nfc_info(priv->dev, "reset the chip\n");
-		gpio_set_value(priv->reset_n_io, 0);
+		gpio_set_value(priv->config.reset_n_io, 0);
 		usleep_range(5000, 10000);
-		gpio_set_value(priv->reset_n_io, 1);
+		gpio_set_value(priv->config.reset_n_io, 1);
 	} else
 		nfc_info(priv->dev, "no reset available on this interface\n");
 }
 
+#ifdef CONFIG_OF
+
+int nfcmrvl_parse_dt(struct device_node *node,
+		     struct nfcmrvl_platform_data *pdata)
+{
+	int reset_n_io;
+
+	reset_n_io = of_get_named_gpio(node, "reset-n-io", 0);
+	if (reset_n_io < 0) {
+		pr_info("no reset-n-io config\n");
+		reset_n_io = 0;
+	} else if (!gpio_is_valid(reset_n_io)) {
+		pr_err("invalid reset-n-io GPIO\n");
+		return reset_n_io;
+	}
+	pdata->reset_n_io = reset_n_io;
+
+	if (of_find_property(node, "hci-muxed", NULL))
+		pdata->hci_muxed = 1;
+	else
+		pdata->hci_muxed = 0;
+
+	return 0;
+}
+
+#else
+
+int nfcmrvl_parse_dt(struct device_node *node,
+		     struct nfcmrvl_platform_data *pdata)
+{
+	return -ENODEV;
+}
+
+#endif
+
+EXPORT_SYMBOL_GPL(nfcmrvl_parse_dt);
+
 MODULE_AUTHOR("Marvell International Ltd.");
 MODULE_DESCRIPTION("Marvell NFC driver ver " VERSION);
 MODULE_VERSION(VERSION);
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index 2edae9a..214412b 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -16,6 +16,11 @@
  * this warranty disclaimer.
  **/
 
+#ifndef _NFCMRVL_H_
+#define _NFCMRVL_H_
+
+#include <linux/platform_data/nfcmrvl.h>
+
 /* Define private flags: */
 #define NFCMRVL_NCI_RUNNING			1
 
@@ -38,22 +43,25 @@
 #define NFCMRVL_HCI_OGF				0x81
 #define NFCMRVL_HCI_OCF				0xFE
 
-#define NFCMRVL_DEV_FLAG_HCI_MUXED		(1 << 0)
-#define NFCMRVL_DEV_FLAG_SET_RESET_N_IO(X)	((X) << 16)
-#define NFCMRVL_DEV_FLAG_GET_RESET_N_IO(X)	((X) >> 16)
 
 struct nfcmrvl_private {
 
-	/* Tell if NCI packets are encapsulated in HCI ones */
-	int hci_muxed;
+	unsigned long flags;
+
+	/* Platform configuration */
+	struct nfcmrvl_platform_data config;
+
 	struct nci_dev *ndev;
 
-	/* Reset IO (0 if not available) */
-	int reset_n_io;
+	/*
+	** PHY related information
+	*/
 
-	unsigned long flags;
+	/* PHY driver context */
 	void *drv_data;
+	/* PHY device */
 	struct device *dev;
+	/* Low level driver ops */
 	struct nfcmrvl_if_ops *if_ops;
 };
 
@@ -66,8 +74,14 @@ struct nfcmrvl_if_ops {
 void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv);
 int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *skb);
 struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
-						 struct nfcmrvl_if_ops *ops,
-						 struct device *dev,
-						 unsigned int flags);
+				struct nfcmrvl_if_ops *ops,
+				struct device *dev,
+				struct nfcmrvl_platform_data *pdata);
+
 
 void nfcmrvl_chip_reset(struct nfcmrvl_private *priv);
+
+int nfcmrvl_parse_dt(struct device_node *node,
+		     struct nfcmrvl_platform_data *pdata);
+
+#endif
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index c4046b6..aa3f3c1 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -302,6 +302,10 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 	struct nfcmrvl_private *priv;
 	int i;
 	struct usb_device *udev = interface_to_usbdev(intf);
+	struct nfcmrvl_platform_data config;
+
+	/* No configuration for USB */
+	memset(&config, 0, sizeof(config));
 
 	nfc_info(&udev->dev, "intf %p id %p\n", intf, id);
 
@@ -339,7 +343,7 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 	init_usb_anchor(&drv_data->deferred);
 
 	priv = nfcmrvl_nci_register_dev(drv_data, &usb_ops,
-					&drv_data->udev->dev, 0);
+					&drv_data->udev->dev, &config);
 	if (IS_ERR(priv))
 		return PTR_ERR(priv);
 
diff --git a/include/linux/platform_data/nfcmrvl.h b/include/linux/platform_data/nfcmrvl.h
new file mode 100644
index 0000000..106cfe5
--- /dev/null
+++ b/include/linux/platform_data/nfcmrvl.h
@@ -0,0 +1,31 @@
+/*
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
+ */
+
+#ifndef _NFCMRVL_PTF_H_
+#define _NFCMRVL_PTF_H_
+
+struct nfcmrvl_platform_data {
+	/*
+	 * Generic
+	 */
+
+	/* GPIO that is wired to RESET_N signal */
+	unsigned int reset_n_io;
+	/* Tell if transport is muxed in HCI one */
+	unsigned int hci_muxed;
+};
+
+#endif /* _NFCMRVL_PTF_H_ */
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
