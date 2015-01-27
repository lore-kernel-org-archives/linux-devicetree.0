From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 09/14] NFC: st21nfcb: Adding support for secure element
Date: Tue, 27 Jan 2015 01:28:19 +0100
Message-ID: <1422318504-10039-10-git-send-email-christophe-h.ricard@st.com>
References: <1422318504-10039-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422318504-10039-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

st21nfcb has 3 SWP lines and can support up to 3 secure elements (UICC/=
eSE and =C2=B5SD in the future).

Some st21nfcb firmware does not support the nci command nci_nfcee_mode_=
set(NCI_NFCEE_DISABLE).
=46or this reason, we assume 2 secures elements are always present (UIC=
C and eSE).
They will be added to the SE list once successfully activated. They wil=
l
be available only after running through enable_se handler or when the p=
oll
in listen mode is started.

During initialization, the white_list will be always set assuming both
UICC & eSE are present.

On ese activation, the atr is retrieved to calculate a command exchange
timeout according to the first atr(TB) value.

The se_io will allow to transfer data over SWP. 2 kind of event may app=
ear
after a data is sent over:
- ST21NFCB_EVT_TRANSMIT_DATA when receiving an apdu answer
- ST21NFCB_EVT_WTX_REQUEST when the secure element needs more time than
expected to compute a command. If this timeout expired, a first recover=
y
tentative consist to send a simple software reset command. If this
tentative still fail, a second recovery tentative consist to send a
hardware reset.
This function is only relevant for eSE like secure element.

Like st21nfca, we do reference pipe with a tuple (gate, host) in order =
to
keep the host information when receiving secure element event
(ex: EVT_TRANSACTION).

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfcb/Makefile      |   2 +-
 drivers/nfc/st21nfcb/st21nfcb.c    |   8 +-
 drivers/nfc/st21nfcb/st21nfcb.h    |   2 +
 drivers/nfc/st21nfcb/st21nfcb_se.c | 610 +++++++++++++++++++++++++++++=
++++++++
 drivers/nfc/st21nfcb/st21nfcb_se.h |  59 ++++
 5 files changed, 679 insertions(+), 2 deletions(-)
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb_se.c
 create mode 100644 drivers/nfc/st21nfcb/st21nfcb_se.h

diff --git a/drivers/nfc/st21nfcb/Makefile b/drivers/nfc/st21nfcb/Makef=
ile
index 974c2e9..2f452d7 100644
--- a/drivers/nfc/st21nfcb/Makefile
+++ b/drivers/nfc/st21nfcb/Makefile
@@ -2,7 +2,7 @@
 # Makefile for ST21NFCB NCI based NFC driver
 #
=20
-st21nfcb_nci-objs =3D ndlc.o st21nfcb.o st21nfcb_hci_core.o
+st21nfcb_nci-objs =3D ndlc.o st21nfcb.o st21nfcb_hci_core.o st21nfcb_s=
e.o
 obj-$(CONFIG_NFC_ST21NFCB)     +=3D st21nfcb_nci.o
=20
 st21nfcb_i2c-objs =3D i2c.o
diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st2=
1nfcb.c
index ea63d58..d2b60eb 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.c
+++ b/drivers/nfc/st21nfcb/st21nfcb.c
@@ -22,6 +22,7 @@
 #include <net/nfc/nci_core.h>
=20
 #include "st21nfcb.h"
+#include "st21nfcb_se.h"
=20
 #define DRIVER_DESC "NCI NFC driver for ST21NFCB"
=20
@@ -78,6 +79,10 @@ static struct nci_ops st21nfcb_nci_ops =3D {
 	.close =3D st21nfcb_nci_close,
 	.send =3D st21nfcb_nci_send,
 	.get_rfprotocol =3D st21nfcb_nci_get_rfprotocol,
+	.discover_se =3D st21nfcb_nci_discover_se,
+	.enable_se =3D st21nfcb_nci_enable_se,
+	.disable_se =3D st21nfcb_nci_disable_se,
+	.se_io =3D st21nfcb_nci_se_io,
 };
=20
 int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
