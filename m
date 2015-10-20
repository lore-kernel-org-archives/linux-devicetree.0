From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 18/30] nfc: st-nci: Add support for proprietary commands for factory tests
Date: Tue, 20 Oct 2015 23:48:09 +0200
Message-ID: <1445377701-8353-19-git-send-email-christophe-h.ricard@st.com>
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
- HCI_DM_DIRECT_LOAD: Allow to load a firmware into the CLF. A complete
packet can be more than 8KB.
- HCI_DM_RESET: Allow to run a CLF reset in order to "commit" CLF
configuration changes without CLF power off.
-  HCI_GET_PARAM: Allow to retrieve an HCI CLF parameter (for example the
white list).
- HCI_DM_FIELD_GENERATOR: Allow to generate different kind of RF
technology. When using this command to anti-collision is done.
- HCI_LOOPBACK: Allow to echo a command and test the Dh to CLF
connectivity.
- HCI_DM_VDC_MEASUREMENT_VALUE: Allow to measure the field applied on the
CLF antenna. A value between 0 and 0x0f is returned. 0 is maximum.
- HCI_DM_FWUPD_START: Allow to put CLF into firmware update mode. It is a
specific CLF command as there is no GPIO for this.
- HCI_DM_FWUPD_END:  Allow to complete firmware update.
- HCI_DM_VDC_VALUE_COMPARISON: Allow to compare the field applied on the
CLF antenna to a reference value.
- MANUFACTURER_SPECIFIC: Allow to retrieve manufacturer specific data
received during a NCI_CORE_INIT_CMD.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st-nci/Makefile             |   2 +-
 drivers/nfc/st-nci/core.c               |  14 +-
 drivers/nfc/st-nci/st-nci.h             |   4 +
 drivers/nfc/st-nci/st-nci_se.c          |  30 +-
 drivers/nfc/st-nci/st-nci_vendor_cmds.c | 516 ++++++++++++++++++++++++++++++++
 drivers/nfc/st-nci/st-nci_vendor_cmds.h |  88 ++++++
 include/net/nfc/nci_core.h              |   1 +
 7 files changed, 645 insertions(+), 10 deletions(-)
 create mode 100644 drivers/nfc/st-nci/st-nci_vendor_cmds.c
 create mode 100644 drivers/nfc/st-nci/st-nci_vendor_cmds.h

diff --git a/drivers/nfc/st-nci/Makefile b/drivers/nfc/st-nci/Makefile
index 348ce76..60e569b 100644
--- a/drivers/nfc/st-nci/Makefile
+++ b/drivers/nfc/st-nci/Makefile
@@ -2,7 +2,7 @@
 # Makefile for ST21NFCB NCI based NFC driver
 #
 
-st-nci-objs = ndlc.o core.o st-nci_se.o
+st-nci-objs = ndlc.o core.o st-nci_se.o st-nci_vendor_cmds.o
 obj-$(CONFIG_NFC_ST_NCI)     += st-nci.o
 
 st-nci_i2c-objs = i2c.o
diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
index c419d39..fd2a5ca 100644
--- a/drivers/nfc/st-nci/core.c
+++ b/drivers/nfc/st-nci/core.c
@@ -25,6 +25,7 @@
 
 #include "st-nci.h"
 #include "st-nci_se.h"
+#include "st-nci_vendor_cmds.h"
 
 #define DRIVER_DESC "NCI NFC driver for ST_NCI"
 
@@ -153,14 +154,23 @@ int st_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
 
 	nci_set_drvdata(ndlc->ndev, info);
 
+	r = st_nci_vendor_cmds_init(ndlc->ndev);
+	if (r) {
+		pr_err("Cannot register proprietary vendor cmds\n");
+		goto err_reg_dev;
+	}
+
 	r = nci_register_device(ndlc->ndev);
 	if (r) {
 		pr_err("Cannot register nfc device to nci core\n");
-		nci_free_device(ndlc->ndev);
-		return r;
+		goto err_reg_dev;
 	}
 
 	return st_nci_se_init(ndlc->ndev);
+
+err_reg_dev:
+	nci_free_device(ndlc->ndev);
+	return r;
 }
 EXPORT_SYMBOL_GPL(st_nci_probe);
 
