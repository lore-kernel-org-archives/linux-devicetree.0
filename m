From: Sagar Dharia <sdharia@codeaurora.org>
Subject: [PATCH V3 3/6] slimbus: Add messaging APIs to slimbus framework
Date: Mon,  3 Aug 2015 00:59:47 -0600
Message-ID: <1438585190-11894-4-git-send-email-sdharia@codeaurora.org>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, sdharia@codeaurora.org, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Slimbus devices use value-element, and information elements to
control device parameters (e.g. value element is used to represent
gain for codec, information element is used to represent interrupt
status for codec when codec interrupt fires).
Messaging APIs are used to set/get these value and information
elements. Slimbus specification uses 8-bit "transaction IDs" for
messages where a read-value is anticipated. Framework uses a table
of pointers to store those TIDs and responds back to the caller in
O(1).
Caller can opt to do synchronous, or asynchronous reads/writes. For
asynchronous operations, the callback will be called from atomic
context.

Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
Tested-by: Naveen Kaje <nkaje@codeaurora.org>
---
 drivers/slimbus/Makefile         |   2 +-
 drivers/slimbus/slim-core.c      |  44 +++++
 drivers/slimbus/slim-messaging.c | 378 +++++++++++++++++++++++++++++++++++++++
 include/linux/slimbus.h          | 226 +++++++++++++++++++++++
 4 files changed, 649 insertions(+), 1 deletion(-)
 create mode 100644 drivers/slimbus/slim-messaging.c

diff --git a/drivers/slimbus/Makefile b/drivers/slimbus/Makefile
index aa9c147..d95a0a2 100644
--- a/drivers/slimbus/Makefile
+++ b/drivers/slimbus/Makefile
@@ -1,4 +1,4 @@
 #
 # Makefile for kernel slimbus framework.
 #
-obj-$(CONFIG_SLIMBUS)			+= slim-core.o
+obj-$(CONFIG_SLIMBUS)			+= slim-core.o slim-messaging.o
diff --git a/drivers/slimbus/slim-core.c b/drivers/slimbus/slim-core.c
index d3fa28b..9d104ee 100644
--- a/drivers/slimbus/slim-core.c
+++ b/drivers/slimbus/slim-core.c
@@ -17,6 +17,7 @@
 #include <linux/completion.h>
 #include <linux/idr.h>
 #include <linux/pm_runtime.h>
+#include <linux/dma-mapping.h>
 #include <linux/slimbus.h>
 #include <linux/of.h>
 
@@ -454,7 +455,37 @@ int slim_register_controller(struct slim_controller *ctrl)
 		ctrl->min_cg = SLIM_MIN_CLK_GEAR;
 	if (!ctrl->max_cg)
 		ctrl->max_cg = SLIM_MAX_CLK_GEAR;
+
 	mutex_init(&ctrl->m_ctrl);
+	spin_lock_init(&ctrl->tx.lock);
+	spin_lock_init(&ctrl->rx.lock);
+
+	ctrl->pending_wr = kcalloc((ctrl->tx.n - 1),
+				   sizeof(struct slim_pending),
+				   GFP_KERNEL);
+	if (!ctrl->pending_wr) {
+		ret = -ENOMEM;
+		goto wr_alloc_failed;
+	}
+
+	sema_init(&ctrl->tx_sem, (ctrl->tx.n - 1));
+
+	ctrl->tx.base = dma_alloc_coherent(ctrl->dev.parent,
+					   (ctrl->tx.sl_sz * ctrl->tx.n),
+					   &ctrl->tx.phy, GFP_KERNEL);
+	if (!ctrl->tx.base) {
+		ret = -ENOMEM;
+		goto tx_alloc_failed;
+	}
+
+	ctrl->rx.base = dma_alloc_coherent(ctrl->dev.parent,
+					   (ctrl->rx.sl_sz * ctrl->rx.n),
+					   &ctrl->rx.phy, GFP_KERNEL);
+	if (!ctrl->rx.base) {
+		ret = -ENOMEM;
+		goto rx_alloc_failed;
+	}
+
 	ret = device_register(&ctrl->dev);
 	if (ret)
 		goto out_list;
