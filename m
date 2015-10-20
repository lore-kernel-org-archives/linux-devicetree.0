From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 27/30] nfc: st21nfca: Add support for proprietary commands for factory tests
Date: Tue, 20 Oct 2015 23:48:18 +0200
Message-ID: <1445377701-8353-28-git-send-email-christophe-h.ricard@st.com>
References: <1445377701-8353-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445377701-8353-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for proprietary commands useful mainly for factory testings.
Here is a list:
- FACTORY_MODE: Allow to set the driver into a mode where no secure element
are activated. It does not consider any NFC_ATTR_VENDOR_DATA.
- HCI_CLEAR_ALL_PIPES: Allow to execute a HCI clear all pipes command.
It does not consider any NFC_ATTR_VENDOR_DATA.
- HCI_DM_PUT_DATA: Allow to configure specific CLF registry as for example
RF trimmings or low level drivers configurations (I2C, SPI, SWP).
- HCI_DM_UPDATE_AID: Allow to configure an AID routing into the CLF routing
table following RF technology, CLF mode or protocol.
- HCI_DM_GET_INFO: Allow to retrieve CLF information.
- HCI_DM_GET_DATA: Allow to retrieve CLF configurable data such as low
level drivers configurations or RF trimmings.
- HCI_DM_LOAD: Allow to load a firmware into the CLF. A complete
packet can be more than 8KB.
- HCI_DM_RESET: Allow to run a CLF reset in order to "commit" CLF
configuration changes without CLF power off.
-  HCI_GET_PARAM: Allow to retrieve an HCI CLF parameter (for example the
white list).
- HCI_DM_FIELD_GENERATOR: Allow to generate different kind of RF
technology. When using this command to anti-collision is done.
- HCI_LOOPBACK: Allow to echo a command and test the Dh to CLF
connectivity.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/Makefile               |   2 +-
 drivers/nfc/st21nfca/st21nfca.c             |   4 +
 drivers/nfc/st21nfca/st21nfca.h             |   4 +-
 drivers/nfc/st21nfca/st21nfca_se.c          |   4 +-
 drivers/nfc/st21nfca/st21nfca_vendor_cmds.c | 369 ++++++++++++++++++++++++++++
 drivers/nfc/st21nfca/st21nfca_vendor_cmds.h |  74 ++++++
 6 files changed, 454 insertions(+), 3 deletions(-)
 create mode 100644 drivers/nfc/st21nfca/st21nfca_vendor_cmds.c
 create mode 100644 drivers/nfc/st21nfca/st21nfca_vendor_cmds.h

diff --git a/drivers/nfc/st21nfca/Makefile b/drivers/nfc/st21nfca/Makefile
index 97edab4..e817c72 100644
--- a/drivers/nfc/st21nfca/Makefile
+++ b/drivers/nfc/st21nfca/Makefile
@@ -2,7 +2,7 @@
 # Makefile for ST21NFCA HCI based NFC driver
 #
 
-st21nfca_hci-objs = st21nfca.o st21nfca_dep.o st21nfca_se.o
+st21nfca_hci-objs = st21nfca.o st21nfca_dep.o st21nfca_se.o st21nfca_vendor_cmds.o
 obj-$(CONFIG_NFC_ST21NFCA)     += st21nfca_hci.o
 
 st21nfca_i2c-objs  = i2c.o
diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index 76ef9cf..bf82459 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -24,6 +24,7 @@
 #include "st21nfca.h"
 #include "st21nfca_dep.h"
 #include "st21nfca_se.h"
+#include "st21nfca_vendor_cmds.h"
 
 #define DRIVER_DESC "HCI NFC driver for ST21NFCA"
 
@@ -923,6 +924,8 @@ static int st21nfca_hci_event_received(struct nfc_hci_dev *hdev, u8 pipe,
 							event, skb);
 	case ST21NFCA_APDU_READER_GATE:
 		return st21nfca_apdu_reader_event_received(hdev, event, skb);
+	case NFC_HCI_LOOPBACK_GATE:
+		return st21nfca_hci_loopback_event_received(hdev, event, skb);
 	default:
 		return 1;
 	}
