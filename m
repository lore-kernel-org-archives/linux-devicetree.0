From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 3/9] NFC: nfcmrvl: add firmware download support
Date: Fri, 23 Oct 2015 14:23:00 +0200
Message-ID: <1445602986-3254-4-git-send-email-cuissard@marvell.com>
References: <1445602986-3254-1-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445602986-3254-1-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Implement firmware download protocol for Marvell NFC controllers.
This protocol is based on NCI frames that's why parts of its implementation
use some NCI generic functions.

Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/nfc/nfcmrvl/Makefile  |   2 +-
 drivers/nfc/nfcmrvl/fw_dnld.c | 551 ++++++++++++++++++++++++++++++++++++++++++
 drivers/nfc/nfcmrvl/fw_dnld.h |  98 ++++++++
 drivers/nfc/nfcmrvl/main.c    |  42 +++-
 drivers/nfc/nfcmrvl/nfcmrvl.h |  19 +-
 drivers/nfc/nfcmrvl/uart.c    |  12 +
 drivers/nfc/nfcmrvl/usb.c     |   2 +
 7 files changed, 716 insertions(+), 10 deletions(-)
 create mode 100644 drivers/nfc/nfcmrvl/fw_dnld.c
 create mode 100644 drivers/nfc/nfcmrvl/fw_dnld.h

diff --git a/drivers/nfc/nfcmrvl/Makefile b/drivers/nfc/nfcmrvl/Makefile
index 7751962..4554ee8 100644
--- a/drivers/nfc/nfcmrvl/Makefile
+++ b/drivers/nfc/nfcmrvl/Makefile
@@ -2,7 +2,7 @@
 # Makefile for NFCMRVL NCI based NFC driver
 #
 
-nfcmrvl-y += main.o
+nfcmrvl-y += main.o fw_dnld.o
 obj-$(CONFIG_NFC_MRVL) += nfcmrvl.o
 
 nfcmrvl_usb-y += usb.o
