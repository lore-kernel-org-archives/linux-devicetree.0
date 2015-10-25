From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 03/35] nfc: st21nfca: Align st21nfca driver with other nfc driver
Date: Sun, 25 Oct 2015 22:54:18 +0100
Message-ID: <1445810090-18403-4-git-send-email-christophe-h.ricard@st.com>
References: <1445810090-18403-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445810090-18403-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Align st21nfca driver with or nfc driver:
- Remove st21nfca_ prefix
- Merge st21nfca_se.h, st21nfca_dep.h in st21nfca.h

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/nfc/st21nfca/Makefile       |    2 +-
 drivers/nfc/st21nfca/core.c         | 1062 +++++++++++++++++++++++++++=
+++++++
 drivers/nfc/st21nfca/dep.c          |  688 ++++++++++++++++++++++
 drivers/nfc/st21nfca/se.c           |  419 ++++++++++++++
 drivers/nfc/st21nfca/st21nfca.c     | 1064 ---------------------------=
--------
 drivers/nfc/st21nfca/st21nfca.h     |   98 +++-
 drivers/nfc/st21nfca/st21nfca_dep.c |  689 -----------------------
 drivers/nfc/st21nfca/st21nfca_dep.h |   43 --
 drivers/nfc/st21nfca/st21nfca_se.c  |  420 --------------
 drivers/nfc/st21nfca/st21nfca_se.h  |   63 ---
 10 files changed, 2249 insertions(+), 2299 deletions(-)
 create mode 100644 drivers/nfc/st21nfca/core.c
 create mode 100644 drivers/nfc/st21nfca/dep.c
 create mode 100644 drivers/nfc/st21nfca/se.c
 delete mode 100644 drivers/nfc/st21nfca/st21nfca.c
 delete mode 100644 drivers/nfc/st21nfca/st21nfca_dep.c
 delete mode 100644 drivers/nfc/st21nfca/st21nfca_dep.h
 delete mode 100644 drivers/nfc/st21nfca/st21nfca_se.c
 delete mode 100644 drivers/nfc/st21nfca/st21nfca_se.h

diff --git a/drivers/nfc/st21nfca/Makefile b/drivers/nfc/st21nfca/Makef=
ile
index 97edab4..82434c3 100644
--- a/drivers/nfc/st21nfca/Makefile
+++ b/drivers/nfc/st21nfca/Makefile
@@ -2,7 +2,7 @@
 # Makefile for ST21NFCA HCI based NFC driver
 #
=20
-st21nfca_hci-objs =3D st21nfca.o st21nfca_dep.o st21nfca_se.o
+st21nfca_hci-objs =3D core.o dep.o se.o
 obj-$(CONFIG_NFC_ST21NFCA)     +=3D st21nfca_hci.o
=20
 st21nfca_i2c-objs  =3D i2c.o
diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
new file mode 100644
index 0000000..42f1974
--- /dev/null
+++ b/drivers/nfc/st21nfca/core.c
@@ -0,0 +1,1062 @@
+/*
+ * HCI based Driver for STMicroelectronics NFC Chip
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
+#include <net/nfc/hci.h>
+#include <net/nfc/llc.h>
+
+#include "st21nfca.h"
+
+#define DRIVER_DESC "HCI NFC driver for ST21NFCA"
+
+#define FULL_VERSION_LEN 3
+
+/* Proprietary gates, events, commands and registers */
+
+/* Commands that apply to all RF readers */
+#define ST21NFCA_RF_READER_CMD_PRESENCE_CHECK	0x30
+
+#define ST21NFCA_RF_READER_ISO15693_GATE	0x12
+#define ST21NFCA_RF_READER_ISO15693_INVENTORY	0x01
+
+/*
+ * Reader gate for communication with contact-less cards using Type A
+ * protocol ISO14443-3 but not compliant with ISO14443-4
+ */
+#define ST21NFCA_RF_READER_14443_3_A_GATE	0x15
+#define ST21NFCA_RF_READER_14443_3_A_UID	0x02
+#define ST21NFCA_RF_READER_14443_3_A_ATQA	0x03
+#define ST21NFCA_RF_READER_14443_3_A_SAK	0x04
+
+#define ST21NFCA_RF_READER_F_DATARATE		0x01
+#define ST21NFCA_RF_READER_F_DATARATE_106	0x01
+#define ST21NFCA_RF_READER_F_DATARATE_212	0x02
+#define ST21NFCA_RF_READER_F_DATARATE_424	0x04
+#define ST21NFCA_RF_READER_F_POL_REQ		0x02
+#define ST21NFCA_RF_READER_F_POL_REQ_DEFAULT	0xffff0000
+#define ST21NFCA_RF_READER_F_NFCID2		0x03
+#define ST21NFCA_RF_READER_F_NFCID1		0x04
+
+#define ST21NFCA_RF_CARD_F_MODE			0x01
+#define ST21NFCA_RF_CARD_F_NFCID2_LIST		0x04
+#define ST21NFCA_RF_CARD_F_NFCID1		0x05
+#define ST21NFCA_RF_CARD_F_SENS_RES		0x06
+#define ST21NFCA_RF_CARD_F_SEL_RES		0x07
+#define ST21NFCA_RF_CARD_F_DATARATE		0x08
+#define ST21NFCA_RF_CARD_F_DATARATE_212_424	0x01
+
+#define ST21NFCA_DEVICE_MGNT_PIPE		0x02
+
+#define ST21NFCA_DM_GETINFO			0x13
+#define ST21NFCA_DM_GETINFO_PIPE_LIST		0x02
+#define ST21NFCA_DM_GETINFO_PIPE_INFO		0x01
+#define ST21NFCA_DM_PIPE_CREATED		0x02
+#define ST21NFCA_DM_PIPE_OPEN			0x04
+#define ST21NFCA_DM_RF_ACTIVE			0x80
+#define ST21NFCA_DM_DISCONNECT			0x30
+
+#define ST21NFCA_DM_IS_PIPE_OPEN(p) \
+	((p & 0x0f) =3D=3D (ST21NFCA_DM_PIPE_CREATED | ST21NFCA_DM_PIPE_OPEN)=
)
+
+#define ST21NFCA_NFC_MODE			0x03	/* NFC_MODE parameter*/
+
+#define ST21NFCA_EVT_HOT_PLUG			0x03
+#define ST21NFCA_EVT_HOT_PLUG_IS_INHIBITED(x) (x->data[0] & 0x80)
+
+#define ST21NFCA_SE_TO_PIPES			2000
+
+static DECLARE_BITMAP(dev_mask, ST21NFCA_NUM_DEVICES);
+
+static struct nfc_hci_gate st21nfca_gates[] =3D {
+	{NFC_HCI_ADMIN_GATE, NFC_HCI_ADMIN_PIPE},
+	{NFC_HCI_LOOPBACK_GATE, NFC_HCI_INVALID_PIPE},
+	{NFC_HCI_ID_MGMT_GATE, NFC_HCI_INVALID_PIPE},
+	{NFC_HCI_LINK_MGMT_GATE, NFC_HCI_LINK_MGMT_PIPE},
+	{NFC_HCI_RF_READER_B_GATE, NFC_HCI_INVALID_PIPE},
+	{NFC_HCI_RF_READER_A_GATE, NFC_HCI_INVALID_PIPE},
+	{ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_DEVICE_MGNT_PIPE},
+	{ST21NFCA_RF_READER_F_GATE, NFC_HCI_INVALID_PIPE},
+	{ST21NFCA_RF_READER_14443_3_A_GATE, NFC_HCI_INVALID_PIPE},
+	{ST21NFCA_RF_READER_ISO15693_GATE, NFC_HCI_INVALID_PIPE},
+	{ST21NFCA_RF_CARD_F_GATE, NFC_HCI_INVALID_PIPE},
+
+	/* Secure element pipes are created by secure element host */
+	{ST21NFCA_CONNECTIVITY_GATE, NFC_HCI_DO_NOT_CREATE_PIPE},
+	{ST21NFCA_APDU_READER_GATE, NFC_HCI_DO_NOT_CREATE_PIPE},
+};
+
+struct st21nfca_pipe_info {
+	u8 pipe_state;
+	u8 src_host_id;
+	u8 src_gate_id;
+	u8 dst_host_id;
+	u8 dst_gate_id;
+} __packed;
+
+/* Largest headroom needed for outgoing custom commands */
+#define ST21NFCA_CMDS_HEADROOM  7
+
+static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
+{
+	int i, j, r;
+	struct sk_buff *skb_pipe_list, *skb_pipe_info;
+	struct st21nfca_pipe_info *info;
+
+	u8 pipe_list[] =3D { ST21NFCA_DM_GETINFO_PIPE_LIST,
+		NFC_HCI_TERMINAL_HOST_ID
+	};
+	u8 pipe_info[] =3D { ST21NFCA_DM_GETINFO_PIPE_INFO,
+		NFC_HCI_TERMINAL_HOST_ID, 0
+	};
+
+	/* On ST21NFCA device pipes number are dynamics
+	 * A maximum of 16 pipes can be created at the same time
+	 * If pipes are already created, hci_dev_up will fail.
+	 * Doing a clear all pipe is a bad idea because:
+	 * - It does useless EEPROM cycling
+	 * - It might cause issue for secure elements support
+	 * (such as removing connectivity or APDU reader pipe)
+	 * A better approach on ST21NFCA is to:
+	 * - get a pipe list for each host.
+	 * (eg: NFC_HCI_HOST_CONTROLLER_ID for now).
+	 * (TODO Later on UICC HOST and eSE HOST)
+	 * - get pipe information
+	 * - match retrieved pipe list in st21nfca_gates
+	 * ST21NFCA_DEVICE_MGNT_GATE is a proprietary gate
+	 * with ST21NFCA_DEVICE_MGNT_PIPE.
+	 * Pipe can be closed and need to be open.
+	 */
+	r =3D nfc_hci_connect_gate(hdev, NFC_HCI_HOST_CONTROLLER_ID,
+				ST21NFCA_DEVICE_MGNT_GATE,
+				ST21NFCA_DEVICE_MGNT_PIPE);
+	if (r < 0)
+		return r;
+
+	/* Get pipe list */
+	r =3D nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+			ST21NFCA_DM_GETINFO, pipe_list, sizeof(pipe_list),
+			&skb_pipe_list);
+	if (r < 0)
+		return r;
+
+	/* Complete the existing gate_pipe table */
+	for (i =3D 0; i < skb_pipe_list->len; i++) {
+		pipe_info[2] =3D skb_pipe_list->data[i];
+		r =3D nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+					ST21NFCA_DM_GETINFO, pipe_info,
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
+		info =3D (struct st21nfca_pipe_info *) skb_pipe_info->data;
+		if (info->dst_gate_id =3D=3D ST21NFCA_APDU_READER_GATE &&
+			info->src_host_id !=3D ST21NFCA_ESE_HOST_ID) {
+			pr_err("Unexpected apdu_reader pipe on host %x\n",
+				info->src_host_id);
+			kfree_skb(skb_pipe_info);
+			continue;
+		}
+
+		for (j =3D 0; (j < ARRAY_SIZE(st21nfca_gates)) &&
+			(st21nfca_gates[j].gate !=3D info->dst_gate_id) ; j++)
+			;
+
+		if (j < ARRAY_SIZE(st21nfca_gates) &&
+			st21nfca_gates[j].gate =3D=3D info->dst_gate_id &&
+			ST21NFCA_DM_IS_PIPE_OPEN(info->pipe_state)) {
+			st21nfca_gates[j].pipe =3D pipe_info[2];
+
+			hdev->gate2pipe[st21nfca_gates[j].gate] =3D
+							st21nfca_gates[j].pipe;
+			hdev->pipes[st21nfca_gates[j].pipe].gate =3D
+							st21nfca_gates[j].gate;
+			hdev->pipes[st21nfca_gates[j].pipe].dest_host =3D
+							info->src_host_id;
+		}
+		kfree_skb(skb_pipe_info);
+	}
+
+	/*
+	 * 3 gates have a well known pipe ID.
+	 * They will never appear in the pipe list
+	 */
+	if (skb_pipe_list->len + 3 < ARRAY_SIZE(st21nfca_gates)) {
+		for (i =3D skb_pipe_list->len + 3;
+				i < ARRAY_SIZE(st21nfca_gates) - 2; i++) {
+			r =3D nfc_hci_connect_gate(hdev,
+					NFC_HCI_HOST_CONTROLLER_ID,
+					st21nfca_gates[i].gate,
+					st21nfca_gates[i].pipe);
+			if (r < 0)
+				goto free_list;
+		}
+	}
+
+	memcpy(hdev->init_data.gates, st21nfca_gates, sizeof(st21nfca_gates))=
;
+free_list:
+	kfree_skb(skb_pipe_list);
+	return r;
+}
+
+static int st21nfca_hci_open(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+	int r;
+
+	mutex_lock(&info->info_lock);
+
+	if (info->state !=3D ST21NFCA_ST_COLD) {
+		r =3D -EBUSY;
+		goto out;
+	}
+
+	r =3D info->phy_ops->enable(info->phy_id);
+
+	if (r =3D=3D 0)
+		info->state =3D ST21NFCA_ST_READY;
+
+out:
+	mutex_unlock(&info->info_lock);
+	return r;
+}
+
+static void st21nfca_hci_close(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	mutex_lock(&info->info_lock);
+
+	if (info->state =3D=3D ST21NFCA_ST_COLD)
+		goto out;
+
+	info->phy_ops->disable(info->phy_id);
+	info->state =3D ST21NFCA_ST_COLD;
+
+out:
+	mutex_unlock(&info->info_lock);
+}
+
+static int st21nfca_hci_ready(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+	struct sk_buff *skb;
+
+	u8 param;
+	u8 white_list[2];
+	int wl_size =3D 0;
+	int r;
+
+	if (info->se_status->is_ese_present &&
+		info->se_status->is_uicc_present) {
+		white_list[wl_size++] =3D NFC_HCI_UICC_HOST_ID;
+		white_list[wl_size++] =3D ST21NFCA_ESE_HOST_ID;
+	} else if (!info->se_status->is_ese_present &&
+			 info->se_status->is_uicc_present) {
+		white_list[wl_size++] =3D NFC_HCI_UICC_HOST_ID;
+	} else if (info->se_status->is_ese_present &&
+			!info->se_status->is_uicc_present) {
+		white_list[wl_size++] =3D ST21NFCA_ESE_HOST_ID;
+	}
+
+	if (wl_size) {
+		r =3D nfc_hci_set_param(hdev, NFC_HCI_ADMIN_GATE,
+					NFC_HCI_ADMIN_WHITELIST,
+					(u8 *) &white_list, wl_size);
+		if (r < 0)
+			return r;
+	}
+
+	/* Set NFC_MODE in device management gate to enable */
+	r =3D nfc_hci_get_param(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+			      ST21NFCA_NFC_MODE, &skb);
+	if (r < 0)
+		return r;
+
+	param =3D skb->data[0];
+	kfree_skb(skb);
+	if (param =3D=3D 0) {
+		param =3D 1;
+
+		r =3D nfc_hci_set_param(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+					ST21NFCA_NFC_MODE, &param, 1);
+		if (r < 0)
+			return r;
+	}
+
+	r =3D nfc_hci_send_event(hdev, NFC_HCI_RF_READER_A_GATE,
+			       NFC_HCI_EVT_END_OPERATION, NULL, 0);
+	if (r < 0)
+		return r;
+
+	r =3D nfc_hci_get_param(hdev, NFC_HCI_ID_MGMT_GATE,
+			      NFC_HCI_ID_MGMT_VERSION_SW, &skb);
+	if (r < 0)
+		return r;
+
+	if (skb->len !=3D FULL_VERSION_LEN) {
+		kfree_skb(skb);
+		return -EINVAL;
+	}
+
+	print_hex_dump(KERN_DEBUG, "FULL VERSION SOFTWARE INFO: ",
+		       DUMP_PREFIX_NONE, 16, 1,
+		       skb->data, FULL_VERSION_LEN, false);
+
+	kfree_skb(skb);
+
+	return 0;
+}
+
+static int st21nfca_hci_xmit(struct nfc_hci_dev *hdev, struct sk_buff =
*skb)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	return info->phy_ops->write(info->phy_id, skb);
+}
+
+static int st21nfca_hci_start_poll(struct nfc_hci_dev *hdev,
+				   u32 im_protocols, u32 tm_protocols)
+{
+	int r;
+	u32 pol_req;
+	u8 param[19];
+	struct sk_buff *datarate_skb;
+
+	pr_info(DRIVER_DESC ": %s protocols 0x%x 0x%x\n",
+		__func__, im_protocols, tm_protocols);
+
+	r =3D nfc_hci_send_event(hdev, NFC_HCI_RF_READER_A_GATE,
+			       NFC_HCI_EVT_END_OPERATION, NULL, 0);
+	if (r < 0)
+		return r;
+	if (im_protocols) {
+		/*
+		 * enable polling according to im_protocols & tm_protocols
+		 * - CLOSE pipe according to im_protocols & tm_protocols
+		 */
+		if ((NFC_HCI_RF_READER_B_GATE & im_protocols) =3D=3D 0) {
+			r =3D nfc_hci_disconnect_gate(hdev,
+					NFC_HCI_RF_READER_B_GATE);
+			if (r < 0)
+				return r;
+		}
+
+		if ((NFC_HCI_RF_READER_A_GATE & im_protocols) =3D=3D 0) {
+			r =3D nfc_hci_disconnect_gate(hdev,
+					NFC_HCI_RF_READER_A_GATE);
+			if (r < 0)
+				return r;
+		}
+
+		if ((ST21NFCA_RF_READER_F_GATE & im_protocols) =3D=3D 0) {
+			r =3D nfc_hci_disconnect_gate(hdev,
+					ST21NFCA_RF_READER_F_GATE);
+			if (r < 0)
+				return r;
+		} else {
+			hdev->gb =3D nfc_get_local_general_bytes(hdev->ndev,
+							       &hdev->gb_len);
+
+			if (hdev->gb =3D=3D NULL || hdev->gb_len =3D=3D 0) {
+				im_protocols &=3D ~NFC_PROTO_NFC_DEP_MASK;
+				tm_protocols &=3D ~NFC_PROTO_NFC_DEP_MASK;
+			}
+
+			param[0] =3D ST21NFCA_RF_READER_F_DATARATE_106 |
+			    ST21NFCA_RF_READER_F_DATARATE_212 |
+			    ST21NFCA_RF_READER_F_DATARATE_424;
+			r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_READER_F_GATE,
+					      ST21NFCA_RF_READER_F_DATARATE,
+					      param, 1);
+			if (r < 0)
+				return r;
+
+			pol_req =3D be32_to_cpu((__force __be32)
+					ST21NFCA_RF_READER_F_POL_REQ_DEFAULT);
+			r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_READER_F_GATE,
+					      ST21NFCA_RF_READER_F_POL_REQ,
+					      (u8 *) &pol_req, 4);
+			if (r < 0)
+				return r;
+		}
+
+		if ((ST21NFCA_RF_READER_14443_3_A_GATE & im_protocols) =3D=3D 0) {
+			r =3D nfc_hci_disconnect_gate(hdev,
+					ST21NFCA_RF_READER_14443_3_A_GATE);
+			if (r < 0)
+				return r;
+		}
+
+		if ((ST21NFCA_RF_READER_ISO15693_GATE & im_protocols) =3D=3D 0) {
+			r =3D nfc_hci_disconnect_gate(hdev,
+					ST21NFCA_RF_READER_ISO15693_GATE);
+			if (r < 0)
+				return r;
+		}
+
+		r =3D nfc_hci_send_event(hdev, NFC_HCI_RF_READER_A_GATE,
+				       NFC_HCI_EVT_READER_REQUESTED, NULL, 0);
+		if (r < 0)
+			nfc_hci_send_event(hdev, NFC_HCI_RF_READER_A_GATE,
+					   NFC_HCI_EVT_END_OPERATION, NULL, 0);
+	}
+
+	if (tm_protocols & NFC_PROTO_NFC_DEP_MASK) {
+		r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_CARD_F_GATE,
+				      ST21NFCA_RF_CARD_F_DATARATE,
+				      &datarate_skb);
+		if (r < 0)
+			return r;
+
+		/* Configure the maximum supported datarate to 424Kbps */
+		if (datarate_skb->len > 0 &&
+		    datarate_skb->data[0] !=3D
+		    ST21NFCA_RF_CARD_F_DATARATE_212_424) {
+			param[0] =3D ST21NFCA_RF_CARD_F_DATARATE_212_424;
+			r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
+					      ST21NFCA_RF_CARD_F_DATARATE,
+					      param, 1);
+			if (r < 0) {
+				kfree_skb(datarate_skb);
+				return r;
+			}
+		}
+		kfree_skb(datarate_skb);
+
+		/*
+		 * Configure sens_res
+		 *
+		 * NFC Forum Digital Spec Table 7:
+		 * NFCID1 size: triple (10 bytes)
+		 */
+		param[0] =3D 0x00;
+		param[1] =3D 0x08;
+		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
+				      ST21NFCA_RF_CARD_F_SENS_RES, param, 2);
+		if (r < 0)
+			return r;
+
+		/*
+		 * Configure sel_res
+		 *
+		 * NFC Forum Digistal Spec Table 17:
+		 * b3 set to 0b (value b7-b6):
+		 * - 10b: Configured for NFC-DEP Protocol
+		 */
+		param[0] =3D 0x40;
+		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
+				      ST21NFCA_RF_CARD_F_SEL_RES, param, 1);
+		if (r < 0)
+			return r;
+
+		/* Configure NFCID1 Random uid */
+		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
+				      ST21NFCA_RF_CARD_F_NFCID1, NULL, 0);
+		if (r < 0)
+			return r;
+
+		/* Configure NFCID2_LIST */
+		/* System Code */
+		param[0] =3D 0x00;
+		param[1] =3D 0x00;
+		/* NFCID2 */
+		param[2] =3D 0x01;
+		param[3] =3D 0xfe;
+		param[4] =3D 'S';
+		param[5] =3D 'T';
+		param[6] =3D 'M';
+		param[7] =3D 'i';
+		param[8] =3D 'c';
+		param[9] =3D 'r';
+		/* 8 byte Pad bytes used for polling respone frame */
+
+		/*
+		 * Configuration byte:
+		 * - bit 0: define the default NFCID2 entry used when the
+		 * system code is equal to 'FFFF'
+		 * - bit 1: use a random value for lowest 6 bytes of
+		 * NFCID2 value
+		 * - bit 2: ignore polling request frame if request code
+		 * is equal to '01'
+		 * - Other bits are RFU
+		 */
+		param[18] =3D 0x01;
+		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
+				      ST21NFCA_RF_CARD_F_NFCID2_LIST, param,
+				      19);
+		if (r < 0)
+			return r;
+
+		param[0] =3D 0x02;
+		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
+				      ST21NFCA_RF_CARD_F_MODE, param, 1);
+	}
+
+	return r;
+}
+
+static void st21nfca_hci_stop_poll(struct nfc_hci_dev *hdev)
+{
+	nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+			ST21NFCA_DM_DISCONNECT, NULL, 0, NULL);
+}
+
+static int st21nfca_get_iso14443_3_atqa(struct nfc_hci_dev *hdev, u16 =
*atqa)
+{
+	int r;
+	struct sk_buff *atqa_skb =3D NULL;
+
+	r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_14443_3_A_GATE,
+			      ST21NFCA_RF_READER_14443_3_A_ATQA, &atqa_skb);
+	if (r < 0)
+		goto exit;
+
+	if (atqa_skb->len !=3D 2) {
+		r =3D -EPROTO;
+		goto exit;
+	}
+
+	*atqa =3D be16_to_cpu(*(__be16 *) atqa_skb->data);
+
+exit:
+	kfree_skb(atqa_skb);
+	return r;
+}
+
+static int st21nfca_get_iso14443_3_sak(struct nfc_hci_dev *hdev, u8 *s=
ak)
+{
+	int r;
+	struct sk_buff *sak_skb =3D NULL;
+
+	r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_14443_3_A_GATE,
+			      ST21NFCA_RF_READER_14443_3_A_SAK, &sak_skb);
+	if (r < 0)
+		goto exit;
+
+	if (sak_skb->len !=3D 1) {
+		r =3D -EPROTO;
+		goto exit;
+	}
+
+	*sak =3D sak_skb->data[0];
+
+exit:
+	kfree_skb(sak_skb);
+	return r;
+}
+
+static int st21nfca_get_iso14443_3_uid(struct nfc_hci_dev *hdev, u8 *u=
id,
+				       int *len)
+{
+	int r;
+	struct sk_buff *uid_skb =3D NULL;
+
+	r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_14443_3_A_GATE,
+			      ST21NFCA_RF_READER_14443_3_A_UID, &uid_skb);
+	if (r < 0)
+		goto exit;
+
+	if (uid_skb->len =3D=3D 0 || uid_skb->len > NFC_NFCID1_MAXSIZE) {
+		r =3D -EPROTO;
+		goto exit;
+	}
+
+	memcpy(uid, uid_skb->data, uid_skb->len);
+	*len =3D uid_skb->len;
+exit:
+	kfree_skb(uid_skb);
+	return r;
+}
+
+static int st21nfca_get_iso15693_inventory(struct nfc_hci_dev *hdev,
+					   struct nfc_target *target)
+{
+	int r;
+	struct sk_buff *inventory_skb =3D NULL;
+
+	r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_ISO15693_GATE,
+			      ST21NFCA_RF_READER_ISO15693_INVENTORY,
+			      &inventory_skb);
+	if (r < 0)
+		goto exit;
+
+	skb_pull(inventory_skb, 2);
+
+	if (inventory_skb->len =3D=3D 0 ||
+	    inventory_skb->len > NFC_ISO15693_UID_MAXSIZE) {
+		r =3D -EPROTO;
+		goto exit;
+	}
+
+	memcpy(target->iso15693_uid, inventory_skb->data, inventory_skb->len)=
;
+	target->iso15693_dsfid	=3D inventory_skb->data[1];
+	target->is_iso15693 =3D 1;
+exit:
+	kfree_skb(inventory_skb);
+	return r;
+}
+
+static int st21nfca_hci_dep_link_up(struct nfc_hci_dev *hdev,
+				    struct nfc_target *target, u8 comm_mode,
+				    u8 *gb, size_t gb_len)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	info->dep_info.idx =3D target->idx;
+	return st21nfca_im_send_atr_req(hdev, gb, gb_len);
+}
+
+static int st21nfca_hci_dep_link_down(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	info->state =3D ST21NFCA_ST_READY;
+
+	return nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
+				ST21NFCA_DM_DISCONNECT, NULL, 0, NULL);
+}
+
+static int st21nfca_hci_target_from_gate(struct nfc_hci_dev *hdev, u8 =
gate,
+					 struct nfc_target *target)
+{
+	int r, len;
+	u16 atqa;
+	u8 sak;
+	u8 uid[NFC_NFCID1_MAXSIZE];
+
+	switch (gate) {
+	case ST21NFCA_RF_READER_F_GATE:
+		target->supported_protocols =3D NFC_PROTO_FELICA_MASK;
+		break;
+	case ST21NFCA_RF_READER_14443_3_A_GATE:
+		/* ISO14443-3 type 1 or 2 tags */
+		r =3D st21nfca_get_iso14443_3_atqa(hdev, &atqa);
+		if (r < 0)
+			return r;
+		if (atqa =3D=3D 0x000c) {
+			target->supported_protocols =3D NFC_PROTO_JEWEL_MASK;
+			target->sens_res =3D 0x0c00;
+		} else {
+			r =3D st21nfca_get_iso14443_3_sak(hdev, &sak);
+			if (r < 0)
+				return r;
+
+			r =3D st21nfca_get_iso14443_3_uid(hdev, uid, &len);
+			if (r < 0)
+				return r;
+
+			target->supported_protocols =3D
+			    nfc_hci_sak_to_protocol(sak);
+			if (target->supported_protocols =3D=3D 0xffffffff)
+				return -EPROTO;
+
+			target->sens_res =3D atqa;
+			target->sel_res =3D sak;
+			memcpy(target->nfcid1, uid, len);
+			target->nfcid1_len =3D len;
+		}
+
+		break;
+	case ST21NFCA_RF_READER_ISO15693_GATE:
+		target->supported_protocols =3D NFC_PROTO_ISO15693_MASK;
+		r =3D st21nfca_get_iso15693_inventory(hdev, target);
+		if (r < 0)
+			return r;
+		break;
+	default:
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int st21nfca_hci_complete_target_discovered(struct nfc_hci_dev =
*hdev,
+						u8 gate,
+						struct nfc_target *target)
+{
+	int r;
+	struct sk_buff *nfcid_skb =3D NULL;
+
+	if (gate =3D=3D ST21NFCA_RF_READER_F_GATE) {
+		r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_F_GATE,
+				ST21NFCA_RF_READER_F_NFCID2, &nfcid_skb);
+		if (r < 0)
+			goto exit;
+
+		if (nfcid_skb->len > NFC_SENSF_RES_MAXSIZE) {
+			r =3D -EPROTO;
+			goto exit;
+		}
+
+		/*
+		 * - After the recepton of polling response for type F frame
+		 * at 212 or 424 Kbit/s, NFCID2 registry parameters will be
+		 * updated.
+		 * - After the reception of SEL_RES with NFCIP-1 compliant bit
+		 * set for type A frame NFCID1 will be updated
+		 */
+		if (nfcid_skb->len > 0) {
+			/* P2P in type F */
+			memcpy(target->sensf_res, nfcid_skb->data,
+				nfcid_skb->len);
+			target->sensf_res_len =3D nfcid_skb->len;
+			/* NFC Forum Digital Protocol Table 44 */
+			if (target->sensf_res[0] =3D=3D 0x01 &&
+			    target->sensf_res[1] =3D=3D 0xfe)
+				target->supported_protocols =3D
+							NFC_PROTO_NFC_DEP_MASK;
+			else
+				target->supported_protocols =3D
+							NFC_PROTO_FELICA_MASK;
+		} else {
+			kfree_skb(nfcid_skb);
+			/* P2P in type A */
+			r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_F_GATE,
+					ST21NFCA_RF_READER_F_NFCID1,
+					&nfcid_skb);
+			if (r < 0)
+				goto exit;
+
+			if (nfcid_skb->len > NFC_NFCID1_MAXSIZE) {
+				r =3D -EPROTO;
+				goto exit;
+			}
+			memcpy(target->sensf_res, nfcid_skb->data,
+				nfcid_skb->len);
+			target->sensf_res_len =3D nfcid_skb->len;
+			target->supported_protocols =3D NFC_PROTO_NFC_DEP_MASK;
+		}
+		target->hci_reader_gate =3D ST21NFCA_RF_READER_F_GATE;
+	}
+	r =3D 1;
+exit:
+	kfree_skb(nfcid_skb);
+	return r;
+}
+
+#define ST21NFCA_CB_TYPE_READER_ISO15693 1
+static void st21nfca_hci_data_exchange_cb(void *context, struct sk_buf=
f *skb,
+					  int err)
+{
+	struct st21nfca_hci_info *info =3D context;
+
+	switch (info->async_cb_type) {
+	case ST21NFCA_CB_TYPE_READER_ISO15693:
+		if (err =3D=3D 0)
+			skb_trim(skb, skb->len - 1);
+		info->async_cb(info->async_cb_context, skb, err);
+		break;
+	default:
+		if (err =3D=3D 0)
+			kfree_skb(skb);
+		break;
+	}
+}
+
+/*
+ * Returns:
+ * <=3D 0: driver handled the data exchange
+ *    1: driver doesn't especially handle, please do standard processi=
ng
+ */
+static int st21nfca_hci_im_transceive(struct nfc_hci_dev *hdev,
+				      struct nfc_target *target,
+				      struct sk_buff *skb,
+				      data_exchange_cb_t cb, void *cb_context)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	pr_info(DRIVER_DESC ": %s for gate=3D%d len=3D%d\n", __func__,
+		target->hci_reader_gate, skb->len);
+
+	switch (target->hci_reader_gate) {
+	case ST21NFCA_RF_READER_F_GATE:
+		if (target->supported_protocols =3D=3D NFC_PROTO_NFC_DEP_MASK)
+			return st21nfca_im_send_dep_req(hdev, skb);
+
+		*skb_push(skb, 1) =3D 0x1a;
+		return nfc_hci_send_cmd_async(hdev, target->hci_reader_gate,
+					      ST21NFCA_WR_XCHG_DATA, skb->data,
+					      skb->len, cb, cb_context);
+	case ST21NFCA_RF_READER_14443_3_A_GATE:
+		*skb_push(skb, 1) =3D 0x1a;	/* CTR, see spec:10.2.2.1 */
+
+		return nfc_hci_send_cmd_async(hdev, target->hci_reader_gate,
+					      ST21NFCA_WR_XCHG_DATA, skb->data,
+					      skb->len, cb, cb_context);
+	case ST21NFCA_RF_READER_ISO15693_GATE:
+		info->async_cb_type =3D ST21NFCA_CB_TYPE_READER_ISO15693;
+		info->async_cb =3D cb;
+		info->async_cb_context =3D cb_context;
+
+		*skb_push(skb, 1) =3D 0x17;
+
+		return nfc_hci_send_cmd_async(hdev, target->hci_reader_gate,
+					      ST21NFCA_WR_XCHG_DATA, skb->data,
+					      skb->len,
+					      st21nfca_hci_data_exchange_cb,
+					      info);
+		break;
+	default:
+		return 1;
+	}
+}
+
+static int st21nfca_hci_tm_send(struct nfc_hci_dev *hdev, struct sk_bu=
ff *skb)
+{
+	return st21nfca_tm_send_dep_res(hdev, skb);
+}
+
+static int st21nfca_hci_check_presence(struct nfc_hci_dev *hdev,
+				       struct nfc_target *target)
+{
+	u8 fwi =3D 0x11;
+
+	switch (target->hci_reader_gate) {
+	case NFC_HCI_RF_READER_A_GATE:
+	case NFC_HCI_RF_READER_B_GATE:
+		/*
+		 * PRESENCE_CHECK on those gates is available
+		 * However, the answer to this command is taking 3 * fwi
+		 * if the card is no present.
+		 * Instead, we send an empty I-Frame with a very short
+		 * configurable fwi ~604=C2=B5s.
+		 */
+		return nfc_hci_send_cmd(hdev, target->hci_reader_gate,
+					ST21NFCA_WR_XCHG_DATA, &fwi, 1, NULL);
+	case ST21NFCA_RF_READER_14443_3_A_GATE:
+		return nfc_hci_send_cmd(hdev, target->hci_reader_gate,
+					ST21NFCA_RF_READER_CMD_PRESENCE_CHECK,
+					NULL, 0, NULL);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static void st21nfca_hci_cmd_received(struct nfc_hci_dev *hdev, u8 pip=
e, u8 cmd,
+				struct sk_buff *skb)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+	u8 gate =3D hdev->pipes[pipe].gate;
+
+	pr_debug("cmd: %x\n", cmd);
+
+	switch (cmd) {
+	case NFC_HCI_ANY_OPEN_PIPE:
+		if (gate !=3D ST21NFCA_APDU_READER_GATE &&
+			hdev->pipes[pipe].dest_host !=3D NFC_HCI_UICC_HOST_ID)
+			info->se_info.count_pipes++;
+
+		if (info->se_info.count_pipes =3D=3D info->se_info.expected_pipes) {
+			del_timer_sync(&info->se_info.se_active_timer);
+			info->se_info.se_active =3D false;
+			info->se_info.count_pipes =3D 0;
+			complete(&info->se_info.req_completion);
+		}
+	break;
+	}
+}
+
+static int st21nfca_admin_event_received(struct nfc_hci_dev *hdev, u8 =
event,
+					struct sk_buff *skb)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	pr_debug("admin event: %x\n", event);
+
+	switch (event) {
+	case ST21NFCA_EVT_HOT_PLUG:
+		if (info->se_info.se_active) {
+			if (!ST21NFCA_EVT_HOT_PLUG_IS_INHIBITED(skb)) {
+				del_timer_sync(&info->se_info.se_active_timer);
+				info->se_info.se_active =3D false;
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
+/*
+ * Returns:
+ * <=3D 0: driver handled the event, skb consumed
+ *    1: driver does not handle the event, please do standard processi=
ng
+ */
+static int st21nfca_hci_event_received(struct nfc_hci_dev *hdev, u8 pi=
pe,
+				       u8 event, struct sk_buff *skb)
+{
+	u8 gate =3D hdev->pipes[pipe].gate;
+	u8 host =3D hdev->pipes[pipe].dest_host;
+
+	pr_debug("hci event: %d gate: %x\n", event, gate);
+
+	switch (gate) {
+	case NFC_HCI_ADMIN_GATE:
+		return st21nfca_admin_event_received(hdev, event, skb);
+	case ST21NFCA_RF_CARD_F_GATE:
+		return st21nfca_dep_event_received(hdev, event, skb);
+	case ST21NFCA_CONNECTIVITY_GATE:
+		return st21nfca_connectivity_event_received(hdev, host,
+							event, skb);
+	case ST21NFCA_APDU_READER_GATE:
+		return st21nfca_apdu_reader_event_received(hdev, event, skb);
+	default:
+		return 1;
+	}
+}
+
+static struct nfc_hci_ops st21nfca_hci_ops =3D {
+	.open =3D st21nfca_hci_open,
+	.close =3D st21nfca_hci_close,
+	.load_session =3D st21nfca_hci_load_session,
+	.hci_ready =3D st21nfca_hci_ready,
+	.xmit =3D st21nfca_hci_xmit,
+	.start_poll =3D st21nfca_hci_start_poll,
+	.stop_poll =3D st21nfca_hci_stop_poll,
+	.dep_link_up =3D st21nfca_hci_dep_link_up,
+	.dep_link_down =3D st21nfca_hci_dep_link_down,
+	.target_from_gate =3D st21nfca_hci_target_from_gate,
+	.complete_target_discovered =3D st21nfca_hci_complete_target_discover=
ed,
+	.im_transceive =3D st21nfca_hci_im_transceive,
+	.tm_send =3D st21nfca_hci_tm_send,
+	.check_presence =3D st21nfca_hci_check_presence,
+	.event_received =3D st21nfca_hci_event_received,
+	.cmd_received =3D st21nfca_hci_cmd_received,
+	.discover_se =3D st21nfca_hci_discover_se,
+	.enable_se =3D st21nfca_hci_enable_se,
+	.disable_se =3D st21nfca_hci_disable_se,
+	.se_io =3D st21nfca_hci_se_io,
+};
+
+int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
+		       char *llc_name, int phy_headroom, int phy_tailroom,
+		       int phy_payload, struct nfc_hci_dev **hdev,
+			   struct st21nfca_se_status *se_status)
+{
+	struct st21nfca_hci_info *info;
+	int r =3D 0;
+	int dev_num;
+	u32 protocols;
+	struct nfc_hci_init_data init_data;
+	unsigned long quirks =3D 0;
+
+	info =3D kzalloc(sizeof(struct st21nfca_hci_info), GFP_KERNEL);
+	if (!info) {
+		r =3D -ENOMEM;
+		goto err_alloc_hdev;
+	}
+
+	info->phy_ops =3D phy_ops;
+	info->phy_id =3D phy_id;
+	info->state =3D ST21NFCA_ST_COLD;
+	mutex_init(&info->info_lock);
+
+	init_data.gate_count =3D ARRAY_SIZE(st21nfca_gates);
+
+	memcpy(init_data.gates, st21nfca_gates, sizeof(st21nfca_gates));
+
+	/*
+	 * Session id must include the driver name + i2c bus addr
+	 * persistent info to discriminate 2 identical chips
+	 */
+	dev_num =3D find_first_zero_bit(dev_mask, ST21NFCA_NUM_DEVICES);
+
+	if (dev_num >=3D ST21NFCA_NUM_DEVICES)
+		return -ENODEV;
+
+	set_bit(dev_num, dev_mask);
+
+	scnprintf(init_data.session_id, sizeof(init_data.session_id), "%s%2x"=
,
+		  "ST21AH", dev_num);
+
+	protocols =3D NFC_PROTO_JEWEL_MASK |
+	    NFC_PROTO_MIFARE_MASK |
+	    NFC_PROTO_FELICA_MASK |
+	    NFC_PROTO_ISO14443_MASK |
+	    NFC_PROTO_ISO14443_B_MASK |
+	    NFC_PROTO_ISO15693_MASK |
+	    NFC_PROTO_NFC_DEP_MASK;
+
+	set_bit(NFC_HCI_QUIRK_SHORT_CLEAR, &quirks);
+
+	info->hdev =3D
+	    nfc_hci_allocate_device(&st21nfca_hci_ops, &init_data, quirks,
+				    protocols, llc_name,
+				    phy_headroom + ST21NFCA_CMDS_HEADROOM,
+				    phy_tailroom, phy_payload);
+
+	if (!info->hdev) {
+		pr_err("Cannot allocate nfc hdev.\n");
+		r =3D -ENOMEM;
+		goto err_alloc_hdev;
+	}
+
+	info->se_status =3D se_status;
+
+	nfc_hci_set_clientdata(info->hdev, info);
+
+	r =3D nfc_hci_register_device(info->hdev);
+	if (r)
+		goto err_regdev;
+
+	*hdev =3D info->hdev;
+	st21nfca_dep_init(info->hdev);
+	st21nfca_se_init(info->hdev);
+
+	return 0;
+
+err_regdev:
+	nfc_hci_free_device(info->hdev);
+
+err_alloc_hdev:
+	kfree(info);
+
+	return r;
+}
+EXPORT_SYMBOL(st21nfca_hci_probe);
+
+void st21nfca_hci_remove(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	st21nfca_dep_deinit(hdev);
+	st21nfca_se_deinit(hdev);
+	nfc_hci_unregister_device(hdev);
+	nfc_hci_free_device(hdev);
+	kfree(info);
+}
+EXPORT_SYMBOL(st21nfca_hci_remove);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st21nfca/dep.c b/drivers/nfc/st21nfca/dep.c
new file mode 100644
index 0000000..c011712
--- /dev/null
+++ b/drivers/nfc/st21nfca/dep.c
@@ -0,0 +1,688 @@
+/*
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
+#include <net/nfc/hci.h>
+
+#include "st21nfca.h"
+
+#define ST21NFCA_NFCIP1_INITIATOR 0x00
+#define ST21NFCA_NFCIP1_REQ 0xd4
+#define ST21NFCA_NFCIP1_RES 0xd5
+#define ST21NFCA_NFCIP1_ATR_REQ 0x00
+#define ST21NFCA_NFCIP1_ATR_RES 0x01
+#define ST21NFCA_NFCIP1_PSL_REQ 0x04
+#define ST21NFCA_NFCIP1_PSL_RES 0x05
+#define ST21NFCA_NFCIP1_DEP_REQ 0x06
+#define ST21NFCA_NFCIP1_DEP_RES 0x07
+
+#define ST21NFCA_NFC_DEP_PFB_PNI(pfb)     ((pfb) & 0x03)
+#define ST21NFCA_NFC_DEP_PFB_TYPE(pfb) ((pfb) & 0xE0)
+#define ST21NFCA_NFC_DEP_PFB_IS_TIMEOUT(pfb) \
+				((pfb) & ST21NFCA_NFC_DEP_PFB_TIMEOUT_BIT)
+#define ST21NFCA_NFC_DEP_DID_BIT_SET(pfb) ((pfb) & 0x04)
+#define ST21NFCA_NFC_DEP_NAD_BIT_SET(pfb) ((pfb) & 0x08)
+#define ST21NFCA_NFC_DEP_PFB_TIMEOUT_BIT 0x10
+
+#define ST21NFCA_NFC_DEP_PFB_IS_TIMEOUT(pfb) \
+				((pfb) & ST21NFCA_NFC_DEP_PFB_TIMEOUT_BIT)
+
+#define ST21NFCA_NFC_DEP_PFB_I_PDU          0x00
+#define ST21NFCA_NFC_DEP_PFB_ACK_NACK_PDU   0x40
+#define ST21NFCA_NFC_DEP_PFB_SUPERVISOR_PDU 0x80
+
+#define ST21NFCA_ATR_REQ_MIN_SIZE 17
+#define ST21NFCA_ATR_REQ_MAX_SIZE 65
+#define ST21NFCA_LR_BITS_PAYLOAD_SIZE_254B 0x30
+#define ST21NFCA_GB_BIT  0x02
+
+#define ST21NFCA_EVT_SEND_DATA		0x10
+#define ST21NFCA_EVT_FIELD_ON           0x11
+#define ST21NFCA_EVT_CARD_DEACTIVATED   0x12
+#define ST21NFCA_EVT_CARD_ACTIVATED     0x13
+#define ST21NFCA_EVT_FIELD_OFF          0x14
+
+#define ST21NFCA_EVT_CARD_F_BITRATE 0x16
+#define ST21NFCA_EVT_READER_F_BITRATE 0x13
+#define	ST21NFCA_PSL_REQ_SEND_SPEED(brs) (brs & 0x38)
+#define ST21NFCA_PSL_REQ_RECV_SPEED(brs) (brs & 0x07)
+#define ST21NFCA_PP2LRI(pp) ((pp & 0x30) >> 4)
+#define ST21NFCA_CARD_BITRATE_212 0x01
+#define ST21NFCA_CARD_BITRATE_424 0x02
+
+#define ST21NFCA_DEFAULT_TIMEOUT 0x0a
+
+
+#define PROTOCOL_ERR(req) pr_err("%d: ST21NFCA Protocol error: %s\n", =
\
+				 __LINE__, req)
+
+struct st21nfca_atr_req {
+	u8 length;
+	u8 cmd0;
+	u8 cmd1;
+	u8 nfcid3[NFC_NFCID3_MAXSIZE];
+	u8 did;
+	u8 bsi;
+	u8 bri;
+	u8 ppi;
+	u8 gbi[0];
+} __packed;
+
+struct st21nfca_atr_res {
+	u8 length;
+	u8 cmd0;
+	u8 cmd1;
+	u8 nfcid3[NFC_NFCID3_MAXSIZE];
+	u8 did;
+	u8 bsi;
+	u8 bri;
+	u8 to;
+	u8 ppi;
+	u8 gbi[0];
+} __packed;
+
+struct st21nfca_psl_req {
+	u8 length;
+	u8 cmd0;
+	u8 cmd1;
+	u8 did;
+	u8 brs;
+	u8 fsl;
+} __packed;
+
+struct st21nfca_psl_res {
+	u8 length;
+	u8 cmd0;
+	u8 cmd1;
+	u8 did;
+} __packed;
+
+struct st21nfca_dep_req_res {
+	u8 length;
+	u8 cmd0;
+	u8 cmd1;
+	u8 pfb;
+	u8 did;
+	u8 nad;
+} __packed;
+
+static void st21nfca_tx_work(struct work_struct *work)
+{
+	struct st21nfca_hci_info *info =3D container_of(work,
+						struct st21nfca_hci_info,
+						dep_info.tx_work);
+
+	struct nfc_dev *dev;
+	struct sk_buff *skb;
+
+	if (info) {
+		dev =3D info->hdev->ndev;
+		skb =3D info->dep_info.tx_pending;
+
+		device_lock(&dev->dev);
+
+		nfc_hci_send_cmd_async(info->hdev, ST21NFCA_RF_READER_F_GATE,
+				ST21NFCA_WR_XCHG_DATA, skb->data, skb->len,
+				info->async_cb, info);
+		device_unlock(&dev->dev);
+		kfree_skb(skb);
+	}
+}
+
+static void st21nfca_im_send_pdu(struct st21nfca_hci_info *info,
+						struct sk_buff *skb)
+{
+	info->dep_info.tx_pending =3D skb;
+	schedule_work(&info->dep_info.tx_work);
+}
+
+static int st21nfca_tm_send_atr_res(struct nfc_hci_dev *hdev,
+				    struct st21nfca_atr_req *atr_req)
+{
+	struct st21nfca_atr_res *atr_res;
+	struct sk_buff *skb;
+	size_t gb_len;
+	int r;
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	gb_len =3D atr_req->length - sizeof(struct st21nfca_atr_req);
+	skb =3D alloc_skb(atr_req->length + 1, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+
+	skb_put(skb, sizeof(struct st21nfca_atr_res));
+
+	atr_res =3D (struct st21nfca_atr_res *)skb->data;
+	memset(atr_res, 0, sizeof(struct st21nfca_atr_res));
+
+	atr_res->length =3D atr_req->length + 1;
+	atr_res->cmd0 =3D ST21NFCA_NFCIP1_RES;
+	atr_res->cmd1 =3D ST21NFCA_NFCIP1_ATR_RES;
+
+	memcpy(atr_res->nfcid3, atr_req->nfcid3, 6);
+	atr_res->bsi =3D 0x00;
+	atr_res->bri =3D 0x00;
+	atr_res->to =3D ST21NFCA_DEFAULT_TIMEOUT;
+	atr_res->ppi =3D ST21NFCA_LR_BITS_PAYLOAD_SIZE_254B;
+
+	if (gb_len) {
+		skb_put(skb, gb_len);
+
+		atr_res->ppi |=3D ST21NFCA_GB_BIT;
+		memcpy(atr_res->gbi, atr_req->gbi, gb_len);
+		r =3D nfc_set_remote_general_bytes(hdev->ndev, atr_res->gbi,
+						  gb_len);
+		if (r < 0)
+			return r;
+	}
+
+	info->dep_info.curr_nfc_dep_pni =3D 0;
+
+	r =3D nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
+				ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
+	kfree_skb(skb);
+	return r;
+}
+
+static int st21nfca_tm_recv_atr_req(struct nfc_hci_dev *hdev,
+				    struct sk_buff *skb)
+{
+	struct st21nfca_atr_req *atr_req;
+	size_t gb_len;
+	int r;
+
+	skb_trim(skb, skb->len - 1);
+
+	if (!skb->len) {
+		r =3D -EIO;
+		goto exit;
+	}
+
+	if (skb->len < ST21NFCA_ATR_REQ_MIN_SIZE) {
+		r =3D -EPROTO;
+		goto exit;
+	}
+
+	atr_req =3D (struct st21nfca_atr_req *)skb->data;
+
+	if (atr_req->length < sizeof(struct st21nfca_atr_req)) {
+		r =3D -EPROTO;
+		goto exit;
+	}
+
+	r =3D st21nfca_tm_send_atr_res(hdev, atr_req);
+	if (r)
+		goto exit;
+
+	gb_len =3D skb->len - sizeof(struct st21nfca_atr_req);
+
+	r =3D nfc_tm_activated(hdev->ndev, NFC_PROTO_NFC_DEP_MASK,
+			      NFC_COMM_PASSIVE, atr_req->gbi, gb_len);
+	if (r)
+		goto exit;
+
+	r =3D 0;
+
+exit:
+	return r;
+}
+
+static int st21nfca_tm_send_psl_res(struct nfc_hci_dev *hdev,
+				    struct st21nfca_psl_req *psl_req)
+{
+	struct st21nfca_psl_res *psl_res;
+	struct sk_buff *skb;
+	u8 bitrate[2] =3D {0, 0};
+	int r;
+
+	skb =3D alloc_skb(sizeof(struct st21nfca_psl_res), GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+	skb_put(skb, sizeof(struct st21nfca_psl_res));
+
+	psl_res =3D (struct st21nfca_psl_res *)skb->data;
+
+	psl_res->length =3D sizeof(struct st21nfca_psl_res);
+	psl_res->cmd0 =3D ST21NFCA_NFCIP1_RES;
+	psl_res->cmd1 =3D ST21NFCA_NFCIP1_PSL_RES;
+	psl_res->did =3D psl_req->did;
+
+	r =3D nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
+				ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
+	if (r < 0)
+		goto error;
+
+	/*
+	 * ST21NFCA only support P2P passive.
+	 * PSL_REQ BRS value !=3D 0 has only a meaning to
+	 * change technology to type F.
+	 * We change to BITRATE 424Kbits.
+	 * In other case switch to BITRATE 106Kbits.
+	 */
+	if (ST21NFCA_PSL_REQ_SEND_SPEED(psl_req->brs) &&
+	    ST21NFCA_PSL_REQ_RECV_SPEED(psl_req->brs)) {
+		bitrate[0] =3D ST21NFCA_CARD_BITRATE_424;
+		bitrate[1] =3D ST21NFCA_CARD_BITRATE_424;
+	}
+
+	/* Send an event to change bitrate change event to card f */
+	r =3D nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
+			ST21NFCA_EVT_CARD_F_BITRATE, bitrate, 2);
+error:
+	kfree_skb(skb);
+	return r;
+}
+
+static int st21nfca_tm_recv_psl_req(struct nfc_hci_dev *hdev,
+				    struct sk_buff *skb)
+{
+	struct st21nfca_psl_req *psl_req;
+	int r;
+
+	skb_trim(skb, skb->len - 1);
+
+	if (!skb->len) {
+		r =3D -EIO;
+		goto exit;
+	}
+
+	psl_req =3D (struct st21nfca_psl_req *)skb->data;
+
+	if (skb->len < sizeof(struct st21nfca_psl_req)) {
+		r =3D -EIO;
+		goto exit;
+	}
+
+	r =3D st21nfca_tm_send_psl_res(hdev, psl_req);
+exit:
+	return r;
+}
+
+int st21nfca_tm_send_dep_res(struct nfc_hci_dev *hdev, struct sk_buff =
*skb)
+{
+	int r;
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	*skb_push(skb, 1) =3D info->dep_info.curr_nfc_dep_pni;
+	*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_DEP_RES;
+	*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_RES;
+	*skb_push(skb, 1) =3D skb->len;
+
+	r =3D nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
+			ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
+	kfree_skb(skb);
+
+	return r;
+}
+EXPORT_SYMBOL(st21nfca_tm_send_dep_res);
+
+static int st21nfca_tm_recv_dep_req(struct nfc_hci_dev *hdev,
+				    struct sk_buff *skb)
+{
+	struct st21nfca_dep_req_res *dep_req;
+	u8 size;
+	int r;
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	skb_trim(skb, skb->len - 1);
+
+	size =3D 4;
+
+	dep_req =3D (struct st21nfca_dep_req_res *)skb->data;
+	if (skb->len < size) {
+		r =3D -EIO;
+		goto exit;
+	}
+
+	if (ST21NFCA_NFC_DEP_DID_BIT_SET(dep_req->pfb))
+		size++;
+	if (ST21NFCA_NFC_DEP_NAD_BIT_SET(dep_req->pfb))
+		size++;
+
+	if (skb->len < size) {
+		r =3D -EIO;
+		goto exit;
+	}
+
+	/* Receiving DEP_REQ - Decoding */
+	switch (ST21NFCA_NFC_DEP_PFB_TYPE(dep_req->pfb)) {
+	case ST21NFCA_NFC_DEP_PFB_I_PDU:
+		info->dep_info.curr_nfc_dep_pni =3D
+				ST21NFCA_NFC_DEP_PFB_PNI(dep_req->pfb);
+		break;
+	case ST21NFCA_NFC_DEP_PFB_ACK_NACK_PDU:
+		pr_err("Received a ACK/NACK PDU\n");
+		break;
+	case ST21NFCA_NFC_DEP_PFB_SUPERVISOR_PDU:
+		pr_err("Received a SUPERVISOR PDU\n");
+		break;
+	}
+
+	skb_pull(skb, size);
+
+	return nfc_tm_data_received(hdev->ndev, skb);
+exit:
+	return r;
+}
+
+static int st21nfca_tm_event_send_data(struct nfc_hci_dev *hdev,
+				struct sk_buff *skb)
+{
+	u8 cmd0, cmd1;
+	int r;
+
+	cmd0 =3D skb->data[1];
+	switch (cmd0) {
+	case ST21NFCA_NFCIP1_REQ:
+		cmd1 =3D skb->data[2];
+		switch (cmd1) {
+		case ST21NFCA_NFCIP1_ATR_REQ:
+			r =3D st21nfca_tm_recv_atr_req(hdev, skb);
+			break;
+		case ST21NFCA_NFCIP1_PSL_REQ:
+			r =3D st21nfca_tm_recv_psl_req(hdev, skb);
+			break;
+		case ST21NFCA_NFCIP1_DEP_REQ:
+			r =3D st21nfca_tm_recv_dep_req(hdev, skb);
+			break;
+		default:
+			return 1;
+		}
+	default:
+		return 1;
+	}
+	return r;
+}
+
+/*
+ * Returns:
+ * <=3D 0: driver handled the event, skb consumed
+ *    1: driver does not handle the event, please do standard processi=
ng
+ */
+int st21nfca_dep_event_received(struct nfc_hci_dev *hdev,
+				u8 event, struct sk_buff *skb)
+{
+	int r =3D 0;
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	pr_debug("dep event: %d\n", event);
+
+	switch (event) {
+	case ST21NFCA_EVT_CARD_ACTIVATED:
+		info->dep_info.curr_nfc_dep_pni =3D 0;
+		break;
+	case ST21NFCA_EVT_CARD_DEACTIVATED:
+		break;
+	case ST21NFCA_EVT_FIELD_ON:
+		break;
+	case ST21NFCA_EVT_FIELD_OFF:
+		break;
+	case ST21NFCA_EVT_SEND_DATA:
+		r =3D st21nfca_tm_event_send_data(hdev, skb);
+		if (r < 0)
+			return r;
+		return 0;
+	default:
+		return 1;
+	}
+	kfree_skb(skb);
+	return r;
+}
+EXPORT_SYMBOL(st21nfca_dep_event_received);
+
+static void st21nfca_im_send_psl_req(struct nfc_hci_dev *hdev, u8 did,=
 u8 bsi,
+				     u8 bri, u8 lri)
+{
+	struct sk_buff *skb;
+	struct st21nfca_psl_req *psl_req;
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	skb =3D
+	    alloc_skb(sizeof(struct st21nfca_psl_req) + 1, GFP_KERNEL);
+	if (!skb)
+		return;
+	skb_reserve(skb, 1);
+
+	skb_put(skb, sizeof(struct st21nfca_psl_req));
+	psl_req =3D (struct st21nfca_psl_req *) skb->data;
+
+	psl_req->length =3D sizeof(struct st21nfca_psl_req);
+	psl_req->cmd0 =3D ST21NFCA_NFCIP1_REQ;
+	psl_req->cmd1 =3D ST21NFCA_NFCIP1_PSL_REQ;
+	psl_req->did =3D did;
+	psl_req->brs =3D (0x30 & bsi << 4) | (bri & 0x03);
+	psl_req->fsl =3D lri;
+
+	*skb_push(skb, 1) =3D info->dep_info.to | 0x10;
+
+	st21nfca_im_send_pdu(info, skb);
+}
+
+#define ST21NFCA_CB_TYPE_READER_F 1
+static void st21nfca_im_recv_atr_res_cb(void *context, struct sk_buff =
*skb,
+					int err)
+{
+	struct st21nfca_hci_info *info =3D context;
+	struct st21nfca_atr_res *atr_res;
+	int r;
+
+	if (err !=3D 0)
+		return;
+
+	if (!skb)
+		return;
+
+	switch (info->async_cb_type) {
+	case ST21NFCA_CB_TYPE_READER_F:
+		skb_trim(skb, skb->len - 1);
+		atr_res =3D (struct st21nfca_atr_res *)skb->data;
+		r =3D nfc_set_remote_general_bytes(info->hdev->ndev,
+				atr_res->gbi,
+				skb->len - sizeof(struct st21nfca_atr_res));
+		if (r < 0)
+			return;
+
+		if (atr_res->to >=3D 0x0e)
+			info->dep_info.to =3D 0x0e;
+		else
+			info->dep_info.to =3D atr_res->to + 1;
+
+		info->dep_info.to |=3D 0x10;
+
+		r =3D nfc_dep_link_is_up(info->hdev->ndev, info->dep_info.idx,
+					NFC_COMM_PASSIVE, NFC_RF_INITIATOR);
+		if (r < 0)
+			return;
+
+		info->dep_info.curr_nfc_dep_pni =3D 0;
+		if (ST21NFCA_PP2LRI(atr_res->ppi) !=3D info->dep_info.lri)
+			st21nfca_im_send_psl_req(info->hdev, atr_res->did,
+						atr_res->bsi, atr_res->bri,
+						ST21NFCA_PP2LRI(atr_res->ppi));
+		break;
+	default:
+		kfree_skb(skb);
+		break;
+	}
+}
+
+int st21nfca_im_send_atr_req(struct nfc_hci_dev *hdev, u8 *gb, size_t =
gb_len)
+{
+	struct sk_buff *skb;
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+	struct st21nfca_atr_req *atr_req;
+	struct nfc_target *target;
+	uint size;
+
+	info->dep_info.to =3D ST21NFCA_DEFAULT_TIMEOUT;
+	size =3D ST21NFCA_ATR_REQ_MIN_SIZE + gb_len;
+	if (size > ST21NFCA_ATR_REQ_MAX_SIZE) {
+		PROTOCOL_ERR("14.6.1.1");
+		return -EINVAL;
+	}
+
+	skb =3D
+	    alloc_skb(sizeof(struct st21nfca_atr_req) + gb_len + 1, GFP_KERNE=
L);
+	if (!skb)
+		return -ENOMEM;
+
+	skb_reserve(skb, 1);
+
+	skb_put(skb, sizeof(struct st21nfca_atr_req));
+
+	atr_req =3D (struct st21nfca_atr_req *)skb->data;
+	memset(atr_req, 0, sizeof(struct st21nfca_atr_req));
+
+	atr_req->cmd0 =3D ST21NFCA_NFCIP1_REQ;
+	atr_req->cmd1 =3D ST21NFCA_NFCIP1_ATR_REQ;
+	memset(atr_req->nfcid3, 0, NFC_NFCID3_MAXSIZE);
+	target =3D hdev->ndev->targets;
+
+	if (target->sensf_res_len > 0)
+		memcpy(atr_req->nfcid3, target->sensf_res,
+				target->sensf_res_len);
+	else
+		get_random_bytes(atr_req->nfcid3, NFC_NFCID3_MAXSIZE);
+
+	atr_req->did =3D 0x0;
+
+	atr_req->bsi =3D 0x00;
+	atr_req->bri =3D 0x00;
+	atr_req->ppi =3D ST21NFCA_LR_BITS_PAYLOAD_SIZE_254B;
+	if (gb_len) {
+		atr_req->ppi |=3D ST21NFCA_GB_BIT;
+		memcpy(skb_put(skb, gb_len), gb, gb_len);
+	}
+	atr_req->length =3D sizeof(struct st21nfca_atr_req) + hdev->gb_len;
+
+	*skb_push(skb, 1) =3D info->dep_info.to | 0x10; /* timeout */
+
+	info->async_cb_type =3D ST21NFCA_CB_TYPE_READER_F;
+	info->async_cb_context =3D info;
+	info->async_cb =3D st21nfca_im_recv_atr_res_cb;
+	info->dep_info.bri =3D atr_req->bri;
+	info->dep_info.bsi =3D atr_req->bsi;
+	info->dep_info.lri =3D ST21NFCA_PP2LRI(atr_req->ppi);
+
+	return nfc_hci_send_cmd_async(hdev, ST21NFCA_RF_READER_F_GATE,
+				ST21NFCA_WR_XCHG_DATA, skb->data,
+				skb->len, info->async_cb, info);
+}
+EXPORT_SYMBOL(st21nfca_im_send_atr_req);
+
+static void st21nfca_im_recv_dep_res_cb(void *context, struct sk_buff =
*skb,
+					int err)
+{
+	struct st21nfca_hci_info *info =3D context;
+	struct st21nfca_dep_req_res *dep_res;
+
+	int size;
+
+	if (err !=3D 0)
+		return;
+
+	if (!skb)
+		return;
+
+	switch (info->async_cb_type) {
+	case ST21NFCA_CB_TYPE_READER_F:
+		dep_res =3D (struct st21nfca_dep_req_res *)skb->data;
+
+		size =3D 3;
+		if (skb->len < size)
+			goto exit;
+
+		if (ST21NFCA_NFC_DEP_DID_BIT_SET(dep_res->pfb))
+			size++;
+		if (ST21NFCA_NFC_DEP_NAD_BIT_SET(dep_res->pfb))
+			size++;
+
+		if (skb->len < size)
+			goto exit;
+
+		skb_trim(skb, skb->len - 1);
+
+		/* Receiving DEP_REQ - Decoding */
+		switch (ST21NFCA_NFC_DEP_PFB_TYPE(dep_res->pfb)) {
+		case ST21NFCA_NFC_DEP_PFB_ACK_NACK_PDU:
+			pr_err("Received a ACK/NACK PDU\n");
+		case ST21NFCA_NFC_DEP_PFB_I_PDU:
+			info->dep_info.curr_nfc_dep_pni =3D
+			    ST21NFCA_NFC_DEP_PFB_PNI(dep_res->pfb + 1);
+			size++;
+			skb_pull(skb, size);
+			nfc_tm_data_received(info->hdev->ndev, skb);
+			break;
+		case ST21NFCA_NFC_DEP_PFB_SUPERVISOR_PDU:
+			pr_err("Received a SUPERVISOR PDU\n");
+			skb_pull(skb, size);
+			*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_DEP_REQ;
+			*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_REQ;
+			*skb_push(skb, 1) =3D skb->len;
+			*skb_push(skb, 1) =3D info->dep_info.to | 0x10;
+
+			st21nfca_im_send_pdu(info, skb);
+			break;
+		}
+
+		return;
+	default:
+		break;
+	}
+
+exit:
+	kfree_skb(skb);
+}
+
+int st21nfca_im_send_dep_req(struct nfc_hci_dev *hdev, struct sk_buff =
*skb)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	info->async_cb_type =3D ST21NFCA_CB_TYPE_READER_F;
+	info->async_cb_context =3D info;
+	info->async_cb =3D st21nfca_im_recv_dep_res_cb;
+
+	*skb_push(skb, 1) =3D info->dep_info.curr_nfc_dep_pni;
+	*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_DEP_REQ;
+	*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_REQ;
+	*skb_push(skb, 1) =3D skb->len;
+
+	*skb_push(skb, 1) =3D info->dep_info.to | 0x10;
+
+	return nfc_hci_send_cmd_async(hdev, ST21NFCA_RF_READER_F_GATE,
+				      ST21NFCA_WR_XCHG_DATA,
+				      skb->data, skb->len,
+				      info->async_cb, info);
+}
+EXPORT_SYMBOL(st21nfca_im_send_dep_req);
+
+void st21nfca_dep_init(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	INIT_WORK(&info->dep_info.tx_work, st21nfca_tx_work);
+	info->dep_info.curr_nfc_dep_pni =3D 0;
+	info->dep_info.idx =3D 0;
+	info->dep_info.to =3D ST21NFCA_DEFAULT_TIMEOUT;
+}
+EXPORT_SYMBOL(st21nfca_dep_init);
+
+void st21nfca_dep_deinit(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	cancel_work_sync(&info->dep_info.tx_work);
+}
+EXPORT_SYMBOL(st21nfca_dep_deinit);
diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
new file mode 100644
index 0000000..6aa4e34
--- /dev/null
+++ b/drivers/nfc/st21nfca/se.c
@@ -0,0 +1,419 @@
+/*
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
+#include <net/nfc/hci.h>
+
+#include "st21nfca.h"
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
+ * WT =3D 2^BWI/10[s], convert into msecs and add a secure
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
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	/* Bits 8 to 5 of the first TB for T=3D1 encode BWI from zero to nine=
 */
