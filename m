From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/10] NFC: st21nfca: Adding support for secure element
Date: Tue, 27 Jan 2015 01:18:19 +0100
Message-ID: <1422317900-3810-10-git-send-email-christophe-h.ricard@st.com>
References: <1422317900-3810-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422317900-3810-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

st21nfca has 1 physical SWP line and can support up to 2 secure elements
(UICC & eSE) thanks to an external switch managed with a gpio.

The platform integrator needs to specify thanks to 2 initialization
properties, uicc-present and ese-present, if it is suppose to have uicc
and/or ese. Of course if the platform does not have an external switch,
only one kind of secure element can be supported. Those parameters are
under platform integrator responsibilities.

During initialization, the white_list will be set according to those
parameters.

The discovery_se function will assume a secure element is physically
present according to uicc-present and ese-present values and will add it
to the secure element list. On ese activation, the atr is retrieved to
calculate a command exchange timeout based on the first atr(TB) value.

The se_io will allow to transfer data over SWP. 2 kind of events may appear
after a data is sent over:
- ST21NFCA_EVT_TRANSMIT_DATA when receiving an apdu answer
- ST21NFCA_EVT_WTX_REQUEST when the secure element needs more time than
expected to compute a command. If this timeout expired, a first recovery
tentative consist to send a simple software reset proprietary command.
If this tentative still fail, a second recovery tentative consist to send
a hardware reset proprietary command.
This function is only relevant for eSE like secure element.

This patch also change the way a pipe is referenced. There can be
different pipe connected to the same gate with different host destination
(ex: CONNECTIVITY). In order to keep host information every pipe are
reference with a tuple (gate, host). In order to reduce changes, we are
keeping unchanged the way a gate is addressed on the Terminal Host.
However, this is working because we consider the apdu reader gate is only
present on the eSE slot also the connectivity gate cannot give a reliable
value; it will give the latest stored pipe value.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/Makefile          |   2 +-
 drivers/nfc/st21nfca/i2c.c             |  17 +-
 drivers/nfc/st21nfca/st21nfca.c        | 134 +++++++++--
 drivers/nfc/st21nfca/st21nfca.h        |  21 +-
 drivers/nfc/st21nfca/st21nfca_se.c     | 390 +++++++++++++++++++++++++++++++++
 drivers/nfc/st21nfca/st21nfca_se.h     |  63 ++++++
 include/linux/platform_data/st21nfca.h |   2 +
 7 files changed, 608 insertions(+), 21 deletions(-)
 create mode 100644 drivers/nfc/st21nfca/st21nfca_se.c
 create mode 100644 drivers/nfc/st21nfca/st21nfca_se.h

diff --git a/drivers/nfc/st21nfca/Makefile b/drivers/nfc/st21nfca/Makefile
index 7d688f9..97edab4 100644
--- a/drivers/nfc/st21nfca/Makefile
+++ b/drivers/nfc/st21nfca/Makefile
@@ -2,7 +2,7 @@
 # Makefile for ST21NFCA HCI based NFC driver
 #
 