diff --git a/drivers/nfc/nfcmrvl/fw_dnld.c b/drivers/nfc/nfcmrvl/fw_dnld.c
new file mode 100644
index 0000000..d3065f0
--- /dev/null
+++ b/drivers/nfc/nfcmrvl/fw_dnld.c
@@ -0,0 +1,551 @@
+/*
+ * Marvell NFC driver: Firmware downloader
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
+ */
+
+#include <linux/module.h>
+#include <linux/unaligned/access_ok.h>
+#include <linux/firmware.h>
+#include <linux/nfc.h>
+#include <net/nfc/nci.h>
+#include <net/nfc/nci_core.h>
+#include "nfcmrvl.h"
+
+#define FW_DNLD_TIMEOUT			15000
+
+#define NCI_OP_PROPRIETARY_BOOT_CMD	nci_opcode_pack(NCI_GID_PROPRIETARY, \
+							NCI_OP_PROP_BOOT_CMD)
+
+/* FW download states */
+
+enum {
+	STATE_RESET = 0,
+	STATE_INIT,
+	STATE_SET_REF_CLOCK,
+	STATE_SET_HI_CONFIG,
+	STATE_OPEN_LC,
+	STATE_FW_DNLD,
+	STATE_CLOSE_LC,
+	STATE_BOOT
+};
+
+enum {
+	SUBSTATE_WAIT_COMMAND = 0,
+	SUBSTATE_WAIT_ACK_CREDIT,
+	SUBSTATE_WAIT_NACK_CREDIT,
+	SUBSTATE_WAIT_DATA_CREDIT,
+};
+
+/*
+** Patterns for responses
+*/
+
+static const uint8_t nci_pattern_core_reset_ntf[] = {
+	0x60, 0x00, 0x02, 0xA0, 0x01
+};
+
+static const uint8_t nci_pattern_core_init_rsp[] = {
+	0x40, 0x01, 0x11
+};
+
+static const uint8_t nci_pattern_core_set_config_rsp[] = {
+	0x40, 0x02, 0x02, 0x00, 0x00
+};
+
+static const uint8_t nci_pattern_core_conn_create_rsp[] = {
+	0x40, 0x04, 0x04, 0x00
+};
+
+static const uint8_t nci_pattern_core_conn_close_rsp[] = {
+	0x40, 0x05, 0x01, 0x00
+};
+
+static const uint8_t nci_pattern_core_conn_credits_ntf[] = {
+	0x60, 0x06, 0x03, 0x01, NCI_CORE_LC_CONNID_PROP_FW_DL, 0x01
+};
+
+static const uint8_t nci_pattern_proprietary_boot_rsp[] = {
+	0x4F, 0x3A, 0x01, 0x00
+};
+
+static struct sk_buff *alloc_lc_skb(struct nfcmrvl_private *priv, uint8_t plen)
+{
+	struct sk_buff *skb;
+	struct nci_data_hdr *hdr;
+
+	skb = nci_skb_alloc(priv->ndev, (NCI_DATA_HDR_SIZE + plen), GFP_KERNEL);
+	if (!skb) {
+		pr_err("no memory for data\n");
+		return NULL;
+	}
+
+	hdr = (struct nci_data_hdr *) skb_put(skb, NCI_DATA_HDR_SIZE);
+	hdr->conn_id = NCI_CORE_LC_CONNID_PROP_FW_DL;
+	hdr->rfu = 0;
+	hdr->plen = plen;
+
+	nci_mt_set((__u8 *)hdr, NCI_MT_DATA_PKT);
+	nci_pbf_set((__u8 *)hdr, NCI_PBF_LAST);
+
+	return skb;
+}
+
+static void fw_dnld_over(struct nfcmrvl_private *priv, u32 error)
+{
+	if (priv->fw_dnld.fw) {
+		release_firmware(priv->fw_dnld.fw);
+		priv->fw_dnld.fw = NULL;
+		priv->fw_dnld.header = NULL;
+		priv->fw_dnld.binary_config = NULL;
+	}
+
+	atomic_set(&priv->ndev->cmd_cnt, 0);
+	del_timer_sync(&priv->ndev->cmd_timer);
+
+	del_timer_sync(&priv->fw_dnld.timer);
+
+	nfc_info(priv->dev, "FW loading over (%d)]\n", error);
+
+	if (error != 0) {
+		/* failed, halt the chip to avoid power consumption */
+		nfcmrvl_chip_halt(priv);
+	}
+
+	nfc_fw_download_done(priv->ndev->nfc_dev, priv->fw_dnld.name, error);
+}
+
+static void fw_dnld_timeout(unsigned long arg)
+{
+	struct nfcmrvl_private *priv = (struct nfcmrvl_private *) arg;
+
+	nfc_err(priv->dev, "FW loading timeout");
+	priv->fw_dnld.state = STATE_RESET;
+	fw_dnld_over(priv, -ETIMEDOUT);
+}
+
+static int process_state_reset(struct nfcmrvl_private *priv,
+			       struct sk_buff *skb)
+{
+	if (sizeof(nci_pattern_core_reset_ntf) != skb->len ||
+	    memcmp(skb->data, nci_pattern_core_reset_ntf,
+		   sizeof(nci_pattern_core_reset_ntf)))
+		return -EINVAL;
+
+	nfc_info(priv->dev, "BootROM reset, start fw download\n");
+
+	/* Start FW download state machine */
+	priv->fw_dnld.state = STATE_INIT;
+	nci_send_cmd(priv->ndev, NCI_OP_CORE_INIT_CMD, 0, NULL);
+
+	return 0;
+}
+
+static int process_state_init(struct nfcmrvl_private *priv, struct sk_buff *skb)
+{
+	struct nci_core_set_config_cmd cmd;
+
+	if (sizeof(nci_pattern_core_init_rsp) >= skb->len ||
+	    memcmp(skb->data, nci_pattern_core_init_rsp,
+		   sizeof(nci_pattern_core_init_rsp)))
+		return -EINVAL;
+
+	cmd.num_params = 1;
+	cmd.param.id = NFCMRVL_PROP_REF_CLOCK;
+	cmd.param.len = 4;
+	memcpy(cmd.param.val, &priv->fw_dnld.header->ref_clock, 4);
+
+	nci_send_cmd(priv->ndev, NCI_OP_CORE_SET_CONFIG_CMD, 3 + cmd.param.len,
+		     &cmd);
+
+	priv->fw_dnld.state = STATE_SET_REF_CLOCK;
+	return 0;
+}
+
+static void create_lc(struct nfcmrvl_private *priv)
+{
+	uint8_t param[2] = { NCI_CORE_LC_PROP_FW_DL, 0x0 };
+
+	priv->fw_dnld.state = STATE_OPEN_LC;
+	nci_send_cmd(priv->ndev, NCI_OP_CORE_CONN_CREATE_CMD, 2, param);
+}
+
+static int process_state_set_ref_clock(struct nfcmrvl_private *priv,
+				       struct sk_buff *skb)
+{
+	struct nci_core_set_config_cmd cmd;
+
+	if (sizeof(nci_pattern_core_set_config_rsp) != skb->len ||
+	    memcmp(skb->data, nci_pattern_core_set_config_rsp, skb->len))
+		return -EINVAL;
+
+	cmd.num_params = 1;
+	cmd.param.id = NFCMRVL_PROP_SET_HI_CONFIG;
+
+	switch (priv->phy) {
+	case NFCMRVL_PHY_UART:
+		cmd.param.len = 5;
+		memcpy(cmd.param.val,
+		       &priv->fw_dnld.binary_config->uart.baudrate,
+		       4);
+		cmd.param.val[4] =
+			priv->fw_dnld.binary_config->uart.flow_control;
+		break;
+	case NFCMRVL_PHY_I2C:
+		cmd.param.len = 5;
+		memcpy(cmd.param.val,
+		       &priv->fw_dnld.binary_config->i2c.clk,
+		       4);
+		cmd.param.val[4] = 0;
+		break;
+	case NFCMRVL_PHY_SPI:
+		cmd.param.len = 5;
+		memcpy(cmd.param.val,
+		       &priv->fw_dnld.binary_config->spi.clk,
+		       4);
+		cmd.param.val[4] = 0;
+		break;
+	default:
+		create_lc(priv);
+		return 0;
+	}
+
+	priv->fw_dnld.state = STATE_SET_HI_CONFIG;
+	nci_send_cmd(priv->ndev, NCI_OP_CORE_SET_CONFIG_CMD, 3 + cmd.param.len,
+		     &cmd);
+	return 0;
+}
+
+static int process_state_set_hi_config(struct nfcmrvl_private *priv,
+				       struct sk_buff *skb)
+{
+	if (sizeof(nci_pattern_core_set_config_rsp) != skb->len ||
+	    memcmp(skb->data, nci_pattern_core_set_config_rsp, skb->len))
+		return -EINVAL;
+
+	create_lc(priv);
+	return 0;
+}
+
+static int process_state_open_lc(struct nfcmrvl_private *priv,
+				 struct sk_buff *skb)
+{
+	if (sizeof(nci_pattern_core_conn_create_rsp) >= skb->len ||
+	    memcmp(skb->data, nci_pattern_core_conn_create_rsp,
+		   sizeof(nci_pattern_core_conn_create_rsp)))
+		return -EINVAL;
+
+	priv->fw_dnld.state = STATE_FW_DNLD;
+	priv->fw_dnld.substate = SUBSTATE_WAIT_COMMAND;
+	priv->fw_dnld.offset = priv->fw_dnld.binary_config->offset;
+	return 0;
+}
+
+static int process_state_fw_dnld(struct nfcmrvl_private *priv,
+				 struct sk_buff *skb)
+{
+	uint16_t len;
+	uint16_t comp_len;
+	struct sk_buff *out_skb;
+
+	switch (priv->fw_dnld.substate) {
+	case SUBSTATE_WAIT_COMMAND:
+		/* Command format:
+		   B0..2: NCI header
+		   B3   : Helper command (0xA5)
+		   B4..5: le16 data size
+		   B6..7: le16 data size complement (~)
+		   B8..N: payload */
+
+		/* Remove NCI HDR */
+		skb_pull(skb, 3);
+		if (skb->data[0] != HELPER_CMD_PACKET_FORMAT || skb->len != 5) {
+			nfc_err(priv->dev, "bad command");
+			return -EINVAL;
+		}
+		skb_pull(skb, 1);
+		memcpy(&len, skb->data, 2);
+		skb_pull(skb, 2);
+		memcpy(&comp_len, skb->data, 2);
+		skb_pull(skb, 2);
+		len = get_unaligned_le16(&len);
+		comp_len = get_unaligned_le16(&comp_len);
+		if (((~len) & 0xFFFF) != comp_len) {
+			nfc_err(priv->dev, "bad len complement: %x %x %x",
+				len, comp_len, (~len & 0xFFFF));
+			out_skb = alloc_lc_skb(priv, 1);
+			if (!out_skb)
+				return -ENOMEM;
+			*skb_put(out_skb, 1) = 0xBF;
+			nci_send_frame(priv->ndev, out_skb);
+			priv->fw_dnld.substate = SUBSTATE_WAIT_NACK_CREDIT;
+			return 0;
+		}
+		priv->fw_dnld.chunk_len = len;
+		out_skb = alloc_lc_skb(priv, 1);
+		if (!out_skb)
+			return -ENOMEM;
+		*skb_put(out_skb, 1) = HELPER_ACK_PACKET_FORMAT;
+		nci_send_frame(priv->ndev, out_skb);
+		priv->fw_dnld.substate = SUBSTATE_WAIT_ACK_CREDIT;
+		break;
+
+	case SUBSTATE_WAIT_ACK_CREDIT:
+		if (sizeof(nci_pattern_core_conn_credits_ntf) != skb->len ||
+		    memcmp(nci_pattern_core_conn_credits_ntf, skb->data,
+			   skb->len)) {
+			nfc_err(priv->dev, "bad packet: waiting for credit");
+			return -EINVAL;
+		}
+		if (priv->fw_dnld.chunk_len == 0) {
+			/* FW Loading is done */
+			uint8_t conn_id = NCI_CORE_LC_CONNID_PROP_FW_DL;
+
+			priv->fw_dnld.state = STATE_CLOSE_LC;
+			nci_send_cmd(priv->ndev, NCI_OP_CORE_CONN_CLOSE_CMD,
+				     1, &conn_id);
+		} else {
+			out_skb = alloc_lc_skb(priv, priv->fw_dnld.chunk_len);
+			if (!out_skb)
+				return -ENOMEM;
+			memcpy(skb_put(out_skb, priv->fw_dnld.chunk_len),
+			       ((uint8_t *)priv->fw_dnld.fw->data) +
+			       priv->fw_dnld.offset,
+			       priv->fw_dnld.chunk_len);
+			nci_send_frame(priv->ndev, out_skb);
+			priv->fw_dnld.substate = SUBSTATE_WAIT_DATA_CREDIT;
+		}
+		break;
+
+	case SUBSTATE_WAIT_DATA_CREDIT:
+		if (sizeof(nci_pattern_core_conn_credits_ntf) != skb->len ||
+		    memcmp(nci_pattern_core_conn_credits_ntf, skb->data,
+			    skb->len)) {
+			nfc_err(priv->dev, "bad packet: waiting for credit");
+			return -EINVAL;
+		}
+		priv->fw_dnld.offset += priv->fw_dnld.chunk_len;
+		priv->fw_dnld.chunk_len = 0;
+		priv->fw_dnld.substate = SUBSTATE_WAIT_COMMAND;
+		break;
+
+	case SUBSTATE_WAIT_NACK_CREDIT:
+		if (sizeof(nci_pattern_core_conn_credits_ntf) != skb->len ||
+		    memcmp(nci_pattern_core_conn_credits_ntf, skb->data,
+			    skb->len)) {
+			nfc_err(priv->dev, "bad packet: waiting for credit");
+			return -EINVAL;
+		}
+		priv->fw_dnld.substate = SUBSTATE_WAIT_COMMAND;
+		break;
+	}
+	return 0;
+}
+
+static int process_state_close_lc(struct nfcmrvl_private *priv,
+				  struct sk_buff *skb)
+{
+	if (sizeof(nci_pattern_core_conn_close_rsp) != skb->len ||
+	    memcmp(skb->data, nci_pattern_core_conn_close_rsp, skb->len))
+		return -EINVAL;
+
+	priv->fw_dnld.state = STATE_BOOT;
+	nci_send_cmd(priv->ndev, NCI_OP_PROPRIETARY_BOOT_CMD, 0, NULL);
+	return 0;
+}
+
+static int process_state_boot(struct nfcmrvl_private *priv, struct sk_buff *skb)
+{
+	if (sizeof(nci_pattern_proprietary_boot_rsp) != skb->len ||
+	    memcmp(skb->data, nci_pattern_proprietary_boot_rsp, skb->len))
+		return -EINVAL;
+
+	/*
+	 * Update HI config to use the right configuration for the next
+	 * data exchanges.
+	 */
+	priv->if_ops->nci_update_config(priv,
+					&priv->fw_dnld.binary_config->config);
+
+	if (priv->fw_dnld.binary_config == &priv->fw_dnld.header->helper) {
+		/*
+		 * This is the case where an helper was needed and we have
+		 * uploaded it. Now we have to wait the next RESET NTF to start
+		 * FW download.
+		 */
+		priv->fw_dnld.state = STATE_RESET;
+		priv->fw_dnld.binary_config = &priv->fw_dnld.header->firmware;
+		nfc_info(priv->dev, "FW loading: helper loaded");
+	} else {
+		nfc_info(priv->dev, "FW loading: firmware loaded");
+		fw_dnld_over(priv, 0);
+	}
+	return 0;
+}
+
+static void fw_dnld_rx_work(struct work_struct *work)
+{
+	int ret;
+	struct sk_buff *skb;
+	struct nfcmrvl_fw_dnld *fw_dnld = container_of(work,
+						       struct nfcmrvl_fw_dnld,
+						       rx_work);
+	struct nfcmrvl_private *priv = container_of(fw_dnld,
+						    struct nfcmrvl_private,
+						    fw_dnld);
+
+	while ((skb = skb_dequeue(&fw_dnld->rx_q))) {
+		nfc_send_to_raw_sock(priv->ndev->nfc_dev, skb,
+				     RAW_PAYLOAD_NCI, NFC_DIRECTION_RX);
+		switch (fw_dnld->state) {
+		case STATE_RESET:
+			ret = process_state_reset(priv, skb);
+			break;
+		case STATE_INIT:
+			ret = process_state_init(priv, skb);
+			break;
+		case STATE_SET_REF_CLOCK:
+			ret = process_state_set_ref_clock(priv, skb);
+			break;
+		case STATE_SET_HI_CONFIG:
+			ret = process_state_set_hi_config(priv, skb);
+			break;
+		case STATE_OPEN_LC:
+			ret = process_state_open_lc(priv, skb);
+			break;
+		case STATE_FW_DNLD:
+			ret = process_state_fw_dnld(priv, skb);
+			break;
+		case STATE_CLOSE_LC:
+			ret = process_state_close_lc(priv, skb);
+			break;
+		case STATE_BOOT:
+			ret = process_state_boot(priv, skb);
+			break;
+		default:
+			ret = -EFAULT;
+		}
+
+		kfree_skb(skb);
+
+		if (ret != 0) {
+			nfc_err(priv->dev, "FW loading error");
+			fw_dnld_over(priv, ret);
+			break;
+		}
+	}
+}
+
+int	nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv)
+{
+	char name[32];
+
+	INIT_WORK(&priv->fw_dnld.rx_work, fw_dnld_rx_work);
+	snprintf(name, sizeof(name), "%s_nfcmrvl_fw_dnld_rx_wq",
+		 dev_name(priv->dev));
+	priv->fw_dnld.rx_wq = create_singlethread_workqueue(name);
+	if (!priv->fw_dnld.rx_wq)
+		return -ENOMEM;
+	skb_queue_head_init(&priv->fw_dnld.rx_q);
+	return 0;
+}
+
+void	nfcmrvl_fw_dnld_deinit(struct nfcmrvl_private *priv)
+{
+	destroy_workqueue(priv->fw_dnld.rx_wq);
+}
+
+void	nfcmrvl_fw_dnld_recv_frame(struct nfcmrvl_private *priv,
+				   struct sk_buff *skb)
+{
+	/* Allow next command */
+	atomic_set(&priv->ndev->cmd_cnt, 1);
+	del_timer_sync(&priv->ndev->cmd_timer);
+
+	/* Queue and trigger rx work */
+	skb_queue_tail(&priv->fw_dnld.rx_q, skb);
+	queue_work(priv->fw_dnld.rx_wq, &priv->fw_dnld.rx_work);
+}
+
+void nfcmrvl_fw_dnld_abort(struct nfcmrvl_private *priv)
+{
+	fw_dnld_over(priv, -EHOSTDOWN);
+}
+
+int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name)
+{
+	struct nfcmrvl_private *priv = nci_get_drvdata(ndev);
+	struct nfcmrvl_fw_dnld *fw_dnld = &priv->fw_dnld;
+
+	if (!priv->support_fw_dnld)
+		return -ENOTSUPP;
+
+	if (!firmware_name || !firmware_name[0])
+		return -EINVAL;
+
+	strcpy(fw_dnld->name, firmware_name);
+
+	/*
+	 * Retrieve FW binary file and parse it to initialize FW download
+	 * state machine.
+	 */
+
+	/* Retrieve FW binary */
+	if (request_firmware(&fw_dnld->fw, firmware_name, priv->dev) < 0) {
+		nfc_err(priv->dev, "failed to retrieve FW %s", firmware_name);
+		return -ENOENT;
+	}
+
+	fw_dnld->header = (const struct nfcmrvl_fw *) priv->fw_dnld.fw->data;
+
+	if (fw_dnld->header->magic != NFCMRVL_FW_MAGIC ||
+	    fw_dnld->header->phy != priv->phy) {
+		nfc_err(priv->dev, "bad firmware binary %s magic=0x%x phy=%d",
+			firmware_name, fw_dnld->header->magic,
+			fw_dnld->header->phy);
+		release_firmware(fw_dnld->fw);
+		fw_dnld->header = NULL;
+		return -EINVAL;
+	}
+
+	if (fw_dnld->header->helper.offset != 0) {
+		nfc_info(priv->dev, "loading helper");
+		fw_dnld->binary_config = &fw_dnld->header->helper;
+	} else {
+		nfc_info(priv->dev, "loading firmware");
+		fw_dnld->binary_config = &fw_dnld->header->firmware;
+	}
+
+	/* Configure a timer for timeout */
+	setup_timer(&priv->fw_dnld.timer, fw_dnld_timeout,
+		    (unsigned long) priv);
+	mod_timer(&priv->fw_dnld.timer,
+		  jiffies + msecs_to_jiffies(FW_DNLD_TIMEOUT));
+
+	/* Ronfigure HI to be sure that it is the bootrom values */
+	priv->if_ops->nci_update_config(priv,
+					&fw_dnld->header->bootrom.config);
+
+	/* Allow first command */
+	atomic_set(&priv->ndev->cmd_cnt, 1);
+
+	/* First, reset the chip */
+	priv->fw_dnld.state = STATE_RESET;
+	nfcmrvl_chip_reset(priv);
+
+	/* Now wait for CORE_RESET_NTF or timeout */
+
+	return 0;
+}
diff --git a/drivers/nfc/nfcmrvl/fw_dnld.h b/drivers/nfc/nfcmrvl/fw_dnld.h
new file mode 100644
index 0000000..ee4a339
--- /dev/null
+++ b/drivers/nfc/nfcmrvl/fw_dnld.h
@@ -0,0 +1,98 @@
+/**
+ * Marvell NFC driver: Firmware downloader
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
+#ifndef __NFCMRVL_FW_DNLD_H__
+#define __NFCMRVL_FW_DNLD_H__
+
+#include <linux/workqueue.h>
+
+#define NFCMRVL_FW_MAGIC		0x88888888
+
+#define NCI_OP_PROP_BOOT_CMD		0x3A
+
+#define NCI_CORE_LC_PROP_FW_DL		0xFD
+#define NCI_CORE_LC_CONNID_PROP_FW_DL	0x02
+
+#define HELPER_CMD_ENTRY_POINT		0x04
+#define HELPER_CMD_PACKET_FORMAT	0xA5
+#define HELPER_ACK_PACKET_FORMAT	0x5A
+#define HELPER_RETRY_REQUESTED		(1 << 15)
+
+struct nfcmrvl_private;
+
+struct nfcmrvl_fw_uart_config {
+	uint8_t flow_control;
+	uint32_t baudrate;
+} __packed;
+
+struct nfcmrvl_fw_i2c_config {
+	uint32_t clk;
+} __packed;
+
+struct nfcmrvl_fw_spi_config {
+	uint32_t clk;
+} __packed;
+
+struct nfcmrvl_fw_binary_config {
+	uint32_t offset;
+	union {
+		void *config;
+		struct nfcmrvl_fw_uart_config uart;
+		struct nfcmrvl_fw_i2c_config i2c;
+		struct nfcmrvl_fw_spi_config spi;
+		uint8_t reserved[64];
+	};
+} __packed;
+
+struct nfcmrvl_fw {
+	uint32_t magic;
+	uint32_t ref_clock;
+	uint32_t phy;
+	struct nfcmrvl_fw_binary_config bootrom;
+	struct nfcmrvl_fw_binary_config helper;
+	struct nfcmrvl_fw_binary_config firmware;
+	uint8_t reserved[64];
+} __packed;
+
+struct nfcmrvl_fw_dnld {
+	char name[NFC_FIRMWARE_NAME_MAXSIZE + 1];
+	const struct firmware *fw;
+
+	const struct nfcmrvl_fw *header;
+	const struct nfcmrvl_fw_binary_config *binary_config;
+
+	int state;
+	int substate;
+	int offset;
+	int chunk_len;
+
+	struct workqueue_struct	*rx_wq;
+	struct work_struct rx_work;
+	struct sk_buff_head rx_q;
+
+	struct timer_list timer;
+};
+
+int nfcmrvl_fw_dnld_init(struct nfcmrvl_private *priv);
+void nfcmrvl_fw_dnld_deinit(struct nfcmrvl_private *priv);
+void nfcmrvl_fw_dnld_abort(struct nfcmrvl_private *priv);
+int nfcmrvl_fw_dnld_start(struct nci_dev *ndev, const char *firmware_name);
+void nfcmrvl_fw_dnld_recv_frame(struct nfcmrvl_private *priv,
+				struct sk_buff *skb);
+
+#endif
diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
index 77e292f..6fb23cc 100644
--- a/drivers/nfc/nfcmrvl/main.c
+++ b/drivers/nfc/nfcmrvl/main.c
@@ -61,9 +61,6 @@ static int nfcmrvl_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
 
 	skb->dev = (void *)ndev;
 
-	if (!test_bit(NFCMRVL_NCI_RUNNING, &priv->flags))
-		return -EBUSY;
-
 	if (priv->config.hci_muxed) {
 		unsigned char *hdr;
 		unsigned char len = skb->len;
@@ -86,11 +83,18 @@ static int nfcmrvl_nci_setup(struct nci_dev *ndev)
 	return 0;
 }
 
+static int nfcmrvl_nci_fw_download(struct nci_dev *ndev,
+				   const char *firmware_name)
+{
+	return nfcmrvl_fw_dnld_start(ndev, firmware_name);
+}
+
 static struct nci_ops nfcmrvl_nci_ops = {
 	.open = nfcmrvl_nci_open,
 	.close = nfcmrvl_nci_close,
 	.send = nfcmrvl_nci_send,
 	.setup = nfcmrvl_nci_setup,
+	.fw_download = nfcmrvl_nci_fw_download,
 };
 
 struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
@@ -143,18 +147,26 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
 
 	nci_set_drvdata(priv->ndev, priv);
 
-	nfcmrvl_chip_reset(priv);
-
 	rc = nci_register_device(priv->ndev);
 	if (rc) {
 		nfc_err(dev, "nci_register_device failed %d\n", rc);
-		nci_free_device(priv->ndev);
-		goto error;
+		goto error_free_dev;
+	}
+
+	/* Ensure that controller is powered off */
+	nfcmrvl_chip_halt(priv);
+
+	rc = nfcmrvl_fw_dnld_init(priv);
+	if (rc) {
+		nfc_err(dev, "failed to initialize FW download %d\n", rc);
+		goto error_free_dev;
 	}
 
 	nfc_info(dev, "registered with nci successfully\n");
 	return priv;
 