+	for (i =3D 1; i < ST21NFCA_ESE_MAX_LENGTH; i++) {
+		td =3D ST21NFCA_ATR_GET_Y_FROM_TD(info->se_info.atr[i]);
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
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	r =3D nfc_hci_get_param(hdev, ST21NFCA_APDU_READER_GATE,
+			ST21NFCA_PARAM_ATR, &skb);
+	if (r < 0)
+		return;
+
+	if (skb->len <=3D ST21NFCA_ESE_MAX_LENGTH) {
+		memcpy(info->se_info.atr, skb->data, skb->len);
+		info->se_info.wt_timeout =3D
+			ST21NFCA_BWI_TO_TIMEOUT(st21nfca_se_get_bwi(hdev));
+	}
+	kfree_skb(skb);
+}
+
+static int st21nfca_hci_control_se(struct nfc_hci_dev *hdev, u32 se_id=
x,
+				u8 state)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+	int r;
+	struct sk_buff *sk_host_list;
+	u8 se_event, host_id;
+
+	switch (se_idx) {
+	case NFC_HCI_UICC_HOST_ID:
+		se_event =3D (state =3D=3D ST21NFCA_SE_MODE_ON ?
+					ST21NFCA_EVT_UICC_ACTIVATE :
+					ST21NFCA_EVT_UICC_DEACTIVATE);
+
+		info->se_info.count_pipes =3D 0;
+		info->se_info.expected_pipes =3D ST21NFCA_SE_COUNT_PIPE_UICC;
+		break;
+	case ST21NFCA_ESE_HOST_ID:
+		se_event =3D (state =3D=3D ST21NFCA_SE_MODE_ON ?
+					ST21NFCA_EVT_SE_ACTIVATE :
+					ST21NFCA_EVT_SE_DEACTIVATE);
+
+		info->se_info.count_pipes =3D 0;
+		info->se_info.expected_pipes =3D ST21NFCA_SE_COUNT_PIPE_EMBEDDED;
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
+	r =3D nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE, se_event,
+			       NULL, 0);
+	if (r < 0)
+		return r;
+
+	mod_timer(&info->se_info.se_active_timer, jiffies +
+		msecs_to_jiffies(ST21NFCA_SE_TO_HOT_PLUG));
+	info->se_info.se_active =3D true;
+
+	/* Ignore return value and check in any case the host_list */
+	wait_for_completion_interruptible(&info->se_info.req_completion);
+
+	r =3D nfc_hci_get_param(hdev, NFC_HCI_ADMIN_GATE,
+			NFC_HCI_ADMIN_HOST_LIST,
+			&sk_host_list);
+	if (r < 0)
+		return r;
+
+	host_id =3D sk_host_list->data[sk_host_list->len - 1];
+	kfree_skb(sk_host_list);
+
+	if (state =3D=3D ST21NFCA_SE_MODE_ON && host_id =3D=3D se_idx)
+		return se_idx;
+	else if (state =3D=3D ST21NFCA_SE_MODE_OFF && host_id !=3D se_idx)
+		return se_idx;
+
+	return -1;
+}
+
+int st21nfca_hci_discover_se(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+	int se_count =3D 0;
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
+	 * According to upper layer, se_idx =3D=3D NFC_SE_UICC when
+	 * info->se_status->is_uicc_enable is true should never happen.
+	 * Same for eSE.
+	 */
+	r =3D st21nfca_hci_control_se(hdev, se_idx, ST21NFCA_SE_MODE_ON);
+
+	if (r =3D=3D ST21NFCA_ESE_HOST_ID) {
+		st21nfca_se_get_atr(hdev);
+		r =3D nfc_hci_send_event(hdev, ST21NFCA_APDU_READER_GATE,
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
+	 * According to upper layer, se_idx =3D=3D NFC_SE_UICC when
+	 * info->se_status->is_uicc_enable is true should never happen
+	 * Same for eSE.
+	 */
+	r =3D st21nfca_hci_control_se(hdev, se_idx, ST21NFCA_SE_MODE_OFF);
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
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	pr_debug("se_io %x\n", se_idx);
+
+	switch (se_idx) {
+	case ST21NFCA_ESE_HOST_ID:
+		info->se_info.cb =3D cb;
+		info->se_info.cb_context =3D cb_context;
+		mod_timer(&info->se_info.bwi_timer, jiffies +
+			  msecs_to_jiffies(info->se_info.wt_timeout));
+		info->se_info.bwi_active =3D true;
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
+	u8 param =3D 0x01;
+	struct st21nfca_hci_info *info =3D (struct st21nfca_hci_info *) data;
+
+	pr_debug("\n");
+
+	info->se_info.bwi_active =3D false;
+
+	if (!info->se_info.xch_error) {
+		info->se_info.xch_error =3D true;
+		nfc_hci_send_event(info->hdev, ST21NFCA_APDU_READER_GATE,
+				ST21NFCA_EVT_SE_SOFT_RESET, NULL, 0);
+	} else {
+		info->se_info.xch_error =3D false;
+		nfc_hci_send_event(info->hdev, ST21NFCA_DEVICE_MGNT_GATE,
+				ST21NFCA_EVT_SE_HARD_RESET, &param, 1);
+	}
+	info->se_info.cb(info->se_info.cb_context, NULL, 0, -ETIME);
+}
+
+static void st21nfca_se_activation_timeout(unsigned long data)
+{
+	struct st21nfca_hci_info *info =3D (struct st21nfca_hci_info *) data;
+
+	pr_debug("\n");
+
+	info->se_info.se_active =3D false;
+
+	complete(&info->se_info.req_completion);
+}
+
+/*
+ * Returns:
+ * <=3D 0: driver handled the event, skb consumed
+ *    1: driver does not handle the event, please do standard processi=
ng
+ */
+int st21nfca_connectivity_event_received(struct nfc_hci_dev *hdev, u8 =
host,
+				u8 event, struct sk_buff *skb)
+{
+	int r =3D 0;
+	struct device *dev =3D &hdev->ndev->dev;
+	struct nfc_evt_transaction *transaction;
+
+	pr_debug("connectivity gate event: %x\n", event);
+
+	switch (event) {
+	case ST21NFCA_EVT_CONNECTIVITY:
+		break;
+	case ST21NFCA_EVT_TRANSACTION:
+		/*
+		 * According to specification etsi 102 622
+		 * 11.2.2.4 EVT_TRANSACTION Table 52
+		 * Description	Tag	Length
+		 * AID		81	5 to 16
+		 * PARAMETERS	82	0 to 255
+		 */
+		if (skb->len < NFC_MIN_AID_LENGTH + 2 &&
+		    skb->data[0] !=3D NFC_EVT_TRANSACTION_AID_TAG)
+			return -EPROTO;
+
+		transaction =3D (struct nfc_evt_transaction *)devm_kzalloc(dev,
+						   skb->len - 2, GFP_KERNEL);
+
+		transaction->aid_len =3D skb->data[1];
+		memcpy(transaction->aid, &skb->data[2],
+		       transaction->aid_len);
+
+		/* Check next byte is PARAMETERS tag (82) */
+		if (skb->data[transaction->aid_len + 2] !=3D
+		    NFC_EVT_TRANSACTION_PARAMS_TAG)
+			return -EPROTO;
+
+		transaction->params_len =3D skb->data[transaction->aid_len + 3];
+		memcpy(transaction->params, skb->data +
+		       transaction->aid_len + 4, transaction->params_len);
+
+		r =3D nfc_se_transaction(hdev->ndev, host, transaction);
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
+	int r =3D 0;
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	pr_debug("apdu reader gate event: %x\n", event);
+
+	switch (event) {
+	case ST21NFCA_EVT_TRANSMIT_DATA:
+		del_timer_sync(&info->se_info.bwi_timer);
+		info->se_info.bwi_active =3D false;
+		r =3D nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE,
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
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	init_completion(&info->se_info.req_completion);
+	/* initialize timers */
+	init_timer(&info->se_info.bwi_timer);
+	info->se_info.bwi_timer.data =3D (unsigned long)info;
+	info->se_info.bwi_timer.function =3D st21nfca_se_wt_timeout;
+	info->se_info.bwi_active =3D false;
+
+	init_timer(&info->se_info.se_active_timer);
+	info->se_info.se_active_timer.data =3D (unsigned long)info;
+	info->se_info.se_active_timer.function =3D st21nfca_se_activation_tim=
eout;
+	info->se_info.se_active =3D false;
+
+	info->se_info.count_pipes =3D 0;
+	info->se_info.expected_pipes =3D 0;
+
+	info->se_info.xch_error =3D false;
+
+	info->se_info.wt_timeout =3D
+			ST21NFCA_BWI_TO_TIMEOUT(ST21NFCA_ATR_DEFAULT_BWI);
+}
+EXPORT_SYMBOL(st21nfca_se_init);
+
+void st21nfca_se_deinit(struct nfc_hci_dev *hdev)
+{
+	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
+
+	if (info->se_info.bwi_active)
+		del_timer_sync(&info->se_info.bwi_timer);
+	if (info->se_info.se_active)
+		del_timer_sync(&info->se_info.se_active_timer);
+
+	info->se_info.bwi_active =3D false;
+	info->se_info.se_active =3D false;
+}
+EXPORT_SYMBOL(st21nfca_se_deinit);
diff --git a/drivers/nfc/st21nfca/st21nfca.c b/drivers/nfc/st21nfca/st2=
1nfca.c
deleted file mode 100644
index 0512865..0000000
--- a/drivers/nfc/st21nfca/st21nfca.c
+++ /dev/null
@@ -1,1064 +0,0 @@
-/*
- * HCI based Driver for STMicroelectronics NFC Chip
- *
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#include <linux/module.h>
-#include <linux/nfc.h>
-#include <net/nfc/hci.h>
-#include <net/nfc/llc.h>
-
-#include "st21nfca.h"
-#include "st21nfca_dep.h"
-#include "st21nfca_se.h"
-
-#define DRIVER_DESC "HCI NFC driver for ST21NFCA"
-
-#define FULL_VERSION_LEN 3
-
-/* Proprietary gates, events, commands and registers */
-
-/* Commands that apply to all RF readers */
-#define ST21NFCA_RF_READER_CMD_PRESENCE_CHECK	0x30
-
-#define ST21NFCA_RF_READER_ISO15693_GATE	0x12
-#define ST21NFCA_RF_READER_ISO15693_INVENTORY	0x01
-
-/*
- * Reader gate for communication with contact-less cards using Type A
- * protocol ISO14443-3 but not compliant with ISO14443-4
- */
-#define ST21NFCA_RF_READER_14443_3_A_GATE	0x15
-#define ST21NFCA_RF_READER_14443_3_A_UID	0x02
-#define ST21NFCA_RF_READER_14443_3_A_ATQA	0x03
-#define ST21NFCA_RF_READER_14443_3_A_SAK	0x04
-
-#define ST21NFCA_RF_READER_F_DATARATE		0x01
-#define ST21NFCA_RF_READER_F_DATARATE_106	0x01
-#define ST21NFCA_RF_READER_F_DATARATE_212	0x02
-#define ST21NFCA_RF_READER_F_DATARATE_424	0x04
-#define ST21NFCA_RF_READER_F_POL_REQ		0x02
-#define ST21NFCA_RF_READER_F_POL_REQ_DEFAULT	0xffff0000
-#define ST21NFCA_RF_READER_F_NFCID2		0x03
-#define ST21NFCA_RF_READER_F_NFCID1		0x04
-
-#define ST21NFCA_RF_CARD_F_MODE			0x01
-#define ST21NFCA_RF_CARD_F_NFCID2_LIST		0x04
-#define ST21NFCA_RF_CARD_F_NFCID1		0x05
-#define ST21NFCA_RF_CARD_F_SENS_RES		0x06
-#define ST21NFCA_RF_CARD_F_SEL_RES		0x07
-#define ST21NFCA_RF_CARD_F_DATARATE		0x08
-#define ST21NFCA_RF_CARD_F_DATARATE_212_424	0x01
-
-#define ST21NFCA_DEVICE_MGNT_PIPE		0x02
-
-#define ST21NFCA_DM_GETINFO			0x13
-#define ST21NFCA_DM_GETINFO_PIPE_LIST		0x02
-#define ST21NFCA_DM_GETINFO_PIPE_INFO		0x01
-#define ST21NFCA_DM_PIPE_CREATED		0x02
-#define ST21NFCA_DM_PIPE_OPEN			0x04
-#define ST21NFCA_DM_RF_ACTIVE			0x80
-#define ST21NFCA_DM_DISCONNECT			0x30
-
-#define ST21NFCA_DM_IS_PIPE_OPEN(p) \
-	((p & 0x0f) =3D=3D (ST21NFCA_DM_PIPE_CREATED | ST21NFCA_DM_PIPE_OPEN)=
)
-
-#define ST21NFCA_NFC_MODE			0x03	/* NFC_MODE parameter*/
-
-#define ST21NFCA_EVT_HOT_PLUG			0x03
-#define ST21NFCA_EVT_HOT_PLUG_IS_INHIBITED(x) (x->data[0] & 0x80)
-
-#define ST21NFCA_SE_TO_PIPES			2000
-
-static DECLARE_BITMAP(dev_mask, ST21NFCA_NUM_DEVICES);
-
-static struct nfc_hci_gate st21nfca_gates[] =3D {
-	{NFC_HCI_ADMIN_GATE, NFC_HCI_ADMIN_PIPE},
-	{NFC_HCI_LOOPBACK_GATE, NFC_HCI_INVALID_PIPE},
-	{NFC_HCI_ID_MGMT_GATE, NFC_HCI_INVALID_PIPE},
-	{NFC_HCI_LINK_MGMT_GATE, NFC_HCI_LINK_MGMT_PIPE},
-	{NFC_HCI_RF_READER_B_GATE, NFC_HCI_INVALID_PIPE},
-	{NFC_HCI_RF_READER_A_GATE, NFC_HCI_INVALID_PIPE},
-	{ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_DEVICE_MGNT_PIPE},
-	{ST21NFCA_RF_READER_F_GATE, NFC_HCI_INVALID_PIPE},
-	{ST21NFCA_RF_READER_14443_3_A_GATE, NFC_HCI_INVALID_PIPE},
-	{ST21NFCA_RF_READER_ISO15693_GATE, NFC_HCI_INVALID_PIPE},
-	{ST21NFCA_RF_CARD_F_GATE, NFC_HCI_INVALID_PIPE},
-
-	/* Secure element pipes are created by secure element host */
-	{ST21NFCA_CONNECTIVITY_GATE, NFC_HCI_DO_NOT_CREATE_PIPE},
-	{ST21NFCA_APDU_READER_GATE, NFC_HCI_DO_NOT_CREATE_PIPE},
-};
-
-struct st21nfca_pipe_info {
-	u8 pipe_state;
-	u8 src_host_id;
-	u8 src_gate_id;
-	u8 dst_host_id;
-	u8 dst_gate_id;
-} __packed;
-
-/* Largest headroom needed for outgoing custom commands */
-#define ST21NFCA_CMDS_HEADROOM  7
-
-static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
-{
-	int i, j, r;
-	struct sk_buff *skb_pipe_list, *skb_pipe_info;
-	struct st21nfca_pipe_info *info;
-
-	u8 pipe_list[] =3D { ST21NFCA_DM_GETINFO_PIPE_LIST,
-		NFC_HCI_TERMINAL_HOST_ID
-	};
-	u8 pipe_info[] =3D { ST21NFCA_DM_GETINFO_PIPE_INFO,
-		NFC_HCI_TERMINAL_HOST_ID, 0
-	};
-
-	/* On ST21NFCA device pipes number are dynamics
-	 * A maximum of 16 pipes can be created at the same time
-	 * If pipes are already created, hci_dev_up will fail.
-	 * Doing a clear all pipe is a bad idea because:
-	 * - It does useless EEPROM cycling
-	 * - It might cause issue for secure elements support
-	 * (such as removing connectivity or APDU reader pipe)
-	 * A better approach on ST21NFCA is to:
-	 * - get a pipe list for each host.
-	 * (eg: NFC_HCI_HOST_CONTROLLER_ID for now).
-	 * (TODO Later on UICC HOST and eSE HOST)
-	 * - get pipe information
-	 * - match retrieved pipe list in st21nfca_gates
-	 * ST21NFCA_DEVICE_MGNT_GATE is a proprietary gate
-	 * with ST21NFCA_DEVICE_MGNT_PIPE.
-	 * Pipe can be closed and need to be open.
-	 */
-	r =3D nfc_hci_connect_gate(hdev, NFC_HCI_HOST_CONTROLLER_ID,
-				ST21NFCA_DEVICE_MGNT_GATE,
-				ST21NFCA_DEVICE_MGNT_PIPE);
-	if (r < 0)
-		return r;
-
-	/* Get pipe list */
-	r =3D nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
-			ST21NFCA_DM_GETINFO, pipe_list, sizeof(pipe_list),
-			&skb_pipe_list);
-	if (r < 0)
-		return r;
-
-	/* Complete the existing gate_pipe table */
-	for (i =3D 0; i < skb_pipe_list->len; i++) {
-		pipe_info[2] =3D skb_pipe_list->data[i];
-		r =3D nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
-					ST21NFCA_DM_GETINFO, pipe_info,
-					sizeof(pipe_info), &skb_pipe_info);
-
-		if (r)
-			continue;
-
-		/*
-		 * Match pipe ID and gate ID
-		 * Output format from ST21NFC_DM_GETINFO is:
-		 * - pipe state (1byte)
-		 * - source hid (1byte)
-		 * - source gid (1byte)
-		 * - destination hid (1byte)
-		 * - destination gid (1byte)
-		 */
-		info =3D (struct st21nfca_pipe_info *) skb_pipe_info->data;
-		if (info->dst_gate_id =3D=3D ST21NFCA_APDU_READER_GATE &&
-			info->src_host_id !=3D ST21NFCA_ESE_HOST_ID) {
-			pr_err("Unexpected apdu_reader pipe on host %x\n",
-				info->src_host_id);
-			kfree_skb(skb_pipe_info);
-			continue;
-		}
-
-		for (j =3D 0; (j < ARRAY_SIZE(st21nfca_gates)) &&
-			(st21nfca_gates[j].gate !=3D info->dst_gate_id) ; j++)
-			;
-
-		if (j < ARRAY_SIZE(st21nfca_gates) &&
-			st21nfca_gates[j].gate =3D=3D info->dst_gate_id &&
-			ST21NFCA_DM_IS_PIPE_OPEN(info->pipe_state)) {
-			st21nfca_gates[j].pipe =3D pipe_info[2];
-
-			hdev->gate2pipe[st21nfca_gates[j].gate] =3D
-							st21nfca_gates[j].pipe;
-			hdev->pipes[st21nfca_gates[j].pipe].gate =3D
-							st21nfca_gates[j].gate;
-			hdev->pipes[st21nfca_gates[j].pipe].dest_host =3D
-							info->src_host_id;
-		}
-		kfree_skb(skb_pipe_info);
-	}
-
-	/*
-	 * 3 gates have a well known pipe ID.
-	 * They will never appear in the pipe list
-	 */
-	if (skb_pipe_list->len + 3 < ARRAY_SIZE(st21nfca_gates)) {
-		for (i =3D skb_pipe_list->len + 3;
-				i < ARRAY_SIZE(st21nfca_gates) - 2; i++) {
-			r =3D nfc_hci_connect_gate(hdev,
-					NFC_HCI_HOST_CONTROLLER_ID,
-					st21nfca_gates[i].gate,
-					st21nfca_gates[i].pipe);
-			if (r < 0)
-				goto free_list;
-		}
-	}
-
-	memcpy(hdev->init_data.gates, st21nfca_gates, sizeof(st21nfca_gates))=
;
-free_list:
-	kfree_skb(skb_pipe_list);
-	return r;
-}
-
-static int st21nfca_hci_open(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-	int r;
-
-	mutex_lock(&info->info_lock);
-
-	if (info->state !=3D ST21NFCA_ST_COLD) {
-		r =3D -EBUSY;
-		goto out;
-	}
-
-	r =3D info->phy_ops->enable(info->phy_id);
-
-	if (r =3D=3D 0)
-		info->state =3D ST21NFCA_ST_READY;
-
-out:
-	mutex_unlock(&info->info_lock);
-	return r;
-}
-
-static void st21nfca_hci_close(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	mutex_lock(&info->info_lock);
-
-	if (info->state =3D=3D ST21NFCA_ST_COLD)
-		goto out;
-
-	info->phy_ops->disable(info->phy_id);
-	info->state =3D ST21NFCA_ST_COLD;
-
-out:
-	mutex_unlock(&info->info_lock);
-}
-
-static int st21nfca_hci_ready(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-	struct sk_buff *skb;
-
-	u8 param;
-	u8 white_list[2];
-	int wl_size =3D 0;
-	int r;
-
-	if (info->se_status->is_ese_present &&
-		info->se_status->is_uicc_present) {
-		white_list[wl_size++] =3D NFC_HCI_UICC_HOST_ID;
-		white_list[wl_size++] =3D ST21NFCA_ESE_HOST_ID;
-	} else if (!info->se_status->is_ese_present &&
-			 info->se_status->is_uicc_present) {
-		white_list[wl_size++] =3D NFC_HCI_UICC_HOST_ID;
-	} else if (info->se_status->is_ese_present &&
-			!info->se_status->is_uicc_present) {
-		white_list[wl_size++] =3D ST21NFCA_ESE_HOST_ID;
-	}
-
-	if (wl_size) {
-		r =3D nfc_hci_set_param(hdev, NFC_HCI_ADMIN_GATE,
-					NFC_HCI_ADMIN_WHITELIST,
-					(u8 *) &white_list, wl_size);
-		if (r < 0)
-			return r;
-	}
-
-	/* Set NFC_MODE in device management gate to enable */
-	r =3D nfc_hci_get_param(hdev, ST21NFCA_DEVICE_MGNT_GATE,
-			      ST21NFCA_NFC_MODE, &skb);
-	if (r < 0)
-		return r;
-
-	param =3D skb->data[0];
-	kfree_skb(skb);
-	if (param =3D=3D 0) {
-		param =3D 1;
-
-		r =3D nfc_hci_set_param(hdev, ST21NFCA_DEVICE_MGNT_GATE,
-					ST21NFCA_NFC_MODE, &param, 1);
-		if (r < 0)
-			return r;
-	}
-
-	r =3D nfc_hci_send_event(hdev, NFC_HCI_RF_READER_A_GATE,
-			       NFC_HCI_EVT_END_OPERATION, NULL, 0);
-	if (r < 0)
-		return r;
-
-	r =3D nfc_hci_get_param(hdev, NFC_HCI_ID_MGMT_GATE,
-			      NFC_HCI_ID_MGMT_VERSION_SW, &skb);
-	if (r < 0)
-		return r;
-
-	if (skb->len !=3D FULL_VERSION_LEN) {
-		kfree_skb(skb);
-		return -EINVAL;
-	}
-
-	print_hex_dump(KERN_DEBUG, "FULL VERSION SOFTWARE INFO: ",
-		       DUMP_PREFIX_NONE, 16, 1,
-		       skb->data, FULL_VERSION_LEN, false);
-
-	kfree_skb(skb);
-
-	return 0;
-}
-
-static int st21nfca_hci_xmit(struct nfc_hci_dev *hdev, struct sk_buff =
*skb)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	return info->phy_ops->write(info->phy_id, skb);
-}
-
-static int st21nfca_hci_start_poll(struct nfc_hci_dev *hdev,
-				   u32 im_protocols, u32 tm_protocols)
-{
-	int r;
-	u32 pol_req;
-	u8 param[19];
-	struct sk_buff *datarate_skb;
-
-	pr_info(DRIVER_DESC ": %s protocols 0x%x 0x%x\n",
-		__func__, im_protocols, tm_protocols);
-
-	r =3D nfc_hci_send_event(hdev, NFC_HCI_RF_READER_A_GATE,
-			       NFC_HCI_EVT_END_OPERATION, NULL, 0);
-	if (r < 0)
-		return r;
-	if (im_protocols) {
-		/*
-		 * enable polling according to im_protocols & tm_protocols
-		 * - CLOSE pipe according to im_protocols & tm_protocols
-		 */
-		if ((NFC_HCI_RF_READER_B_GATE & im_protocols) =3D=3D 0) {
-			r =3D nfc_hci_disconnect_gate(hdev,
-					NFC_HCI_RF_READER_B_GATE);
-			if (r < 0)
-				return r;
-		}
-
-		if ((NFC_HCI_RF_READER_A_GATE & im_protocols) =3D=3D 0) {
-			r =3D nfc_hci_disconnect_gate(hdev,
-					NFC_HCI_RF_READER_A_GATE);
-			if (r < 0)
-				return r;
-		}
-
-		if ((ST21NFCA_RF_READER_F_GATE & im_protocols) =3D=3D 0) {
-			r =3D nfc_hci_disconnect_gate(hdev,
-					ST21NFCA_RF_READER_F_GATE);
-			if (r < 0)
-				return r;
-		} else {
-			hdev->gb =3D nfc_get_local_general_bytes(hdev->ndev,
-							       &hdev->gb_len);
-
-			if (hdev->gb =3D=3D NULL || hdev->gb_len =3D=3D 0) {
-				im_protocols &=3D ~NFC_PROTO_NFC_DEP_MASK;
-				tm_protocols &=3D ~NFC_PROTO_NFC_DEP_MASK;
-			}
-
-			param[0] =3D ST21NFCA_RF_READER_F_DATARATE_106 |
-			    ST21NFCA_RF_READER_F_DATARATE_212 |
-			    ST21NFCA_RF_READER_F_DATARATE_424;
-			r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_READER_F_GATE,
-					      ST21NFCA_RF_READER_F_DATARATE,
-					      param, 1);
-			if (r < 0)
-				return r;
-
-			pol_req =3D be32_to_cpu((__force __be32)
-					ST21NFCA_RF_READER_F_POL_REQ_DEFAULT);
-			r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_READER_F_GATE,
-					      ST21NFCA_RF_READER_F_POL_REQ,
-					      (u8 *) &pol_req, 4);
-			if (r < 0)
-				return r;
-		}
-
-		if ((ST21NFCA_RF_READER_14443_3_A_GATE & im_protocols) =3D=3D 0) {
-			r =3D nfc_hci_disconnect_gate(hdev,
-					ST21NFCA_RF_READER_14443_3_A_GATE);
-			if (r < 0)
-				return r;
-		}
-
-		if ((ST21NFCA_RF_READER_ISO15693_GATE & im_protocols) =3D=3D 0) {
-			r =3D nfc_hci_disconnect_gate(hdev,
-					ST21NFCA_RF_READER_ISO15693_GATE);
-			if (r < 0)
-				return r;
-		}
-
-		r =3D nfc_hci_send_event(hdev, NFC_HCI_RF_READER_A_GATE,
-				       NFC_HCI_EVT_READER_REQUESTED, NULL, 0);
-		if (r < 0)
-			nfc_hci_send_event(hdev, NFC_HCI_RF_READER_A_GATE,
-					   NFC_HCI_EVT_END_OPERATION, NULL, 0);
-	}
-
-	if (tm_protocols & NFC_PROTO_NFC_DEP_MASK) {
-		r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_CARD_F_GATE,
-				      ST21NFCA_RF_CARD_F_DATARATE,
-				      &datarate_skb);
-		if (r < 0)
-			return r;
-
-		/* Configure the maximum supported datarate to 424Kbps */
-		if (datarate_skb->len > 0 &&
-		    datarate_skb->data[0] !=3D
-		    ST21NFCA_RF_CARD_F_DATARATE_212_424) {
-			param[0] =3D ST21NFCA_RF_CARD_F_DATARATE_212_424;
-			r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
-					      ST21NFCA_RF_CARD_F_DATARATE,
-					      param, 1);
-			if (r < 0) {
-				kfree_skb(datarate_skb);
-				return r;
-			}
-		}
-		kfree_skb(datarate_skb);
-
-		/*
-		 * Configure sens_res
-		 *
-		 * NFC Forum Digital Spec Table 7:
-		 * NFCID1 size: triple (10 bytes)
-		 */
-		param[0] =3D 0x00;
-		param[1] =3D 0x08;
-		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
-				      ST21NFCA_RF_CARD_F_SENS_RES, param, 2);
-		if (r < 0)
-			return r;
-
-		/*
-		 * Configure sel_res
-		 *
-		 * NFC Forum Digistal Spec Table 17:
-		 * b3 set to 0b (value b7-b6):
-		 * - 10b: Configured for NFC-DEP Protocol
-		 */
-		param[0] =3D 0x40;
-		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
-				      ST21NFCA_RF_CARD_F_SEL_RES, param, 1);
-		if (r < 0)
-			return r;
-
-		/* Configure NFCID1 Random uid */
-		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
-				      ST21NFCA_RF_CARD_F_NFCID1, NULL, 0);
-		if (r < 0)
-			return r;
-
-		/* Configure NFCID2_LIST */
-		/* System Code */
-		param[0] =3D 0x00;
-		param[1] =3D 0x00;
-		/* NFCID2 */
-		param[2] =3D 0x01;
-		param[3] =3D 0xfe;
-		param[4] =3D 'S';
-		param[5] =3D 'T';
-		param[6] =3D 'M';
-		param[7] =3D 'i';
-		param[8] =3D 'c';
-		param[9] =3D 'r';
-		/* 8 byte Pad bytes used for polling respone frame */
-
-		/*
-		 * Configuration byte:
-		 * - bit 0: define the default NFCID2 entry used when the
-		 * system code is equal to 'FFFF'
-		 * - bit 1: use a random value for lowest 6 bytes of
-		 * NFCID2 value
-		 * - bit 2: ignore polling request frame if request code
-		 * is equal to '01'
-		 * - Other bits are RFU
-		 */
-		param[18] =3D 0x01;
-		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
-				      ST21NFCA_RF_CARD_F_NFCID2_LIST, param,
-				      19);
-		if (r < 0)
-			return r;
-
-		param[0] =3D 0x02;
-		r =3D nfc_hci_set_param(hdev, ST21NFCA_RF_CARD_F_GATE,
-				      ST21NFCA_RF_CARD_F_MODE, param, 1);
-	}
-
-	return r;
-}
-
-static void st21nfca_hci_stop_poll(struct nfc_hci_dev *hdev)
-{
-	nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
-			ST21NFCA_DM_DISCONNECT, NULL, 0, NULL);
-}
-
-static int st21nfca_get_iso14443_3_atqa(struct nfc_hci_dev *hdev, u16 =
*atqa)
-{
-	int r;
-	struct sk_buff *atqa_skb =3D NULL;
-
-	r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_14443_3_A_GATE,
-			      ST21NFCA_RF_READER_14443_3_A_ATQA, &atqa_skb);
-	if (r < 0)
-		goto exit;
-
-	if (atqa_skb->len !=3D 2) {
-		r =3D -EPROTO;
-		goto exit;
-	}
-
-	*atqa =3D be16_to_cpu(*(__be16 *) atqa_skb->data);
-
-exit:
-	kfree_skb(atqa_skb);
-	return r;
-}
-
-static int st21nfca_get_iso14443_3_sak(struct nfc_hci_dev *hdev, u8 *s=
ak)
-{
-	int r;
-	struct sk_buff *sak_skb =3D NULL;
-
-	r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_14443_3_A_GATE,
-			      ST21NFCA_RF_READER_14443_3_A_SAK, &sak_skb);
-	if (r < 0)
-		goto exit;
-
-	if (sak_skb->len !=3D 1) {
-		r =3D -EPROTO;
-		goto exit;
-	}
-
-	*sak =3D sak_skb->data[0];
-
-exit:
-	kfree_skb(sak_skb);
-	return r;
-}
-
-static int st21nfca_get_iso14443_3_uid(struct nfc_hci_dev *hdev, u8 *u=
id,
-				       int *len)
-{
-	int r;
-	struct sk_buff *uid_skb =3D NULL;
-
-	r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_14443_3_A_GATE,
-			      ST21NFCA_RF_READER_14443_3_A_UID, &uid_skb);
-	if (r < 0)
-		goto exit;
-
-	if (uid_skb->len =3D=3D 0 || uid_skb->len > NFC_NFCID1_MAXSIZE) {
-		r =3D -EPROTO;
-		goto exit;
-	}
-
-	memcpy(uid, uid_skb->data, uid_skb->len);
-	*len =3D uid_skb->len;
-exit:
-	kfree_skb(uid_skb);
-	return r;
-}
-
-static int st21nfca_get_iso15693_inventory(struct nfc_hci_dev *hdev,
-					   struct nfc_target *target)
-{
-	int r;
-	struct sk_buff *inventory_skb =3D NULL;
-
-	r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_ISO15693_GATE,
-			      ST21NFCA_RF_READER_ISO15693_INVENTORY,
-			      &inventory_skb);
-	if (r < 0)
-		goto exit;
-
-	skb_pull(inventory_skb, 2);
-
-	if (inventory_skb->len =3D=3D 0 ||
-	    inventory_skb->len > NFC_ISO15693_UID_MAXSIZE) {
-		r =3D -EPROTO;
-		goto exit;
-	}
-
-	memcpy(target->iso15693_uid, inventory_skb->data, inventory_skb->len)=
;
-	target->iso15693_dsfid	=3D inventory_skb->data[1];
-	target->is_iso15693 =3D 1;
-exit:
-	kfree_skb(inventory_skb);
-	return r;
-}
-
-static int st21nfca_hci_dep_link_up(struct nfc_hci_dev *hdev,
-				    struct nfc_target *target, u8 comm_mode,
-				    u8 *gb, size_t gb_len)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	info->dep_info.idx =3D target->idx;
-	return st21nfca_im_send_atr_req(hdev, gb, gb_len);
-}
-
-static int st21nfca_hci_dep_link_down(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	info->state =3D ST21NFCA_ST_READY;
-
-	return nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
-				ST21NFCA_DM_DISCONNECT, NULL, 0, NULL);
-}
-
-static int st21nfca_hci_target_from_gate(struct nfc_hci_dev *hdev, u8 =
gate,
-					 struct nfc_target *target)
-{
-	int r, len;
-	u16 atqa;
-	u8 sak;
-	u8 uid[NFC_NFCID1_MAXSIZE];
-
-	switch (gate) {
-	case ST21NFCA_RF_READER_F_GATE:
-		target->supported_protocols =3D NFC_PROTO_FELICA_MASK;
-		break;
-	case ST21NFCA_RF_READER_14443_3_A_GATE:
-		/* ISO14443-3 type 1 or 2 tags */
-		r =3D st21nfca_get_iso14443_3_atqa(hdev, &atqa);
-		if (r < 0)
-			return r;
-		if (atqa =3D=3D 0x000c) {
-			target->supported_protocols =3D NFC_PROTO_JEWEL_MASK;
-			target->sens_res =3D 0x0c00;
-		} else {
-			r =3D st21nfca_get_iso14443_3_sak(hdev, &sak);
-			if (r < 0)
-				return r;
-
-			r =3D st21nfca_get_iso14443_3_uid(hdev, uid, &len);
-			if (r < 0)
-				return r;
-
-			target->supported_protocols =3D
-			    nfc_hci_sak_to_protocol(sak);
-			if (target->supported_protocols =3D=3D 0xffffffff)
-				return -EPROTO;
-
-			target->sens_res =3D atqa;
-			target->sel_res =3D sak;
-			memcpy(target->nfcid1, uid, len);
-			target->nfcid1_len =3D len;
-		}
-
-		break;
-	case ST21NFCA_RF_READER_ISO15693_GATE:
-		target->supported_protocols =3D NFC_PROTO_ISO15693_MASK;
-		r =3D st21nfca_get_iso15693_inventory(hdev, target);
-		if (r < 0)
-			return r;
-		break;
-	default:
-		return -EPROTO;
-	}
-
-	return 0;
-}
-
-static int st21nfca_hci_complete_target_discovered(struct nfc_hci_dev =
*hdev,
-						u8 gate,
-						struct nfc_target *target)
-{
-	int r;
-	struct sk_buff *nfcid_skb =3D NULL;
-
-	if (gate =3D=3D ST21NFCA_RF_READER_F_GATE) {
-		r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_F_GATE,
-				ST21NFCA_RF_READER_F_NFCID2, &nfcid_skb);
-		if (r < 0)
-			goto exit;
-
-		if (nfcid_skb->len > NFC_SENSF_RES_MAXSIZE) {
-			r =3D -EPROTO;
-			goto exit;
-		}
-
-		/*
-		 * - After the recepton of polling response for type F frame
-		 * at 212 or 424 Kbit/s, NFCID2 registry parameters will be
-		 * updated.
-		 * - After the reception of SEL_RES with NFCIP-1 compliant bit
-		 * set for type A frame NFCID1 will be updated
-		 */
-		if (nfcid_skb->len > 0) {
-			/* P2P in type F */
-			memcpy(target->sensf_res, nfcid_skb->data,
-				nfcid_skb->len);
-			target->sensf_res_len =3D nfcid_skb->len;
-			/* NFC Forum Digital Protocol Table 44 */
-			if (target->sensf_res[0] =3D=3D 0x01 &&
-			    target->sensf_res[1] =3D=3D 0xfe)
-				target->supported_protocols =3D
-							NFC_PROTO_NFC_DEP_MASK;
-			else
-				target->supported_protocols =3D
-							NFC_PROTO_FELICA_MASK;
-		} else {
-			kfree_skb(nfcid_skb);
-			/* P2P in type A */
-			r =3D nfc_hci_get_param(hdev, ST21NFCA_RF_READER_F_GATE,
-					ST21NFCA_RF_READER_F_NFCID1,
-					&nfcid_skb);
-			if (r < 0)
-				goto exit;
-
-			if (nfcid_skb->len > NFC_NFCID1_MAXSIZE) {
-				r =3D -EPROTO;
-				goto exit;
-			}
-			memcpy(target->sensf_res, nfcid_skb->data,
-				nfcid_skb->len);
-			target->sensf_res_len =3D nfcid_skb->len;
-			target->supported_protocols =3D NFC_PROTO_NFC_DEP_MASK;
-		}
-		target->hci_reader_gate =3D ST21NFCA_RF_READER_F_GATE;
-	}
-	r =3D 1;
-exit:
-	kfree_skb(nfcid_skb);
-	return r;
-}
-
-#define ST21NFCA_CB_TYPE_READER_ISO15693 1
-static void st21nfca_hci_data_exchange_cb(void *context, struct sk_buf=
f *skb,
-					  int err)
-{
-	struct st21nfca_hci_info *info =3D context;
-
-	switch (info->async_cb_type) {
-	case ST21NFCA_CB_TYPE_READER_ISO15693:
-		if (err =3D=3D 0)
-			skb_trim(skb, skb->len - 1);
-		info->async_cb(info->async_cb_context, skb, err);
-		break;
-	default:
-		if (err =3D=3D 0)
-			kfree_skb(skb);
-		break;
-	}
-}
-
-/*
- * Returns:
- * <=3D 0: driver handled the data exchange
- *    1: driver doesn't especially handle, please do standard processi=
ng
- */
-static int st21nfca_hci_im_transceive(struct nfc_hci_dev *hdev,
-				      struct nfc_target *target,
-				      struct sk_buff *skb,
-				      data_exchange_cb_t cb, void *cb_context)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	pr_info(DRIVER_DESC ": %s for gate=3D%d len=3D%d\n", __func__,
-		target->hci_reader_gate, skb->len);
-
-	switch (target->hci_reader_gate) {
-	case ST21NFCA_RF_READER_F_GATE:
-		if (target->supported_protocols =3D=3D NFC_PROTO_NFC_DEP_MASK)
-			return st21nfca_im_send_dep_req(hdev, skb);
-
-		*skb_push(skb, 1) =3D 0x1a;
-		return nfc_hci_send_cmd_async(hdev, target->hci_reader_gate,
-					      ST21NFCA_WR_XCHG_DATA, skb->data,
-					      skb->len, cb, cb_context);
-	case ST21NFCA_RF_READER_14443_3_A_GATE:
-		*skb_push(skb, 1) =3D 0x1a;	/* CTR, see spec:10.2.2.1 */
-
-		return nfc_hci_send_cmd_async(hdev, target->hci_reader_gate,
-					      ST21NFCA_WR_XCHG_DATA, skb->data,
-					      skb->len, cb, cb_context);
-	case ST21NFCA_RF_READER_ISO15693_GATE:
-		info->async_cb_type =3D ST21NFCA_CB_TYPE_READER_ISO15693;
-		info->async_cb =3D cb;
-		info->async_cb_context =3D cb_context;
-
-		*skb_push(skb, 1) =3D 0x17;
-
-		return nfc_hci_send_cmd_async(hdev, target->hci_reader_gate,
-					      ST21NFCA_WR_XCHG_DATA, skb->data,
-					      skb->len,
-					      st21nfca_hci_data_exchange_cb,
-					      info);
-		break;
-	default:
-		return 1;
-	}
-}
-
-static int st21nfca_hci_tm_send(struct nfc_hci_dev *hdev, struct sk_bu=
ff *skb)
-{
-	return st21nfca_tm_send_dep_res(hdev, skb);
-}
-
-static int st21nfca_hci_check_presence(struct nfc_hci_dev *hdev,
-				       struct nfc_target *target)
-{
-	u8 fwi =3D 0x11;
-
-	switch (target->hci_reader_gate) {
-	case NFC_HCI_RF_READER_A_GATE:
-	case NFC_HCI_RF_READER_B_GATE:
-		/*
-		 * PRESENCE_CHECK on those gates is available
-		 * However, the answer to this command is taking 3 * fwi
-		 * if the card is no present.
-		 * Instead, we send an empty I-Frame with a very short
-		 * configurable fwi ~604=C2=B5s.
-		 */
-		return nfc_hci_send_cmd(hdev, target->hci_reader_gate,
-					ST21NFCA_WR_XCHG_DATA, &fwi, 1, NULL);
-	case ST21NFCA_RF_READER_14443_3_A_GATE:
-		return nfc_hci_send_cmd(hdev, target->hci_reader_gate,
-					ST21NFCA_RF_READER_CMD_PRESENCE_CHECK,
-					NULL, 0, NULL);
-	default:
-		return -EOPNOTSUPP;
-	}
-}
-
-static void st21nfca_hci_cmd_received(struct nfc_hci_dev *hdev, u8 pip=
e, u8 cmd,
-				struct sk_buff *skb)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-	u8 gate =3D hdev->pipes[pipe].gate;
-
-	pr_debug("cmd: %x\n", cmd);
-
-	switch (cmd) {
-	case NFC_HCI_ANY_OPEN_PIPE:
-		if (gate !=3D ST21NFCA_APDU_READER_GATE &&
-			hdev->pipes[pipe].dest_host !=3D NFC_HCI_UICC_HOST_ID)
-			info->se_info.count_pipes++;
-
-		if (info->se_info.count_pipes =3D=3D info->se_info.expected_pipes) {
-			del_timer_sync(&info->se_info.se_active_timer);
-			info->se_info.se_active =3D false;
-			info->se_info.count_pipes =3D 0;
-			complete(&info->se_info.req_completion);
-		}
-	break;
-	}
-}
-
-static int st21nfca_admin_event_received(struct nfc_hci_dev *hdev, u8 =
event,
-					struct sk_buff *skb)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	pr_debug("admin event: %x\n", event);
-
-	switch (event) {
-	case ST21NFCA_EVT_HOT_PLUG:
-		if (info->se_info.se_active) {
-			if (!ST21NFCA_EVT_HOT_PLUG_IS_INHIBITED(skb)) {
-				del_timer_sync(&info->se_info.se_active_timer);
-				info->se_info.se_active =3D false;
-				complete(&info->se_info.req_completion);
-			} else {
-				mod_timer(&info->se_info.se_active_timer,
-					jiffies +
-					msecs_to_jiffies(ST21NFCA_SE_TO_PIPES));
-			}
-		}
-	break;
-	}
-	kfree_skb(skb);
-	return 0;
-}
-
-/*
- * Returns:
- * <=3D 0: driver handled the event, skb consumed
- *    1: driver does not handle the event, please do standard processi=
ng
- */
-static int st21nfca_hci_event_received(struct nfc_hci_dev *hdev, u8 pi=
pe,
-				       u8 event, struct sk_buff *skb)
-{
-	u8 gate =3D hdev->pipes[pipe].gate;
-	u8 host =3D hdev->pipes[pipe].dest_host;
-
-	pr_debug("hci event: %d gate: %x\n", event, gate);
-
-	switch (gate) {
-	case NFC_HCI_ADMIN_GATE:
-		return st21nfca_admin_event_received(hdev, event, skb);
-	case ST21NFCA_RF_CARD_F_GATE:
-		return st21nfca_dep_event_received(hdev, event, skb);
-	case ST21NFCA_CONNECTIVITY_GATE:
-		return st21nfca_connectivity_event_received(hdev, host,
-							event, skb);
-	case ST21NFCA_APDU_READER_GATE:
-		return st21nfca_apdu_reader_event_received(hdev, event, skb);
-	default:
-		return 1;
-	}
-}
-
-static struct nfc_hci_ops st21nfca_hci_ops =3D {
-	.open =3D st21nfca_hci_open,
-	.close =3D st21nfca_hci_close,
-	.load_session =3D st21nfca_hci_load_session,
-	.hci_ready =3D st21nfca_hci_ready,
-	.xmit =3D st21nfca_hci_xmit,
-	.start_poll =3D st21nfca_hci_start_poll,
-	.stop_poll =3D st21nfca_hci_stop_poll,
-	.dep_link_up =3D st21nfca_hci_dep_link_up,
-	.dep_link_down =3D st21nfca_hci_dep_link_down,
-	.target_from_gate =3D st21nfca_hci_target_from_gate,
-	.complete_target_discovered =3D st21nfca_hci_complete_target_discover=
ed,
-	.im_transceive =3D st21nfca_hci_im_transceive,
-	.tm_send =3D st21nfca_hci_tm_send,
-	.check_presence =3D st21nfca_hci_check_presence,
-	.event_received =3D st21nfca_hci_event_received,
-	.cmd_received =3D st21nfca_hci_cmd_received,
-	.discover_se =3D st21nfca_hci_discover_se,
-	.enable_se =3D st21nfca_hci_enable_se,
-	.disable_se =3D st21nfca_hci_disable_se,
-	.se_io =3D st21nfca_hci_se_io,
-};
-
-int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
-		       char *llc_name, int phy_headroom, int phy_tailroom,
-		       int phy_payload, struct nfc_hci_dev **hdev,
-			   struct st21nfca_se_status *se_status)
-{
-	struct st21nfca_hci_info *info;
-	int r =3D 0;
-	int dev_num;
-	u32 protocols;
-	struct nfc_hci_init_data init_data;
-	unsigned long quirks =3D 0;
-
-	info =3D kzalloc(sizeof(struct st21nfca_hci_info), GFP_KERNEL);
-	if (!info) {
-		r =3D -ENOMEM;
-		goto err_alloc_hdev;
-	}
-
-	info->phy_ops =3D phy_ops;
-	info->phy_id =3D phy_id;
-	info->state =3D ST21NFCA_ST_COLD;
-	mutex_init(&info->info_lock);
-
-	init_data.gate_count =3D ARRAY_SIZE(st21nfca_gates);
-
-	memcpy(init_data.gates, st21nfca_gates, sizeof(st21nfca_gates));
-
-	/*
-	 * Session id must include the driver name + i2c bus addr
-	 * persistent info to discriminate 2 identical chips
-	 */
-	dev_num =3D find_first_zero_bit(dev_mask, ST21NFCA_NUM_DEVICES);
-
-	if (dev_num >=3D ST21NFCA_NUM_DEVICES)
-		return -ENODEV;
-
-	set_bit(dev_num, dev_mask);
-
-	scnprintf(init_data.session_id, sizeof(init_data.session_id), "%s%2x"=
,
-		  "ST21AH", dev_num);
-
-	protocols =3D NFC_PROTO_JEWEL_MASK |
-	    NFC_PROTO_MIFARE_MASK |
-	    NFC_PROTO_FELICA_MASK |
-	    NFC_PROTO_ISO14443_MASK |
-	    NFC_PROTO_ISO14443_B_MASK |
-	    NFC_PROTO_ISO15693_MASK |
-	    NFC_PROTO_NFC_DEP_MASK;
-
-	set_bit(NFC_HCI_QUIRK_SHORT_CLEAR, &quirks);
-
-	info->hdev =3D
-	    nfc_hci_allocate_device(&st21nfca_hci_ops, &init_data, quirks,
-				    protocols, llc_name,
-				    phy_headroom + ST21NFCA_CMDS_HEADROOM,
-				    phy_tailroom, phy_payload);
-
-	if (!info->hdev) {
-		pr_err("Cannot allocate nfc hdev.\n");
-		r =3D -ENOMEM;
-		goto err_alloc_hdev;
-	}
-
-	info->se_status =3D se_status;
-
-	nfc_hci_set_clientdata(info->hdev, info);
-
-	r =3D nfc_hci_register_device(info->hdev);
-	if (r)
-		goto err_regdev;
-
-	*hdev =3D info->hdev;
-	st21nfca_dep_init(info->hdev);
-	st21nfca_se_init(info->hdev);
-
-	return 0;
-
-err_regdev:
-	nfc_hci_free_device(info->hdev);
-
-err_alloc_hdev:
-	kfree(info);
-
-	return r;
-}
-EXPORT_SYMBOL(st21nfca_hci_probe);
-
-void st21nfca_hci_remove(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	st21nfca_dep_deinit(hdev);
-	st21nfca_se_deinit(hdev);
-	nfc_hci_unregister_device(hdev);
-	nfc_hci_free_device(hdev);
-	kfree(info);
-}
-EXPORT_SYMBOL(st21nfca_hci_remove);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st21nfca/st21nfca.h b/drivers/nfc/st21nfca/st2=
1nfca.h
index 15a78d3..70e2d43 100644
--- a/drivers/nfc/st21nfca/st21nfca.h
+++ b/drivers/nfc/st21nfca/st21nfca.h
@@ -18,9 +18,8 @@
 #define __LOCAL_ST21NFCA_H_