@@ -114,9 +119,10 @@ int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int =
phy_headroom,
 	if (r) {
 		pr_err("Cannot register nfc device to nci core\n");
 		nci_free_device(ndlc->ndev);
+		return r;
 	}
=20
-	return r;
+	return st21nfcb_se_init(ndlc->ndev);
 }
 EXPORT_SYMBOL_GPL(st21nfcb_nci_probe);
=20
diff --git a/drivers/nfc/st21nfcb/st21nfcb.h b/drivers/nfc/st21nfcb/st2=
1nfcb.h
index ea58a56..5ef8a58 100644
--- a/drivers/nfc/st21nfcb/st21nfcb.h
+++ b/drivers/nfc/st21nfcb/st21nfcb.h
@@ -19,6 +19,7 @@
 #ifndef __LOCAL_ST21NFCB_H_
 #define __LOCAL_ST21NFCB_H_
=20
+#include "st21nfcb_se.h"
 #include "ndlc.h"
=20
 /* Define private flags: */
@@ -27,6 +28,7 @@
 struct st21nfcb_nci_info {
 	struct llt_ndlc *ndlc;
 	unsigned long flags;
+	struct st21nfcb_se_info se_info;
 };
=20
 void st21nfcb_nci_remove(struct nci_dev *ndev);
