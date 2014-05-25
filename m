From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] NFC: st21nfcb: Add driver for STMicroelectronics ST21NFCB NFC chip
Date: Sun, 25 May 2014 22:35:38 +0200
Message-ID: <1401050140-15050-2-git-send-email-christophe-h.ricard@st.com>
References: <1401050140-15050-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401050140-15050-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add driver for STMicroelectronics ST21NFCB NFC controller.
ST21NFCB is using NCI protocol and a proprietary low level transport
protocol called NDLC used on top.

NDLC:
The protocol defines 2 types of frame:
- One type carrying NCI data (referred as DATAFRAME frames).
- One type carrying protocol information used for flow control and error
control mechanisms (referred as SUPERVISOR frames).

   After each frame transmission to the NFC controller, the device host SHALL
wait an ACK (SUPERVISOR frame) reception before to send a new frame.
The NFC controller MAY send a frame at anytime to the device host.
   The NFC controller MAY send a specific WAIT supervisor frame to indicate
to device host that a NCI data packet has been received but that it could take
significant time before the NFC controller sends an ACK and thus allows next
data reception.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/Kconfig                    |   2 +-
 drivers/nfc/Makefile                   |   3 +-
 drivers/nfc/st21nfcb/Kconfig           |  22 ++
 drivers/nfc/st21nfcb/Makefile          |   8 +
 drivers/nfc/st21nfcb/i2c.c             | 460 +++++++++++++++++++++++++++++++++
 drivers/nfc/st21nfcb/ndlc.c            | 292 +++++++++++++++++++++
 drivers/nfc/st21nfcb/ndlc.h            |  55 ++++
 drivers/nfc/st21nfcb/st21nfcb.c        | 129 +++++++++
 drivers/nfc/st21nfcb/st21nfcb.h        |  38 +++
 include/linux/platform_data/st21nfcb.h |  32 +++
 10 files changed, 1039 insertions(+), 2 deletions(-)
 create mode 100644 drivers/nfc/st21nfcb/Kconfig
 create mode 100644 drivers/nfc/st21nfcb/Makefile
 create mode 100644 drivers/nfc/st21nfcb/i2c.c
 create mode 100644 drivers/nfc/st21nfcb/ndlc.c
 create mode 100644 drivers/nfc/st21nfcb/ndlc.h
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb.c
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb.h
 create mode 100644 include/linux/platform_data/st21nfcb.h

diff --git a/drivers/nfc/Kconfig b/drivers/nfc/Kconfig
index 26c66a1..7929fac 100644
--- a/drivers/nfc/Kconfig
+++ b/drivers/nfc/Kconfig
@@ -72,5 +72,5 @@ source "drivers/nfc/pn544/Kconfig"
 source "drivers/nfc/microread/Kconfig"
 source "drivers/nfc/nfcmrvl/Kconfig"
 source "drivers/nfc/st21nfca/Kconfig"
-
+source "drivers/nfc/st21nfcb/Kconfig"
 endmenu
diff --git a/drivers/nfc/Makefile b/drivers/nfc/Makefile
index 23225b0..6b23a2c 100644
--- a/drivers/nfc/Makefile
+++ b/drivers/nfc/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_NFC_SIM)		+= nfcsim.o
 obj-$(CONFIG_NFC_PORT100)	+= port100.o
 obj-$(CONFIG_NFC_MRVL)		+= nfcmrvl/
 obj-$(CONFIG_NFC_TRF7970A)	+= trf7970a.o
-obj-$(CONFIG_NFC_ST21NFCA)  += st21nfca/
+obj-$(CONFIG_NFC_ST21NFCA)  	+= st21nfca/
+obj-$(CONFIG_NFC_ST21NFCB)	+= st21nfcb/
 
 ccflags-$(CONFIG_NFC_DEBUG) := -DDEBUG