@@ -472,10 +503,19 @@ int slim_register_controller(struct slim_controller *ctrl)
 
 err_workq_failed:
 	device_unregister(&ctrl->dev);
+	dma_free_coherent(ctrl->dev.parent, (ctrl->rx.sl_sz * ctrl->rx.n),
+			  ctrl->rx.base, ctrl->rx.phy);
+rx_alloc_failed:
+	dma_free_coherent(ctrl->dev.parent, (ctrl->tx.sl_sz * ctrl->tx.n),
+			  ctrl->tx.base, ctrl->tx.phy);
+tx_alloc_failed:
+	kfree(ctrl->pending_wr);
+wr_alloc_failed:
 out_list:
 	mutex_lock(&slim_lock);
 	idr_remove(&ctrl_idr, ctrl->nr);
 	mutex_unlock(&slim_lock);
+	dev_err(&ctrl->dev, "slimbus controller registration failed:%d", ret);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(slim_register_controller);
@@ -527,6 +567,10 @@ int slim_del_controller(struct slim_controller *ctrl)
 	wait_for_completion(&ctrl->dev_released);
 	list_del(&ctrl->list);
 	destroy_workqueue(ctrl->wq);
+	dma_free_coherent(ctrl->dev.parent, (ctrl->rx.sl_sz * ctrl->rx.n),
+			  ctrl->rx.base, ctrl->rx.phy);
+	dma_free_coherent(ctrl->dev.parent, (ctrl->tx.sl_sz * ctrl->tx.n),
+			  ctrl->tx.base, ctrl->tx.phy);
 	/* free bus id */
 	mutex_lock(&slim_lock);
 	idr_remove(&ctrl_idr, ctrl->nr);