diff --git a/drivers/nfc/st21nfcb/st21nfcb_se.c b/drivers/nfc/st21nfcb/=
st21nfcb_se.c
new file mode 100644
index 0000000..cf65368
--- /dev/null
+++ b/drivers/nfc/st21nfcb/st21nfcb_se.c
@@ -0,0 +1,610 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+
+#include <linux/module.h>
+#include <linux/nfc.h>
+#include <net/nfc/nci.h>
+#include <net/nfc/nci_core.h>
+
+#include "st21nfcb.h"
+#include "st21nfcb_se.h"
+#include "st21nfcb_hci_core.h"
+
+struct st21nfcb_pipe_info {
+	u8 pipe_state;
+	u8 src_host_id;
+	u8 src_gate_id;
+	u8 dst_host_id;
+	u8 dst_gate_id;
+} __packed;
+
+/* Connectivity pipe only */
+#define ST21NFCB_SE_COUNT_PIPE_UICC             0x01
+/* Connectivity + APDU Reader pipe */
+#define ST21NFCB_SE_COUNT_PIPE_EMBEDDED         0x02
+
+#define ST21NFCB_SE_TO_HOT_PLUG			1000 /* msecs */
+#define ST21NFCB_SE_TO_PIPES			2000
+
+#define ST21NFCB_EVT_HOT_PLUG_IS_INHIBITED(x)   (x->data[0] & 0x80)
+
+#define ST21NFCB_HCI_APDU_PARAM_ATR                     0x01
+#define ST21NFCB_HCI_ADMIN_PARAM_SESSION_IDENTITY       0x01
+#define ST21NFCB_HCI_ADMIN_PARAM_WHITELIST              0x03
+#define ST21NFCB_HCI_ADMIN_PARAM_HOST_LIST              0x04
+
+#define ST21NFCB_EVT_SE_HARD_RESET		0x20
+#define ST21NFCB_EVT_TRANSMIT_DATA		0x10
+#define ST21NFCB_EVT_WTX_REQUEST		0x11
+#define ST21NFCB_EVT_SE_SOFT_RESET		0x11
+#define ST21NFCB_EVT_SE_END_OF_APDU_TRANSFER	0x21
+#define ST21NFCB_EVT_HOT_PLUG			0x03
+
+#define ST21NFCB_SE_MODE_OFF                    0x00
+#define ST21NFCB_SE_MODE_ON                     0x01
+
+#define ST21NFCB_EVT_CONNECTIVITY       0x10
+#define ST21NFCB_EVT_TRANSACTION        0x12
+
+#define ST21NFCB_DM_GETINFO             0x13
+#define ST21NFCB_DM_GETINFO_PIPE_LIST   0x02
+#define ST21NFCB_DM_GETINFO_PIPE_INFO   0x01
+#define ST21NFCB_DM_PIPE_CREATED        0x02
+#define ST21NFCB_DM_PIPE_OPEN           0x04
+#define ST21NFCB_DM_RF_ACTIVE           0x80
+#define ST21NFCB_DM_DISCONNECT          0x30
+
+#define ST21NFCB_DM_IS_PIPE_OPEN(p) \
+	((p & 0x0f) =3D=3D (ST21NFCB_DM_PIPE_CREATED | ST21NFCB_DM_PIPE_OPEN)=
)
+
+#define ST21NFCB_ATR_DEFAULT_BWI        0x04
+
+/*
+ * WT =3D 2^BWI/10[s], convert into msecs and add a secure
+ * room by increasing by 2 this timeout
+ */
+#define ST21NFCB_BWI_TO_TIMEOUT(x)      ((1 << x) * 200)
+#define ST21NFCB_ATR_GET_Y_FROM_TD(x)   (x >> 4)
+
+/* If TA is present bit 0 is set */
+#define ST21NFCB_ATR_TA_PRESENT(x) (x & 0x01)
+/* If TB is present bit 1 is set */
+#define ST21NFCB_ATR_TB_PRESENT(x) (x & 0x02)
+
+/* Here are the mandatory pipe for st21nfcb */
+static struct st21nfcb_hci_gate st21nfcb_gates[] =3D {
+	{ST21NFCB_HCI_ADMIN_GATE, ST21NFCB_HCI_ADMIN_PIPE},
+	{ST21NFCB_HCI_LINK_MGMT_GATE, ST21NFCB_HCI_LINK_MGMT_PIPE},
+	{ST21NFCB_DEVICE_MGNT_GATE, ST21NFCB_DEVICE_MGNT_PIPE},
+
+	/* Secure element pipes are created by secure element host */
+	{ST21NFCB_CONNECTIVITY_GATE, ST21NFCB_HCI_DO_NOT_OPEN_PIPE},
+	{ST21NFCB_APDU_READER_GATE, ST21NFCB_HCI_DO_NOT_OPEN_PIPE},
+};
+
+static u8 st21nfcb_se_get_bwi(struct nci_dev *ndev)
+{
+	int i;
+	u8 td;
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
+
+	/* Bits 8 to 5 of the first TB for T=3D1 encode BWI from zero to nine=
 */
+	for (i =3D 1; i < ST21NFCB_ESE_MAX_LENGTH; i++) {
+		td =3D ST21NFCB_ATR_GET_Y_FROM_TD(info->se_info.atr[i]);
+		if (ST21NFCB_ATR_TA_PRESENT(td))
+			i++;
+		if (ST21NFCB_ATR_TB_PRESENT(td)) {
+			i++;
+			return info->se_info.atr[i] >> 4;
+		}
+	}
+	return ST21NFCB_ATR_DEFAULT_BWI;
+}
+
+static void st21nfcb_se_get_atr(struct nci_dev *ndev)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
+	struct st21nfcb_hci_dev  *hdev =3D info->se_info.hci_dev;
+	int r;
+	struct sk_buff *skb;
+
+	r =3D st21nfcb_hci_get_param(hdev, ST21NFCB_APDU_READER_GATE,
+				ST21NFCB_HCI_APDU_PARAM_ATR, &skb);
+	if (r < 0)
+		return;
+
+	if (skb->len <=3D ST21NFCB_ESE_MAX_LENGTH) {
+		memcpy(info->se_info.atr, skb->data, skb->len);
+
+		info->se_info.wt_timeout =3D
+			ST21NFCB_BWI_TO_TIMEOUT(st21nfcb_se_get_bwi(ndev));
+	}
+	kfree_skb(skb);
+}
+
+static int st21nfcb_hci_load_session(struct st21nfcb_hci_dev *hdev)
+{
+	int i, j, r;
+	struct sk_buff *skb_pipe_list, *skb_pipe_info;
+	struct st21nfcb_pipe_info *dm_pipe_info;
+	u8 pipe_list[] =3D { ST21NFCB_DM_GETINFO_PIPE_LIST,
+			ST21NFCB_TERMINAL_HOST_ID};
+	u8 pipe_info[] =3D { ST21NFCB_DM_GETINFO_PIPE_INFO,
+			ST21NFCB_TERMINAL_HOST_ID, 0};
+
+	/* On ST21NFCB device pipes number are dynamics
+	 * If pipes are already created, hci_dev_up will fail.
+	 * Doing a clear all pipe is a bad idea because:
+	 * - It does useless EEPROM cycling
+	 * - It might cause issue for secure elements support
+	 * (such as removing connectivity or APDU reader pipe)
+	 * A better approach on ST21NFCB is to:
+	 * - get a pipe list for each host.
+	 * (eg: ST21NFCB_HOST_CONTROLLER_ID for now).
+	 * (TODO Later on UICC HOST and eSE HOST)
+	 * - get pipe information
+	 * - match retrieved pipe list in st21nfcb_gates
+	 * ST21NFCB_DEVICE_MGNT_GATE is a proprietary gate
+	 * with ST21NFCB_DEVICE_MGNT_PIPE.
+	 * Pipe can be closed and need to be open.
+	 */
+	r =3D st21nfcb_hci_connect_gate(hdev, ST21NFCB_HOST_CONTROLLER_ID,
+				ST21NFCB_DEVICE_MGNT_GATE,
+				ST21NFCB_DEVICE_MGNT_PIPE);
+	if (r < 0)
+		goto free_info;
+
+	/* Get pipe list */
+	r =3D st21nfcb_hci_send_cmd(hdev, ST21NFCB_DEVICE_MGNT_GATE,
+			ST21NFCB_DM_GETINFO, pipe_list, sizeof(pipe_list),
+			&skb_pipe_list);
+	if (r < 0)
+		goto free_info;
+
+	/* Complete the existing gate_pipe table */
+	for (i =3D 0; i < skb_pipe_list->len; i++) {
+		pipe_info[2] =3D skb_pipe_list->data[i];
+		r =3D st21nfcb_hci_send_cmd(hdev, ST21NFCB_DEVICE_MGNT_GATE,
+					ST21NFCB_DM_GETINFO, pipe_info,
+					sizeof(pipe_info), &skb_pipe_info);
+
+		if (r)
+			continue;
+
+		/*
+		 * Match pipe ID and gate ID
+		 * Output format from ST21NFC_DM_GETINFO is:
+		 * - pipe state (1byte)
+		 * - source hid (1byte)
+		 * - source gid (1byte)
+		 * - destination hid (1byte)
+		 * - destination gid (1byte)
+		 */
+		dm_pipe_info =3D (struct st21nfcb_pipe_info *)skb_pipe_info->data;
+		if (dm_pipe_info->dst_gate_id =3D=3D ST21NFCB_APDU_READER_GATE &&
+		    dm_pipe_info->src_host_id !=3D ST21NFCB_ESE_HOST_ID) {
+			pr_err("Unexpected apdu_reader pipe on host %x\n",
+			       dm_pipe_info->src_host_id);
+			continue;
+		}
+
+		for (j =3D 0; (j < ARRAY_SIZE(st21nfcb_gates)) &&
+		     (st21nfcb_gates[j].gate !=3D dm_pipe_info->dst_gate_id); j++)
+			;
+
+		if (j < ARRAY_SIZE(st21nfcb_gates) &&
+		    st21nfcb_gates[j].gate =3D=3D dm_pipe_info->dst_gate_id &&
+		    ST21NFCB_DM_IS_PIPE_OPEN(dm_pipe_info->pipe_state)) {
+			st21nfcb_gates[j].pipe =3D pipe_info[2];
+
+			hdev->gate2pipe[st21nfcb_gates[j].gate] =3D
+						st21nfcb_gates[j].pipe;
+			hdev->pipes[st21nfcb_gates[j].pipe].gate =3D
+						st21nfcb_gates[j].gate;
+			hdev->pipes[st21nfcb_gates[j].pipe].host =3D
+						dm_pipe_info->src_host_id;
+		}
+	}
+
+	memcpy(hdev->init_data.gates, st21nfcb_gates, sizeof(st21nfcb_gates))=
;
+
+free_info:
+	kfree_skb(skb_pipe_info);
+	kfree_skb(skb_pipe_list);
+	return r;
+}
+
+static void st21nfcb_hci_admin_event_received(struct st21nfcb_hci_dev =
*hdev,
+					      u8 event, struct sk_buff *skb)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(hdev->ndev);
+
+	switch (event) {
+	case ST21NFCB_EVT_HOT_PLUG:
+		if (info->se_info.se_active) {
+			if (!ST21NFCB_EVT_HOT_PLUG_IS_INHIBITED(skb)) {
+				del_timer_sync(&info->se_info.se_active_timer);
+				info->se_info.se_active =3D false;
+				complete(&info->se_info.req_completion);
+			} else {
+				mod_timer(&info->se_info.se_active_timer,
+				      jiffies +
+				      msecs_to_jiffies(ST21NFCB_SE_TO_PIPES));
+			}
+		}
+	break;
+	}
+}
+
+static int st21nfcb_hci_apdu_reader_event_received(struct st21nfcb_hci=
_dev *hdev,
+						   u8 event,
+						   struct sk_buff *skb)
+{
+	int r =3D 0;
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(hdev->ndev);
+
+	pr_debug("apdu reader gate event: %x\n", event);
+
+	switch (event) {
+	case ST21NFCB_EVT_TRANSMIT_DATA:
+		del_timer_sync(&info->se_info.bwi_timer);
+		info->se_info.bwi_active =3D false;
+		info->se_info.cb(info->se_info.cb_context,
+				 skb->data, skb->len, 0);
+	break;
+	case ST21NFCB_EVT_WTX_REQUEST:
+		mod_timer(&info->se_info.bwi_timer, jiffies +
+			  msecs_to_jiffies(info->se_info.wt_timeout));
+	break;
+	}
+
+	kfree_skb(skb);
+	return r;
+}
+
+/*
+ * Returns:
+ * <=3D 0: driver handled the event, skb consumed
+ *    1: driver does not handle the event, please do standard processi=
ng
+ */
+static int st21nfcb_hci_connectivity_event_received(struct st21nfcb_hc=
i_dev *hdev,
+						    u8 host, u8 event,
+						    struct sk_buff *skb)
+{
+	int r =3D 0;
+
+	pr_debug("connectivity gate event: %x\n", event);
+
+	switch (event) {
+	case ST21NFCB_EVT_CONNECTIVITY:
+	break;
+	case ST21NFCB_EVT_TRANSACTION:
+	break;
+	default:
+		return 1;
+	}
+	kfree_skb(skb);
+	return r;
+}
+
+static void st21nfcb_hci_event_received(struct st21nfcb_hci_dev *hdev,=
 u8 pipe,
+					u8 event, struct sk_buff *skb)
+{
+	u8 gate =3D hdev->pipes[pipe].gate;
+	u8 host =3D hdev->pipes[pipe].host;
+
+	switch (gate) {
+	case ST21NFCB_HCI_ADMIN_GATE:
+		st21nfcb_hci_admin_event_received(hdev, event, skb);
+	break;
+	case ST21NFCB_APDU_READER_GATE:
+		st21nfcb_hci_apdu_reader_event_received(hdev, event, skb);
+	break;
+	case ST21NFCB_CONNECTIVITY_GATE:
+		st21nfcb_hci_connectivity_event_received(hdev, host, event,
+							 skb);
+	break;
+	}
+}
+
+static void st21nfcb_hci_cmd_received(struct st21nfcb_hci_dev *hdev, u=
8 pipe, u8 cmd,
+				      struct sk_buff *skb)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(hdev->ndev);
+	u8 gate =3D hdev->pipes[pipe].gate;
+
+	pr_debug("cmd: %x\n", cmd);
+
+	switch (cmd) {
+	case ST21NFCB_HCI_ANY_OPEN_PIPE:
+		if (gate !=3D ST21NFCB_APDU_READER_GATE &&
+		    hdev->pipes[pipe].host !=3D ST21NFCB_UICC_HOST_ID)
+			hdev->count_pipes++;
+
+		if (hdev->count_pipes =3D=3D hdev->expected_pipes) {
+			del_timer_sync(&info->se_info.se_active_timer);
+			info->se_info.se_active =3D false;
+			hdev->count_pipes =3D 0;
+			complete(&info->se_info.req_completion);
+		}
+	break;
+	}
+}
+
+/*
+ * Remarks: On some early st21nfcb firmware, nci_nfcee_mode_set(0)
+ * is rejected
+ */
+static int st21nfcb_nci_control_se(struct nci_dev *ndev, u8 se_idx,
+				   u8 state)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
+	struct st21nfcb_hci_dev  *hdev =3D info->se_info.hci_dev;
+	int r;
+	struct sk_buff *sk_host_list;
+	u8 host_id;
+
+	switch (se_idx) {
+	case ST21NFCB_UICC_HOST_ID:
+		hdev->count_pipes =3D 0;
+		hdev->expected_pipes =3D ST21NFCB_SE_COUNT_PIPE_UICC;
+		break;
+	case ST21NFCB_ESE_HOST_ID:
+		hdev->count_pipes =3D 0;
+		hdev->expected_pipes =3D ST21NFCB_SE_COUNT_PIPE_EMBEDDED;
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
+	r =3D nci_nfcee_mode_set(ndev, se_idx, NCI_NFCEE_ENABLE);
+	if (r !=3D NCI_STATUS_OK)
+		return r;
+
+	mod_timer(&info->se_info.se_active_timer, jiffies +
+		msecs_to_jiffies(ST21NFCB_SE_TO_HOT_PLUG));
+	info->se_info.se_active =3D true;
+
+	/* Ignore return value and check in any case the host_list */
+	wait_for_completion_interruptible(&info->se_info.req_completion);
+
+	r =3D st21nfcb_hci_get_param(hdev, ST21NFCB_HCI_ADMIN_GATE,
+			ST21NFCB_HCI_ADMIN_PARAM_HOST_LIST, &sk_host_list);
+	if (r !=3D ST21NFCB_HCI_ANY_OK)
+		return r;
+
+	host_id =3D sk_host_list->data[sk_host_list->len - 1];
+	kfree_skb(sk_host_list);
+	if (state =3D=3D ST21NFCB_SE_MODE_ON && host_id =3D=3D se_idx)
+		return se_idx;
+	else if (state =3D=3D ST21NFCB_SE_MODE_OFF && host_id !=3D se_idx)
+		return se_idx;
+
+	return -1;
+}
+
+int st21nfcb_nci_disable_se(struct nci_dev *ndev, u32 se_idx)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
+	struct st21nfcb_hci_dev  *hdev =3D info->se_info.hci_dev;
+	int r;
+
+	pr_debug("st21nfcb_nci_disable_se\n");
+
+	if (se_idx =3D=3D NFC_SE_EMBEDDED) {
+		r =3D st21nfcb_hci_send_event(hdev, ST21NFCB_APDU_READER_GATE,
+				ST21NFCB_EVT_SE_END_OF_APDU_TRANSFER, NULL, 0);
+		if (r < 0)
+			return r;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(st21nfcb_nci_disable_se);
+
+int st21nfcb_nci_enable_se(struct nci_dev *ndev, u32 se_idx)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
+	struct st21nfcb_hci_dev  *hdev =3D info->se_info.hci_dev;
+	int r;
+
+	pr_debug("st21nfcb_nci_enable_se\n");
+
+	if (se_idx =3D=3D ST21NFCB_HCI_HOST_ID_ESE) {
+		r =3D st21nfcb_hci_send_event(hdev, ST21NFCB_APDU_READER_GATE,
+				ST21NFCB_EVT_SE_SOFT_RESET, NULL, 0);
+		if (r < 0)
+			return r;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(st21nfcb_nci_enable_se);
+
+static struct st21nfcb_hci_ops hci_ops =3D {
+	.load_session =3D st21nfcb_hci_load_session,
+	.event_received =3D st21nfcb_hci_event_received,
+	.cmd_received =3D st21nfcb_hci_cmd_received,
+};
+
+int st21nfcb_nci_discover_se(struct nci_dev *ndev)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
+	struct st21nfcb_hci_dev  *hdev;
+	u8 param[2];
+	int r;
+	int se_count =3D 0;
+
+	pr_debug("st21nfcb_nci_discover_se\n");
+
+	hdev =3D st21nfcb_hci_allocate(ndev, &hci_ops, "ST21BH",
+				     st21nfcb_gates, sizeof(st21nfcb_gates));
+	if (!hdev)
+		return -ENOMEM;
+
+	info->se_info.hci_dev =3D hdev;
+
+	r =3D st21nfcb_hci_open_pipe(hdev, ST21NFCB_HCI_ADMIN_PIPE);
+	if (r !=3D ST21NFCB_HCI_ANY_OK)
+		return r;
+
+	param[0] =3D ST21NFCB_UICC_HOST_ID;
+	param[1] =3D ST21NFCB_HCI_HOST_ID_ESE;
+	r =3D st21nfcb_hci_set_param(hdev, ST21NFCB_HCI_ADMIN_GATE,
+				ST21NFCB_HCI_ADMIN_PARAM_WHITELIST,
+				param, sizeof(param));
+	if (r !=3D ST21NFCB_HCI_ANY_OK)
+		return r;
+
+	r =3D st21nfcb_nci_control_se(ndev, ST21NFCB_UICC_HOST_ID,
+				ST21NFCB_SE_MODE_ON);
+	if (r =3D=3D ST21NFCB_UICC_HOST_ID) {
+		nfc_add_se(ndev->nfc_dev, ST21NFCB_UICC_HOST_ID, NFC_SE_UICC);
+		se_count++;
+	}
+
+	/* Try to enable eSE in order to check availability */
+	r =3D st21nfcb_nci_control_se(ndev, ST21NFCB_HCI_HOST_ID_ESE,
+				ST21NFCB_SE_MODE_ON);
+	if (r =3D=3D ST21NFCB_HCI_HOST_ID_ESE) {
+		nfc_add_se(ndev->nfc_dev, ST21NFCB_HCI_HOST_ID_ESE,
+			   NFC_SE_EMBEDDED);
+		se_count++;
+		st21nfcb_se_get_atr(ndev);
+	}
+
+	return !se_count;
+}
+EXPORT_SYMBOL_GPL(st21nfcb_nci_discover_se);
+
+int st21nfcb_nci_se_io(struct nci_dev *ndev, u32 se_idx,
+		       u8 *apdu, size_t apdu_length,
+		       se_io_cb_t cb, void *cb_context)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
+	struct st21nfcb_hci_dev  *hdev =3D info->se_info.hci_dev;
+
+	pr_debug("\n");
+
+	switch (se_idx) {
+	case ST21NFCB_HCI_HOST_ID_ESE:
+		info->se_info.cb =3D cb;
+		info->se_info.cb_context =3D cb_context;
+		mod_timer(&info->se_info.bwi_timer, jiffies +
+			  msecs_to_jiffies(info->se_info.wt_timeout));
+		info->se_info.bwi_active =3D true;
+		return st21nfcb_hci_send_event(hdev, ST21NFCB_APDU_READER_GATE,
+					ST21NFCB_EVT_TRANSMIT_DATA, apdu,
+					apdu_length);
+	default:
+		return -ENODEV;
+	}
+}
+EXPORT_SYMBOL(st21nfcb_nci_se_io);
+
+static void st21nfcb_se_wt_timeout(unsigned long data)
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
+	u8 param =3D 0x01;
+	struct st21nfcb_nci_info *info =3D (struct st21nfcb_nci_info *) data;
+	struct st21nfcb_hci_dev  *hdev =3D info->se_info.hci_dev;
+
+	pr_debug("\n");
+
+	info->se_info.bwi_active =3D false;
+
+	if (!info->se_info.xch_error) {
+		info->se_info.xch_error =3D true;
+		st21nfcb_hci_send_event(hdev, ST21NFCB_APDU_READER_GATE,
+				ST21NFCB_EVT_SE_SOFT_RESET, NULL, 0);
+	} else {
+		info->se_info.xch_error =3D false;
+		st21nfcb_hci_send_event(hdev, ST21NFCB_DEVICE_MGNT_GATE,
+				ST21NFCB_EVT_SE_HARD_RESET, &param, 1);
+	}
+	info->se_info.cb(info->se_info.cb_context, NULL, 0, -ETIME);
+}
+
+static void st21nfcb_se_activation_timeout(unsigned long data)
+{
+	struct st21nfcb_nci_info *info =3D (struct st21nfcb_nci_info *) data;
+
+	pr_debug("\n");
+
+	info->se_info.se_active =3D false;
+
+	complete(&info->se_info.req_completion);
+}
+
+int st21nfcb_se_init(struct nci_dev *ndev)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
+
+	init_completion(&info->se_info.req_completion);
+	/* initialize timers */
+	init_timer(&info->se_info.bwi_timer);
+	info->se_info.bwi_timer.data =3D (unsigned long)info;
+	info->se_info.bwi_timer.function =3D st21nfcb_se_wt_timeout;
+	info->se_info.bwi_active =3D false;
+
+	init_timer(&info->se_info.se_active_timer);
+	info->se_info.se_active_timer.data =3D (unsigned long)info;
+	info->se_info.se_active_timer.function =3D
+			st21nfcb_se_activation_timeout;
+	info->se_info.se_active =3D false;
+
+	info->se_info.xch_error =3D false;
+
+	info->se_info.wt_timeout =3D
+		ST21NFCB_BWI_TO_TIMEOUT(ST21NFCB_ATR_DEFAULT_BWI);
+
+	return 0;
+}
+EXPORT_SYMBOL(st21nfcb_se_init);
+
+void st21nfcb_se_deinit(struct nci_dev *ndev)
+{
+	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
+
+	if (info->se_info.bwi_active)
+		del_timer_sync(&info->se_info.bwi_timer);
+	if (info->se_info.se_active)
+		del_timer_sync(&info->se_info.se_active_timer);
+
+	info->se_info.se_active =3D false;
+	info->se_info.bwi_active =3D false;
+	st21nfcb_hci_free(info->se_info.hci_dev);
+}
+EXPORT_SYMBOL(st21nfcb_se_deinit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st21nfcb/st21nfcb_se.h b/drivers/nfc/st21nfcb/=
st21nfcb_se.h
new file mode 100644
index 0000000..979c7dd
--- /dev/null
+++ b/drivers/nfc/st21nfcb/st21nfcb_se.h
@@ -0,0 +1,59 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+#ifndef __LOCAL_ST21NFCB_SE_H_
+#define __LOCAL_ST21NFCB_SE_H_
+
+#include "st21nfcb_hci_core.h"
+
+/*
+ * ref ISO7816-3 chap 8.1. the initial character TS is followed by a
+ * sequence of at most 32 characters.
+ */
+#define ST21NFCB_ESE_MAX_LENGTH		33
+#define ST21NFCB_HCI_HOST_ID_ESE	0xc0
+
+struct st21nfcb_se_info {
+	u8 atr[ST21NFCB_ESE_MAX_LENGTH];
+	struct completion req_completion;
+
+	struct timer_list bwi_timer;
+	int wt_timeout; /* in msecs */
+	bool bwi_active;
+
+	struct timer_list se_active_timer;
+	bool se_active;
+
+	struct st21nfcb_hci_dev *hci_dev;
+
+	bool xch_error;
+
+	se_io_cb_t cb;
+	void *cb_context;
+};
+
+int st21nfcb_se_init(struct nci_dev *ndev);
+void st21nfcb_se_deinit(struct nci_dev *ndev);
+
+int st21nfcb_nci_discover_se(struct nci_dev *ndev);
+int st21nfcb_nci_enable_se(struct nci_dev *ndev, u32 se_idx);
+int st21nfcb_nci_disable_se(struct nci_dev *ndev, u32 se_idx);
+int st21nfcb_nci_se_io(struct nci_dev *ndev, u32 se_idx,
+					u8 *apdu, size_t apdu_length,
+					se_io_cb_t cb, void *cb_context);
+
+#endif /* __LOCAL_ST21NFCB_NCI_H_ */
--=20
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