diff --git a/drivers/nfc/st-nci/st-nci.h b/drivers/nfc/st-nci/st-nci.h
index 850a239..858e8e6 100644
--- a/drivers/nfc/st-nci/st-nci.h
+++ b/drivers/nfc/st-nci/st-nci.h
@@ -20,6 +20,7 @@
 #define __LOCAL_ST_NCI_H_
 
 #include "st-nci_se.h"
+#include "st-nci_vendor_cmds.h"
 #include "ndlc.h"
 
 /* Define private flags: */
@@ -28,6 +29,8 @@
 #define ST_NCI_CORE_PROP                0x01
 #define ST_NCI_SET_NFC_MODE             0x02
 
+#define ST_NCI_DEVICE_MGNT_GATE		0x01
+
 struct nci_mode_set_cmd {
 	u8 cmd_type;
 	u8 mode;
@@ -41,6 +44,7 @@ struct st_nci_info {
 	struct llt_ndlc *ndlc;
 	unsigned long flags;
 	struct st_nci_se_info se_info;
+	struct st_nci_vendor_info vendor_info;
 };
 
 void st_nci_remove(struct nci_dev *ndev);
diff --git a/drivers/nfc/st-nci/st-nci_se.c b/drivers/nfc/st-nci/st-nci_se.c
index a8ae04e..45eda3e 100644
--- a/drivers/nfc/st-nci/st-nci_se.c
+++ b/drivers/nfc/st-nci/st-nci_se.c
@@ -24,6 +24,7 @@
 
 #include "st-nci.h"
 #include "st-nci_se.h"
+#include "st-nci_vendor_cmds.h"
 
 struct st_nci_pipe_info {
 	u8 pipe_state;
@@ -40,7 +41,6 @@ struct st_nci_pipe_info {
 #define ST_NCI_ESE_HOST_ID            0xc0
 
 /* Gates */
-#define ST_NCI_DEVICE_MGNT_GATE       0x01
 #define ST_NCI_APDU_READER_GATE       0xf0
 #define ST_NCI_CONNECTIVITY_GATE      0x41
 
@@ -115,6 +115,8 @@ static struct nci_hci_gate st_nci_gates[] = {
 
 	{NCI_HCI_IDENTITY_MGMT_GATE, NCI_HCI_INVALID_PIPE,
 					ST_NCI_HOST_CONTROLLER_ID},
+	{NCI_HCI_LOOPBACK_GATE, NCI_HCI_INVALID_PIPE,
+					ST_NCI_HOST_CONTROLLER_ID},
 
 	/* Secure element pipes are created by secure element host */
 	{ST_NCI_CONNECTIVITY_GATE, NCI_HCI_DO_NOT_OPEN_PIPE,
@@ -377,8 +379,10 @@ void st_nci_hci_event_received(struct nci_dev *ndev, u8 pipe,
 		st_nci_hci_apdu_reader_event_received(ndev, event, skb);
 	break;
 	case ST_NCI_CONNECTIVITY_GATE:
-		st_nci_hci_connectivity_event_received(ndev, host, event,
-							 skb);
+		st_nci_hci_connectivity_event_received(ndev, host, event, skb);
+	break;
+	case NCI_HCI_LOOPBACK_GATE:
+		st_nci_hci_loopback_event_received(ndev, event, skb);
 	break;
 	}
 }
@@ -510,6 +514,7 @@ EXPORT_SYMBOL_GPL(st_nci_enable_se);
 
 static int st_nci_hci_network_init(struct nci_dev *ndev)
 {
+	struct st_nci_info *info = nci_get_drvdata(ndev);
 	struct core_conn_create_dest_spec_params *dest_params;
 	struct dest_spec_params spec_params;
 	struct nci_conn_info    *conn_info;
@@ -562,10 +567,17 @@ static int st_nci_hci_network_init(struct nci_dev *ndev)
 	if (r != NCI_HCI_ANY_OK)
 		goto free_dest_params;
 
-	r = nci_nfcee_mode_set(ndev, ndev->hci_dev->conn_info->id,
-			       NCI_NFCEE_ENABLE);
-	if (r != NCI_STATUS_OK)
-		goto free_dest_params;
+	/*
+	 * In factory mode, we prevent secure elements activation
+	 * by disabling nfcee on the current HCI connection id.
+	 * HCI will be used here only for proprietary commands.
+	 */
+	if (test_bit(ST_NCI_FACTORY_MODE, &info->flags))
+		r = nci_nfcee_mode_set(ndev, ndev->hci_dev->conn_info->id,
+				       NCI_NFCEE_DISABLE);
+	else
+		r = nci_nfcee_mode_set(ndev, ndev->hci_dev->conn_info->id,
+				       NCI_NFCEE_ENABLE);
 
 free_dest_params:
 	kfree(dest_params);
@@ -579,6 +591,7 @@ int st_nci_discover_se(struct nci_dev *ndev)
 	u8 param[2];
 	int r;
 	int se_count = 0;
+	struct st_nci_info *info = nci_get_drvdata(ndev);
 
 	pr_debug("st_nci_discover_se\n");
 
@@ -586,6 +599,9 @@ int st_nci_discover_se(struct nci_dev *ndev)
 	if (r != 0)
 		return r;
 
+	if (test_bit(ST_NCI_FACTORY_MODE, &info->flags))
+		return 0;
+
 	param[0] = ST_NCI_UICC_HOST_ID;
 	param[1] = ST_NCI_HCI_HOST_ID_ESE;
 	r = nci_hci_set_param(ndev, NCI_HCI_ADMIN_GATE,
diff --git a/drivers/nfc/st-nci/st-nci_vendor_cmds.c b/drivers/nfc/st-nci/st-nci_vendor_cmds.c
new file mode 100644
index 0000000..4e4247b
--- /dev/null
+++ b/drivers/nfc/st-nci/st-nci_vendor_cmds.c
@@ -0,0 +1,516 @@
+/*
+ * Proprietary commands extension for STMicroelectronics NFC NCI Chip
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
+#include <linux/delay.h>
+#include <net/nfc/nci_core.h>
+
+#include "st-nci.h"
+#include "st-nci_vendor_cmds.h"
+
+#define ST_NCI_HCI_DM_GETDATA			0x10
+#define ST_NCI_HCI_DM_PUTDATA			0x11
+#define ST_NCI_HCI_DM_LOAD			0x12
+#define ST_NCI_HCI_DM_GETINFO			0x13
+#define ST_NCI_HCI_DM_FWUPD_START		0x14
+#define ST_NCI_HCI_DM_FWUPD_STOP		0x15
+#define ST_NCI_HCI_DM_UPDATE_AID		0x20
+#define ST_NCI_HCI_DM_RESET			0x3e
+
+#define ST_NCI_HCI_DM_FIELD_GENERATOR		0x32
+#define ST_NCI_HCI_DM_VDC_MEASUREMENT_VALUE	0x33
+#define ST_NCI_HCI_DM_VDC_VALUE_COMPARISON	0x34
+
+#define ST_NCI_FACTORY_MODE_ON			1
+#define ST_NCI_FACTORY_MODE_OFF			0
+
+#define ST_NCI_EVT_POST_DATA			0x02
+
+struct get_param_data {
+	u8 gate;
+	u8 data;
+} __packed;
+
+static int st_nci_factory_mode(struct nfc_dev *dev, void *data,
+			       size_t data_len)
+{
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+	struct st_nci_info *info = nci_get_drvdata(ndev);
+
+	if (data_len != 1)
+		return -EINVAL;
+
+	pr_debug("factory mode: %x\n", ((u8 *)data)[0]);
+
+	switch (((u8 *)data)[0]) {
+	case ST_NCI_FACTORY_MODE_ON:
+		test_and_set_bit(ST_NCI_FACTORY_MODE, &info->flags);
+	break;
+	case ST_NCI_FACTORY_MODE_OFF:
+		clear_bit(ST_NCI_FACTORY_MODE, &info->flags);
+	break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int st_nci_hci_clear_all_pipes(struct nfc_dev *dev, void *data,
+				      size_t data_len)
+{
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	return nci_hci_clear_all_pipes(ndev);
+}
+
+static int st_nci_hci_dm_put_data(struct nfc_dev *dev, void *data,
+				  size_t data_len)
+{
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	return nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+				ST_NCI_HCI_DM_PUTDATA, data,
+				data_len, NULL);
+}
+
+static int st_nci_hci_dm_update_aid(struct nfc_dev *dev, void *data,
+				    size_t data_len)
+{
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	return nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+			ST_NCI_HCI_DM_UPDATE_AID, data, data_len, NULL);
+}
+
+static int st_nci_hci_dm_get_info(struct nfc_dev *dev, void *data,
+				  size_t data_len)
+{
+	int r;
+	struct sk_buff *msg, *skb;
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	r = nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE, ST_NCI_HCI_DM_GETINFO,
+			     data, data_len, &skb);
+	if (r)
+		goto exit;
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(dev, ST_NCI_VENDOR_OUI,
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
+static int st_nci_hci_dm_get_data(struct nfc_dev *dev, void *data,
+				  size_t data_len)
+{
+	int r;
+	struct sk_buff *msg, *skb;
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	r = nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE, ST_NCI_HCI_DM_GETDATA,
+			     data, data_len, &skb);
+	if (r)
+		goto exit;
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(dev, ST_NCI_VENDOR_OUI,
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
+static int st_nci_hci_dm_fwupd_start(struct nfc_dev *dev, void *data,
+				     size_t data_len)
+{
+	int r;
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	dev->fw_download_in_progress = true;
+	r = nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+			ST_NCI_HCI_DM_FWUPD_START, data, data_len, NULL);
+	if (r)
+		dev->fw_download_in_progress = false;
+
+	return r;
+}
+
+static int st_nci_hci_dm_fwupd_end(struct nfc_dev *dev, void *data,
+				   size_t data_len)
+{
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	return nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+			ST_NCI_HCI_DM_FWUPD_STOP, data, data_len, NULL);
+}
+
+static int st_nci_hci_dm_direct_load(struct nfc_dev *dev, void *data,
+				     size_t data_len)
+{
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	if (dev->fw_download_in_progress) {
+		dev->fw_download_in_progress = false;
+		return nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+				ST_NCI_HCI_DM_LOAD, data, data_len, NULL);
+	}
+	return -EPROTO;
+}
+
+static int st_nci_hci_dm_reset(struct nfc_dev *dev, void *data,
+			       size_t data_len)
+{
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+			ST_NCI_HCI_DM_RESET, data, data_len, NULL);
+	msleep(200);
+
+	return 0;
+}
+
+static int st_nci_hci_get_param(struct nfc_dev *dev, void *data,
+				size_t data_len)
+{
+	int r;
+	struct sk_buff *msg, *skb;
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+	struct get_param_data *param = (struct get_param_data *)data;
+
+	if (data_len < sizeof(struct get_param_data))
+		return -EPROTO;
+
+	r = nci_hci_get_param(ndev, param->gate, param->data, &skb);
+	if (r)
+		goto exit;
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(dev, ST_NCI_VENDOR_OUI,
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
+static int st_nci_hci_dm_field_generator(struct nfc_dev *dev, void *data,
+					 size_t data_len)
+{
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	return nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+				ST_NCI_HCI_DM_FIELD_GENERATOR, data, data_len, NULL);
+}
+
+static int st_nci_hci_dm_vdc_measurement_value(struct nfc_dev *dev, void *data,
+					       size_t data_len)
+{
+	int r;
+	struct sk_buff *msg, *skb;
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	if (data_len != 4)
+		return -EPROTO;
+
+	r = nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+			     ST_NCI_HCI_DM_VDC_MEASUREMENT_VALUE,
+			     data, data_len, &skb);
+	if (r)
+		goto exit;
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(dev, ST_NCI_VENDOR_OUI,
+				HCI_DM_VDC_MEASUREMENT_VALUE, skb->len);
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
+static int st_nci_hci_dm_vdc_value_comparison(struct nfc_dev *dev, void *data,
+					      size_t data_len)
+{
+	int r;
+	struct sk_buff *msg, *skb;
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	if (data_len != 2)
+		return -EPROTO;
+
+	r = nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+			     ST_NCI_HCI_DM_VDC_VALUE_COMPARISON,
+			     data, data_len, &skb);
+	if (r)
+		goto exit;
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(dev, ST_NCI_VENDOR_OUI,
+					HCI_DM_VDC_VALUE_COMPARISON, skb->len);
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
+void st_nci_hci_loopback_event_received(struct nci_dev *ndev, u8 event,
+					struct sk_buff *skb)
+{
+	struct st_nci_info *info = nci_get_drvdata(ndev);
+
+	switch (event) {
+	case ST_NCI_EVT_POST_DATA:
+		info->vendor_info.rx_skb = skb;
+
+		complete(&info->vendor_info.req_completion);
+	break;
+	}
+}
+EXPORT_SYMBOL(st_nci_hci_loopback_event_received);
+
+static int st_nci_hci_loopback(struct nfc_dev *dev, void *data,
+			       size_t data_len)
+{
+	int r;
+	struct sk_buff *msg;
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+	struct st_nci_info *info = nci_get_drvdata(ndev);
+
+	if (data_len <= 0)
+		return -EPROTO;
+
+	reinit_completion(&info->vendor_info.req_completion);
+	info->vendor_info.rx_skb = NULL;
+
+	r = nci_hci_send_event(ndev, NCI_HCI_LOOPBACK_GATE,
+			       ST_NCI_EVT_POST_DATA, data, data_len);
+	if (r != data_len) {
+		r = -EPROTO;
+		goto exit;
+	}
+
+	wait_for_completion_interruptible(&info->vendor_info.req_completion);
+
+	if (!info->vendor_info.rx_skb ||
+	    info->vendor_info.rx_skb->len != data_len) {
+		r = -EPROTO;
+		goto exit;
+	}
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(ndev->nfc_dev,
+					ST_NCI_VENDOR_OUI,
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
+static int st_nci_manufacturer_specific(struct nfc_dev *dev, void *data,
+					size_t data_len)
+{
+	struct sk_buff *msg;
+	struct nci_dev *ndev = nfc_get_drvdata(dev);
+
+	msg = nfc_vendor_cmd_alloc_reply_skb(dev, ST_NCI_VENDOR_OUI,
+					MANUFACTURER_SPECIFIC,
+					sizeof(ndev->manufact_specific_info));
+	if (!msg)
+		return -ENOMEM;
+
+	if (nla_put(msg, NFC_ATTR_VENDOR_DATA, sizeof(ndev->manufact_specific_info),
+		    &ndev->manufact_specific_info)) {
+		kfree_skb(msg);
+		return -ENOBUFS;
+	}
+
+	return nfc_vendor_cmd_reply(msg);
+}
+
+static struct nfc_vendor_cmd st_nci_vendor_cmds[] = {
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = FACTORY_MODE,
+		.doit = st_nci_factory_mode,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_CLEAR_ALL_PIPES,
+		.doit = st_nci_hci_clear_all_pipes,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_PUT_DATA,
+		.doit = st_nci_hci_dm_put_data,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_UPDATE_AID,
+		.doit = st_nci_hci_dm_update_aid,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_GET_INFO,
+		.doit = st_nci_hci_dm_get_info,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_GET_DATA,
+		.doit = st_nci_hci_dm_get_data,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_DIRECT_LOAD,
+		.doit = st_nci_hci_dm_direct_load,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_RESET,
+		.doit = st_nci_hci_dm_reset,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_GET_PARAM,
+		.doit = st_nci_hci_get_param,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_FIELD_GENERATOR,
+		.doit = st_nci_hci_dm_field_generator,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_FWUPD_START,
+		.doit = st_nci_hci_dm_fwupd_start,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_FWUPD_END,
+		.doit = st_nci_hci_dm_fwupd_end,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_LOOPBACK,
+		.doit = st_nci_hci_loopback,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_VDC_MEASUREMENT_VALUE,
+		.doit = st_nci_hci_dm_vdc_measurement_value,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = HCI_DM_VDC_VALUE_COMPARISON,
+		.doit = st_nci_hci_dm_vdc_value_comparison,
+	},
+	{
+		.vendor_id = ST_NCI_VENDOR_OUI,
+		.subcmd = MANUFACTURER_SPECIFIC,
+		.doit = st_nci_manufacturer_specific,
+	},
+};
+
+int st_nci_vendor_cmds_init(struct nci_dev *ndev)
+{
+	struct st_nci_info *info = nci_get_drvdata(ndev);
+
+	init_completion(&info->vendor_info.req_completion);
+	return nfc_set_vendor_cmds(ndev->nfc_dev, st_nci_vendor_cmds,
+				   sizeof(st_nci_vendor_cmds));
+}
+EXPORT_SYMBOL(st_nci_vendor_cmds_init);
diff --git a/drivers/nfc/st-nci/st-nci_vendor_cmds.h b/drivers/nfc/st-nci/st-nci_vendor_cmds.h
new file mode 100644
index 0000000..89542da
--- /dev/null
+++ b/drivers/nfc/st-nci/st-nci_vendor_cmds.h
@@ -0,0 +1,88 @@
+/*
+ * Vendor commands extension for STMicroelectronics NFC NCI Chip
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
+#ifndef __LOCAL_ST_NCI_VENDOR_CMDS_H__
+#define __LOCAL_ST_NCI_VENDOR_CMDS_H__
+
+#define ST_NCI_VENDOR_OUI 0x0080E1 /* STMicroelectronics */
+
+#define ST_NCI_FACTORY_MODE 2
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
+ * @HCI_DM_DIRECT_LOAD: Allow to load a firmware into the CLF. A complete
+ *	packet can be more than 8KB.
+ * @HCI_DM_RESET: Allow to run a CLF reset in order to "commit" CLF
+ *	configuration changes without CLF power off.
+ * @HCI_GET_PARAM: Allow to retrieve an HCI CLF parameter (for example the
+ *	white list).
+ * @HCI_DM_FIELD_GENERATOR: Allow to generate different kind of RF
+ *	technology. When using this command to anti-collision is done.
+ * @HCI_LOOPBACK: Allow to echo a command and test the Dh to CLF
+ *	connectivity.
+ * @HCI_DM_VDC_MEASUREMENT_VALUE: Allow to measure the field applied on the
+ *	CLF antenna. A value between 0 and 0x0f is returned. 0 is maximum.
+ * @HCI_DM_FWUPD_START: Allow to put CLF into firmware update mode. It is a
+ *	specific CLF command as there is no GPIO for this.
+ * @HCI_DM_FWUPD_END:  Allow to complete firmware update.
+ * @HCI_DM_VDC_VALUE_COMPARISON: Allow to compare the field applied on the
+ *	CLF antenna to a reference value.
+ * @MANUFACTURER_SPECIFIC: Allow to retrieve manufacturer specific data
+ *	received during a NCI_CORE_INIT_CMD.
+ */
+enum nfc_vendor_cmds {
+	FACTORY_MODE,
+	HCI_CLEAR_ALL_PIPES,
+	HCI_DM_PUT_DATA,
+	HCI_DM_UPDATE_AID,
+	HCI_DM_GET_INFO,
+	HCI_DM_GET_DATA,
+	HCI_DM_DIRECT_LOAD,
+	HCI_DM_RESET,
+	HCI_GET_PARAM,
+	HCI_DM_FIELD_GENERATOR,
+	HCI_LOOPBACK,
+	HCI_DM_FWUPD_START,
+	HCI_DM_FWUPD_END,
+	HCI_DM_VDC_MEASUREMENT_VALUE,
+	HCI_DM_VDC_VALUE_COMPARISON,
+	MANUFACTURER_SPECIFIC,
+};
+
+struct st_nci_vendor_info {
+	struct completion req_completion;
+	struct sk_buff *rx_skb;
+};
+
+void st_nci_hci_loopback_event_received(struct nci_dev *ndev, u8 event,
+					 struct sk_buff *skb);
+int st_nci_vendor_cmds_init(struct nci_dev *ndev);
+
+#endif
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 377f3de..591338f 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -125,6 +125,7 @@ struct nci_conn_info {
 
 /* Gates */
 #define NCI_HCI_ADMIN_GATE         0x00
+#define NCI_HCI_LOOPBACK_GATE	   0x04
 #define NCI_HCI_IDENTITY_MGMT_GATE 0x05
 #define NCI_HCI_LINK_MGMT_GATE     0x06
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