diff --git a/drivers/nfc/st21nfcb/Kconfig b/drivers/nfc/st21nfcb/Kconfig
new file mode 100644
index 0000000..e0322dd
--- /dev/null
+++ b/drivers/nfc/st21nfcb/Kconfig
@@ -0,0 +1,22 @@
+config NFC_ST21NFCB
+	tristate "STMicroelectronics ST21NFCB NFC driver"
+	depends on NFC_NCI
+	default n
+	---help---
+	  STMicroelectronics ST21NFCB core driver. It implements the chipset
+	  NCI logic and hooks into the NFC kernel APIs. Physical layers will
+	  register against it.
+
+	  To compile this driver as a module, choose m here. The module will
+	  be called st21nfcb.
+	  Say N if unsure.
+
+config NFC_ST21NFCB_I2C
+	tristate "NFC ST21NFCB i2c support"
+	depends on NFC_ST21NFCB && I2C
+	---help---
+	  This module adds support for the STMicroelectronics st21nfcb i2c interface.
+	  Select this if your platform is using the i2c bus.
+
+	  If you choose to build a module, it'll be called st21nfcb_i2c.
+	  Say N if unsure.
diff --git a/drivers/nfc/st21nfcb/Makefile b/drivers/nfc/st21nfcb/Makefile
new file mode 100644
index 0000000..13d9f03
--- /dev/null
+++ b/drivers/nfc/st21nfcb/Makefile
@@ -0,0 +1,8 @@
+#
+# Makefile for ST21NFCB NCI based NFC driver
+#
+
+st21nfcb_i2c-objs  = i2c.o
+
+obj-$(CONFIG_NFC_ST21NFCB)     += st21nfcb.o ndlc.o
+obj-$(CONFIG_NFC_ST21NFCB_I2C) += st21nfcb_i2c.o
diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
new file mode 100644
index 0000000..f53b101
--- /dev/null
+++ b/drivers/nfc/st21nfcb/i2c.c
@@ -0,0 +1,460 @@
+/*
+ * I2C Link Layer for ST21NFCB NCI based Driver
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/crc-ccitt.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <linux/miscdevice.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/nfc.h>
+#include <linux/firmware.h>
+#include <linux/unaligned/access_ok.h>
+#include <linux/platform_data/st21nfcb.h>
+
+#include <net/nfc/nci.h>
+#include <net/nfc/llc.h>
+#include <net/nfc/nfc.h>
+
+#include "ndlc.h"
+
+/* ndlc header */
+#define ST21NFCB_FRAME_HEADROOM	1
+#define ST21NFCB_FRAME_TAILROOM 0
+
+#define ST21NFCB_NCI_I2C_MIN_SIZE 4   /* PCB(1) + NCI Packet header(3) */
+#define ST21NFCB_NCI_I2C_MAX_SIZE 250 /* req 4.2.1 */
+
+#define ST21NFCB_NCI_I2C_DRIVER_NAME "st21nfcb_nci_i2c"
+
+static struct i2c_device_id st21nfcb_nci_i2c_id_table[] = {
+	{ST21NFCB_NCI_DRIVER_NAME, 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, st21nfcb_nci_i2c_id_table);
+
+struct st21nfcb_i2c_phy {
+	struct i2c_client *i2c_dev;
+	struct llt_ndlc *ndlc;
+
+	unsigned int gpio_irq;
+	unsigned int gpio_reset;
+	unsigned int irq_polarity;
+
+	int powered;
+
+	/*
+	 * < 0 if hardware error occured (e.g. i2c err)
+	 * and prevents normal operation.
+	 */
+	int hard_fault;
+};
+
+#define I2C_DUMP_SKB(info, skb)					\
+do {								\
+	pr_debug("%s:\n", info);				\
+	print_hex_dump(KERN_DEBUG, "i2c: ", DUMP_PREFIX_OFFSET,	\
+		       16, 1, (skb)->data, (skb)->len, 0);	\
+} while (0)
+
+static int st21nfcb_nci_i2c_enable(void *phy_id)
+{
+	struct st21nfcb_i2c_phy *phy = phy_id;
+
+	gpio_set_value(phy->gpio_reset, 0);
+	usleep_range(10000, 15000);
+	gpio_set_value(phy->gpio_reset, 1);
+	phy->powered = 1;
+	usleep_range(80000, 85000);
+
+	return 0;
+}
+
+static void st21nfcb_nci_i2c_disable(void *phy_id)
+{
+	struct st21nfcb_i2c_phy *phy = phy_id;
+
+	pr_info("\n");
+
+	phy->powered = 0;
+	/* reset chip in order to flush clf */
+	gpio_set_value(phy->gpio_reset, 0);
+	usleep_range(10000, 15000);
+	gpio_set_value(phy->gpio_reset, 1);
+}
+
+static void st21nfcb_nci_remove_header(struct sk_buff *skb)
+{
+	skb_pull(skb, ST21NFCB_FRAME_HEADROOM);
+}
+
+/*
+ * Writing a frame must not return the number of written bytes.
+ * It must return either zero for success, or <0 for error.
+ * In addition, it must not alter the skb
+ */
+static int st21nfcb_nci_i2c_write(void *phy_id, struct sk_buff *skb)
+{
+	int r = -1;
+	struct st21nfcb_i2c_phy *phy = phy_id;
+	struct i2c_client *client = phy->i2c_dev;
+
+	I2C_DUMP_SKB("st21nfcb_nci_i2c_write", skb);
+
+	if (phy->hard_fault != 0)
+		return phy->hard_fault;
+
+	r = i2c_master_send(client, skb->data, skb->len);
+	if (r == -EREMOTEIO) {  /* Retry, chip was in standby */
+		usleep_range(1000, 4000);
+		r = i2c_master_send(client, skb->data, skb->len);
+	}
+
+	if (r >= 0) {
+		if (r != skb->len)
+			r = -EREMOTEIO;
+		else
+			r = 0;
+	}
+
+	st21nfcb_nci_remove_header(skb);
+
+	return r;
+}
+
+/*
+ * Reads an ndlc frame and returns it in a newly allocated sk_buff.
+ * returns:
+ * frame size : if received frame is complete (find ST21NFCB_SOF_EOF at
+ * end of read)
+ * -EAGAIN : if received frame is incomplete (not find ST21NFCB_SOF_EOF
+ * at end of read)
+ * -EREMOTEIO : i2c read error (fatal)
+ * -EBADMSG : frame was incorrect and discarded
+ * (value returned from st21nfcb_nci_i2c_repack)
+ * -EIO : if no ST21NFCB_SOF_EOF is found after reaching
+ * the read length end sequence
+ */
+static int st21nfcb_nci_i2c_read(struct st21nfcb_i2c_phy *phy,
+				 struct sk_buff **skb)
+{
+	int r;
+	u8 len;
+	u8 buf[ST21NFCB_NCI_I2C_MAX_SIZE];
+	struct i2c_client *client = phy->i2c_dev;
+
+	r = i2c_master_recv(client, buf, 4);
+	if (r == -EREMOTEIO) {  /* Retry, chip was in standby */
+		usleep_range(1000, 4000);
+		r = i2c_master_recv(client, buf, 4);
+	} else if (r != 4) {
+		nfc_err(&client->dev, "cannot read ndlc & nci header\n");
+		return -EREMOTEIO;
+	}
+
+	len = be16_to_cpu(*(__be16 *) (buf + 2));
+	if (len > ST21NFCB_NCI_I2C_MAX_SIZE) {
+		nfc_err(&client->dev, "invalid frame len\n");
+		return -EBADMSG;
+	}
+
+	*skb = alloc_skb(4 + len, GFP_KERNEL);
+	if (*skb == NULL)
+		return -ENOMEM;
+
+	skb_reserve(*skb, 4);
+	skb_put(*skb, 4);
+	memcpy((*skb)->data, buf, 4);
+
+	if (!len)
+		return 0;
+
+	r = i2c_master_recv(client, buf, len);
+	if (r != len) {
+		kfree_skb(*skb);
+		return -EREMOTEIO;
+	}
+
+	skb_put(*skb, len);
+	memcpy((*skb)->data + 4, buf, len);
+
+	I2C_DUMP_SKB("i2c frame read", *skb);
+
+	return 0;
+}
+
+/*
+ * Reads an ndlc frame from the chip.
+ *
+ * On ST21NFCB, IRQ goes in idle state when read starts.
+ */
+static irqreturn_t st21nfcb_nci_irq_thread_fn(int irq, void *phy_id)
+{
+	struct st21nfcb_i2c_phy *phy = phy_id;
+	struct i2c_client *client;
+	struct sk_buff *skb = NULL;
+	int r;
+
+	if (!phy || irq != phy->i2c_dev->irq) {
+		WARN_ON_ONCE(1);
+		return IRQ_NONE;
+	}
+
+	client = phy->i2c_dev;
+	dev_dbg(&client->dev, "IRQ\n");
+
+	if (phy->hard_fault)
+		return IRQ_HANDLED;
+
+	if (!phy->powered) {
+		st21nfcb_nci_i2c_disable(phy);
+		return IRQ_HANDLED;
+	}
+
+	r = st21nfcb_nci_i2c_read(phy, &skb);
+	if (r == -EREMOTEIO) {
+		phy->hard_fault = r;
+                ndlc_recv(phy->ndlc, NULL);
+		return IRQ_HANDLED;
+	} else if (r == -ENOMEM || r == -EBADMSG) {
+		return IRQ_HANDLED;
+	}
+
+	ndlc_recv(phy->ndlc, skb);
+
+	return IRQ_HANDLED;
+}
+
+static struct nfc_phy_ops i2c_phy_ops = {
+	.write = st21nfcb_nci_i2c_write,
+	.enable = st21nfcb_nci_i2c_enable,
+	.disable = st21nfcb_nci_i2c_disable,
+};
+
+#ifdef CONFIG_OF
+static int st21nfcb_nci_i2c_of_request_resources(struct i2c_client *client)
+{
+	struct st21nfcb_i2c_phy *phy = i2c_get_clientdata(client);
+	struct device_node *pp;
+	int gpio;
+	int r;
+
+	pp = client->dev.of_node;
+	if (!pp)
+		return -ENODEV;
+
+	/* Get GPIO from device tree */
+	gpio = of_get_named_gpio(pp, "reset-gpios", 0);
+	if (gpio < 0) {
+		nfc_err(&client->dev,
+			"Failed to retrieve reset-gpios from device tree\n");
+		return gpio;
+	}
+
+	/* GPIO request and configuration */
+	r = devm_gpio_request(&client->dev, gpio, "clf_reset");
+	if (r) {
+		nfc_err(&client->dev, "Failed to request reset pin\n");
+		return -ENODEV;
+	}
+
+	r = gpio_direction_output(gpio, 1);
+	if (r) {
+		nfc_err(&client->dev,
+			"Failed to set reset pin direction as output\n");
+		return -ENODEV;
+	}
+	phy->gpio_reset = gpio;
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
+static int st21nfcb_nci_i2c_of_request_resources(struct i2c_client *client)
+{
+	return -ENODEV;
+}
+#endif
+
+static int st21nfcb_nci_i2c_request_resources(struct i2c_client *client)
+{
+	struct st21nfcb_nfc_platform_data *pdata;
+	struct st21nfcb_i2c_phy *phy = i2c_get_clientdata(client);
+	int r;
+	int irq;
+
+	pdata = client->dev.platform_data;
+	if (pdata == NULL) {
+		nfc_err(&client->dev, "No platform data\n");
+		return -EINVAL;
+	}
+
+	/* store for later use */
+	phy->gpio_irq = pdata->gpio_irq;
+	phy->gpio_reset = pdata->gpio_reset;
+	phy->irq_polarity = pdata->irq_polarity;
+
+	r = devm_gpio_request(&client->dev, phy->gpio_irq, "wake_up");
+	if (r) {
+		pr_err("%s : gpio_request failed\n", __FILE__);
+		return -ENODEV;
+	}
+
+	r = gpio_direction_input(phy->gpio_irq);
+	if (r) {
+		pr_err("%s : gpio_direction_input failed\n", __FILE__);
+		return -ENODEV;
+	}
+
+	r = devm_gpio_request(&client->dev,
+			      phy->gpio_reset, "clf_reset");
+	if (r) {
+		pr_err("%s : reset gpio_request failed\n", __FILE__);
+		return -ENODEV;
+	}
+
+	r = gpio_direction_output(phy->gpio_reset, 1);
+	if (r) {
+		pr_err("%s : reset gpio_direction_output failed\n",
+			__FILE__);
+		return -ENODEV;
+	}
+
+	/* IRQ */
+	irq = gpio_to_irq(phy->gpio_irq);
+	if (irq < 0) {
+		nfc_err(&client->dev,
+			"Unable to get irq number for GPIO %d error %d\n",
+			phy->gpio_irq, r);
+		return -ENODEV;
+	}
+	client->irq = irq;
+
+	return 0;
+}
+
+static int st21nfcb_nci_i2c_probe(struct i2c_client *client,
+				  const struct i2c_device_id *id)
+{
+	struct st21nfcb_i2c_phy *phy;
+	struct st21nfcb_nfc_platform_data *pdata;
+	int r;
+
+	dev_dbg(&client->dev, "%s\n", __func__);
+	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
+		return -ENODEV;
+	}
+
+	phy = devm_kzalloc(&client->dev, sizeof(struct st21nfcb_i2c_phy),
+			   GFP_KERNEL);
+	if (!phy) {
+		nfc_err(&client->dev,
+			"Cannot allocate memory for st21nfcb i2c phy.\n");
+		return -ENOMEM;
+	}
+
+	phy->i2c_dev = client;
+
+	i2c_set_clientdata(client, phy);
+
+	pdata = client->dev.platform_data;
+	if (!pdata && client->dev.of_node) {
+		r = st21nfcb_nci_i2c_of_request_resources(client);
+		if (r) {
+			nfc_err(&client->dev, "No platform data\n");
+			return r;
+		}
+	} else if (pdata) {
+		r = st21nfcb_nci_i2c_request_resources(client);
+		if (r) {
+			nfc_err(&client->dev,
+				"Cannot get platform resources\n");
+			return r;
+		}
+	} else {
+		nfc_err(&client->dev,
+			"st21nfcb platform resources not available\n");
+		return -ENODEV;
+	}
+
+	r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+				st21nfcb_nci_irq_thread_fn,
+				phy->irq_polarity | IRQF_ONESHOT,
+				ST21NFCB_NCI_DRIVER_NAME, phy);
+	if (r < 0) {
+		nfc_err(&client->dev, "Unable to register IRQ handler\n");
+		return r;
+	}
+
+	return ndlc_probe(phy, &i2c_phy_ops, &client->dev,
+			ST21NFCB_FRAME_HEADROOM, ST21NFCB_FRAME_TAILROOM,
+			&phy->ndlc);
+}
+
+static int st21nfcb_nci_i2c_remove(struct i2c_client *client)
+{
+	struct st21nfcb_i2c_phy *phy = i2c_get_clientdata(client);
+
+	dev_dbg(&client->dev, "%s\n", __func__);
+
+	ndlc_remove(phy->ndlc);
+
+	if (phy->powered)
+		st21nfcb_nci_i2c_disable(phy);
+
+	return 0;
+}
+
+static const struct of_device_id of_st21nfcb_i2c_match[] = {
+	{ .compatible = "st,st21nfcb_i2c", },
+	{}
+};
+
+static struct i2c_driver st21nfcb_nci_i2c_driver = {
+	.driver = {
+		.owner = THIS_MODULE,
+		.name = ST21NFCB_NCI_I2C_DRIVER_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(of_st21nfcb_i2c_match),
+	},
+	.probe = st21nfcb_nci_i2c_probe,
+	.id_table = st21nfcb_nci_i2c_id_table,
+	.remove = st21nfcb_nci_i2c_remove,
+};
+
+module_i2c_driver(st21nfcb_nci_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st21nfcb/ndlc.c b/drivers/nfc/st21nfcb/ndlc.c
new file mode 100644
index 0000000..d5a5007
--- /dev/null
+++ b/drivers/nfc/st21nfcb/ndlc.c
@@ -0,0 +1,292 @@
+/*
+ * Low Level Transport (NDLC) Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/sched.h>
+#include <net/nfc/nci_core.h>
+
+#include "ndlc.h"
+#include "st21nfcb.h"
+
+#define NDLC_TIMER_T1		100
+#define NDLC_TIMER_T1_WAIT	400
+#define NDLC_TIMER_T2		1200
+
+#define PCB_TYPE_DATAFRAME		0x80
+#define PCB_TYPE_SUPERVISOR		0xc0
+#define PCB_TYPE_MASK			PCB_TYPE_SUPERVISOR
+
+#define PCB_SYNC_ACK			0x20
+#define PCB_SYNC_NACK			0x10
+#define PCB_SYNC_WAIT			0x30
+#define PCB_SYNC_NOINFO			0x00
+#define PCB_SYNC_MASK			PCB_SYNC_WAIT
+
+#define PCB_DATAFRAME_RETRANSMIT_YES	0x00
+#define PCB_DATAFRAME_RETRANSMIT_NO	0x04
+#define PCB_DATAFRAME_RETRANSMIT_MASK	PCB_DATAFRAME_RETRANSMIT_NO
+
+#define PCB_SUPERVISOR_RETRANSMIT_YES	0x00
+#define PCB_SUPERVISOR_RETRANSMIT_NO	0x02
+#define PCB_SUPERVISOR_RETRANSMIT_MASK	PCB_SUPERVISOR_RETRANSMIT_NO
+
+#define PCB_FRAME_CRC_INFO_PRESENT	0x08
+#define PCB_FRAME_CRC_INFO_NOTPRESENT	0x00
+#define PCB_FRAME_CRC_INFO_MASK		PCB_FRAME_CRC_INFO_PRESENT
+
+#define NDLC_DUMP_SKB(info, skb)                                 \
+do {                                                             \
+	pr_debug("%s:\n", info);                                 \
+	print_hex_dump(KERN_DEBUG, "ndlc: ", DUMP_PREFIX_OFFSET, \
+			16, 1, skb->data, skb->len, 0);          \
+} while (0)
+
+int ndlc_open(struct llt_ndlc *ndlc)
+{
+	/* toggle reset pin */
+	ndlc->ops->enable(ndlc->phy_id);
+	return 0;
+}
+
+void ndlc_close(struct llt_ndlc *ndlc)
+{
+	/* toggle reset pin */
+	ndlc->ops->disable(ndlc->phy_id);
+}
+
+int ndlc_send(struct llt_ndlc *ndlc, struct sk_buff *skb)
+{
+	/* add ndlc header */
+	u8 pcb = PCB_TYPE_DATAFRAME | PCB_DATAFRAME_RETRANSMIT_NO |
+		PCB_FRAME_CRC_INFO_NOTPRESENT;
+
+	*skb_push(skb, 1) = pcb;
+	skb_queue_tail(&ndlc->send_q, skb);
+
+	schedule_work(&ndlc->sm_work);
+
+	return 0;
+}
+
+static void llt_ndlc_send_queue(struct llt_ndlc *ndlc)
+{
+	struct sk_buff *skb;
+	int r;
+	unsigned long time_sent;
+
+	if (ndlc->send_q.qlen)
+		pr_debug("sendQlen=%d unackQlen=%d\n",
+			 ndlc->send_q.qlen, ndlc->ack_pending_q.qlen);
+
+	while (ndlc->send_q.qlen) {
+		skb = skb_dequeue(&ndlc->send_q);
+		NDLC_DUMP_SKB("ndlc frame written", skb);
+		r = ndlc->ops->write(ndlc->phy_id, skb);
+		if (r < 0) {
+			ndlc->hard_fault = r;
+			break;
+		}
+		time_sent = jiffies;
+		*(unsigned long *)skb->cb = time_sent;
+
+		skb_queue_tail(&ndlc->ack_pending_q, skb);
+
+		/* start timer t1 for ndlc aknowledge */
+		ndlc->t1_active = true;
+		mod_timer(&ndlc->t1_timer, time_sent +
+			msecs_to_jiffies(NDLC_TIMER_T1));
+	}
+}
+
+static void llt_ndlc_requeue_data_pending(struct llt_ndlc *ndlc)
+{
+	struct sk_buff *skb;
+	u8 pcb;
+
+	while ((skb = skb_dequeue_tail(&ndlc->ack_pending_q))) {
+		pcb = skb->data[0];
+		switch (pcb & PCB_TYPE_MASK) {
+		case PCB_TYPE_SUPERVISOR:
+			skb->data[0] = (pcb & ~PCB_SUPERVISOR_RETRANSMIT_MASK) |
+				PCB_SUPERVISOR_RETRANSMIT_YES;
+			break;
+		case PCB_TYPE_DATAFRAME:
+			skb->data[0] = (pcb & ~PCB_DATAFRAME_RETRANSMIT_MASK) |
+				PCB_DATAFRAME_RETRANSMIT_YES;
+			break;
+		default:
+			pr_err("UNKNOWN Packet Control Byte=%d\n", pcb);
+			kfree_skb(skb);
+			break;
+		}
+		skb_queue_head(&ndlc->send_q, skb);
+	}
+}
+
+static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
+{
+	struct sk_buff *skb;
+	u8 pcb;
+	unsigned long time_sent;
+
+	if (ndlc->rcv_q.qlen)
+		pr_debug("rcvQlen=%d\n", ndlc->rcv_q.qlen);
+
+	while ((skb = skb_dequeue(&ndlc->rcv_q)) != NULL) {
+		pcb = skb->data[0];
+		skb_pull(skb, 1);
+		if ((pcb & PCB_TYPE_MASK) == PCB_TYPE_SUPERVISOR) {
+			switch (pcb & PCB_SYNC_MASK) {
+			case PCB_SYNC_ACK:
+				del_timer_sync(&ndlc->t1_timer);
+				del_timer_sync(&ndlc->t2_timer);
+				ndlc->t2_active = false;
+				ndlc->t1_active = false;
+				break;
+			case PCB_SYNC_NACK:
+				llt_ndlc_requeue_data_pending(ndlc);
+				llt_ndlc_send_queue(ndlc);
+				/* start timer t1 for ndlc aknowledge */
+				time_sent = jiffies;
+				ndlc->t1_active = true;
+				mod_timer(&ndlc->t1_timer, time_sent +
+					msecs_to_jiffies(NDLC_TIMER_T1));
+				break;
+			case PCB_SYNC_WAIT:
+				time_sent = jiffies;
+				ndlc->t1_active = true;
+				mod_timer(&ndlc->t1_timer, time_sent +
+					  msecs_to_jiffies(NDLC_TIMER_T1_WAIT));
+				break;
+			default:
+				pr_err("UNKNOWN Packet Control Byte=%d\n", pcb);
+				kfree_skb(skb);
+				break;
+			}
+		} else {
+			nci_recv_frame(ndlc->ndev, skb);
+		}
+	}
+}
+
+static void llt_ndlc_sm_work(struct work_struct *work)
+{
+	struct llt_ndlc *ndlc = container_of(work, struct llt_ndlc, sm_work);
+
+	llt_ndlc_send_queue(ndlc);
+	llt_ndlc_rcv_queue(ndlc);
+
+	if (ndlc->t1_active && timer_pending(&ndlc->t1_timer) == 0) {
+		pr_debug
+		    ("Handle T1(recv SUPERVISOR) elapsed (T1 now inactive)\n");
+		ndlc->t1_active = false;
+
+		llt_ndlc_requeue_data_pending(ndlc);
+		llt_ndlc_send_queue(ndlc);
+	}
+
+	if (ndlc->t2_active && timer_pending(&ndlc->t2_timer) == 0) {
+		pr_debug("Handle T2(recv DATA) elapsed (T2 now inactive)\n");
+		ndlc->t2_active = false;
+		ndlc->t1_active = false;
+		del_timer_sync(&ndlc->t1_timer);
+
+		ndlc_close(ndlc);
+		ndlc->hard_fault = -EREMOTEIO;
+	}
+}
+
+void ndlc_recv(struct llt_ndlc *ndlc, struct sk_buff *skb)
+{
+	if (skb == NULL) {
+		pr_err("NULL Frame -> link is dead\n");
+		ndlc->hard_fault = -EREMOTEIO;
+		ndlc_close(ndlc);
+	} else {
+		NDLC_DUMP_SKB("incoming frame", skb);
+		skb_queue_tail(&ndlc->rcv_q, skb);
+	}
+
+	schedule_work(&ndlc->sm_work);
+}
+
+static void ndlc_t1_timeout(unsigned long data)
+{
+	struct llt_ndlc *ndlc = (struct llt_ndlc *)data;
+
+	pr_debug("\n");
+
+	schedule_work(&ndlc->sm_work);
+}
+
+static void ndlc_t2_timeout(unsigned long data)
+{
+	struct llt_ndlc *ndlc = (struct llt_ndlc *)data;
+
+	pr_debug("\n");
+
+	schedule_work(&ndlc->sm_work);
+}
+
+int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct device *dev,
+	       int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id)
+{
+	struct llt_ndlc *ndlc;
+
+	ndlc = devm_kzalloc(dev, sizeof(struct llt_ndlc), GFP_KERNEL);
+	if (!ndlc) {
+		nfc_err(dev, "Cannot allocate memory for ndlc.\n");
+		return -ENOMEM;
+	}
+	ndlc->ops = phy_ops;
+	ndlc->phy_id = phy_id;
+	ndlc->dev = dev;
+
+	*ndlc_id = ndlc;
+
+	/* start timers */
+	init_timer(&ndlc->t1_timer);
+	ndlc->t1_timer.data = (unsigned long)ndlc;
+	ndlc->t1_timer.function = ndlc_t1_timeout;
+
+	init_timer(&ndlc->t2_timer);
+	ndlc->t2_timer.data = (unsigned long)ndlc;
+	ndlc->t2_timer.function = ndlc_t2_timeout;
+
+	skb_queue_head_init(&ndlc->rcv_q);
+	skb_queue_head_init(&ndlc->send_q);
+	skb_queue_head_init(&ndlc->ack_pending_q);
+
+	INIT_WORK(&ndlc->sm_work, llt_ndlc_sm_work);
+
+	return st21nfcb_nci_probe(ndlc, phy_headroom, phy_tailroom);
+}
+
+void ndlc_remove(struct llt_ndlc *ndlc)
+{
+	/* cancel timers */
+	del_timer_sync(&ndlc->t1_timer);
+	del_timer_sync(&ndlc->t2_timer);
+	ndlc->t2_active = false;
+	ndlc->t1_active = false;
+
+	skb_queue_purge(&ndlc->rcv_q);
+	skb_queue_purge(&ndlc->send_q);
+
+	st21nfcb_nci_remove(ndlc->ndev);
+	kfree(ndlc);
+}
diff --git a/drivers/nfc/st21nfcb/ndlc.h b/drivers/nfc/st21nfcb/ndlc.h
new file mode 100644
index 0000000..c30a2f0
--- /dev/null
+++ b/drivers/nfc/st21nfcb/ndlc.h
@@ -0,0 +1,55 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __LOCAL_NDLC_H_
+#define __LOCAL_NDLC_H_
+
+#include <linux/skbuff.h>
+#include <net/nfc/nfc.h>
+
+/* Low Level Transport description */
+struct llt_ndlc {
+	struct nci_dev *ndev;
+	struct nfc_phy_ops *ops;
+	void *phy_id;
+
+	struct timer_list t1_timer;
+	bool t1_active;
+
+	struct timer_list t2_timer;
+	bool t2_active;
+
+	struct sk_buff_head rcv_q;
+	struct sk_buff_head send_q;
+	struct sk_buff_head ack_pending_q;
+
+	struct work_struct sm_work;
+
+	struct device *dev;
+
+	int hard_fault;
+};
+
+int ndlc_open(struct llt_ndlc *ndlc);
+void ndlc_close(struct llt_ndlc *ndlc);
+int ndlc_send(struct llt_ndlc *ndlc, struct sk_buff *skb);
+void ndlc_recv(struct llt_ndlc *ndlc, struct sk_buff *skb);
+int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct device *dev,
+	int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id);
+void ndlc_remove(struct llt_ndlc *ndlc);
+#endif /* __LOCAL_NDLC_H__ */
diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st21nfcb.c
new file mode 100644
index 0000000..4d95863
--- /dev/null
+++ b/drivers/nfc/st21nfcb/st21nfcb.c
@@ -0,0 +1,129 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/module.h>
+#include <linux/nfc.h>
+#include <net/nfc/nci.h>
+#include <net/nfc/nci_core.h>
+
+#include "st21nfcb.h"
+#include "ndlc.h"
+
+#define DRIVER_DESC "NCI NFC driver for ST21NFCB"
+
+static int st21nfcb_nci_open(struct nci_dev *ndev)
+{
+	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
+	int r;
+
+	if (test_and_set_bit(ST21NFCB_NCI_RUNNING, &info->flags))
+		return 0;
+
+	r = ndlc_open(info->ndlc);
+	if (r)
+		clear_bit(ST21NFCB_NCI_RUNNING, &info->flags);
+
+	return r;
+}
+
+static int st21nfcb_nci_close(struct nci_dev *ndev)
+{
+	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
+
+	if (!test_and_clear_bit(ST21NFCB_NCI_RUNNING, &info->flags))
+		return 0;
+
+	ndlc_close(info->ndlc);
+
+	return 0;
+}
+
+static int st21nfcb_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
+{
+	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
+
+	skb->dev = (void *)ndev;
+
+	if (!test_bit(ST21NFCB_NCI_RUNNING, &info->flags))
+		return -EBUSY;
+
+	return ndlc_send(info->ndlc, skb);
+}
+
+static struct nci_ops st21nfcb_nci_ops = {
+	.open = st21nfcb_nci_open,
+	.close = st21nfcb_nci_close,
+	.send = st21nfcb_nci_send,
+};
+
+int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
+		       int phy_tailroom)
+{
+	struct st21nfcb_nci_info *info;
+	int r;
+	u32 protocols;
+
+	info = devm_kzalloc(ndlc->dev,
+			sizeof(struct st21nfcb_nci_info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	protocols = NFC_PROTO_JEWEL_MASK
+		| NFC_PROTO_MIFARE_MASK
+		| NFC_PROTO_FELICA_MASK
+		| NFC_PROTO_ISO14443_MASK
+		| NFC_PROTO_ISO14443_B_MASK
+		| NFC_PROTO_NFC_DEP_MASK;
+
+	ndlc->ndev = nci_allocate_device(&st21nfcb_nci_ops, protocols,
+					phy_headroom, phy_tailroom);
+	if (!ndlc->ndev) {
+		pr_err("Cannot allocate nfc ndev\n");
+		r = -ENOMEM;
+		goto err_alloc_ndev;
+	}
+	info->ndlc = ndlc;
+
+	nci_set_drvdata(ndlc->ndev, info);
+
+	r = nci_register_device(ndlc->ndev);
+	if (r)
+		goto err_regdev;
+
+	return r;
+err_regdev:
+	nci_free_device(ndlc->ndev);
+
+err_alloc_ndev:
+	kfree(info);
+	return r;
+}
+EXPORT_SYMBOL_GPL(st21nfcb_nci_probe);
+
+void st21nfcb_nci_remove(struct nci_dev *ndev)
+{
+	struct st21nfcb_nci_info *info = nci_get_drvdata(ndev);
+
+	nci_unregister_device(ndev);
+	nci_free_device(ndev);
+	kfree(info);
+}
+EXPORT_SYMBOL_GPL(st21nfcb_nci_remove);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st21nfcb/st21nfcb.h b/drivers/nfc/st21nfcb/st21nfcb.h
new file mode 100644
index 0000000..4bbbebb
--- /dev/null
+++ b/drivers/nfc/st21nfcb/st21nfcb.h
@@ -0,0 +1,38 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __LOCAL_ST21NFCB_H_
+#define __LOCAL_ST21NFCB_H_
+
+#include <net/nfc/nci_core.h>
+
+#include "ndlc.h"
+
+/* Define private flags: */
+#define ST21NFCB_NCI_RUNNING			1
+
+struct st21nfcb_nci_info {
+	struct llt_ndlc *ndlc;
+	unsigned long flags;
+};
+
+void st21nfcb_nci_remove(struct nci_dev *ndev);
+int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
+		int phy_tailroom);
+
+#endif /* __LOCAL_ST21NFCB_H_ */
diff --git a/include/linux/platform_data/st21nfcb.h b/include/linux/platform_data/st21nfcb.h
new file mode 100644
index 0000000..2a7b769
--- /dev/null
+++ b/include/linux/platform_data/st21nfcb.h
@@ -0,0 +1,32 @@
+/*
+ * Driver include for the ST21NFCB NFC chip.
+ *
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _ST21NFCA_HCI_H_
+#define _ST21NFCA_HCI_H_
+
+#include <linux/i2c.h>
+
+#define ST21NFCB_NCI_DRIVER_NAME "st21nfcb_nci"
+
+struct st21nfcb_nfc_platform_data {
+	unsigned int gpio_irq;
+	unsigned int gpio_reset;
+	unsigned int irq_polarity;
+};
+
+#endif /* _ST21NFCA_HCI_H_ */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