+error_free_dev:
+	nci_free_device(priv->ndev);
 error:
 	kfree(priv);
 	return ERR_PTR(rc);
@@ -165,6 +177,11 @@ void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv)
 {
 	struct nci_dev *ndev = priv->ndev;
 
+	if (priv->ndev->nfc_dev->fw_download_in_progress)
+		nfcmrvl_fw_dnld_abort(priv);
+
+	nfcmrvl_fw_dnld_deinit(priv);
+
 	nci_unregister_device(ndev);
 	nci_free_device(ndev);
 	kfree(priv);
@@ -185,6 +202,11 @@ int nfcmrvl_nci_recv_frame(struct nfcmrvl_private *priv, struct sk_buff *skb)
 		}
 	}
 
+	if (priv->ndev->nfc_dev->fw_download_in_progress) {
+		nfcmrvl_fw_dnld_recv_frame(priv, skb);
+		return 0;
+	}
+
 	if (test_bit(NFCMRVL_NCI_RUNNING, &priv->flags))
 		nci_recv_frame(priv->ndev, skb);
 	else {
@@ -213,6 +235,12 @@ void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
 		nfc_info(priv->dev, "no reset available on this interface\n");
 }
 
+void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
+{
+	if (priv->config.reset_n_io)
+		gpio_set_value(priv->config.reset_n_io, 0);
+}
+
 #ifdef CONFIG_OF
 
 int nfcmrvl_parse_dt(struct device_node *node,
diff --git a/drivers/nfc/nfcmrvl/nfcmrvl.h b/drivers/nfc/nfcmrvl/nfcmrvl.h
index e5a7e54..1b30f04 100644
--- a/drivers/nfc/nfcmrvl/nfcmrvl.h
+++ b/drivers/nfc/nfcmrvl/nfcmrvl.h
@@ -1,7 +1,7 @@
 /**
  * Marvell NFC driver
  *
- * Copyright (C) 2014, Marvell International Ltd.
+ * Copyright (C) 2014-2015, Marvell International Ltd.
  *
  * This software file (the "File") is distributed by Marvell International
  * Ltd. under the terms of the GNU General Public License Version 2, June 1991
@@ -21,6 +21,8 @@
 
 #include <linux/platform_data/nfcmrvl.h>
 
+#include "fw_dnld.h"
+
 /* Define private flags: */
 #define NFCMRVL_NCI_RUNNING			1
 
@@ -37,6 +39,8 @@
 */
 
 #define NFCMRVL_PB_BAIL_OUT			0x11
+#define NFCMRVL_PROP_REF_CLOCK			0xF0
+#define NFCMRVL_PROP_SET_HI_CONFIG		0xF1
 
 /*
 ** HCI defines
@@ -52,9 +56,10 @@
 enum nfcmrvl_phy {
 	NFCMRVL_PHY_USB		= 0,
 	NFCMRVL_PHY_UART	= 1,
+	NFCMRVL_PHY_I2C		= 2,
+	NFCMRVL_PHY_SPI		= 3,
 };
 
-
 struct nfcmrvl_private {
 
 	unsigned long flags;
@@ -62,8 +67,15 @@ struct nfcmrvl_private {
 	/* Platform configuration */
 	struct nfcmrvl_platform_data config;
 
+	/* Parent dev */
 	struct nci_dev *ndev;
 
+	/* FW download context */
+	struct nfcmrvl_fw_dnld fw_dnld;
+
+	/* FW download support */
+	bool support_fw_dnld;
+
 	/*
 	** PHY related information
 	*/
@@ -82,6 +94,8 @@ struct nfcmrvl_if_ops {
 	int (*nci_open) (struct nfcmrvl_private *priv);
 	int (*nci_close) (struct nfcmrvl_private *priv);
 	int (*nci_send) (struct nfcmrvl_private *priv, struct sk_buff *skb);
+	void (*nci_update_config)(struct nfcmrvl_private *priv,
+				  const void *param);
 };
 
 void nfcmrvl_nci_unregister_dev(struct nfcmrvl_private *priv);
@@ -93,6 +107,7 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(void *drv_data,
 
 
 void nfcmrvl_chip_reset(struct nfcmrvl_private *priv);
+void nfcmrvl_chip_halt(struct nfcmrvl_private *priv);
 
 int nfcmrvl_parse_dt(struct device_node *node,
 		     struct nfcmrvl_platform_data *pdata);
diff --git a/drivers/nfc/nfcmrvl/uart.c b/drivers/nfc/nfcmrvl/uart.c
index 61442d6..8355824 100644
--- a/drivers/nfc/nfcmrvl/uart.c
+++ b/drivers/nfc/nfcmrvl/uart.c
@@ -50,10 +50,21 @@ static int nfcmrvl_uart_nci_send(struct nfcmrvl_private *priv,
 	return nu->ops.send(nu, skb);
 }
 
+static void nfcmrvl_uart_nci_update_config(struct nfcmrvl_private *priv,
+					   const void *param)
+{
+	struct nci_uart *nu = priv->drv_data;
+	const struct nfcmrvl_fw_uart_config *config = param;
+
+	nci_uart_set_config(nu, le32_to_cpu(config->baudrate),
+			    config->flow_control);
+}
+
 static struct nfcmrvl_if_ops uart_ops = {
 	.nci_open = nfcmrvl_uart_nci_open,
 	.nci_close = nfcmrvl_uart_nci_close,
 	.nci_send = nfcmrvl_uart_nci_send,
+	.nci_update_config = nfcmrvl_uart_nci_update_config
 };
 
 #ifdef CONFIG_OF
@@ -132,6 +143,7 @@ static int nfcmrvl_nci_uart_open(struct nci_uart *nu)
 		return PTR_ERR(priv);
 
 	priv->phy = NFCMRVL_PHY_UART;
+	priv->support_fw_dnld = true;
 
 	nu->drv_data = priv;
 	nu->ndev = priv->ndev;
diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index 5e624d1..b276174 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -347,6 +347,8 @@ static int nfcmrvl_probe(struct usb_interface *intf,
 
 	drv_data->priv = priv;
 	drv_data->priv->phy = NFCMRVL_PHY_USB;
+	drv_data->priv->support_fw_dnld = false;
+
 	priv->dev = &drv_data->udev->dev;
 
 	usb_set_intfdata(intf, drv_data);
-- 
2.2.0.33.gc18b867

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