diff --git a/drivers/slimbus/slim-messaging.c b/drivers/slimbus/slim-messaging.c
new file mode 100644
index 0000000..09ea850
--- /dev/null
+++ b/drivers/slimbus/slim-messaging.c
@@ -0,0 +1,378 @@
+/* Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/slab.h>
+#include <linux/slimbus.h>
+
+/**
+ * slim_msg_response: Deliver Message response received from a device to the
+ *	framework.
+ * @ctrl: Controller handle
+ * @reply: Reply received from the device
+ * @len: Length of the reply
+ * @tid: Transaction ID received with which framework can associate reply.
+ * Called by controller to inform framework about the response received.
+ * This helps in making the API asynchronous, and controller-driver doesn't need
+ * to manage 1 more table other than the one managed by framework mapping TID
+ * with buffers
+ */
+void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
+{
+	struct slim_val_inf *msg;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->txn_lock, flags);
+	msg = ctrl->tid_tbl[tid];
+	if (msg == NULL || msg->rbuf == NULL) {
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
+		dev_err(&ctrl->dev, "Got response to invalid TID:%d, len:%d\n",
+				tid, len);
+		return;
+	}
+	memcpy(msg->rbuf, reply, len);
+	ctrl->tid_tbl[tid] = NULL;
+	if (msg->comp_cb)
+		msg->comp_cb(msg->ctx, 0);
+	spin_unlock_irqrestore(&ctrl->txn_lock, flags);
+}
+EXPORT_SYMBOL_GPL(slim_msg_response);
+
+struct slim_cb_data {
+	struct completion *comp;
+	int ret;
+};
+
+static void slim_sync_default_cb(void *ctx, int err)
+{
+	struct slim_cb_data *cbd = ctx;
+
+	cbd->ret = err;
+	complete(cbd->comp);
+}
+
+int slim_processtxn(struct slim_controller *ctrl,
+				struct slim_msg_txn *txn)
+{
+	int ret, i = 0;
+	unsigned long flags;
+	u8 *buf;
+	bool async = false;
+	struct slim_cb_data cbd;
+	DECLARE_COMPLETION_ONSTACK(done);
+	bool need_tid = slim_tid_txn(txn->mt, txn->mc);
+
+	if (!txn->msg->comp_cb) {
+		txn->msg->comp_cb = slim_sync_default_cb;
+		cbd.comp = &done;
+		txn->msg->ctx = &cbd;
+	} else {
+		async = true;
+	}
+
+	buf = slim_get_tx(ctrl, txn, need_tid, async);
+	if (!buf)
+		return -ENOMEM;
+
+	if (need_tid) {
+		spin_lock_irqsave(&ctrl->txn_lock, flags);
+		for (i = 0; i < ctrl->last_tid; i++) {
+			if (ctrl->tid_tbl[i] == NULL)
+				break;
+		}
+		if (i >= ctrl->last_tid) {
+			if (ctrl->last_tid == (SLIM_MAX_TIDS - 1)) {
+				spin_unlock_irqrestore(&ctrl->txn_lock, flags);
+				return -ENOMEM;
+			}
+			ctrl->last_tid++;
+		}
+		ctrl->tid_tbl[i] = txn->msg;
+		txn->tid = i;
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
+	}
+
+	ret = ctrl->xfer_msg(ctrl, txn, buf);
+
+	if (!ret && !async) { /* sync transaction */
+		/* Fine-tune calculation after bandwidth management */
+		unsigned long ms = txn->rl + 100;
+
+		ret = wait_for_completion_timeout(&done,
+						  msecs_to_jiffies(ms));
+		if (!ret)
+			slim_return_tx(ctrl, -ETIMEDOUT);
+
+		ret = cbd.ret;
+	}
+
+	if (ret && need_tid) {
+		spin_lock_irqsave(&ctrl->txn_lock, flags);
+		/* Invalidate the transaction */
+		ctrl->tid_tbl[txn->tid] = NULL;
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
+	}
+	if (ret)
+		dev_err(&ctrl->dev, "Tx:MT:0x%x, MC:0x%x, LA:0x%x failed:%d\n",
+			txn->mt, txn->mc, txn->la, ret);
+	if (!async) {
+		txn->msg->comp_cb = NULL;
+		txn->msg->ctx = NULL;
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(slim_processtxn);
+
+static int slim_val_inf_sanity(struct slim_controller *ctrl,
+			       struct slim_val_inf *msg, u8 mc)
+{
+	if (!msg || msg->num_bytes > 16 ||
+	    (msg->start_offset + msg->num_bytes) > 0xC00)
+		goto reterr;
+	switch (mc) {
+	case SLIM_MSG_MC_REQUEST_VALUE:
+	case SLIM_MSG_MC_REQUEST_INFORMATION:
+		if (msg->rbuf != NULL)
+			return 0;
+		break;
+	case SLIM_MSG_MC_CHANGE_VALUE:
+	case SLIM_MSG_MC_CLEAR_INFORMATION:
+		if (msg->wbuf != NULL)
+			return 0;
+		break;
+	case SLIM_MSG_MC_REQUEST_CHANGE_VALUE:
+	case SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION:
+		if (msg->rbuf != NULL && msg->wbuf != NULL)
+			return 0;
+		break;
+	default:
+		break;
+	}
+reterr:
+	dev_err(&ctrl->dev, "Sanity check failed:msg:offset:0x%x, mc:%d\n",
+		msg->start_offset, mc);
+	return -EINVAL;
+}
+
+static u16 slim_slicecodefromsize(u16 req)
+{
+	static const u8 codetosize[8] = {1, 2, 3, 4, 6, 8, 12, 16};
+
+	if (req >= ARRAY_SIZE(codetosize))
+		return 0;
+	else
+		return codetosize[req];
+}
+
+static u16 slim_slicesize(int code)
+{
+	static const u8 sizetocode[16] = {
+		0, 1, 2, 3, 3, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7
+	};
+
+	clamp(code, 1, (int)ARRAY_SIZE(sizetocode));
+	return sizetocode[code - 1];
+}
+
+int slim_xfer_msg(struct slim_controller *ctrl,
+			struct slim_device *sbdev, struct slim_val_inf *msg,
+			u8 mc)
+{
+	DEFINE_SLIM_LDEST_TXN(txn_stack, mc, 6, sbdev->laddr, msg);
+	struct slim_msg_txn *txn = &txn_stack;
+	int ret;
+	u16 sl, cur;
+
+	ret = slim_val_inf_sanity(ctrl, msg, mc);
+	if (ret)
+		return ret;
+
+	sl = slim_slicesize(msg->num_bytes);
+	dev_dbg(&ctrl->dev, "SB xfer msg:os:%x, len:%d, MC:%x, sl:%x\n",
+		msg->start_offset, msg->num_bytes, mc, sl);
+
+	cur = slim_slicecodefromsize(sl);
+	txn->ec = ((sl | (1 << 3)) | ((msg->start_offset & 0xFFF) << 4));
+
+	if (mc == SLIM_MSG_MC_REQUEST_CHANGE_VALUE ||
+		mc == SLIM_MSG_MC_CHANGE_VALUE ||
+		mc == SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION ||
+		mc == SLIM_MSG_MC_CLEAR_INFORMATION)
+		txn->rl += msg->num_bytes;
+	if (slim_tid_txn(txn->mt, txn->mc))
+		txn->rl++;
+
+	return slim_processtxn(ctrl, txn);
+}
+EXPORT_SYMBOL_GPL(slim_xfer_msg);
+
+/* Message APIs Unicast message APIs used by slimbus slave drivers */
+
+/*
+ * Message API access routines.
+ * @sb: client handle requesting elemental message reads, writes.
+ * @msg: Input structure for start-offset, number of bytes to read.
+ * context: can sleep
+ * Returns:
+ * -EINVAL: Invalid parameters
+ * -ETIMEDOUT: If transmission of this message timed out (e.g. due to bus lines
+ *	not being clocked or driven by controller)
+ * -ENOTCONN: If the transmitted message was not ACKed by destination device.
+ */
+int slim_request_val_element(struct slim_device *sb,
+				struct slim_val_inf *msg)
+{
+	struct slim_controller *ctrl = sb->ctrl;
+
+	if (!ctrl)
+		return -EINVAL;
+	return slim_xfer_msg(ctrl, sb, msg, SLIM_MSG_MC_REQUEST_VALUE);
+}
+EXPORT_SYMBOL_GPL(slim_request_val_element);
+
+int slim_request_inf_element(struct slim_device *sb,
+				struct slim_val_inf *msg)
+{
+	struct slim_controller *ctrl = sb->ctrl;
+
+	if (!ctrl)
+		return -EINVAL;
+	return slim_xfer_msg(ctrl, sb, msg, SLIM_MSG_MC_REQUEST_INFORMATION);
+}
+EXPORT_SYMBOL_GPL(slim_request_inf_element);
+
+int slim_change_val_element(struct slim_device *sb, struct slim_val_inf *msg)
+{
+	struct slim_controller *ctrl = sb->ctrl;
+
+	if (!ctrl)
+		return -EINVAL;
+	return slim_xfer_msg(ctrl, sb, msg, SLIM_MSG_MC_CHANGE_VALUE);
+}
+EXPORT_SYMBOL_GPL(slim_change_val_element);
+
+int slim_clear_inf_element(struct slim_device *sb, struct slim_val_inf *msg)
+{
+	struct slim_controller *ctrl = sb->ctrl;
+
+	if (!ctrl)
+		return -EINVAL;
+	return slim_xfer_msg(ctrl, sb, msg, SLIM_MSG_MC_CLEAR_INFORMATION);
+}
+EXPORT_SYMBOL_GPL(slim_clear_inf_element);
+
+int slim_request_change_val_element(struct slim_device *sb,
+					struct slim_val_inf *msg)
+{
+	struct slim_controller *ctrl = sb->ctrl;
+
+	if (!ctrl)
+		return -EINVAL;
+	return slim_xfer_msg(ctrl, sb, msg, SLIM_MSG_MC_REQUEST_CHANGE_VALUE);
+}
+EXPORT_SYMBOL_GPL(slim_request_change_val_element);
+
+int slim_request_clear_inf_element(struct slim_device *sb,
+					struct slim_val_inf *msg)
+{
+	struct slim_controller *ctrl = sb->ctrl;
+
+	if (!ctrl)
+		return -EINVAL;
+	return slim_xfer_msg(ctrl, sb, msg,
+					SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION);
+}
+EXPORT_SYMBOL_GPL(slim_request_clear_inf_element);
+
+/* Functions to get/return TX, RX buffers for messaging. */
+
+void *slim_get_rx(struct slim_controller *ctrl)
+{
+	unsigned long flags;
+	int idx;
+
+	spin_lock_irqsave(&ctrl->rx.lock, flags);
+	if ((ctrl->rx.tail + 1) % ctrl->rx.n == ctrl->rx.head) {
+		spin_unlock_irqrestore(&ctrl->rx.lock, flags);
+		dev_err(&ctrl->dev, "RX QUEUE full!");
+		return NULL;
+	}
+	idx = ctrl->rx.tail;
+	ctrl->rx.tail = (ctrl->rx.tail + 1) % ctrl->rx.n;
+	spin_unlock_irqrestore(&ctrl->rx.lock, flags);
+	return ctrl->rx.base + (idx * ctrl->rx.sl_sz);
+}
+EXPORT_SYMBOL_GPL(slim_get_rx);
+
+int slim_return_rx(struct slim_controller *ctrl, void *buf)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->rx.lock, flags);
+	if (ctrl->rx.tail == ctrl->rx.head) {
+		spin_unlock_irqrestore(&ctrl->rx.lock, flags);
+		return -ENODATA;
+	}
+	memcpy(buf, ctrl->rx.base + (ctrl->rx.head * ctrl->rx.sl_sz),
+				ctrl->rx.sl_sz);
+	ctrl->rx.head = (ctrl->rx.head + 1) % ctrl->rx.n;
+	spin_unlock_irqrestore(&ctrl->rx.lock, flags);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(slim_return_rx);
+
+void slim_return_tx(struct slim_controller *ctrl, int err)
+{
+	unsigned long flags;
+	int idx;
+	struct slim_pending cur;
+
+	spin_lock_irqsave(&ctrl->tx.lock, flags);
+	idx = ctrl->tx.head;
+	ctrl->tx.head = (ctrl->tx.head + 1) % ctrl->tx.n;
+	cur = ctrl->pending_wr[idx];
+	ctrl->pending_wr[idx].cb = NULL;
+	spin_unlock_irqrestore(&ctrl->tx.lock, flags);
+	if (!cur.cb)
+		dev_err(&ctrl->dev, "NULL Transaction or completion");
+	else
+		cur.cb(cur.ctx, err);
+	up(&ctrl->tx_sem);
+}
+EXPORT_SYMBOL_GPL(slim_return_tx);
+
+void *slim_get_tx(struct slim_controller *ctrl, struct slim_msg_txn *txn,
+		bool need_tid, bool async)
+{
+	unsigned long flags;
+	int ret, idx;
+
+	ret = down_interruptible(&ctrl->tx_sem);
+	if (ret < 0) {
+		dev_err(&ctrl->dev, "TX semaphore down returned:%d", ret);
+		return NULL;
+	}
+	spin_lock_irqsave(&ctrl->tx.lock, flags);
+	if (((ctrl->tx.head + 1) % ctrl->tx.n) == ctrl->tx.tail) {
+		spin_unlock_irqrestore(&ctrl->tx.lock, flags);
+		dev_err(&ctrl->dev, "controller TX buf unavailable");
+		up(&ctrl->tx_sem);
+		return NULL;
+	}
+	idx = ctrl->tx.tail;
+	ctrl->tx.tail = (ctrl->tx.tail + 1) % ctrl->tx.n;
+	spin_unlock_irqrestore(&ctrl->tx.lock, flags);
+	ctrl->pending_wr[idx].cb = txn->msg->comp_cb;
+	ctrl->pending_wr[idx].ctx = txn->msg->ctx;
+	ctrl->pending_wr[idx].need_tid = need_tid;
+	ctrl->pending_wr[idx].async = async;
+	return ctrl->tx.base + (idx * ctrl->tx.sl_sz);
+}
+EXPORT_SYMBOL_GPL(slim_get_tx);
diff --git a/include/linux/slimbus.h b/include/linux/slimbus.h
index ca587ec..8c9bd3d 100644
--- a/include/linux/slimbus.h
+++ b/include/linux/slimbus.h
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
+#include <linux/semaphore.h>
 #include <linux/mod_devicetable.h>
 
 /**
@@ -34,6 +35,9 @@ extern struct bus_type slimbus_type;
 #define SLIM_FRM_SLOTS_PER_SUPERFRAME	16
 #define SLIM_GDE_SLOTS_PER_SUPERFRAME	2
 
+/* MAX in-flight transactions neededing transaction ID (8-bit, per spec) */
+#define SLIM_MAX_TIDS			256
+
 struct slim_controller;
 struct slim_device;
 
@@ -100,12 +104,117 @@ struct slim_addrt {
 #define SLIM_MSG_MC_ASSIGN_LOGICAL_ADDRESS       0x2
 #define SLIM_MSG_MC_REPORT_ABSENT                0xF
 
+/* Information Element management messages */
+#define SLIM_MSG_MC_REQUEST_INFORMATION          0x20
+#define SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION    0x21
+#define SLIM_MSG_MC_REPLY_INFORMATION            0x24
+#define SLIM_MSG_MC_CLEAR_INFORMATION            0x28
+#define SLIM_MSG_MC_REPORT_INFORMATION           0x29
+
+/* Value Element management messages */
+#define SLIM_MSG_MC_REQUEST_VALUE                0x60
+#define SLIM_MSG_MC_REQUEST_CHANGE_VALUE         0x61
+#define SLIM_MSG_MC_REPLY_VALUE                  0x64
+#define SLIM_MSG_MC_CHANGE_VALUE                 0x68
+
 /* Destination type Values */
 #define SLIM_MSG_DEST_LOGICALADDR	0
 #define SLIM_MSG_DEST_ENUMADDR		1
 #define	SLIM_MSG_DEST_BROADCAST		3
 
 /**
+ * struct slim_val_inf: Slimbus value or information element
+ * @start_offset: Specifies starting offset in information/value element map
+ * @num_bytes: upto 16. This ensures that the message will fit the slicesize
+ *		per slimbus spec
+ * @comp_cb: Callback if this read/write is asynchronous
+ * @ctx: Argument for comp_cb
+ */
+struct slim_val_inf {
+	u16			start_offset;
+	u8			num_bytes;
+	u8			*rbuf;
+	const u8		*wbuf;
+	void			(*comp_cb)(void *ctx, int err);
+	void			*ctx;
+};
+
+/**
+ * struct slim_msg_txn: Message to be sent by the controller.
+ * This structure has packet header, payload and buffer to be filled (if any)
+ * @rl: Header field. remaining length.
+ * @mt: Header field. Message type.
+ * @mc: Header field. LSB is message code for type mt.
+ * @dt: Header field. Destination type.
+ * @ec: Element code. Used for elemental access APIs.
+ * @len: Length of payload. (excludes ec)
+ * @tid: Transaction ID. Used for messages expecting response.
+ *	(relevant for message-codes involving read operation)
+ * @la: Logical address of the device this message is going to.
+ *	(Not used when destination type is broadcast.)
+ * @msg: Elemental access message to be read/written
+ */
+struct slim_msg_txn {
+	u8			rl;
+	u8			mt;
+	u8			mc;
+	u8			dt;
+	u16			ec;
+	u8			tid;
+	u8			la;
+	struct slim_val_inf	*msg;
+};
+
+/* Frequently used message transaction structures */
+#define DEFINE_SLIM_LDEST_TXN(name, mc, rl, la, msg) \
+	struct slim_msg_txn name = { rl, 0, mc, SLIM_MSG_DEST_LOGICALADDR, 0,\
+					0, la, msg, }
+
+#define DEFINE_SLIM_BCAST_TXN(name, mc, rl, la, msg) \
+	struct slim_msg_txn name = { rl, 0, mc, SLIM_MSG_DEST_BROADCAST, 0,\
+					0, la, msg, }
+
+#define DEFINE_SLIM_EDEST_TXN(name, mc, rl, la, msg) \
+	struct slim_msg_txn name = { rl, 0, mc, SLIM_MSG_DEST_ENUMADDR, 0,\
+					0, la, msg, }
+
+/**
+ * struct slim_ctrl_buf: circular buffer used by contoller for TX, RX
+ * @base: virtual base address for this buffer
+ * @phy: physical address for this buffer (this is useful if controller can
+ *	  DMA the buffers for TX and RX to/from controller hardware
+ * @lock: lock protecting head and tail
+ * @head: index where buffer is returned back
+ * @tail: index from where buffer is consumed
+ * @sl_sz: byte-size of each slot in this buffer
+ * @n:	  number of elements in this circular ring, note that this needs to be
+ *	1 more than actual buffers to allow for one open slot
+ */
+struct slim_ctrl_buf {
+	void		*base;
+	phys_addr_t	phy;
+	spinlock_t	lock;
+	int		head;
+	int		tail;
+	int		sl_sz;
+	int		n;
+};
+
+/**
+ * struct slim_pending: context of pending transfers
+ * @cb: callback for this transfer
+ * @ctx: contex for the callback function
+ * @need_tid: True if this transfer need Transaction ID
+ * @async: True if this is asynchronous transfer
+ */
+struct slim_pending {
+	void (*cb)(void *ctx, int err);
+	void *ctx;
+	bool need_tid;
+	bool async;
+};
+
+/**
  * struct slim_controller: Controls every instance of SLIMbus
  *				(similar to 'master' on SPI)
  *	'Manager device' is responsible for  device management, bandwidth
@@ -140,6 +249,16 @@ struct slim_addrt {
  * @num_dev: Number of active slimbus slaves on this bus
  * @devs: List of devices on this controller
  * @wq: Workqueue per controller used to notify devices when they report present
+ * @tid_tbl: Table of transactions having transaction ID
+ * @txn_lock: Lock to protect table of transactions
+ * @rx: RX buffers used by controller to receive messages. Ctrl may receive more
+ *	than 1 message (e.g. multiple report-present messages or messages from
+ *	multiple slaves).
+ * @tx: TX buffers used by controller to transmit messages. Ctrl may have
+ *	ability to send/queue multiple messages to HW at once.
+ * @pending_wr: Pending write transactions to be acknowledged by controller
+ * @tx_sem: Semaphore for available TX buffers for this controller
+ * @last_tid: Last used entry for TID transactions
  * @dev_released: completion used to signal when sysfs has released this
  *	controller so that it can be deleted during shutdown
  * @xfer_msg: Transfer a message on this controller (this can be a broadcast
@@ -166,7 +285,16 @@ struct slim_controller {
 	u8			num_dev;
 	struct list_head	devs;
 	struct workqueue_struct *wq;
+	struct slim_val_inf	*tid_tbl[SLIM_MAX_TIDS];
+	u8			last_tid;
+	spinlock_t		txn_lock;
+	struct slim_ctrl_buf	tx;
+	struct slim_ctrl_buf	rx;
+	struct slim_pending	*pending_wr;
+	struct semaphore	tx_sem;
 	struct completion	dev_released;
+	int			(*xfer_msg)(struct slim_controller *ctrl,
+					    struct slim_msg_txn *tx, void *buf);
 	int			(*set_laddr)(struct slim_controller *ctrl,
 					     struct slim_eaddr *ea, u8 laddr);
 	int			(*get_laddr)(struct slim_controller *ctrl,
@@ -386,4 +514,102 @@ static inline void slim_set_clientdata(struct slim_device *dev, void *data)
 	dev_set_drvdata(&dev->dev, data);
 }
 
+/* Message APIs Unicast message APIs used by slimbus slave drivers */
+
+/**
+ * Message API access routines for value elements.
+ * @sb: client handle requesting elemental message reads, writes.
+ * @msg: Input structure for start-offset, number of bytes to read.
+ * context: can sleep
+ * Returns:
+ * -EINVAL: Invalid parameters
+ * -ETIMEDOUT: If transmission of this message timed out (e.g. due to bus lines
+ *	not being clocked or driven by controller)
+ * -ENOTCONN: If the transmitted message was not ACKed by destination device.
+ */
+int slim_request_val_element(struct slim_device *sb,
+					struct slim_val_inf *msg);
+int slim_change_val_element(struct slim_device *sb,
+					struct slim_val_inf *msg);
+int slim_request_change_val_element(struct slim_device *sb,
+					struct slim_val_inf *msg);
+
+
+/**
+ * Message API access routines for information elements.
+ * @sb: client handle requesting elemental message reads, writes.
+ * @msg: Input structure for start-offset, number of bytes to read
+ *	wbuf will contain information element(s) bit masks to be cleared.
+ *	rbuf will return what the information element value was
+ */
+
+int slim_request_inf_element(struct slim_device *sb,
+					struct slim_val_inf *msg);
+int slim_clear_inf_element(struct slim_device *sb,
+					struct slim_val_inf *msg);
+int slim_request_clear_inf_element(struct slim_device *sb,
+					struct slim_val_inf *msg);
+
+/**
+ * slim_msg_response: Deliver Message response received from a device to the
+ *	framework.
+ * @ctrl: Controller handle
+ * @reply: Reply received from the device
+ * @len: Length of the reply
+ * @tid: Transaction ID received with which framework can associate reply.
+ * Called by controller to inform framework about the response received.
+ * This helps in making the API asynchronous, and controller-driver doesn't need
+ * to manage 1 more table other than the one managed by framework mapping TID
+ * with buffers
+ */
+void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid,
+				u8 len);
+
+/**
+ * slim_processtxn: Process a slimbus-messaging transaction
+ * @ctrl: Controller handle
+ * @txn: Transaction to be sent over SLIMbus
+ * Called by controller to transmit messaging transactions not dealing with
+ * Interface/Value elements. (e.g. transmittting a message to assign logical
+ * address to a slave device
+ * Returns:
+ * -ETIMEDOUT: If transmission of this message timed out (e.g. due to bus lines
+ *	not being clocked or driven by controller)
+ * -ENOTCONN: If the transmitted message was not ACKed by destination device.
+ */
+int slim_processtxn(struct slim_controller *ctrl, struct slim_msg_txn *txn);
+
+/**
+ * Functions to get/put TX, RX buffers for messaging.
+ * @ctrl: Controller handle
+ * These functions are called by controller to process the TX/RX buffers.
+ * TX buffer is requested by controller when it's filled-in and sent to the
+ * HW. When HW has finished processing this buffer, controller should return it
+ * back to the pool.
+ * RX buffer is requested by controller when data is received from HW, but is
+ * not processed (e.g. 'report-present message was sent by HW in ISR and SW
+ * needs more time to process the buffer to assign Logical Address)
+ * RX buffer is returned back to the pool when associated RX action
+ * is taken (e.g. Received message is decoded and client's
+ * response buffer is filled in.)
+ */
+void *slim_get_rx(struct slim_controller *ctrl);
+
+int slim_return_rx(struct slim_controller *ctrl, void *buf);
+
+void *slim_get_tx(struct slim_controller *ctrl, struct slim_msg_txn *txn,
+		bool need_tid, bool async);
+
+void slim_return_tx(struct slim_controller *ctrl, int err);
+
+static inline bool slim_tid_txn(u8 mt, u8 mc)
+{
+	return (mt == SLIM_MSG_MT_CORE &&
+		(mc == SLIM_MSG_MC_REQUEST_INFORMATION ||
+		 mc == SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION ||
+		 mc == SLIM_MSG_MC_REQUEST_VALUE ||
+		 mc == SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION));
+}
+/* end of message apis */
+
 #endif /* _LINUX_SLIMBUS_H */
-- 
1.8.2.1