=20
 #include <net/nfc/hci.h>
-
-#include "st21nfca_dep.h"
-#include "st21nfca_se.h"
+#include <linux/skbuff.h>
+#include <linux/workqueue.h>
=20
 #define HCI_MODE 0
=20
@@ -46,28 +45,68 @@
 #define ST21NFCA_HCI_LLC_MAX_SIZE       (ST21NFCA_HCI_LLC_LEN_CRC + 1 =
+ \
 					ST21NFCA_HCI_LLC_MAX_PAYLOAD)
=20
-#define DRIVER_DESC "HCI NFC driver for ST21NFCA"
+/* Reader RF commands */
+#define ST21NFCA_WR_XCHG_DATA           0x10
+
+#define ST21NFCA_DEVICE_MGNT_GATE       0x01
+#define ST21NFCA_RF_READER_F_GATE       0x14
+#define ST21NFCA_RF_CARD_F_GATE		0x24
+#define ST21NFCA_APDU_READER_GATE	0xf0
+#define ST21NFCA_CONNECTIVITY_GATE	0x41
=20
-#define ST21NFCA_HCI_MODE 0
+/*
+ * ref ISO7816-3 chap 8.1. the initial character TS is followed by a
+ * sequence of at most 32 characters.
+ */
+#define ST21NFCA_ESE_MAX_LENGTH		33
+#define ST21NFCA_ESE_HOST_ID		0xc0
+
+#define DRIVER_DESC "HCI NFC driver for ST21NFCA"
=20
-#define ST21NFCA_NUM_DEVICES 256
+#define ST21NFCA_HCI_MODE		0
+#define ST21NFCA_NUM_DEVICES		256
=20
 struct st21nfca_se_status {
 	bool is_ese_present;
 	bool is_uicc_present;
 };