@@ -1024,6 +1027,7 @@ int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 	*hdev = info->hdev;
 	st21nfca_dep_init(info->hdev);
 	st21nfca_se_init(info->hdev);
+	st21nfca_vendor_cmds_init(info->hdev);
 
 	return 0;
 
diff --git a/drivers/nfc/st21nfca/st21nfca.h b/drivers/nfc/st21nfca/st21nfca.h
index 15a78d3..070136b 100644
--- a/drivers/nfc/st21nfca/st21nfca.h
+++ b/drivers/nfc/st21nfca/st21nfca.h
@@ -21,6 +21,7 @@
 
 #include "st21nfca_dep.h"
 #include "st21nfca_se.h"
+#include "st21nfca_vendor_cmds.h"
 
 #define HCI_MODE 0
 
@@ -60,7 +61,7 @@ struct st21nfca_se_status {
 int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 		       char *llc_name, int phy_headroom, int phy_tailroom,
 		       int phy_payload, struct nfc_hci_dev **hdev,
-			   struct st21nfca_se_status *se_status);
+		       struct st21nfca_se_status *se_status);
 void st21nfca_hci_remove(struct nfc_hci_dev *hdev);
 
 enum st21nfca_state {
@@ -85,6 +86,7 @@ struct st21nfca_hci_info {
 
 	struct st21nfca_dep_info dep_info;
 	struct st21nfca_se_info se_info;
+	struct st21nfca_vendor_info vendor_info;
 };
 
 /* Reader RF commands */
diff --git a/drivers/nfc/st21nfca/st21nfca_se.c b/drivers/nfc/st21nfca/st21nfca_se.c
index 0eb42ef..646c340 100644
--- a/drivers/nfc/st21nfca/st21nfca_se.c
+++ b/drivers/nfc/st21nfca/st21nfca_se.c
@@ -168,6 +168,9 @@ int st21nfca_hci_discover_se(struct nfc_hci_dev *hdev)
 	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
 	int se_count = 0;
 
+	if (test_bit(ST21NFCA_FACTORY_MODE, &hdev->quirks))
+		return 0;
+
 	if (info->se_status->is_uicc_present) {
 		nfc_add_se(hdev->ndev, NFC_HCI_UICC_HOST_ID, NFC_SE_UICC);
 		se_count++;
@@ -192,7 +195,6 @@ int st21nfca_hci_enable_se(struct nfc_hci_dev *hdev, u32 se_idx)
 	 * Same for eSE.
 	 */
 	r = st21nfca_hci_control_se(hdev, se_idx, ST21NFCA_SE_MODE_ON);
-
 	if (r == ST21NFCA_ESE_HOST_ID) {
 		st21nfca_se_get_atr(hdev);
 		r = nfc_hci_send_event(hdev, ST21NFCA_APDU_READER_GATE,
diff --git a/drivers/nfc/st21nfca/st21nfca_vendor_cmds.c b/drivers/nfc/st21nfca/st21nfca_vendor_cmds.c
new file mode 100644
index 0000000..e7b1842
--- /dev/null
+++ b/drivers/nfc/st21nfca/st21nfca_vendor_cmds.c
@@ -0,0 +1,369 @@
+/*
+ * Proprietary commands extension for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014-2015  STMicroelectronics SAS. All rights reserved.
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
+#include <net/genetlink.h>
+#include <linux/module.h>
+#include <linux/nfc.h>
+#include <net/nfc/hci.h>
+#include <net/nfc/llc.h>
+
+#include "st21nfca.h"
+#include "st21nfca_vendor_cmds.h"
+
+#define ST21NFCA_HCI_DM_GETDATA			0x10
+#define ST21NFCA_HCI_DM_PUTDATA			0x11
+#define ST21NFCA_HCI_DM_LOAD			0x12
+#define ST21NFCA_HCI_DM_GETINFO			0x13
+#define ST21NFCA_HCI_DM_UPDATE_AID		0x20
+#define ST21NFCA_HCI_DM_RESET			0x3e
+
+#define ST21NFCA_HCI_DM_FIELD_GENERATOR		0x32
+
+#define ST21NFCA_FACTORY_MODE_ON		1
+#define ST21NFCA_FACTORY_MODE_OFF		0
+
+#define ST21NFCA_EVT_POST_DATA			0x02
+
+struct get_param_data {
+	u8 gate;
+	u8 data;
+} __packed;
+
+static int st21nfca_factory_mode(struct nfc_dev *dev, void *data,
+			       size_t data_len)
+{
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+
+	if (data_len != 1)
+		return -EINVAL;
+
+	pr_debug("factory mode: %x\n", ((u8 *)data)[0]);
+
+	switch (((u8 *)data)[0]) {
+	case ST21NFCA_FACTORY_MODE_ON:
+		test_and_set_bit(ST21NFCA_FACTORY_MODE, &hdev->quirks);
+	break;
+	case ST21NFCA_FACTORY_MODE_OFF:
+		clear_bit(ST21NFCA_FACTORY_MODE, &hdev->quirks);
+	break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int st21nfca_hci_clear_all_pipes(struct nfc_dev *dev, void *data,
+				      size_t data_len)
+{
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+
+	return nfc_hci_disconnect_all_gates(hdev);
+}
+
+static int st21nfca_hci_dm_put_data(struct nfc_dev *dev, void *data,
+				  size_t data_len)
+{
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+
+	return nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+				ST21NFCA_HCI_DM_PUTDATA, data,
+				data_len, NULL);
+}
+
+static int st21nfca_hci_dm_update_aid(struct nfc_dev *dev, void *data,
+				    size_t data_len)
+{
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+
+	return nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+			ST21NFCA_HCI_DM_UPDATE_AID, data, data_len, NULL);
+}
+
+static int st21nfca_hci_dm_get_info(struct nfc_dev *dev, void *data,
+				    size_t data_len)
+{
+	int r;
+	struct sk_buff *msg, *skb;
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+
+	r = nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_HCI_DM_GETINFO,
+			     data, data_len, &skb);
+	if (r)
+		goto exit;
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(dev, ST21NFCA_VENDOR_OUI,
+					     HCI_DM_GET_INFO, skb->len);
+	if (!msg) {
+		r = -ENOMEM;
+		goto free_skb;
+	}
+
+	if (nla_put(msg, NFC_ATTR_VENDOR_DATA, skb->len, skb->data)) {
+		kfree_skb(msg);
+		r = -ENOBUFS;
+		goto free_skb;
+	}
+
+	r = nfc_vendor_cmd_reply(msg);
+
+free_skb:
+	kfree_skb(skb);
+exit:
+	return r;
+}
+
+static int st21nfca_hci_dm_get_data(struct nfc_dev *dev, void *data,
+				    size_t data_len)
+{
+	int r;
+	struct sk_buff *msg, *skb;
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+
+	r = nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_HCI_DM_GETDATA,
+			     data, data_len, &skb);
+	if (r)
+		goto exit;
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(dev, ST21NFCA_VENDOR_OUI,
+					     HCI_DM_GET_DATA, skb->len);
+	if (!msg) {
+		r = -ENOMEM;
+		goto free_skb;
+	}
+
+	if (nla_put(msg, NFC_ATTR_VENDOR_DATA, skb->len, skb->data)) {
+		kfree_skb(msg);
+		r = -ENOBUFS;
+		goto free_skb;
+	}
+
+	r = nfc_vendor_cmd_reply(msg);
+
+free_skb:
+	kfree_skb(skb);
+exit:
+	return r;
+}
+
+static int st21nfca_hci_dm_load(struct nfc_dev *dev, void *data,
+				size_t data_len)
+{
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+
+	return nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+				ST21NFCA_HCI_DM_LOAD, data, data_len, NULL);
+}
+
+static int st21nfca_hci_dm_reset(struct nfc_dev *dev, void *data,
+				 size_t data_len)
+{
+	int r;
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+
+	r = nfc_hci_send_cmd_async(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+			ST21NFCA_HCI_DM_RESET, data, data_len, NULL, NULL);
+	if (r < 0)
+		return r;
+
+	r = nfc_llc_stop(hdev->llc);
+	if (r < 0)
+		return r;
+
+	return nfc_llc_start(hdev->llc);
+}
+
+static int st21nfca_hci_get_param(struct nfc_dev *dev, void *data,
+				  size_t data_len)
+{
+	int r;
+	struct sk_buff *msg, *skb;
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+	struct get_param_data *param = (struct get_param_data *)data;
+
+	if (data_len < sizeof(struct get_param_data))
+		return -EPROTO;
+
+	r = nfc_hci_get_param(hdev, param->gate, param->data, &skb);
+	if (r)
+		goto exit;
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(dev, ST21NFCA_VENDOR_OUI,
+					     HCI_GET_PARAM, skb->len);
+	if (!msg) {
+		r = -ENOMEM;
+		goto free_skb;
+	}
+
+	if (nla_put(msg, NFC_ATTR_VENDOR_DATA, skb->len, skb->data)) {
+		kfree_skb(msg);
+		r = -ENOBUFS;
+		goto free_skb;
+	}
+
+	r = nfc_vendor_cmd_reply(msg);
+
+free_skb:
+	kfree_skb(skb);
+exit:
+	return r;
+}
+
+static int st21nfca_hci_dm_field_generator(struct nfc_dev *dev, void *data,
+					   size_t data_len)
+{
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+
+	return nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+				ST21NFCA_HCI_DM_FIELD_GENERATOR, data, data_len, NULL);
+}
+
+int st21nfca_hci_loopback_event_received(struct nfc_hci_dev *hdev, u8 event,
+					   struct sk_buff *skb)
+{
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	switch (event) {
+	case ST21NFCA_EVT_POST_DATA:
+		info->vendor_info.rx_skb = skb;
+
+		complete(&info->vendor_info.req_completion);
+	break;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(st21nfca_hci_loopback_event_received);
+
+static int st21nfca_hci_loopback(struct nfc_dev *dev, void *data,
+				 size_t data_len)
+{
+	int r;
+	struct sk_buff *msg;
+	struct nfc_hci_dev *hdev = nfc_get_drvdata(dev);
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	if (data_len <= 0)
+		return -EPROTO;
+
+	reinit_completion(&info->vendor_info.req_completion);
+	info->vendor_info.rx_skb = NULL;
+
+	r = nfc_hci_send_event(hdev, NFC_HCI_LOOPBACK_GATE,
+			       ST21NFCA_EVT_POST_DATA, data, data_len);
+	if (r < 0) {
+		r = -EPROTO;
+		goto exit;
+	}
+
+	wait_for_completion_interruptible(&info->vendor_info.req_completion);
+	if (!info->vendor_info.rx_skb ||
+	    info->vendor_info.rx_skb->len != data_len) {
+		r = -EPROTO;
+		goto exit;
+	}
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(hdev->ndev,
+					ST21NFCA_VENDOR_OUI,
+					HCI_LOOPBACK,
+					info->vendor_info.rx_skb->len);
+	if (!msg) {
+		r = -ENOMEM;
+		goto free_skb;
+	}
+
+	if (nla_put(msg, NFC_ATTR_VENDOR_DATA, info->vendor_info.rx_skb->len,
+		    info->vendor_info.rx_skb->data)) {
+		kfree_skb(msg);
+		r = -ENOBUFS;
+		goto free_skb;
+	}
+
+	r = nfc_vendor_cmd_reply(msg);
+free_skb:
+	kfree_skb(info->vendor_info.rx_skb);
+exit:
+	return r;
+}
+
+static struct nfc_vendor_cmd st21nfca_vendor_cmds[] = {
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = FACTORY_MODE,
+		.doit = st21nfca_factory_mode,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_CLEAR_ALL_PIPES,
+		.doit = st21nfca_hci_clear_all_pipes,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_DM_PUT_DATA,
+		.doit = st21nfca_hci_dm_put_data,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_DM_UPDATE_AID,
+		.doit = st21nfca_hci_dm_update_aid,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_DM_GET_INFO,
+		.doit = st21nfca_hci_dm_get_info,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_DM_GET_DATA,
+		.doit = st21nfca_hci_dm_get_data,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_DM_LOAD,
+		.doit = st21nfca_hci_dm_load,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_DM_RESET,
+		.doit = st21nfca_hci_dm_reset,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_GET_PARAM,
+		.doit = st21nfca_hci_get_param,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_DM_FIELD_GENERATOR,
+		.doit = st21nfca_hci_dm_field_generator,
+	},
+	{
+		.vendor_id = ST21NFCA_VENDOR_OUI,
+		.subcmd = HCI_LOOPBACK,
+		.doit = st21nfca_hci_loopback,
+	},
+};
+
+int st21nfca_vendor_cmds_init(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	init_completion(&info->vendor_info.req_completion);
+	return nfc_set_vendor_cmds(hdev->ndev, st21nfca_vendor_cmds,
+				   sizeof(st21nfca_vendor_cmds));
+}
+EXPORT_SYMBOL(st21nfca_vendor_cmds_init);
diff --git a/drivers/nfc/st21nfca/st21nfca_vendor_cmds.h b/drivers/nfc/st21nfca/st21nfca_vendor_cmds.h
new file mode 100644
index 0000000..da06a79
--- /dev/null
+++ b/drivers/nfc/st21nfca/st21nfca_vendor_cmds.h
@@ -0,0 +1,74 @@
+/*
+ * Vendor commands extension for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014-2015  STMicroelectronics SAS. All rights reserved.
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
+#ifndef __LOCAL_ST21NFCA_VENDOR_CMDS_H__
+#define __LOCAL_ST21NFCA_VENDOR_CMDS_H__
+
+#define ST21NFCA_VENDOR_OUI 0x0080E1 /* STMicroelectronics */
+
+#define ST21NFCA_FACTORY_MODE 2
+
+/**
+ * enum nfc_vendor_cmds - supported nfc vendor commands
+ *
+ * @FACTORY_MODE: Allow to set the driver into a mode where no secure element
+ *	are activated. It does not consider any NFC_ATTR_VENDOR_DATA.
+ * @HCI_CLEAR_ALL_PIPES: Allow to execute a HCI clear all pipes command.
+ *	It does not consider any NFC_ATTR_VENDOR_DATA.
+ * @HCI_DM_PUT_DATA: Allow to configure specific CLF registry as for example
+ *	RF trimmings or low level drivers configurations (I2C, SPI, SWP).
+ * @HCI_DM_UPDATE_AID: Allow to configure an AID routing into the CLF routing
+ *	table following RF technology, CLF mode or protocol.
+ * @HCI_DM_GET_INFO: Allow to retrieve CLF information.
+ * @HCI_DM_GET_DATA: Allow to retrieve CLF configurable data such as low
+ *	level drivers configurations or RF trimmings.
+ * @HCI_DM_LOAD: Allow to load a firmware into the CLF. A complete
+ *	packet can be more than 8KB.
+ * @HCI_DM_RESET: Allow to run a CLF reset in order to "commit" CLF
+ *	configuration changes without CLF power off.
+ * @HCI_GET_PARAM: Allow to retrieve an HCI CLF parameter (for example the
+ *	white list).
+ * @HCI_DM_FIELD_GENERATOR: Allow to generate different kind of RF
+ *	technology. When using this command to anti-collision is done.
+ * @HCI_LOOPBACK: Allow to echo a command and test the Dh to CLF
+ * 	connectivity.
+ */
+enum nfc_vendor_cmds {
+	FACTORY_MODE,
+	HCI_CLEAR_ALL_PIPES,
+	HCI_DM_PUT_DATA,
+	HCI_DM_UPDATE_AID,
+	HCI_DM_GET_INFO,
+	HCI_DM_GET_DATA,
+	HCI_DM_LOAD,
+	HCI_DM_RESET,
+	HCI_GET_PARAM,
+	HCI_DM_FIELD_GENERATOR,
+	HCI_LOOPBACK,
+};
+
+struct st21nfca_vendor_info {
+	struct completion req_completion;
+	struct sk_buff *rx_skb;
+};
+
+int st21nfca_hci_loopback_event_received(struct nfc_hci_dev *ndev, u8 event,
+					 struct sk_buff *skb);
+int st21nfca_vendor_cmds_init(struct nfc_hci_dev *ndev);
+
+#endif
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
