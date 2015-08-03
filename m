From: Sagar Dharia <sdharia@codeaurora.org>
Subject: [PATCH V3 5/6] slimbus: Add support for 'clock-pause' feature
Date: Mon,  3 Aug 2015 00:59:49 -0600
Message-ID: <1438585190-11894-6-git-send-email-sdharia@codeaurora.org>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, sdharia@codeaurora.org, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Per slimbus specification, a reconfiguration sequence known as
'clock pause' needs to be broadcast over the bus while entering low-
power mode. Clock-pause is initiated by the controller driver.
To exit clock-pause, controller typically wakes up the framer device.
Since wakeup precedure is controller-specific, framework calls it via
controller's function pointer to invoke it.

Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
---
 drivers/slimbus/Makefile     |   2 +-
 drivers/slimbus/slim-core.c  |   2 +
 drivers/slimbus/slim-sched.c | 121 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/slimbus.h      |  65 +++++++++++++++++++++++
 4 files changed, 189 insertions(+), 1 deletion(-)
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
index 9d104ee..5d27ff2 100644
--- a/drivers/slimbus/slim-core.c
+++ b/drivers/slimbus/slim-core.c
@@ -459,6 +459,8 @@ int slim_register_controller(struct slim_controller *ctrl)
 	mutex_init(&ctrl->m_ctrl);
 	spin_lock_init(&ctrl->tx.lock);
 	spin_lock_init(&ctrl->rx.lock);
+	mutex_init(&ctrl->sched.m_reconf);
+	init_completion(&ctrl->sched.pause_comp);
 
 	ctrl->pending_wr = kcalloc((ctrl->tx.n - 1),
 				   sizeof(struct slim_pending),
diff --git a/drivers/slimbus/slim-sched.c b/drivers/slimbus/slim-sched.c
new file mode 100644
index 0000000..e44922d
--- /dev/null
+++ b/drivers/slimbus/slim-sched.c
@@ -0,0 +1,121 @@
+/* Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
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
+	mutex_lock(&sched->m_reconf);
+	if (wakeup) {
+		if (sched->clk_state == SLIM_CLK_ACTIVE) {
+			mutex_unlock(&sched->m_reconf);
+			return 0;
+		}
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
+	return ret;
+}
+EXPORT_SYMBOL_GPL(slim_ctrl_clk_pause);
+
diff --git a/include/linux/slimbus.h b/include/linux/slimbus.h
index 8c9bd3d..660da15 100644
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
@@ -215,6 +225,39 @@ struct slim_pending {
 };
 
 /**
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
+};
+
+/**
  * struct slim_controller: Controls every instance of SLIMbus
  *				(similar to 'master' on SPI)
  *	'Manager device' is responsible for  device management, bandwidth
@@ -259,6 +302,7 @@ struct slim_pending {
  * @pending_wr: Pending write transactions to be acknowledged by controller
  * @tx_sem: Semaphore for available TX buffers for this controller
  * @last_tid: Last used entry for TID transactions
+ * @sched: scheduler structure used by the controller
  * @dev_released: completion used to signal when sysfs has released this
  *	controller so that it can be deleted during shutdown
  * @xfer_msg: Transfer a message on this controller (this can be a broadcast
@@ -270,6 +314,9 @@ struct slim_pending {
  * @get_laddr: It is possible that controller needs to set fixed logical
  *	address table and get_laddr can be used in that case so that controller
  *	can do this assignment.
+ * @wakeup: This function pointer implements controller-specific procedure
+ *	to wake it up from clock-pause. Framework will call this to bring
+ *	the controller out of clock pause.
  */
 struct slim_controller {
 	struct device		dev;
@@ -292,6 +339,7 @@ struct slim_controller {
 	struct slim_ctrl_buf	rx;
 	struct slim_pending	*pending_wr;
 	struct semaphore	tx_sem;
+	struct slim_sched	sched;
 	struct completion	dev_released;
 	int			(*xfer_msg)(struct slim_controller *ctrl,
 					    struct slim_msg_txn *tx, void *buf);
@@ -299,6 +347,7 @@ struct slim_controller {
 					     struct slim_eaddr *ea, u8 laddr);
 	int			(*get_laddr)(struct slim_controller *ctrl,
 					     struct slim_eaddr *ea, u8 *laddr);
+	int			(*wakeup)(struct slim_controller *ctrl);
 };
 
 #define to_slim_controller(d) container_of(d, struct slim_controller, dev)
@@ -612,4 +661,20 @@ static inline bool slim_tid_txn(u8 mt, u8 mc)
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
