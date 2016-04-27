From: Sagar Dharia <sdharia@codeaurora.org>
Subject: [PATCH V5 5/6] slimbus: Add support for 'clock-pause' feature
Date: Wed, 27 Apr 2016 17:58:08 -0600
Message-ID: <1461801489-16254-6-git-send-email-sdharia@codeaurora.org>
References: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1461801489-16254-1-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, sdharia@codeaurora.org, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, sheetal.tigadoli@gmail.com, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Per slimbus specification, a reconfiguration sequence known as
'clock pause' needs to be broadcast over the bus while entering low-
power mode. Clock-pause is initiated by the controller driver.
To exit clock-pause, controller typically wakes up the framer device.
Since wakeup precedure is controller-specific, framework calls it via
controller's function pointer to invoke it.

Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
---
 drivers/slimbus/Makefile         |   2 +-
 drivers/slimbus/slim-core.c      |  15 +++++
 drivers/slimbus/slim-messaging.c |  50 ++++++++++++++--
 drivers/slimbus/slim-sched.c     | 126 +++++++++++++++++++++++++++++++++++++++
 include/linux/slimbus.h          |  69 ++++++++++++++++++++-
 5 files changed, 254 insertions(+), 8 deletions(-)
 create mode 100644 drivers/slimbus/slim-sched.c

diff --git a/drivers/slimbus/Makefile b/drivers/slimbus/Makefile
index 574a892..cc0d20a 100644
--- a/drivers/slimbus/Makefile
+++ b/drivers/slimbus/Makefile
@@ -1,5 +1,5 @@
 #
 # Makefile for kernel slimbus framework.
 #
-obj-$(CONFIG_SLIMBUS)			+= slim-core.o slim-messaging.o
+obj-$(CONFIG_SLIMBUS)			+= slim-core.o slim-messaging.o slim-sched.o
 obj-$(CONFIG_SLIM_QCOM_CTRL)		+= slim-qcom-ctrl.o
diff --git a/drivers/slimbus/slim-core.c b/drivers/slimbus/slim-core.c
index 7d8b71c..c9d912f 100644
--- a/drivers/slimbus/slim-core.c
+++ b/drivers/slimbus/slim-core.c
@@ -421,6 +421,8 @@ int slim_register_controller(struct slim_controller *ctrl)
 	mutex_init(&ctrl->m_ctrl);
 	spin_lock_init(&ctrl->tx.lock);
 	spin_lock_init(&ctrl->rx.lock);
+	mutex_init(&ctrl->sched.m_reconf);
+	init_completion(&ctrl->sched.pause_comp);
 
 	ctrl->pending_wr = kcalloc((ctrl->tx.n - 1),
 				   sizeof(struct slim_pending),
@@ -512,6 +514,8 @@ int slim_del_controller(struct slim_controller *ctrl)
 	/* Remove all clients */
 	device_for_each_child(&ctrl->dev, NULL, slim_ctrl_remove_device);
 
+	/* Enter clock pause */
+	slim_ctrl_clk_pause(ctrl, false, 0);
 
 	list_del(&ctrl->list);
 	destroy_workqueue(ctrl->wq);
@@ -666,6 +670,14 @@ int slim_assign_laddr(struct slim_controller *ctrl, struct slim_eaddr *e_addr,
 	struct slim_device *slim;
 	struct slim_addrt *temp;
 
+	ret = pm_runtime_get_sync(ctrl->dev.parent);
+
+	if (ctrl->sched.clk_state != SLIM_CLK_ACTIVE) {
+		dev_err(&ctrl->dev, "slim ctrl not active,state:%d, ret:%d\n",
+				    ctrl->sched.clk_state, ret);
+		goto slimbus_not_active;
+	}
+
 	mutex_lock(&ctrl->m_ctrl);
 	/* already assigned */
 	if (ctrl_getaddr_entry(ctrl, e_addr, &i) == 0) {
@@ -736,6 +748,9 @@ ret_assigned_laddr:
 		}
 		mutex_unlock(&slim->report_lock);
 	}
+slimbus_not_active:
+	pm_runtime_mark_last_busy(ctrl->dev.parent);
+	pm_runtime_put_autosuspend(ctrl->dev.parent);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(slim_assign_laddr);
diff --git a/drivers/slimbus/slim-messaging.c b/drivers/slimbus/slim-messaging.c
index 183742d..5c07241 100644
--- a/drivers/slimbus/slim-messaging.c
+++ b/drivers/slimbus/slim-messaging.c
@@ -10,6 +10,7 @@
  * GNU General Public License for more details.
  */
 #include <linux/slab.h>
+#include <linux/pm_runtime.h>
 #include <linux/slimbus.h>
 
 /**
@@ -43,6 +44,9 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
 	memcpy(msg->rbuf, reply, len);
 	if (msg->comp_cb)
 		msg->comp_cb(msg->ctx, 0);
+	/* Remove runtime-pm vote now that response was received for TID txn */
+	pm_runtime_mark_last_busy(ctrl->dev.parent);
+	pm_runtime_put_autosuspend(ctrl->dev.parent);
 }
 EXPORT_SYMBOL_GPL(slim_msg_response);
 