-st21nfca_hci-objs = st21nfca.o st21nfca_dep.o
+st21nfca_hci-objs = st21nfca.o st21nfca_dep.o st21nfca_se.o
 obj-$(CONFIG_NFC_ST21NFCA)     += st21nfca_hci.o
 
 st21nfca_i2c-objs  = i2c.o
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 82b82db..a321439 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -74,6 +74,8 @@ struct st21nfca_i2c_phy {
 	unsigned int gpio_ena;
 	unsigned int irq_polarity;
 
+	struct st21nfca_se_status se_status;
+
 	struct sk_buff *pending_skb;
 	int current_read_len;
 	/*
@@ -537,6 +539,11 @@ static int st21nfca_hci_i2c_of_request_resources(struct i2c_client *client)
 
 	phy->irq_polarity = irq_get_trigger_type(client->irq);
 
+	phy->se_status.is_ese_present =
+				of_property_read_bool(pp, "ese-present");
+	phy->se_status.is_uicc_present =
+				of_property_read_bool(pp, "uicc-present");
+
 	return 0;
 }
 #else
@@ -571,6 +578,9 @@ static int st21nfca_hci_i2c_request_resources(struct i2c_client *client)
 		}
 	}
 
+	phy->se_status.is_ese_present = pdata->is_ese_present;
+	phy->se_status.is_uicc_present = pdata->is_uicc_present;
+
 	return 0;
 }
 
@@ -638,8 +648,11 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *client,
 	}
 
 	return st21nfca_hci_probe(phy, &i2c_phy_ops, LLC_SHDLC_NAME,
-			       ST21NFCA_FRAME_HEADROOM, ST21NFCA_FRAME_TAILROOM,
-			       ST21NFCA_HCI_LLC_MAX_PAYLOAD, &phy->hdev);
+					ST21NFCA_FRAME_HEADROOM,
+					ST21NFCA_FRAME_TAILROOM,
+					ST21NFCA_HCI_LLC_MAX_PAYLOAD,
+					&phy->hdev,
+					&phy->se_status);
 }
 
 static int st21nfca_hci_i2c_remove(struct i2c_client *client)
diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st21nfca.c
index 7cb7ce4..24d3d24 100644
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ b/drivers/nfc/st21nfca/st21nfca.c
@@ -23,6 +23,7 @@
 
 #include "st21nfca.h"
 #include "st21nfca_dep.h"
+#include "st21nfca_se.h"
 
 #define DRIVER_DESC "HCI NFC driver for ST21NFCA"
 
@@ -62,7 +63,6 @@
 #define ST21NFCA_RF_CARD_F_DATARATE		0x08
 #define ST21NFCA_RF_CARD_F_DATARATE_212_424	0x01
 
-#define ST21NFCA_DEVICE_MGNT_GATE		0x01
 #define ST21NFCA_DEVICE_MGNT_PIPE		0x02
 
 #define ST21NFCA_DM_GETINFO			0x13
@@ -78,6 +78,11 @@
 
 #define ST21NFCA_NFC_MODE			0x03	/* NFC_MODE parameter*/
 
+#define ST21NFCA_EVT_HOT_PLUG			0x03
+#define ST21NFCA_EVT_HOT_PLUG_IS_INHIBITED(x) (x->data[0] & 0x80)
+
+#define ST21NFCA_SE_TO_PIPES			2000
+
 static DECLARE_BITMAP(dev_mask, ST21NFCA_NUM_DEVICES);
 
 static struct nfc_hci_gate st21nfca_gates[] = {
@@ -92,6 +97,10 @@ static struct nfc_hci_gate st21nfca_gates[] = {
 	{ST21NFCA_RF_READER_14443_3_A_GATE, NFC_HCI_INVALID_PIPE},
 	{ST21NFCA_RF_READER_ISO15693_GATE, NFC_HCI_INVALID_PIPE},
 	{ST21NFCA_RF_CARD_F_GATE, NFC_HCI_INVALID_PIPE},
+
+	/* Secure element pipes are created by secure element host */
+	{ST21NFCA_CONNECTIVITY_GATE, NFC_HCI_DO_NOT_CREATE_PIPE},
+	{ST21NFCA_APDU_READER_GATE, NFC_HCI_DO_NOT_CREATE_PIPE},
 };
 
 struct st21nfca_pipe_info {
@@ -136,7 +145,8 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 	 * Pipe can be closed and need to be open.
 	 */
 	r = nfc_hci_connect_gate(hdev, NFC_HCI_HOST_CONTROLLER_ID,
-		ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_DEVICE_MGNT_PIPE);
+				ST21NFCA_DEVICE_MGNT_GATE,
+				ST21NFCA_DEVICE_MGNT_PIPE);
 	if (r < 0)
 		goto free_info;
 
@@ -167,17 +177,28 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 		 * - destination gid (1byte)
 		 */
 		info = (struct st21nfca_pipe_info *) skb_pipe_info->data;
+		if (info->dst_gate_id == ST21NFCA_APDU_READER_GATE &&
+			info->src_host_id != ST21NFCA_ESE_HOST_ID) {
+			pr_err("Unexpected apdu_reader pipe on host %x\n",
+				info->src_host_id);
+			continue;
+		}
+
 		for (j = 0; (j < ARRAY_SIZE(st21nfca_gates)) &&
-			(st21nfca_gates[j].gate != info->dst_gate_id);
-			j++)
+			(st21nfca_gates[j].gate != info->dst_gate_id) ; j++)
 			;
 
 		if (j < ARRAY_SIZE(st21nfca_gates) &&
 			st21nfca_gates[j].gate == info->dst_gate_id &&
 			ST21NFCA_DM_IS_PIPE_OPEN(info->pipe_state)) {
 			st21nfca_gates[j].pipe = pipe_info[2];
+
 			hdev->gate2pipe[st21nfca_gates[j].gate] =
-				st21nfca_gates[j].pipe;
+							st21nfca_gates[j].pipe;
+			hdev->pipes[st21nfca_gates[j].pipe].gate =
+							st21nfca_gates[j].gate;
+			hdev->pipes[st21nfca_gates[j].pipe].dest_host =
+							info->src_host_id;
 		}
 	}
 