=20
-int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
-		       char *llc_name, int phy_headroom, int phy_tailroom,
-		       int phy_payload, struct nfc_hci_dev **hdev,
-			   struct st21nfca_se_status *se_status);
-void st21nfca_hci_remove(struct nfc_hci_dev *hdev);
-
 enum st21nfca_state {
 	ST21NFCA_ST_COLD,
 	ST21NFCA_ST_READY,
 };
=20
+struct st21nfca_dep_info {
+	struct sk_buff *tx_pending;
+	struct work_struct tx_work;
+	u8 curr_nfc_dep_pni;
+	u32 idx;
+	u8 to;
+	u8 did;
+	u8 bsi;
+	u8 bri;
+	u8 lri;
+} __packed;
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
 struct st21nfca_hci_info {
 	struct nfc_phy_ops *phy_ops;
 	void *phy_id;
@@ -87,13 +126,34 @@ struct st21nfca_hci_info {
 	struct st21nfca_se_info se_info;
 };
=20
-/* Reader RF commands */
-#define ST21NFCA_WR_XCHG_DATA           0x10
+int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
+		       char *llc_name, int phy_headroom, int phy_tailroom,
+		       int phy_payload, struct nfc_hci_dev **hdev,
+			   struct st21nfca_se_status *se_status);
+void st21nfca_hci_remove(struct nfc_hci_dev *hdev);
=20
-#define ST21NFCA_DEVICE_MGNT_GATE       0x01
-#define ST21NFCA_RF_READER_F_GATE       0x14
-#define ST21NFCA_RF_CARD_F_GATE			0x24
-#define ST21NFCA_APDU_READER_GATE		0xf0
-#define ST21NFCA_CONNECTIVITY_GATE		0x41
+int st21nfca_dep_event_received(struct nfc_hci_dev *hdev,
+				u8 event, struct sk_buff *skb);
+int st21nfca_tm_send_dep_res(struct nfc_hci_dev *hdev, struct sk_buff =
*skb);
+
+int st21nfca_im_send_atr_req(struct nfc_hci_dev *hdev, u8 *gb, size_t =
gb_len);
+int st21nfca_im_send_dep_req(struct nfc_hci_dev *hdev, struct sk_buff =
*skb);
+void st21nfca_dep_init(struct nfc_hci_dev *hdev);
+void st21nfca_dep_deinit(struct nfc_hci_dev *hdev);
+
+int st21nfca_connectivity_event_received(struct nfc_hci_dev *hdev, u8 =
host,
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
=20
 #endif /* __LOCAL_ST21NFCA_H_ */
diff --git a/drivers/nfc/st21nfca/st21nfca_dep.c b/drivers/nfc/st21nfca=
/st21nfca_dep.c
deleted file mode 100644
index 8882181..0000000
--- a/drivers/nfc/st21nfca/st21nfca_dep.c
+++ /dev/null
@@ -1,689 +0,0 @@
-/*
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#include <net/nfc/hci.h>
-
-#include "st21nfca.h"
-#include "st21nfca_dep.h"
-
-#define ST21NFCA_NFCIP1_INITIATOR 0x00
-#define ST21NFCA_NFCIP1_REQ 0xd4
-#define ST21NFCA_NFCIP1_RES 0xd5
-#define ST21NFCA_NFCIP1_ATR_REQ 0x00
-#define ST21NFCA_NFCIP1_ATR_RES 0x01
-#define ST21NFCA_NFCIP1_PSL_REQ 0x04
-#define ST21NFCA_NFCIP1_PSL_RES 0x05
-#define ST21NFCA_NFCIP1_DEP_REQ 0x06
-#define ST21NFCA_NFCIP1_DEP_RES 0x07
-
-#define ST21NFCA_NFC_DEP_PFB_PNI(pfb)     ((pfb) & 0x03)
-#define ST21NFCA_NFC_DEP_PFB_TYPE(pfb) ((pfb) & 0xE0)
-#define ST21NFCA_NFC_DEP_PFB_IS_TIMEOUT(pfb) \
-				((pfb) & ST21NFCA_NFC_DEP_PFB_TIMEOUT_BIT)
-#define ST21NFCA_NFC_DEP_DID_BIT_SET(pfb) ((pfb) & 0x04)
-#define ST21NFCA_NFC_DEP_NAD_BIT_SET(pfb) ((pfb) & 0x08)
-#define ST21NFCA_NFC_DEP_PFB_TIMEOUT_BIT 0x10
-
-#define ST21NFCA_NFC_DEP_PFB_IS_TIMEOUT(pfb) \
-				((pfb) & ST21NFCA_NFC_DEP_PFB_TIMEOUT_BIT)
-
-#define ST21NFCA_NFC_DEP_PFB_I_PDU          0x00
-#define ST21NFCA_NFC_DEP_PFB_ACK_NACK_PDU   0x40
-#define ST21NFCA_NFC_DEP_PFB_SUPERVISOR_PDU 0x80
-
-#define ST21NFCA_ATR_REQ_MIN_SIZE 17
-#define ST21NFCA_ATR_REQ_MAX_SIZE 65
-#define ST21NFCA_LR_BITS_PAYLOAD_SIZE_254B 0x30
-#define ST21NFCA_GB_BIT  0x02
-
-#define ST21NFCA_EVT_SEND_DATA		0x10
-#define ST21NFCA_EVT_FIELD_ON           0x11
-#define ST21NFCA_EVT_CARD_DEACTIVATED   0x12
-#define ST21NFCA_EVT_CARD_ACTIVATED     0x13
-#define ST21NFCA_EVT_FIELD_OFF          0x14
-
-#define ST21NFCA_EVT_CARD_F_BITRATE 0x16
-#define ST21NFCA_EVT_READER_F_BITRATE 0x13
-#define	ST21NFCA_PSL_REQ_SEND_SPEED(brs) (brs & 0x38)
-#define ST21NFCA_PSL_REQ_RECV_SPEED(brs) (brs & 0x07)
-#define ST21NFCA_PP2LRI(pp) ((pp & 0x30) >> 4)
-#define ST21NFCA_CARD_BITRATE_212 0x01
-#define ST21NFCA_CARD_BITRATE_424 0x02
-
-#define ST21NFCA_DEFAULT_TIMEOUT 0x0a
-
-
-#define PROTOCOL_ERR(req) pr_err("%d: ST21NFCA Protocol error: %s\n", =
\
-				 __LINE__, req)
-
-struct st21nfca_atr_req {
-	u8 length;
-	u8 cmd0;
-	u8 cmd1;
-	u8 nfcid3[NFC_NFCID3_MAXSIZE];
-	u8 did;
-	u8 bsi;
-	u8 bri;
-	u8 ppi;
-	u8 gbi[0];
-} __packed;
-
-struct st21nfca_atr_res {
-	u8 length;
-	u8 cmd0;
-	u8 cmd1;
-	u8 nfcid3[NFC_NFCID3_MAXSIZE];
-	u8 did;
-	u8 bsi;
-	u8 bri;
-	u8 to;
-	u8 ppi;
-	u8 gbi[0];
-} __packed;
-
-struct st21nfca_psl_req {
-	u8 length;
-	u8 cmd0;
-	u8 cmd1;
-	u8 did;
-	u8 brs;
-	u8 fsl;
-} __packed;
-
-struct st21nfca_psl_res {
-	u8 length;
-	u8 cmd0;
-	u8 cmd1;
-	u8 did;
-} __packed;
-
-struct st21nfca_dep_req_res {
-	u8 length;
-	u8 cmd0;
-	u8 cmd1;
-	u8 pfb;
-	u8 did;
-	u8 nad;
-} __packed;
-
-static void st21nfca_tx_work(struct work_struct *work)
-{
-	struct st21nfca_hci_info *info =3D container_of(work,
-						struct st21nfca_hci_info,
-						dep_info.tx_work);
-
-	struct nfc_dev *dev;
-	struct sk_buff *skb;
-
-	if (info) {
-		dev =3D info->hdev->ndev;
-		skb =3D info->dep_info.tx_pending;
-
-		device_lock(&dev->dev);
-
-		nfc_hci_send_cmd_async(info->hdev, ST21NFCA_RF_READER_F_GATE,
-				ST21NFCA_WR_XCHG_DATA, skb->data, skb->len,
-				info->async_cb, info);
-		device_unlock(&dev->dev);
-		kfree_skb(skb);
-	}
-}
-
-static void st21nfca_im_send_pdu(struct st21nfca_hci_info *info,
-						struct sk_buff *skb)
-{
-	info->dep_info.tx_pending =3D skb;
-	schedule_work(&info->dep_info.tx_work);
-}
-
-static int st21nfca_tm_send_atr_res(struct nfc_hci_dev *hdev,
-				    struct st21nfca_atr_req *atr_req)
-{
-	struct st21nfca_atr_res *atr_res;
-	struct sk_buff *skb;
-	size_t gb_len;
-	int r;
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	gb_len =3D atr_req->length - sizeof(struct st21nfca_atr_req);
-	skb =3D alloc_skb(atr_req->length + 1, GFP_KERNEL);
-	if (!skb)
-		return -ENOMEM;
-
-	skb_put(skb, sizeof(struct st21nfca_atr_res));
-
-	atr_res =3D (struct st21nfca_atr_res *)skb->data;
-	memset(atr_res, 0, sizeof(struct st21nfca_atr_res));
-
-	atr_res->length =3D atr_req->length + 1;
-	atr_res->cmd0 =3D ST21NFCA_NFCIP1_RES;
-	atr_res->cmd1 =3D ST21NFCA_NFCIP1_ATR_RES;
-
-	memcpy(atr_res->nfcid3, atr_req->nfcid3, 6);
-	atr_res->bsi =3D 0x00;
-	atr_res->bri =3D 0x00;
-	atr_res->to =3D ST21NFCA_DEFAULT_TIMEOUT;
-	atr_res->ppi =3D ST21NFCA_LR_BITS_PAYLOAD_SIZE_254B;
-
-	if (gb_len) {
-		skb_put(skb, gb_len);
-
-		atr_res->ppi |=3D ST21NFCA_GB_BIT;
-		memcpy(atr_res->gbi, atr_req->gbi, gb_len);
-		r =3D nfc_set_remote_general_bytes(hdev->ndev, atr_res->gbi,
-						  gb_len);
-		if (r < 0)
-			return r;
-	}
-
-	info->dep_info.curr_nfc_dep_pni =3D 0;
-
-	r =3D nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
-				ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
-	kfree_skb(skb);
-	return r;
-}
-
-static int st21nfca_tm_recv_atr_req(struct nfc_hci_dev *hdev,
-				    struct sk_buff *skb)
-{
-	struct st21nfca_atr_req *atr_req;
-	size_t gb_len;
-	int r;
-
-	skb_trim(skb, skb->len - 1);
-
-	if (!skb->len) {
-		r =3D -EIO;
-		goto exit;
-	}
-
-	if (skb->len < ST21NFCA_ATR_REQ_MIN_SIZE) {
-		r =3D -EPROTO;
-		goto exit;
-	}
-
-	atr_req =3D (struct st21nfca_atr_req *)skb->data;
-
-	if (atr_req->length < sizeof(struct st21nfca_atr_req)) {
-		r =3D -EPROTO;
-		goto exit;
-	}
-
-	r =3D st21nfca_tm_send_atr_res(hdev, atr_req);
-	if (r)
-		goto exit;
-
-	gb_len =3D skb->len - sizeof(struct st21nfca_atr_req);
-
-	r =3D nfc_tm_activated(hdev->ndev, NFC_PROTO_NFC_DEP_MASK,
-			      NFC_COMM_PASSIVE, atr_req->gbi, gb_len);
-	if (r)
-		goto exit;
-
-	r =3D 0;
-
-exit:
-	return r;
-}
-
-static int st21nfca_tm_send_psl_res(struct nfc_hci_dev *hdev,
-				    struct st21nfca_psl_req *psl_req)
-{
-	struct st21nfca_psl_res *psl_res;
-	struct sk_buff *skb;
-	u8 bitrate[2] =3D {0, 0};
-	int r;
-
-	skb =3D alloc_skb(sizeof(struct st21nfca_psl_res), GFP_KERNEL);
-	if (!skb)
-		return -ENOMEM;
-	skb_put(skb, sizeof(struct st21nfca_psl_res));
-
-	psl_res =3D (struct st21nfca_psl_res *)skb->data;
-
-	psl_res->length =3D sizeof(struct st21nfca_psl_res);
-	psl_res->cmd0 =3D ST21NFCA_NFCIP1_RES;
-	psl_res->cmd1 =3D ST21NFCA_NFCIP1_PSL_RES;
-	psl_res->did =3D psl_req->did;
-
-	r =3D nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
-				ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
-	if (r < 0)
-		goto error;
-
-	/*
-	 * ST21NFCA only support P2P passive.
-	 * PSL_REQ BRS value !=3D 0 has only a meaning to
-	 * change technology to type F.
-	 * We change to BITRATE 424Kbits.
-	 * In other case switch to BITRATE 106Kbits.
-	 */
-	if (ST21NFCA_PSL_REQ_SEND_SPEED(psl_req->brs) &&
-	    ST21NFCA_PSL_REQ_RECV_SPEED(psl_req->brs)) {
-		bitrate[0] =3D ST21NFCA_CARD_BITRATE_424;
-		bitrate[1] =3D ST21NFCA_CARD_BITRATE_424;
-	}
-
-	/* Send an event to change bitrate change event to card f */
-	r =3D nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
-			ST21NFCA_EVT_CARD_F_BITRATE, bitrate, 2);
-error:
-	kfree_skb(skb);
-	return r;
-}
-
-static int st21nfca_tm_recv_psl_req(struct nfc_hci_dev *hdev,
-				    struct sk_buff *skb)
-{
-	struct st21nfca_psl_req *psl_req;
-	int r;
-
-	skb_trim(skb, skb->len - 1);
-
-	if (!skb->len) {
-		r =3D -EIO;
-		goto exit;
-	}
-
-	psl_req =3D (struct st21nfca_psl_req *)skb->data;
-
-	if (skb->len < sizeof(struct st21nfca_psl_req)) {
-		r =3D -EIO;
-		goto exit;
-	}
-
-	r =3D st21nfca_tm_send_psl_res(hdev, psl_req);
-exit:
-	return r;
-}
-
-int st21nfca_tm_send_dep_res(struct nfc_hci_dev *hdev, struct sk_buff =
*skb)
-{
-	int r;
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	*skb_push(skb, 1) =3D info->dep_info.curr_nfc_dep_pni;
-	*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_DEP_RES;
-	*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_RES;
-	*skb_push(skb, 1) =3D skb->len;
-
-	r =3D nfc_hci_send_event(hdev, ST21NFCA_RF_CARD_F_GATE,
-			ST21NFCA_EVT_SEND_DATA, skb->data, skb->len);
-	kfree_skb(skb);
-
-	return r;
-}
-EXPORT_SYMBOL(st21nfca_tm_send_dep_res);
-
-static int st21nfca_tm_recv_dep_req(struct nfc_hci_dev *hdev,
-				    struct sk_buff *skb)
-{
-	struct st21nfca_dep_req_res *dep_req;
-	u8 size;
-	int r;
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	skb_trim(skb, skb->len - 1);
-
-	size =3D 4;
-
-	dep_req =3D (struct st21nfca_dep_req_res *)skb->data;
-	if (skb->len < size) {
-		r =3D -EIO;
-		goto exit;
-	}
-
-	if (ST21NFCA_NFC_DEP_DID_BIT_SET(dep_req->pfb))
-		size++;
-	if (ST21NFCA_NFC_DEP_NAD_BIT_SET(dep_req->pfb))
-		size++;
-
-	if (skb->len < size) {
-		r =3D -EIO;
-		goto exit;
-	}
-
-	/* Receiving DEP_REQ - Decoding */
-	switch (ST21NFCA_NFC_DEP_PFB_TYPE(dep_req->pfb)) {
-	case ST21NFCA_NFC_DEP_PFB_I_PDU:
-		info->dep_info.curr_nfc_dep_pni =3D
-				ST21NFCA_NFC_DEP_PFB_PNI(dep_req->pfb);
-		break;
-	case ST21NFCA_NFC_DEP_PFB_ACK_NACK_PDU:
-		pr_err("Received a ACK/NACK PDU\n");
-		break;
-	case ST21NFCA_NFC_DEP_PFB_SUPERVISOR_PDU:
-		pr_err("Received a SUPERVISOR PDU\n");
-		break;
-	}
-
-	skb_pull(skb, size);
-
-	return nfc_tm_data_received(hdev->ndev, skb);
-exit:
-	return r;
-}
-
-static int st21nfca_tm_event_send_data(struct nfc_hci_dev *hdev,
-				struct sk_buff *skb)
-{
-	u8 cmd0, cmd1;
-	int r;
-
-	cmd0 =3D skb->data[1];
-	switch (cmd0) {
-	case ST21NFCA_NFCIP1_REQ:
-		cmd1 =3D skb->data[2];
-		switch (cmd1) {
-		case ST21NFCA_NFCIP1_ATR_REQ:
-			r =3D st21nfca_tm_recv_atr_req(hdev, skb);
-			break;
-		case ST21NFCA_NFCIP1_PSL_REQ:
-			r =3D st21nfca_tm_recv_psl_req(hdev, skb);
-			break;
-		case ST21NFCA_NFCIP1_DEP_REQ:
-			r =3D st21nfca_tm_recv_dep_req(hdev, skb);
-			break;
-		default:
-			return 1;
-		}
-	default:
-		return 1;
-	}
-	return r;
-}
-
-/*
- * Returns:
- * <=3D 0: driver handled the event, skb consumed
- *    1: driver does not handle the event, please do standard processi=
ng
- */
-int st21nfca_dep_event_received(struct nfc_hci_dev *hdev,
-				u8 event, struct sk_buff *skb)
-{
-	int r =3D 0;
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	pr_debug("dep event: %d\n", event);
-
-	switch (event) {
-	case ST21NFCA_EVT_CARD_ACTIVATED:
-		info->dep_info.curr_nfc_dep_pni =3D 0;
-		break;
-	case ST21NFCA_EVT_CARD_DEACTIVATED:
-		break;
-	case ST21NFCA_EVT_FIELD_ON:
-		break;
-	case ST21NFCA_EVT_FIELD_OFF:
-		break;
-	case ST21NFCA_EVT_SEND_DATA:
-		r =3D st21nfca_tm_event_send_data(hdev, skb);
-		if (r < 0)
-			return r;
-		return 0;
-	default:
-		return 1;
-	}
-	kfree_skb(skb);
-	return r;
-}
-EXPORT_SYMBOL(st21nfca_dep_event_received);
-
-static void st21nfca_im_send_psl_req(struct nfc_hci_dev *hdev, u8 did,=
 u8 bsi,
-				     u8 bri, u8 lri)
-{
-	struct sk_buff *skb;
-	struct st21nfca_psl_req *psl_req;
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	skb =3D
-	    alloc_skb(sizeof(struct st21nfca_psl_req) + 1, GFP_KERNEL);
-	if (!skb)
-		return;
-	skb_reserve(skb, 1);
-
-	skb_put(skb, sizeof(struct st21nfca_psl_req));
-	psl_req =3D (struct st21nfca_psl_req *) skb->data;
-
-	psl_req->length =3D sizeof(struct st21nfca_psl_req);
-	psl_req->cmd0 =3D ST21NFCA_NFCIP1_REQ;
-	psl_req->cmd1 =3D ST21NFCA_NFCIP1_PSL_REQ;
-	psl_req->did =3D did;
-	psl_req->brs =3D (0x30 & bsi << 4) | (bri & 0x03);
-	psl_req->fsl =3D lri;
-
-	*skb_push(skb, 1) =3D info->dep_info.to | 0x10;
-
-	st21nfca_im_send_pdu(info, skb);
-}
-
-#define ST21NFCA_CB_TYPE_READER_F 1
-static void st21nfca_im_recv_atr_res_cb(void *context, struct sk_buff =
*skb,
-					int err)
-{
-	struct st21nfca_hci_info *info =3D context;
-	struct st21nfca_atr_res *atr_res;
-	int r;
-
-	if (err !=3D 0)
-		return;
-
-	if (!skb)
-		return;
-
-	switch (info->async_cb_type) {
-	case ST21NFCA_CB_TYPE_READER_F:
-		skb_trim(skb, skb->len - 1);
-		atr_res =3D (struct st21nfca_atr_res *)skb->data;
-		r =3D nfc_set_remote_general_bytes(info->hdev->ndev,
-				atr_res->gbi,
-				skb->len - sizeof(struct st21nfca_atr_res));
-		if (r < 0)
-			return;
-
-		if (atr_res->to >=3D 0x0e)
-			info->dep_info.to =3D 0x0e;
-		else
-			info->dep_info.to =3D atr_res->to + 1;
-
-		info->dep_info.to |=3D 0x10;
-
-		r =3D nfc_dep_link_is_up(info->hdev->ndev, info->dep_info.idx,
-					NFC_COMM_PASSIVE, NFC_RF_INITIATOR);
-		if (r < 0)
-			return;
-
-		info->dep_info.curr_nfc_dep_pni =3D 0;
-		if (ST21NFCA_PP2LRI(atr_res->ppi) !=3D info->dep_info.lri)
-			st21nfca_im_send_psl_req(info->hdev, atr_res->did,
-						atr_res->bsi, atr_res->bri,
-						ST21NFCA_PP2LRI(atr_res->ppi));
-		break;
-	default:
-		kfree_skb(skb);
-		break;
-	}
-}
-
-int st21nfca_im_send_atr_req(struct nfc_hci_dev *hdev, u8 *gb, size_t =
gb_len)
-{
-	struct sk_buff *skb;
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-	struct st21nfca_atr_req *atr_req;
-	struct nfc_target *target;
-	uint size;
-
-	info->dep_info.to =3D ST21NFCA_DEFAULT_TIMEOUT;
-	size =3D ST21NFCA_ATR_REQ_MIN_SIZE + gb_len;
-	if (size > ST21NFCA_ATR_REQ_MAX_SIZE) {
-		PROTOCOL_ERR("14.6.1.1");
-		return -EINVAL;
-	}
-
-	skb =3D
-	    alloc_skb(sizeof(struct st21nfca_atr_req) + gb_len + 1, GFP_KERNE=
L);
-	if (!skb)
-		return -ENOMEM;
-
-	skb_reserve(skb, 1);
-
-	skb_put(skb, sizeof(struct st21nfca_atr_req));
-
-	atr_req =3D (struct st21nfca_atr_req *)skb->data;
-	memset(atr_req, 0, sizeof(struct st21nfca_atr_req));
-
-	atr_req->cmd0 =3D ST21NFCA_NFCIP1_REQ;
-	atr_req->cmd1 =3D ST21NFCA_NFCIP1_ATR_REQ;
-	memset(atr_req->nfcid3, 0, NFC_NFCID3_MAXSIZE);
-	target =3D hdev->ndev->targets;
-
-	if (target->sensf_res_len > 0)
-		memcpy(atr_req->nfcid3, target->sensf_res,
-				target->sensf_res_len);
-	else
-		get_random_bytes(atr_req->nfcid3, NFC_NFCID3_MAXSIZE);
-
-	atr_req->did =3D 0x0;
-
-	atr_req->bsi =3D 0x00;
-	atr_req->bri =3D 0x00;
-	atr_req->ppi =3D ST21NFCA_LR_BITS_PAYLOAD_SIZE_254B;
-	if (gb_len) {
-		atr_req->ppi |=3D ST21NFCA_GB_BIT;
-		memcpy(skb_put(skb, gb_len), gb, gb_len);
-	}
-	atr_req->length =3D sizeof(struct st21nfca_atr_req) + hdev->gb_len;
-
-	*skb_push(skb, 1) =3D info->dep_info.to | 0x10; /* timeout */
-
-	info->async_cb_type =3D ST21NFCA_CB_TYPE_READER_F;
-	info->async_cb_context =3D info;
-	info->async_cb =3D st21nfca_im_recv_atr_res_cb;
-	info->dep_info.bri =3D atr_req->bri;
-	info->dep_info.bsi =3D atr_req->bsi;
-	info->dep_info.lri =3D ST21NFCA_PP2LRI(atr_req->ppi);
-
-	return nfc_hci_send_cmd_async(hdev, ST21NFCA_RF_READER_F_GATE,
-				ST21NFCA_WR_XCHG_DATA, skb->data,
-				skb->len, info->async_cb, info);
-}
-EXPORT_SYMBOL(st21nfca_im_send_atr_req);
-
-static void st21nfca_im_recv_dep_res_cb(void *context, struct sk_buff =
*skb,
-					int err)
-{
-	struct st21nfca_hci_info *info =3D context;
-	struct st21nfca_dep_req_res *dep_res;
-
-	int size;
-
-	if (err !=3D 0)
-		return;
-
-	if (!skb)
-		return;
-
-	switch (info->async_cb_type) {
-	case ST21NFCA_CB_TYPE_READER_F:
-		dep_res =3D (struct st21nfca_dep_req_res *)skb->data;
-
-		size =3D 3;
-		if (skb->len < size)
-			goto exit;
-
-		if (ST21NFCA_NFC_DEP_DID_BIT_SET(dep_res->pfb))
-			size++;
-		if (ST21NFCA_NFC_DEP_NAD_BIT_SET(dep_res->pfb))
-			size++;
-
-		if (skb->len < size)
-			goto exit;
-
-		skb_trim(skb, skb->len - 1);
-
-		/* Receiving DEP_REQ - Decoding */
-		switch (ST21NFCA_NFC_DEP_PFB_TYPE(dep_res->pfb)) {
-		case ST21NFCA_NFC_DEP_PFB_ACK_NACK_PDU:
-			pr_err("Received a ACK/NACK PDU\n");
-		case ST21NFCA_NFC_DEP_PFB_I_PDU:
-			info->dep_info.curr_nfc_dep_pni =3D
-			    ST21NFCA_NFC_DEP_PFB_PNI(dep_res->pfb + 1);
-			size++;
-			skb_pull(skb, size);
-			nfc_tm_data_received(info->hdev->ndev, skb);
-			break;
-		case ST21NFCA_NFC_DEP_PFB_SUPERVISOR_PDU:
-			pr_err("Received a SUPERVISOR PDU\n");
-			skb_pull(skb, size);
-			*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_DEP_REQ;
-			*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_REQ;
-			*skb_push(skb, 1) =3D skb->len;
-			*skb_push(skb, 1) =3D info->dep_info.to | 0x10;
-
-			st21nfca_im_send_pdu(info, skb);
-			break;
-		}
-
-		return;
-	default:
-		break;
-	}
-
-exit:
-	kfree_skb(skb);
-}
-
-int st21nfca_im_send_dep_req(struct nfc_hci_dev *hdev, struct sk_buff =
*skb)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	info->async_cb_type =3D ST21NFCA_CB_TYPE_READER_F;
-	info->async_cb_context =3D info;
-	info->async_cb =3D st21nfca_im_recv_dep_res_cb;
-
-	*skb_push(skb, 1) =3D info->dep_info.curr_nfc_dep_pni;
-	*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_DEP_REQ;
-	*skb_push(skb, 1) =3D ST21NFCA_NFCIP1_REQ;
-	*skb_push(skb, 1) =3D skb->len;
-
-	*skb_push(skb, 1) =3D info->dep_info.to | 0x10;
-
-	return nfc_hci_send_cmd_async(hdev, ST21NFCA_RF_READER_F_GATE,
-				      ST21NFCA_WR_XCHG_DATA,
-				      skb->data, skb->len,
-				      info->async_cb, info);
-}
-EXPORT_SYMBOL(st21nfca_im_send_dep_req);
-
-void st21nfca_dep_init(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	INIT_WORK(&info->dep_info.tx_work, st21nfca_tx_work);
-	info->dep_info.curr_nfc_dep_pni =3D 0;
-	info->dep_info.idx =3D 0;
-	info->dep_info.to =3D ST21NFCA_DEFAULT_TIMEOUT;
-}
-EXPORT_SYMBOL(st21nfca_dep_init);
-
-void st21nfca_dep_deinit(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	cancel_work_sync(&info->dep_info.tx_work);
-}
-EXPORT_SYMBOL(st21nfca_dep_deinit);
diff --git a/drivers/nfc/st21nfca/st21nfca_dep.h b/drivers/nfc/st21nfca=
/st21nfca_dep.h
deleted file mode 100644
index baf4664..0000000
--- a/drivers/nfc/st21nfca/st21nfca_dep.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/*
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#ifndef __ST21NFCA_DEP_H
-#define __ST21NFCA_DEP_H
-
-#include <linux/skbuff.h>
-#include <linux/workqueue.h>
-
-struct st21nfca_dep_info {
-	struct sk_buff *tx_pending;
-	struct work_struct tx_work;
-	u8 curr_nfc_dep_pni;
-	u32 idx;
-	u8 to;
-	u8 did;
-	u8 bsi;
-	u8 bri;
-	u8 lri;
-} __packed;
-
-int st21nfca_dep_event_received(struct nfc_hci_dev *hdev,
-				u8 event, struct sk_buff *skb);
-int st21nfca_tm_send_dep_res(struct nfc_hci_dev *hdev, struct sk_buff =
*skb);
-
-int st21nfca_im_send_atr_req(struct nfc_hci_dev *hdev, u8 *gb, size_t =
gb_len);
-int st21nfca_im_send_dep_req(struct nfc_hci_dev *hdev, struct sk_buff =
*skb);
-void st21nfca_dep_init(struct nfc_hci_dev *hdev);
-void st21nfca_dep_deinit(struct nfc_hci_dev *hdev);
-#endif /* __ST21NFCA_DEP_H */
diff --git a/drivers/nfc/st21nfca/st21nfca_se.c b/drivers/nfc/st21nfca/=
st21nfca_se.c
deleted file mode 100644
index 3197e9b..0000000
--- a/drivers/nfc/st21nfca/st21nfca_se.c
+++ /dev/null
@@ -1,420 +0,0 @@
-/*
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#include <net/nfc/hci.h>
-
-#include "st21nfca.h"
-#include "st21nfca_se.h"
-
-#define ST21NFCA_EVT_UICC_ACTIVATE		0x10
-#define ST21NFCA_EVT_UICC_DEACTIVATE	0x13
-#define ST21NFCA_EVT_SE_HARD_RESET		0x20
-#define ST21NFCA_EVT_SE_SOFT_RESET		0x11
-#define ST21NFCA_EVT_SE_END_OF_APDU_TRANSFER	0x21
-#define ST21NFCA_EVT_SE_ACTIVATE		0x22
-#define ST21NFCA_EVT_SE_DEACTIVATE		0x23
-
-#define ST21NFCA_EVT_TRANSMIT_DATA		0x10
-#define ST21NFCA_EVT_WTX_REQUEST		0x11
-
-#define ST21NFCA_EVT_CONNECTIVITY		0x10
-#define ST21NFCA_EVT_TRANSACTION		0x12
-
-#define ST21NFCA_ESE_HOST_ID			0xc0
-
-#define ST21NFCA_SE_TO_HOT_PLUG			1000
-/* Connectivity pipe only */
-#define ST21NFCA_SE_COUNT_PIPE_UICC		0x01
-/* Connectivity + APDU Reader pipe */
-#define ST21NFCA_SE_COUNT_PIPE_EMBEDDED	0x02
-
-#define ST21NFCA_SE_MODE_OFF			0x00
-#define ST21NFCA_SE_MODE_ON				0x01
-
-#define ST21NFCA_PARAM_ATR				0x01
-#define ST21NFCA_ATR_DEFAULT_BWI		0x04
-
-/*
- * WT =3D 2^BWI/10[s], convert into msecs and add a secure
- * room by increasing by 2 this timeout
- */
-#define ST21NFCA_BWI_TO_TIMEOUT(x)		((1 << x) * 200)
-#define ST21NFCA_ATR_GET_Y_FROM_TD(x)	(x >> 4)
-
-/* If TA is present bit 0 is set */
-#define ST21NFCA_ATR_TA_PRESENT(x) (x & 0x01)
-/* If TB is present bit 1 is set */
-#define ST21NFCA_ATR_TB_PRESENT(x) (x & 0x02)
-
-static u8 st21nfca_se_get_bwi(struct nfc_hci_dev *hdev)
-{
-	int i;
-	u8 td;
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	/* Bits 8 to 5 of the first TB for T=3D1 encode BWI from zero to nine=
 */
-	for (i =3D 1; i < ST21NFCA_ESE_MAX_LENGTH; i++) {
-		td =3D ST21NFCA_ATR_GET_Y_FROM_TD(info->se_info.atr[i]);
-		if (ST21NFCA_ATR_TA_PRESENT(td))
-			i++;
-		if (ST21NFCA_ATR_TB_PRESENT(td)) {
-			i++;
-			return info->se_info.atr[i] >> 4;
-		}
-	}
-	return ST21NFCA_ATR_DEFAULT_BWI;
-}
-
-static void st21nfca_se_get_atr(struct nfc_hci_dev *hdev)
-{
-	int r;
-	struct sk_buff *skb;
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	r =3D nfc_hci_get_param(hdev, ST21NFCA_APDU_READER_GATE,
-			ST21NFCA_PARAM_ATR, &skb);
-	if (r < 0)
-		return;
-
-	if (skb->len <=3D ST21NFCA_ESE_MAX_LENGTH) {
-		memcpy(info->se_info.atr, skb->data, skb->len);
-		info->se_info.wt_timeout =3D
-			ST21NFCA_BWI_TO_TIMEOUT(st21nfca_se_get_bwi(hdev));
-	}
-	kfree_skb(skb);
-}
-
-static int st21nfca_hci_control_se(struct nfc_hci_dev *hdev, u32 se_id=
x,
-				u8 state)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-	int r;
-	struct sk_buff *sk_host_list;
-	u8 se_event, host_id;
-
-	switch (se_idx) {
-	case NFC_HCI_UICC_HOST_ID:
-		se_event =3D (state =3D=3D ST21NFCA_SE_MODE_ON ?
-					ST21NFCA_EVT_UICC_ACTIVATE :
-					ST21NFCA_EVT_UICC_DEACTIVATE);
-
-		info->se_info.count_pipes =3D 0;
-		info->se_info.expected_pipes =3D ST21NFCA_SE_COUNT_PIPE_UICC;
-		break;
-	case ST21NFCA_ESE_HOST_ID:
-		se_event =3D (state =3D=3D ST21NFCA_SE_MODE_ON ?
-					ST21NFCA_EVT_SE_ACTIVATE :
-					ST21NFCA_EVT_SE_DEACTIVATE);
-
-		info->se_info.count_pipes =3D 0;
-		info->se_info.expected_pipes =3D ST21NFCA_SE_COUNT_PIPE_EMBEDDED;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/*
-	 * Wait for an EVT_HOT_PLUG in order to
-	 * retrieve a relevant host list.
-	 */
-	reinit_completion(&info->se_info.req_completion);
-	r =3D nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE, se_event,
-			       NULL, 0);
-	if (r < 0)
-		return r;
-
-	mod_timer(&info->se_info.se_active_timer, jiffies +
-		msecs_to_jiffies(ST21NFCA_SE_TO_HOT_PLUG));
-	info->se_info.se_active =3D true;
-
-	/* Ignore return value and check in any case the host_list */
-	wait_for_completion_interruptible(&info->se_info.req_completion);
-
-	r =3D nfc_hci_get_param(hdev, NFC_HCI_ADMIN_GATE,
-			NFC_HCI_ADMIN_HOST_LIST,
-			&sk_host_list);
-	if (r < 0)
-		return r;
-
-	host_id =3D sk_host_list->data[sk_host_list->len - 1];
-	kfree_skb(sk_host_list);
-
-	if (state =3D=3D ST21NFCA_SE_MODE_ON && host_id =3D=3D se_idx)
-		return se_idx;
-	else if (state =3D=3D ST21NFCA_SE_MODE_OFF && host_id !=3D se_idx)
-		return se_idx;
-
-	return -1;
-}
-
-int st21nfca_hci_discover_se(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-	int se_count =3D 0;
-
-	if (info->se_status->is_uicc_present) {
-		nfc_add_se(hdev->ndev, NFC_HCI_UICC_HOST_ID, NFC_SE_UICC);
-		se_count++;
-	}
-
-	if (info->se_status->is_ese_present) {
-		nfc_add_se(hdev->ndev, ST21NFCA_ESE_HOST_ID, NFC_SE_EMBEDDED);
-		se_count++;
-	}
-
-	return !se_count;
-}
-EXPORT_SYMBOL(st21nfca_hci_discover_se);
-
-int st21nfca_hci_enable_se(struct nfc_hci_dev *hdev, u32 se_idx)
-{
-	int r;
-
-	/*
-	 * According to upper layer, se_idx =3D=3D NFC_SE_UICC when
-	 * info->se_status->is_uicc_enable is true should never happen.
-	 * Same for eSE.
-	 */
-	r =3D st21nfca_hci_control_se(hdev, se_idx, ST21NFCA_SE_MODE_ON);
-
-	if (r =3D=3D ST21NFCA_ESE_HOST_ID) {
-		st21nfca_se_get_atr(hdev);
-		r =3D nfc_hci_send_event(hdev, ST21NFCA_APDU_READER_GATE,
-				ST21NFCA_EVT_SE_SOFT_RESET, NULL, 0);
-		if (r < 0)
-			return r;
-	} else if (r < 0) {
-		/*
-		 * The activation tentative failed, the secure element
-		 * is not connected. Remove from the list.
-		 */
-		nfc_remove_se(hdev->ndev, se_idx);
-		return r;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(st21nfca_hci_enable_se);
-
-int st21nfca_hci_disable_se(struct nfc_hci_dev *hdev, u32 se_idx)
-{
-	int r;
-
-	/*
-	 * According to upper layer, se_idx =3D=3D NFC_SE_UICC when
-	 * info->se_status->is_uicc_enable is true should never happen
-	 * Same for eSE.
-	 */
-	r =3D st21nfca_hci_control_se(hdev, se_idx, ST21NFCA_SE_MODE_OFF);
-	if (r < 0)
-		return r;
-
-	return 0;
-}
-EXPORT_SYMBOL(st21nfca_hci_disable_se);
-
-int st21nfca_hci_se_io(struct nfc_hci_dev *hdev, u32 se_idx,
-			u8 *apdu, size_t apdu_length,
-			se_io_cb_t cb, void *cb_context)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	pr_debug("se_io %x\n", se_idx);
-
-	switch (se_idx) {
-	case ST21NFCA_ESE_HOST_ID:
-		info->se_info.cb =3D cb;
-		info->se_info.cb_context =3D cb_context;
-		mod_timer(&info->se_info.bwi_timer, jiffies +
-			  msecs_to_jiffies(info->se_info.wt_timeout));
-		info->se_info.bwi_active =3D true;
-		return nfc_hci_send_event(hdev, ST21NFCA_APDU_READER_GATE,
-					ST21NFCA_EVT_TRANSMIT_DATA,
-					apdu, apdu_length);
-	default:
-		return -ENODEV;
-	}
-}
-EXPORT_SYMBOL(st21nfca_hci_se_io);
-
-static void st21nfca_se_wt_timeout(unsigned long data)
-{
-	/*
-	 * No answer from the secure element
-	 * within the defined timeout.
-	 * Let's send a reset request as recovery procedure.
-	 * According to the situation, we first try to send a software reset
-	 * to the secure element. If the next command is still not
-	 * answering in time, we send to the CLF a secure element hardware
-	 * reset request.
-	 */
-	/* hardware reset managed through VCC_UICC_OUT power supply */
-	u8 param =3D 0x01;
-	struct st21nfca_hci_info *info =3D (struct st21nfca_hci_info *) data;
-
-	pr_debug("\n");
-
-	info->se_info.bwi_active =3D false;
-
-	if (!info->se_info.xch_error) {
-		info->se_info.xch_error =3D true;
-		nfc_hci_send_event(info->hdev, ST21NFCA_APDU_READER_GATE,
-				ST21NFCA_EVT_SE_SOFT_RESET, NULL, 0);
-	} else {
-		info->se_info.xch_error =3D false;
-		nfc_hci_send_event(info->hdev, ST21NFCA_DEVICE_MGNT_GATE,
-				ST21NFCA_EVT_SE_HARD_RESET, &param, 1);
-	}
-	info->se_info.cb(info->se_info.cb_context, NULL, 0, -ETIME);
-}
-
-static void st21nfca_se_activation_timeout(unsigned long data)
-{
-	struct st21nfca_hci_info *info =3D (struct st21nfca_hci_info *) data;
-
-	pr_debug("\n");
-
-	info->se_info.se_active =3D false;
-
-	complete(&info->se_info.req_completion);
-}
-
-/*
- * Returns:
- * <=3D 0: driver handled the event, skb consumed
- *    1: driver does not handle the event, please do standard processi=
ng
- */
-int st21nfca_connectivity_event_received(struct nfc_hci_dev *hdev, u8 =
host,
-				u8 event, struct sk_buff *skb)
-{
-	int r =3D 0;
-	struct device *dev =3D &hdev->ndev->dev;
-	struct nfc_evt_transaction *transaction;
-
-	pr_debug("connectivity gate event: %x\n", event);
-
-	switch (event) {
-	case ST21NFCA_EVT_CONNECTIVITY:
-		break;
-	case ST21NFCA_EVT_TRANSACTION:
-		/*
-		 * According to specification etsi 102 622
-		 * 11.2.2.4 EVT_TRANSACTION Table 52
-		 * Description	Tag	Length
-		 * AID		81	5 to 16
-		 * PARAMETERS	82	0 to 255
-		 */
-		if (skb->len < NFC_MIN_AID_LENGTH + 2 &&
-		    skb->data[0] !=3D NFC_EVT_TRANSACTION_AID_TAG)
-			return -EPROTO;
-
-		transaction =3D (struct nfc_evt_transaction *)devm_kzalloc(dev,
-						   skb->len - 2, GFP_KERNEL);
-
-		transaction->aid_len =3D skb->data[1];
-		memcpy(transaction->aid, &skb->data[2],
-		       transaction->aid_len);
-
-		/* Check next byte is PARAMETERS tag (82) */
-		if (skb->data[transaction->aid_len + 2] !=3D
-		    NFC_EVT_TRANSACTION_PARAMS_TAG)
-			return -EPROTO;
-
-		transaction->params_len =3D skb->data[transaction->aid_len + 3];
-		memcpy(transaction->params, skb->data +
-		       transaction->aid_len + 4, transaction->params_len);
-
-		r =3D nfc_se_transaction(hdev->ndev, host, transaction);
-		break;
-	default:
-		return 1;
-	}
-	kfree_skb(skb);
-	return r;
-}
-EXPORT_SYMBOL(st21nfca_connectivity_event_received);
-
-int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
-					u8 event, struct sk_buff *skb)
-{
-	int r =3D 0;
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	pr_debug("apdu reader gate event: %x\n", event);
-
-	switch (event) {
-	case ST21NFCA_EVT_TRANSMIT_DATA:
-		del_timer_sync(&info->se_info.bwi_timer);
-		info->se_info.bwi_active =3D false;
-		r =3D nfc_hci_send_event(hdev, ST21NFCA_DEVICE_MGNT_GATE,
-				ST21NFCA_EVT_SE_END_OF_APDU_TRANSFER, NULL, 0);
-		if (r < 0)
-			goto exit;
-
-		info->se_info.cb(info->se_info.cb_context,
-			skb->data, skb->len, 0);
-		break;
-	case ST21NFCA_EVT_WTX_REQUEST:
-		mod_timer(&info->se_info.bwi_timer, jiffies +
-				msecs_to_jiffies(info->se_info.wt_timeout));
-		break;
-	}
-
-exit:
-	kfree_skb(skb);
-	return r;
-}
-EXPORT_SYMBOL(st21nfca_apdu_reader_event_received);
-
-void st21nfca_se_init(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	init_completion(&info->se_info.req_completion);
-	/* initialize timers */
-	init_timer(&info->se_info.bwi_timer);
-	info->se_info.bwi_timer.data =3D (unsigned long)info;
-	info->se_info.bwi_timer.function =3D st21nfca_se_wt_timeout;
-	info->se_info.bwi_active =3D false;
-
-	init_timer(&info->se_info.se_active_timer);
-	info->se_info.se_active_timer.data =3D (unsigned long)info;
-	info->se_info.se_active_timer.function =3D st21nfca_se_activation_tim=
eout;
-	info->se_info.se_active =3D false;
-
-	info->se_info.count_pipes =3D 0;
-	info->se_info.expected_pipes =3D 0;
-
-	info->se_info.xch_error =3D false;
-
-	info->se_info.wt_timeout =3D
-			ST21NFCA_BWI_TO_TIMEOUT(ST21NFCA_ATR_DEFAULT_BWI);
-}
-EXPORT_SYMBOL(st21nfca_se_init);
-
-void st21nfca_se_deinit(struct nfc_hci_dev *hdev)
-{
-	struct st21nfca_hci_info *info =3D nfc_hci_get_clientdata(hdev);
-
-	if (info->se_info.bwi_active)
-		del_timer_sync(&info->se_info.bwi_timer);
-	if (info->se_info.se_active)
-		del_timer_sync(&info->se_info.se_active_timer);
-
-	info->se_info.bwi_active =3D false;
-	info->se_info.se_active =3D false;
-}
-EXPORT_SYMBOL(st21nfca_se_deinit);
diff --git a/drivers/nfc/st21nfca/st21nfca_se.h b/drivers/nfc/st21nfca/=
st21nfca_se.h
deleted file mode 100644
index b172cfc..0000000
--- a/drivers/nfc/st21nfca/st21nfca_se.h
+++ /dev/null
@@ -1,63 +0,0 @@
-/*
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#ifndef __ST21NFCA_SE_H
-#define __ST21NFCA_SE_H
-
-#include <linux/skbuff.h>
-#include <linux/workqueue.h>
-
-/*
- * ref ISO7816-3 chap 8.1. the initial character TS is followed by a
- * sequence of at most 32 characters.
- */
-#define ST21NFCA_ESE_MAX_LENGTH			33
-#define ST21NFCA_ESE_HOST_ID			0xc0
-
-struct st21nfca_se_info {
-	u8 atr[ST21NFCA_ESE_MAX_LENGTH];
-	struct completion req_completion;
-
-	struct timer_list bwi_timer;
-	int wt_timeout; /* in msecs */
-	bool bwi_active;
-
-	struct timer_list se_active_timer;
-	bool se_active;
-	int expected_pipes;
-	int count_pipes;
-
-	bool xch_error;
-
-	se_io_cb_t cb;
-	void *cb_context;
-};
-
-int st21nfca_connectivity_event_received(struct nfc_hci_dev *hdev, u8 =
host,
-					u8 event, struct sk_buff *skb);
-int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
-					u8 event, struct sk_buff *skb);
-
-int st21nfca_hci_discover_se(struct nfc_hci_dev *hdev);
-int st21nfca_hci_enable_se(struct nfc_hci_dev *hdev, u32 se_idx);
-int st21nfca_hci_disable_se(struct nfc_hci_dev *hdev, u32 se_idx);
-int st21nfca_hci_se_io(struct nfc_hci_dev *hdev, u32 se_idx,
-		u8 *apdu, size_t apdu_length,
-		se_io_cb_t cb, void *cb_context);
-
-void st21nfca_se_init(struct nfc_hci_dev *hdev);
-void st21nfca_se_deinit(struct nfc_hci_dev *hdev);
-#endif /* __ST21NFCA_SE_H */
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