@@ -65,11 +69,21 @@ int slim_processtxn(struct slim_controller *ctrl,
 	int ret, i = 0;
 	unsigned long flags;
 	u8 *buf;
-	bool async = false;
+	bool async = false, clk_pause_msg = false;
 	struct slim_cb_data cbd;
 	DECLARE_COMPLETION_ONSTACK(done);
 	bool need_tid = slim_tid_txn(txn->mt, txn->mc);
 
+	/*
+	 * do not vote for runtime-PM if the transactions are part of clock
+	 * pause sequence
+	 */
+	if (ctrl->sched.clk_state == SLIM_CLK_ENTERING_PAUSE &&
+		(txn->mt == SLIM_MSG_MT_CORE &&
+		 txn->mc >= SLIM_MSG_MC_BEGIN_RECONFIGURATION &&
+		 txn->mc <= SLIM_MSG_MC_RECONFIGURE_NOW))
+		clk_pause_msg = true;
+
 	if (!txn->msg->comp_cb) {
 		txn->msg->comp_cb = slim_sync_default_cb;
 		cbd.comp = &done;
@@ -78,7 +92,7 @@ int slim_processtxn(struct slim_controller *ctrl,
 		async = true;
 	}
 
-	buf = slim_get_tx(ctrl, txn, need_tid);
+	buf = slim_get_tx(ctrl, txn, need_tid, clk_pause_msg);
 	if (!buf)
 		return -ENOMEM;
 
@@ -92,7 +106,8 @@ int slim_processtxn(struct slim_controller *ctrl,
 			if (ctrl->last_tid == (SLIM_MAX_TIDS - 1)) {
 				spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 				slim_return_tx(ctrl, -ENOMEM);
-				return -ENOMEM;
+				ret = cbd.ret;
+				return ret;
 			}
 			ctrl->last_tid++;
 		}
@@ -362,34 +377,57 @@ void slim_return_tx(struct slim_controller *ctrl, int err)
 		cur.cb(cur.ctx, err);
 
 	up(&ctrl->tx_sem);
+	if (!cur.clk_pause && (!cur.need_tid || err)) {
+		/**
+		 * remove runtime-pm vote if this was TX only, or
+		 * if there was error during this transaction
+		 */
+		pm_runtime_mark_last_busy(ctrl->dev.parent);
+		pm_runtime_put_autosuspend(ctrl->dev.parent);
+	}
 }
 EXPORT_SYMBOL_GPL(slim_return_tx);
 
 void *slim_get_tx(struct slim_controller *ctrl, struct slim_msg_txn *txn,
-		bool need_tid)
+		bool need_tid, bool clk_pause)
 {
 	unsigned long flags;
 	int ret, idx;
 
+	if (!clk_pause) {
+		ret = pm_runtime_get_sync(ctrl->dev.parent);
+
+		if (ctrl->sched.clk_state != SLIM_CLK_ACTIVE) {
+			dev_err(&ctrl->dev, "ctrl wrong state:%d, ret:%d\n",
+				ctrl->sched.clk_state, ret);
+			goto slim_tx_err;
+		}
+	}
+
 	ret = down_interruptible(&ctrl->tx_sem);
 	if (ret < 0) {
 		dev_err(&ctrl->dev, "TX semaphore down returned:%d", ret);
-		return NULL;
+		goto slim_tx_err;
 	}
 	spin_lock_irqsave(&ctrl->tx.lock, flags);
 	if (((ctrl->tx.head + 1) % ctrl->tx.n) == ctrl->tx.tail) {
 		spin_unlock_irqrestore(&ctrl->tx.lock, flags);
 		dev_err(&ctrl->dev, "controller TX buf unavailable");
 		up(&ctrl->tx_sem);
-		return NULL;
+		goto slim_tx_err;
 	}
 	idx = ctrl->tx.tail;
 	ctrl->tx.tail = (ctrl->tx.tail + 1) % ctrl->tx.n;
 	ctrl->pending_wr[idx].cb = txn->msg->comp_cb;
 	ctrl->pending_wr[idx].ctx = txn->msg->ctx;
 	ctrl->pending_wr[idx].need_tid = need_tid;
+	ctrl->pending_wr[idx].clk_pause = clk_pause;
 	spin_unlock_irqrestore(&ctrl->tx.lock, flags);
 
 	return ctrl->tx.base + (idx * ctrl->tx.sl_sz);
+slim_tx_err:
+	pm_runtime_mark_last_busy(ctrl->dev.parent);
+	pm_runtime_put_autosuspend(ctrl->dev.parent);
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(slim_get_tx);
diff --git a/drivers/slimbus/slim-sched.c b/drivers/slimbus/slim-sched.c
new file mode 100644
index 0000000..3ed075f
--- /dev/null
+++ b/drivers/slimbus/slim-sched.c
@@ -0,0 +1,126 @@
+/* Copyright (c) 2011-2016, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/errno.h>
+#include <linux/slimbus.h>
+
+/**
+ * slim_ctrl_clk_pause: Called by slimbus controller to enter/exit 'clock pause'
+ * Slimbus specification needs this sequence to turn-off clocks for the bus.
+ * The sequence involves sending 3 broadcast messages (reconfiguration
+ * sequence) to inform all devices on the bus.
+ * To exit clock-pause, controller typically wakes up active framer device.
+ * @ctrl: controller requesting bus to be paused or woken up
+ * @wakeup: Wakeup this controller from clock pause.
+ * @restart: Restart time value per spec used for clock pause. This value
+ *	isn't used when controller is to be woken up.
+ * This API executes clock pause reconfiguration sequence if wakeup is false.
+ * If wakeup is true, controller's wakeup is called.
+ * For entering clock-pause, -EBUSY is returned if a message txn in pending.
+ */
+int slim_ctrl_clk_pause(struct slim_controller *ctrl, bool wakeup, u8 restart)
+{
+	int i, ret = 0;
+	unsigned long flags;
+	struct slim_sched *sched = &ctrl->sched;
+	struct slim_val_inf msg = {0, 0, NULL, NULL, NULL, NULL};
+
+	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
+				3, SLIM_LA_MANAGER, &msg);
+
+	if (wakeup == false && restart > SLIM_CLK_UNSPECIFIED)
+		return -EINVAL;
+
+	mutex_lock(&sched->m_reconf);
+	if (wakeup) {
+		if (sched->clk_state == SLIM_CLK_ACTIVE) {
+			mutex_unlock(&sched->m_reconf);
+			return 0;
+		}
+
+		/**
+		 * Fine-tune calculation based on clock gear,
+		 * message-bandwidth after bandwidth management
+		 */
+		ret = wait_for_completion_timeout(&sched->pause_comp,
+				msecs_to_jiffies(100));
+		if (!ret) {
+			mutex_unlock(&sched->m_reconf);
+			pr_err("Previous clock pause did not finish");
+			return -ETIMEDOUT;
+		}
+		ret = 0;
+
+		/**
+		 * Slimbus framework will call controller wakeup
+		 * Controller should make sure that it sets active framer
+		 * out of clock pause
+		 */
+		if (sched->clk_state == SLIM_CLK_PAUSED && ctrl->wakeup)
+			ret = ctrl->wakeup(ctrl);
+		if (!ret)
+			sched->clk_state = SLIM_CLK_ACTIVE;
+		mutex_unlock(&sched->m_reconf);
+
+		return ret;
+	}
+
+	/* already paused */
+	if (ctrl->sched.clk_state == SLIM_CLK_PAUSED) {
+		mutex_unlock(&sched->m_reconf);
+		return 0;
+	}
+
+	spin_lock_irqsave(&ctrl->txn_lock, flags);
+	for (i = 0; i < ctrl->last_tid; i++) {
+		/* Pending response for a message */
+		if (ctrl->tid_tbl[i]) {
+			spin_unlock_irqrestore(&ctrl->txn_lock, flags);
+			mutex_unlock(&sched->m_reconf);
+			return -EBUSY;
+		}
+	}
+	spin_unlock_irqrestore(&ctrl->txn_lock, flags);
+
+	sched->clk_state = SLIM_CLK_ENTERING_PAUSE;
+
+	/* clock pause sequence */
+	ret = slim_processtxn(ctrl, &txn);
+	if (ret)
+		goto clk_pause_ret;
+
+	txn.mc = SLIM_MSG_MC_NEXT_PAUSE_CLOCK;
+	txn.rl = 4;
+	msg.num_bytes = 1;
+	msg.wbuf = &restart;
+	ret = slim_processtxn(ctrl, &txn);
+	if (ret)
+		goto clk_pause_ret;
+
+	txn.mc = SLIM_MSG_MC_RECONFIGURE_NOW;
+	txn.rl = 3;
+	msg.num_bytes = 1;
+	msg.wbuf = NULL;
+	ret = slim_processtxn(ctrl, &txn);
+
+clk_pause_ret:
+	if (ret) {
+		sched->clk_state = SLIM_CLK_ACTIVE;
+	} else {
+		sched->clk_state = SLIM_CLK_PAUSED;
+		complete(&sched->pause_comp);
+	}
+	mutex_unlock(&sched->m_reconf);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(slim_ctrl_clk_pause);
diff --git a/include/linux/slimbus.h b/include/linux/slimbus.h
index 63d79c2..9f262b1 100644
--- a/include/linux/slimbus.h
+++ b/include/linux/slimbus.h
@@ -117,11 +117,21 @@ struct slim_addrt {
 #define SLIM_MSG_MC_REPLY_VALUE                  0x64
 #define SLIM_MSG_MC_CHANGE_VALUE                 0x68
 
+/* Clock pause Reconfiguration messages */
+#define SLIM_MSG_MC_BEGIN_RECONFIGURATION        0x40
+#define SLIM_MSG_MC_NEXT_PAUSE_CLOCK             0x4A
+#define SLIM_MSG_MC_RECONFIGURE_NOW              0x5F
+
 /* Destination type Values */
 #define SLIM_MSG_DEST_LOGICALADDR	0
 #define SLIM_MSG_DEST_ENUMADDR		1
 #define	SLIM_MSG_DEST_BROADCAST		3
 
+/* Clock pause values per slimbus spec */
+#define SLIM_CLK_FAST				0
+#define SLIM_CLK_CONST_PHASE			1
+#define SLIM_CLK_UNSPECIFIED			2
+
 /**
  * struct slim_val_inf: Slimbus value or information element
  * @start_offset: Specifies starting offset in information/value element map
@@ -205,11 +215,46 @@ struct slim_ctrl_buf {
  * @cb: callback for this transfer
  * @ctx: contex for the callback function
  * @need_tid: True if this transfer need Transaction ID
+ * @clk_pause: True if this transfer is part of clock-pause sequence
  */
 struct slim_pending {
 	void (*cb)(void *ctx, int err);
 	void *ctx;
 	bool need_tid;
+	bool clk_pause;
+};
+
+/**
+ * enum slim_clk_state: Slimbus controller's clock state used internally for
+ *	maintaining current clock state.
+ * @SLIM_CLK_ACTIVE: Slimbus clock is active
+ * @SLIM_CLK_ENTERING_PAUSE: Slimbus clock pause sequence is being sent on the
+ *	bus. If this succeeds, state changes to SLIM_CLK_PAUSED. If the
+ *	transition fails, state changes back to SLIM_CLK_ACTIVE
+ * @SLIM_CLK_PAUSED: Slimbus controller clock has paused.
+ */
+enum slim_clk_state {
+	SLIM_CLK_ACTIVE,
+	SLIM_CLK_ENTERING_PAUSE,
+	SLIM_CLK_PAUSED,
+};
+
+/**
+ * struct slim_sched: Framework uses this structure internally for scheduling.
+ * @clk_state: Controller's clock state from enum slim_clk_state
+ * @pause_comp: Signals completion of clock pause sequence. This is useful when
+ *	client tries to call slimbus transaction when controller is entering
+ *	clock pause.
+ * @m_reconf: This mutex is held until current reconfiguration (data channel
+ *	scheduling, message bandwidth reservation) is done. Message APIs can
+ *	use the bus concurrently when this mutex is held since elemental access
+ *	messages can be sent on the bus when reconfiguration is in progress.
+ */
+struct slim_sched {
+	int			clkgear;
+	enum slim_clk_state	clk_state;
+	struct completion	pause_comp;
+	struct mutex		m_reconf;
 };
 
 /**
@@ -256,6 +301,7 @@ struct slim_pending {
  * @pending_wr: Pending write transactions to be acknowledged by controller
  * @tx_sem: Semaphore for available TX buffers for this controller
  * @last_tid: Last used entry for TID transactions
+ * @sched: scheduler structure used by the controller
  * @xfer_msg: Transfer a message on this controller (this can be a broadcast
  *	control/status message like data channel setup, or a unicast message
  *	like value element read/write.
@@ -265,6 +311,9 @@ struct slim_pending {
  * @get_laddr: It is possible that controller needs to set fixed logical
  *	address table and get_laddr can be used in that case so that controller
  *	can do this assignment.
+ * @wakeup: This function pointer implements controller-specific procedure
+ *	to wake it up from clock-pause. Framework will call this to bring
+ *	the controller out of clock pause.
  */
 struct slim_controller {
 	struct device		dev;
@@ -286,12 +335,14 @@ struct slim_controller {
 	struct slim_ctrl_buf	rx;
 	struct slim_pending	*pending_wr;
 	struct semaphore	tx_sem;
+	struct slim_sched	sched;
 	int			(*xfer_msg)(struct slim_controller *ctrl,
 					    struct slim_msg_txn *tx, void *buf);
 	int			(*set_laddr)(struct slim_controller *ctrl,
 					     struct slim_eaddr *ea, u8 laddr);
 	int			(*get_laddr)(struct slim_controller *ctrl,
 					     struct slim_eaddr *ea, u8 *laddr);
+	int			(*wakeup)(struct slim_controller *ctrl);
 };
 
 #define to_slim_controller(d) container_of(d, struct slim_controller, dev)
@@ -601,7 +652,7 @@ void *slim_get_rx(struct slim_controller *ctrl);
 int slim_return_rx(struct slim_controller *ctrl, void *buf);
 
 void *slim_get_tx(struct slim_controller *ctrl, struct slim_msg_txn *txn,
-		bool need_tid);
+		bool need_tid, bool clk_pause);
 
 void slim_return_tx(struct slim_controller *ctrl, int err);
 
@@ -615,4 +666,20 @@ static inline bool slim_tid_txn(u8 mt, u8 mc)
 }
 /* end of message apis */
 
+/**
+ * slim_ctrl_clk_pause: Called by slimbus controller to enter/exit 'clock pause'
+ * Slimbus specification needs this sequence to turn-off clocks for the bus.
+ * The sequence involves sending 3 broadcast messages (reconfiguration
+ * sequence) to inform all devices on the bus.
+ * To exit clock-pause, controller typically wakes up active framer device.
+ * @ctrl: controller requesting bus to be paused or woken up
+ * @wakeup: Wakeup this controller from clock pause.
+ * @restart: Restart time value per spec used for clock pause. This value
+ *	isn't used when controller is to be woken up.
+ * This API executes clock pause reconfiguration sequence if wakeup is false.
+ * If wakeup is true, controller's wakeup is called.
+ * For entering clock-pause, -EBUSY is returned if a message txn in pending.
+ */
+int slim_ctrl_clk_pause(struct slim_controller *ctrl, bool wakeup, u8 restart);
+
 #endif /* _LINUX_SLIMBUS_H */
-- 
1.8.2.1