@@ -187,7 +208,7 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 	 */
 	if (skb_pipe_list->len + 3 < ARRAY_SIZE(st21nfca_gates)) {
 		for (i = skb_pipe_list->len + 3;
-				i < ARRAY_SIZE(st21nfca_gates); i++) {
+				i < ARRAY_SIZE(st21nfca_gates) - 2; i++) {
 			r = nfc_hci_connect_gate(hdev,
 					NFC_HCI_HOST_CONTROLLER_ID,
 					st21nfca_gates[i].gate,
@@ -244,16 +265,33 @@ out:
 
 static int st21nfca_hci_ready(struct nfc_hci_dev *hdev)
 {
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
 	struct sk_buff *skb;
 
 	u8 param;
+	u8 white_list[2];
+	int wl_size = 0;
 	int r;
 
-	param = NFC_HCI_UICC_HOST_ID;
-	r = nfc_hci_set_param(hdev, NFC_HCI_ADMIN_GATE,
-			      NFC_HCI_ADMIN_WHITELIST, &param, 1);
-	if (r < 0)
-		return r;
+	if (info->se_status->is_ese_present &&
+		info->se_status->is_uicc_present) {
+		white_list[wl_size++] = NFC_HCI_UICC_HOST_ID;
+		white_list[wl_size++] = ST21NFCA_ESE_HOST_ID;
+	} else if (!info->se_status->is_ese_present &&
+			 info->se_status->is_uicc_present) {
+		white_list[wl_size++] = NFC_HCI_UICC_HOST_ID;
+	} else if (info->se_status->is_ese_present &&
+			!info->se_status->is_uicc_present) {
+		white_list[wl_size++] = ST21NFCA_ESE_HOST_ID;
+	}
+
+	if (wl_size) {
+		r = nfc_hci_set_param(hdev, NFC_HCI_ADMIN_GATE,
+					NFC_HCI_ADMIN_WHITELIST,
+					(u8 *) &white_list, wl_size);
+		if (r < 0)
+			return r;
+	}
 
 	/* Set NFC_MODE in device management gate to enable */
 	r = nfc_hci_get_param(hdev, ST21NFCA_DEVICE_MGNT_GATE,
@@ -821,19 +859,79 @@ static int st21nfca_hci_check_presence(struct nfc_hci_dev *hdev,
 	}
 }
 
+static void st21nfca_hci_cmd_received(struct nfc_hci_dev *hdev, u8 pipe, u8 cmd,
+				struct sk_buff *skb)
+{
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+	u8 gate = hdev->pipes[pipe].gate;
+
+	pr_debug("cmd: %x\n", cmd);
+
+	switch (cmd) {
+	case NFC_HCI_ANY_OPEN_PIPE:
+		if (gate != ST21NFCA_APDU_READER_GATE &&
+			hdev->pipes[pipe].dest_host != NFC_HCI_UICC_HOST_ID)
+			info->se_info.count_pipes++;
+
+		if (info->se_info.count_pipes == info->se_info.expected_pipes) {
+			del_timer_sync(&info->se_info.se_active_timer);
+			info->se_info.se_active = false;
+			info->se_info.count_pipes = 0;
+			complete(&info->se_info.req_completion);
+		}
+	break;
+	}
+}
+
+static int st21nfca_admin_event_received(struct nfc_hci_dev *hdev, u8 event,
+					struct sk_buff *skb)
+{
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	pr_debug("admin event: %x\n", event);
+
+	switch (event) {
+	case ST21NFCA_EVT_HOT_PLUG:
+		if (info->se_info.se_active) {
+			if (!ST21NFCA_EVT_HOT_PLUG_IS_INHIBITED(skb)) {
+				del_timer_sync(&info->se_info.se_active_timer);
+				info->se_info.se_active = false;
+				complete(&info->se_info.req_completion);
+			} else {
+				mod_timer(&info->se_info.se_active_timer,
+					jiffies +
+					msecs_to_jiffies(ST21NFCA_SE_TO_PIPES));
+			}
+		}
+	break;
+	}
+	kfree_skb(skb);
+	return 0;
+}
+
 /*
  * Returns:
  * <= 0: driver handled the event, skb consumed
  *    1: driver does not handle the event, please do standard processing
  */
-static int st21nfca_hci_event_received(struct nfc_hci_dev *hdev, u8 gate,
+static int st21nfca_hci_event_received(struct nfc_hci_dev *hdev, u8 pipe,
 				       u8 event, struct sk_buff *skb)
 {
+	u8 gate = hdev->pipes[pipe].gate;
+	u8 host = hdev->pipes[pipe].dest_host;
+
 	pr_debug("hci event: %d gate: %x\n", event, gate);
 
 	switch (gate) {
+	case NFC_HCI_ADMIN_GATE:
+		return st21nfca_admin_event_received(hdev, event, skb);
 	case ST21NFCA_RF_CARD_F_GATE:
 		return st21nfca_dep_event_received(hdev, event, skb);
+	case ST21NFCA_CONNECTIVITY_GATE:
+		return st21nfca_connectivity_event_received(hdev, host,
+							event, skb);
+	case ST21NFCA_APDU_READER_GATE:
+		return st21nfca_apdu_reader_event_received(hdev, event, skb);
 	default:
 		return 1;
 	}
@@ -855,11 +953,17 @@ static struct nfc_hci_ops st21nfca_hci_ops = {
 	.tm_send = st21nfca_hci_tm_send,
 	.check_presence = st21nfca_hci_check_presence,
 	.event_received = st21nfca_hci_event_received,
+	.cmd_received = st21nfca_hci_cmd_received,
+	.discover_se = st21nfca_hci_discover_se,
+	.enable_se = st21nfca_hci_enable_se,
+	.disable_se = st21nfca_hci_disable_se,
+	.se_io = st21nfca_hci_se_io,
 };
 
 int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 		       char *llc_name, int phy_headroom, int phy_tailroom,
-		       int phy_payload, struct nfc_hci_dev **hdev)
+		       int phy_payload, struct nfc_hci_dev **hdev,
+			   struct st21nfca_se_status *se_status)
 {
 	struct st21nfca_hci_info *info;
 	int r = 0;
@@ -919,6 +1023,8 @@ int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 		goto err_alloc_hdev;
 	}
 
+	info->se_status = se_status;
+
 	nfc_hci_set_clientdata(info->hdev, info);
 
 	r = nfc_hci_register_device(info->hdev);
@@ -927,6 +1033,7 @@ int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 
 	*hdev = info->hdev;
 	st21nfca_dep_init(info->hdev);
+	st21nfca_se_init(info->hdev);
 
 	return 0;
 
@@ -945,6 +1052,7 @@ void st21nfca_hci_remove(struct nfc_hci_dev *hdev)
 	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
 
 	st21nfca_dep_deinit(hdev);
+	st21nfca_se_deinit(hdev);
 	nfc_hci_unregister_device(hdev);
 	nfc_hci_free_device(hdev);
 	kfree(info);
diff --git a/drivers/nfc/st21nfca/st21nfca.h b/drivers/nfc/st21nfca/st21nfca.h
index 7c2a852..15a78d3 100644
--- a/drivers/nfc/st21nfca/st21nfca.h
+++ b/drivers/nfc/st21nfca/st21nfca.h
@@ -20,6 +20,7 @@
 #include <net/nfc/hci.h>
 
 #include "st21nfca_dep.h"
+#include "st21nfca_se.h"
 
 #define HCI_MODE 0
 
@@ -51,9 +52,15 @@
 
 #define ST21NFCA_NUM_DEVICES 256
 
+struct st21nfca_se_status {
+	bool is_ese_present;
+	bool is_uicc_present;
+};
+
 int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 		       char *llc_name, int phy_headroom, int phy_tailroom,
-		       int phy_payload, struct nfc_hci_dev **hdev);
+		       int phy_payload, struct nfc_hci_dev **hdev,
+			   struct st21nfca_se_status *se_status);
 void st21nfca_hci_remove(struct nfc_hci_dev *hdev);
 
 enum st21nfca_state {
@@ -66,6 +73,7 @@ struct st21nfca_hci_info {
 	void *phy_id;
 
 	struct nfc_hci_dev *hdev;
+	struct st21nfca_se_status *se_status;
 
 	enum st21nfca_state state;
 
@@ -76,13 +84,16 @@ struct st21nfca_hci_info {
 	void *async_cb_context;
 
 	struct st21nfca_dep_info dep_info;
+	struct st21nfca_se_info se_info;
 };
 
 /* Reader RF commands */
-#define ST21NFCA_WR_XCHG_DATA            0x10
-
-#define ST21NFCA_RF_READER_F_GATE               0x14
+#define ST21NFCA_WR_XCHG_DATA           0x10
 
-#define ST21NFCA_RF_CARD_F_GATE 0x24
+#define ST21NFCA_DEVICE_MGNT_GATE       0x01
+#define ST21NFCA_RF_READER_F_GATE       0x14
+#define ST21NFCA_RF_CARD_F_GATE			0x24
+#define ST21NFCA_APDU_READER_GATE		0xf0
+#define ST21NFCA_CONNECTIVITY_GATE		0x41
 
 #endif /* __LOCAL_ST21NFCA_H_ */
diff --git a/drivers/nfc/st21nfca/st21nfca_se.c b/drivers/nfc/st21nfca/st21nfca_se.c
new file mode 100644
index 0000000..9b93d39
--- /dev/null
+++ b/drivers/nfc/st21nfca/st21nfca_se.c
@@ -0,0 +1,390 @@
+/*
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
+#include <net/nfc/hci.h>
+
+#include "st21nfca.h"
+#include "st21nfca_se.h"
+
+#define ST21NFCA_EVT_UICC_ACTIVATE		0x10
+#define ST21NFCA_EVT_UICC_DEACTIVATE	0x13
+#define ST21NFCA_EVT_SE_HARD_RESET		0x20
+#define ST21NFCA_EVT_SE_SOFT_RESET		0x11
+#define ST21NFCA_EVT_SE_END_OF_APDU_TRANSFER	0x21
+#define ST21NFCA_EVT_SE_ACTIVATE		0x22
+#define ST21NFCA_EVT_SE_DEACTIVATE		0x23
+
+#define ST21NFCA_EVT_TRANSMIT_DATA		0x10
+#define ST21NFCA_EVT_WTX_REQUEST		0x11
+
+#define ST21NFCA_EVT_CONNECTIVITY		0x10
+#define ST21NFCA_EVT_TRANSACTION		0x12
+
+#define ST21NFCA_ESE_HOST_ID			0xc0
+
+#define ST21NFCA_SE_TO_HOT_PLUG			1000
+/* Connectivity pipe only */
+#define ST21NFCA_SE_COUNT_PIPE_UICC		0x01
+/* Connectivity + APDU Reader pipe */
+#define ST21NFCA_SE_COUNT_PIPE_EMBEDDED	0x02
+
+#define ST21NFCA_SE_MODE_OFF			0x00
+#define ST21NFCA_SE_MODE_ON				0x01
+
+#define ST21NFCA_PARAM_ATR				0x01
+#define ST21NFCA_ATR_DEFAULT_BWI		0x04
+
+/*
+ * WT = 2^BWI/10[s], convert into msecs and add a secure
+ * room by increasing by 2 this timeout
+ */
+#define ST21NFCA_BWI_TO_TIMEOUT(x)		((1 << x) * 200)
+#define ST21NFCA_ATR_GET_Y_FROM_TD(x)	(x >> 4)
+
+/* If TA is present bit 0 is set */
+#define ST21NFCA_ATR_TA_PRESENT(x) (x & 0x01)
+/* If TB is present bit 1 is set */
+#define ST21NFCA_ATR_TB_PRESENT(x) (x & 0x02)
+
+static u8 st21nfca_se_get_bwi(struct nfc_hci_dev *hdev)
+{
+	int i;
+	u8 td;
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	/* Bits 8 to 5 of the first TB for T=1 encode BWI from zero to nine */
+	for (i = 1; i < ST21NFCA_ESE_MAX_LENGTH; i++) {
+		td = ST21NFCA_ATR_GET_Y_FROM_TD(info->se_info.atr[i]);
+		if (ST21NFCA_ATR_TA_PRESENT(td))
+			i++;
+		if (ST21NFCA_ATR_TB_PRESENT(td)) {
+			i++;
+			return info->se_info.atr[i] >> 4;
+		}
+	}
+	return ST21NFCA_ATR_DEFAULT_BWI;
+}
+
+static void st21nfca_se_get_atr(struct nfc_hci_dev *hdev)
+{
+	int r;
+	struct sk_buff *skb;
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	r = nfc_hci_get_param(hdev, ST21NFCA_APDU_READER_GATE,
+			ST21NFCA_PARAM_ATR, &skb);
+	if (r < 0)
+		return;
+
+	if (skb->len <= ST21NFCA_ESE_MAX_LENGTH) {
+		memcpy(info->se_info.atr, skb->data, skb->len);
+		info->se_info.wt_timeout =
+			ST21NFCA_BWI_TO_TIMEOUT(st21nfca_se_get_bwi(hdev));
+	}
+	kfree_skb(skb);
+}
+
+static int st21nfca_hci_control_se(struct nfc_hci_dev *hdev, u32 se_idx,
+				u8 state)
+{
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+	int r;
+	struct sk_buff *sk_host_list;
+	u8 se_event, host_id;
+
+	switch (se_idx) {
+	case NFC_HCI_UICC_HOST_ID:
+		se_event = (state == ST21NFCA_SE_MODE_ON ?
+					ST21NFCA_EVT_UICC_ACTIVATE :
+					ST21NFCA_EVT_UICC_DEACTIVATE);
+
+		info->se_info.count_pipes = 0;
+		info->se_info.expected_pipes = ST21NFCA_SE_COUNT_PIPE_UICC;
+		break;
+	case ST21NFCA_ESE_HOST_ID:
+		se_event = (state == ST21NFCA_SE_MODE_ON ?
+					ST21NFCA_EVT_SE_ACTIVATE :
+					ST21NFCA_EVT_SE_DEACTIVATE);
+
+		info->se_info.count_pipes = 0;
+		info->se_info.expected_pipes = ST21NFCA_SE_COUNT_PIPE_EMBEDDED;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * Wait for an EVT_HOT_PLUG in order to
+	 * retrieve a relevant host list.
+	 */
+	reinit_completion(&info->se_info.req_completion);
+	r = nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE, se_event,
+			       NULL, 0);
+	if (r < 0)
+		return r;
+
+	mod_timer(&info->se_info.se_active_timer, jiffies +
+		msecs_to_jiffies(ST21NFCA_SE_TO_HOT_PLUG));
+	info->se_info.se_active = true;
+
+	/* Ignore return value and check in any case the host_list */
+	wait_for_completion_interruptible(&info->se_info.req_completion);
+
+	r = nfc_hci_get_param(hdev, NFC_HCI_ADMIN_GATE,
+			NFC_HCI_ADMIN_HOST_LIST,
+			&sk_host_list);
+	if (r < 0)
+		return r;
+
+	host_id = sk_host_list->data[sk_host_list->len - 1];
+	kfree_skb(sk_host_list);
+
+	if (state == ST21NFCA_SE_MODE_ON && host_id == se_idx)
+		return se_idx;
+	else if (state == ST21NFCA_SE_MODE_OFF && host_id != se_idx)
+		return se_idx;
+
+	return -1;
+}
+
+int st21nfca_hci_discover_se(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+	int se_count = 0;
+
+	if (info->se_status->is_uicc_present) {
+		nfc_add_se(hdev->ndev, NFC_HCI_UICC_HOST_ID, NFC_SE_UICC);
+		se_count++;
+	}
+
+	if (info->se_status->is_ese_present) {
+		nfc_add_se(hdev->ndev, ST21NFCA_ESE_HOST_ID, NFC_SE_EMBEDDED);
+		se_count++;
+	}
+
+	return !se_count;
+}
+EXPORT_SYMBOL(st21nfca_hci_discover_se);
+
+int st21nfca_hci_enable_se(struct nfc_hci_dev *hdev, u32 se_idx)
+{
+	int r;
+
+	/*
+	 * According to upper layer, se_idx == NFC_SE_UICC when
+	 * info->se_status->is_uicc_enable is true should never happen.
+	 * Same for eSE.
+	 */
+	r = st21nfca_hci_control_se(hdev, se_idx, ST21NFCA_SE_MODE_ON);
+
+	if (r == ST21NFCA_ESE_HOST_ID) {
+		st21nfca_se_get_atr(hdev);
+		r = nfc_hci_send_event(hdev, ST21NFCA_APDU_READER_GATE,
+				ST21NFCA_EVT_SE_SOFT_RESET, NULL, 0);
+		if (r < 0)
+			return r;
+	} else if (r < 0) {
+		/*
+		 * The activation tentative failed, the secure element
+		 * is not connected. Remove from the list.
+		 */
+		nfc_remove_se(hdev->ndev, se_idx);
+		return r;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(st21nfca_hci_enable_se);
+
+int st21nfca_hci_disable_se(struct nfc_hci_dev *hdev, u32 se_idx)
+{
+	int r;
+
+	/*
+	 * According to upper layer, se_idx == NFC_SE_UICC when
+	 * info->se_status->is_uicc_enable is true should never happen
+	 * Same for eSE.
+	 */
+	r = st21nfca_hci_control_se(hdev, se_idx, ST21NFCA_SE_MODE_OFF);
+	if (r < 0)
+		return r;
+
+	return 0;
+}
+EXPORT_SYMBOL(st21nfca_hci_disable_se);
+
+int st21nfca_hci_se_io(struct nfc_hci_dev *hdev, u32 se_idx,
+			u8 *apdu, size_t apdu_length,
+			se_io_cb_t cb, void *cb_context)
+{
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	pr_debug("se_io %x\n", se_idx);
+
+	switch (se_idx) {
+	case ST21NFCA_ESE_HOST_ID:
+		info->se_info.cb = cb;
+		info->se_info.cb_context = cb_context;
+		mod_timer(&info->se_info.bwi_timer, jiffies +
+			  msecs_to_jiffies(info->se_info.wt_timeout));
+		info->se_info.bwi_active = true;
+		return nfc_hci_send_event(hdev, ST21NFCA_APDU_READER_GATE,
+					ST21NFCA_EVT_TRANSMIT_DATA,
+					apdu, apdu_length);
+	default:
+		return -ENODEV;
+	}
+}
+EXPORT_SYMBOL(st21nfca_hci_se_io);
+
+static void st21nfca_se_wt_timeout(unsigned long data)
+{
+	/*
+	 * No answer from the secure element
+	 * within the defined timeout.
+	 * Let's send a reset request as recovery procedure.
+	 * According to the situation, we first try to send a software reset
+	 * to the secure element. If the next command is still not
+	 * answering in time, we send to the CLF a secure element hardware
+	 * reset request.
+	 */
+	/* hardware reset managed through VCC_UICC_OUT power supply */
+	u8 param = 0x01;
+	struct st21nfca_hci_info *info = (struct st21nfca_hci_info *) data;
+
+	pr_debug("\n");
+
+	info->se_info.bwi_active = false;
+
+	if (!info->se_info.xch_error) {
+		info->se_info.xch_error = true;
+		nfc_hci_send_event(info->hdev, ST21NFCA_APDU_READER_GATE,
+				ST21NFCA_EVT_SE_SOFT_RESET, NULL, 0);
+	} else {
+		info->se_info.xch_error = false;
+		nfc_hci_send_event(info->hdev, ST21NFCA_DEVICE_MGNT_GATE,
+				ST21NFCA_EVT_SE_HARD_RESET, &param, 1);
+	}
+	info->se_info.cb(info->se_info.cb_context, NULL, 0, -ETIME);
+}
+
+static void st21nfca_se_activation_timeout(unsigned long data)
+{
+	struct st21nfca_hci_info *info = (struct st21nfca_hci_info *) data;
+
+	pr_debug("\n");
+
+	info->se_info.se_active = false;
+
+	complete(&info->se_info.req_completion);
+}
+
+/*
+ * Returns:
+ * <= 0: driver handled the event, skb consumed
+ *    1: driver does not handle the event, please do standard processing
+ */
+int st21nfca_connectivity_event_received(struct nfc_hci_dev *hdev, u8 host,
+				u8 event, struct sk_buff *skb)
+{
+	int r = 0;
+
+	pr_debug("connectivity gate event: %x\n", event);
+
+	switch (event) {
+	case ST21NFCA_EVT_CONNECTIVITY:
+		break;
+	case ST21NFCA_EVT_TRANSACTION:
+		break;
+	default:
+		return 1;
+	}
+	kfree_skb(skb);
+	return r;
+}
+EXPORT_SYMBOL(st21nfca_connectivity_event_received);
+
+int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
+					u8 event, struct sk_buff *skb)
+{
+	int r = 0;
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	pr_debug("apdu reader gate event: %x\n", event);
+
+	switch (event) {
+	case ST21NFCA_EVT_TRANSMIT_DATA:
+		del_timer_sync(&info->se_info.bwi_timer);
+		info->se_info.bwi_active = false;
+		r = nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+				ST21NFCA_EVT_SE_END_OF_APDU_TRANSFER, NULL, 0);
+		if (r < 0)
+			goto exit;
+
+		info->se_info.cb(info->se_info.cb_context,
+			skb->data, skb->len, 0);
+		break;
+	case ST21NFCA_EVT_WTX_REQUEST:
+		mod_timer(&info->se_info.bwi_timer, jiffies +
+				msecs_to_jiffies(info->se_info.wt_timeout));
+		break;
+	}
+
+exit:
+	kfree_skb(skb);
+	return r;
+}
+EXPORT_SYMBOL(st21nfca_apdu_reader_event_received);
+
+void st21nfca_se_init(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	init_completion(&info->se_info.req_completion);
+	/* initialize timers */
+	init_timer(&info->se_info.bwi_timer);
+	info->se_info.bwi_timer.data = (unsigned long)info;
+	info->se_info.bwi_timer.function = st21nfca_se_wt_timeout;
+	info->se_info.bwi_active = false;
+
+	init_timer(&info->se_info.se_active_timer);
+	info->se_info.se_active_timer.data = (unsigned long)info;
+	info->se_info.se_active_timer.function = st21nfca_se_activation_timeout;
+	info->se_info.se_active = false;
+
+	info->se_info.count_pipes = 0;
+	info->se_info.expected_pipes = 0;
+
+	info->se_info.xch_error = false;
+
+	info->se_info.wt_timeout =
+			ST21NFCA_BWI_TO_TIMEOUT(ST21NFCA_ATR_DEFAULT_BWI);
+}
+EXPORT_SYMBOL(st21nfca_se_init);
+
+void st21nfca_se_deinit(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
+
+	if (info->se_info.bwi_active)
+		del_timer_sync(&info->se_info.bwi_timer);
+	if (info->se_info.se_active)
+		del_timer_sync(&info->se_info.se_active_timer);
+
+	info->se_info.bwi_active = false;
+	info->se_info.se_active = false;
+}
+EXPORT_SYMBOL(st21nfca_se_deinit);
diff --git a/drivers/nfc/st21nfca/st21nfca_se.h b/drivers/nfc/st21nfca/st21nfca_se.h
new file mode 100644
index 0000000..b172cfc
--- /dev/null
+++ b/drivers/nfc/st21nfca/st21nfca_se.h
@@ -0,0 +1,63 @@
+/*
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
+#ifndef __ST21NFCA_SE_H
+#define __ST21NFCA_SE_H
+
+#include <linux/skbuff.h>
+#include <linux/workqueue.h>
+
+/*
+ * ref ISO7816-3 chap 8.1. the initial character TS is followed by a
+ * sequence of at most 32 characters.
+ */
+#define ST21NFCA_ESE_MAX_LENGTH			33
+#define ST21NFCA_ESE_HOST_ID			0xc0
+
+struct st21nfca_se_info {
+	u8 atr[ST21NFCA_ESE_MAX_LENGTH];
+	struct completion req_completion;
+
+	struct timer_list bwi_timer;
+	int wt_timeout; /* in msecs */
+	bool bwi_active;
+
+	struct timer_list se_active_timer;
+	bool se_active;
+	int expected_pipes;
+	int count_pipes;
+
+	bool xch_error;
+
+	se_io_cb_t cb;
+	void *cb_context;
+};
+
+int st21nfca_connectivity_event_received(struct nfc_hci_dev *hdev, u8 host,
+					u8 event, struct sk_buff *skb);
+int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
+					u8 event, struct sk_buff *skb);
+
+int st21nfca_hci_discover_se(struct nfc_hci_dev *hdev);
+int st21nfca_hci_enable_se(struct nfc_hci_dev *hdev, u32 se_idx);
+int st21nfca_hci_disable_se(struct nfc_hci_dev *hdev, u32 se_idx);
+int st21nfca_hci_se_io(struct nfc_hci_dev *hdev, u32 se_idx,
+		u8 *apdu, size_t apdu_length,
+		se_io_cb_t cb, void *cb_context);
+
+void st21nfca_se_init(struct nfc_hci_dev *hdev);
+void st21nfca_se_deinit(struct nfc_hci_dev *hdev);
+#endif /* __ST21NFCA_SE_H */
diff --git a/include/linux/platform_data/st21nfca.h b/include/linux/platform_data/st21nfca.h
index 5087fff..cc2bdaf 100644
--- a/include/linux/platform_data/st21nfca.h
+++ b/include/linux/platform_data/st21nfca.h
@@ -26,6 +26,8 @@
 struct st21nfca_nfc_platform_data {
 	unsigned int gpio_ena;
 	unsigned int irq_polarity;
+	bool is_ese_present;
+	bool is_uicc_present;
 };
 
 #endif /* _ST21NFCA_HCI_H_ */
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
