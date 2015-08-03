From: Sagar Dharia <sdharia@codeaurora.org>
Subject: [PATCH V3 6/6] slim: qcom: Add runtime-pm support using clock-pause feature
Date: Mon,  3 Aug 2015 00:59:50 -0600
Message-ID: <1438585190-11894-7-git-send-email-sdharia@codeaurora.org>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, sdharia@codeaurora.org, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Slimbus HW mandates that clock-pause sequence has to be executed
before disabling relevant interface and core clocks.
Runtime-PM's autosuspend feature is used here to enter/exit low
power mode for Qualcomm's Slimbus controller. Autosuspend feature
enables driver to avoid changing power-modes too frequently since
entering clock-pause is an expensive sequence

Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
---
 drivers/slimbus/slim-qcom-ctrl.c | 149 ++++++++++++++++++++++++++++++++++++++-
 drivers/slimbus/slim-qcom.h      |   1 +
 2 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/slim-qcom-ctrl.c b/drivers/slimbus/slim-qcom-ctrl.c
index 7ff0536..45023a6 100644
--- a/drivers/slimbus/slim-qcom-ctrl.c
+++ b/drivers/slimbus/slim-qcom-ctrl.c
@@ -20,6 +20,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/slimbus.h>
+#include <linux/pm_runtime.h>
 #include "slim-qcom.h"
 
 #define MSM_SLIM_NAME	"msm_slim_ctrl"
@@ -210,6 +211,7 @@ rx_ret_irq:
 		if (q_rx)
 			queue_work(dev->rxwq, &dev->wd);
 	}
+	pm_runtime_mark_last_busy(dev->dev);
 	/**
 	 * All interrupts are handled: complex RX messages requiring more work
 	 * are queued to work-queue, others are handled above
@@ -237,6 +239,28 @@ static void msm_slim_wait_retry(struct msm_slim_ctrl *dev)
 	msleep(msec_per_frm);
 }
 
+static int msm_clk_pause_wakeup(struct slim_controller *ctrl)
+{
+	struct msm_slim_ctrl *dev = slim_get_ctrldata(ctrl);
+
+	clk_prepare_enable(dev->hclk);
+	clk_prepare_enable(dev->rclk);
+	writel_relaxed(1, dev->base + FRM_WAKEUP);
+	/* Make sure framer wakeup write goes through before ISR fires */
+	mb();
+	/**
+	 * HW Workaround: Currently, slave is reporting lost-sync messages
+	 * after slimbus comes out of clock pause.
+	 * Transaction with slave fail before slave reports that message
+	 * Give some time for that report to come
+	 * Slimbus wakes up in clock gear 10 at 24.576MHz. With each superframe
+	 * being 250 usecs, we wait for 5-10 superframes here to ensure
+	 * we get the message
+	 */
+	usleep_range(1250, 2500);
+	return 0;
+}
+
 static int msm_xfer_msg(struct slim_controller *ctrl, struct slim_msg_txn *txn,
 			void *pbuf)
 {
@@ -245,6 +269,22 @@ static int msm_xfer_msg(struct slim_controller *ctrl, struct slim_msg_txn *txn,
 	u32 *head = (u32 *)pbuf;
 	u8 *puc = (u8 *)pbuf;
 	u8 la = txn->la;
+	enum slim_clk_state cur_clk_state = ctrl->sched.clk_state;
+
+	if (cur_clk_state == SLIM_CLK_ENTERING_PAUSE) {
+		if (txn->mc != SLIM_MSG_MC_BEGIN_RECONFIGURATION &&
+		    txn->mc != SLIM_MSG_MC_RECONFIGURE_NOW &&
+		    txn->mc != SLIM_MSG_MC_NEXT_PAUSE_CLOCK)
+			return -EBUSY;
+	} else {
+		int ret = pm_runtime_get_sync(dev->dev);
+
+		if (ret < 0) {
+			pm_runtime_set_suspended(dev->dev);
+			dev_err(dev->dev, "runtime-pm vote failed:%d\n", ret);
+			return ret;
+		}
+	}
 
 	/* HW expects length field to be excluded */
 	txn->rl--;
@@ -273,6 +313,9 @@ static int msm_xfer_msg(struct slim_controller *ctrl, struct slim_msg_txn *txn,
 	if (txn->msg && txn->msg->wbuf)
 		memcpy(puc, txn->msg->wbuf, txn->msg->num_bytes);
 
+	if (cur_clk_state != SLIM_CLK_ENTERING_PAUSE)
+		pm_runtime_put(dev->dev);
+
 	return msm_slim_queue_tx(dev, head, txn->rl, MGR_TX_MSG);
 }
 
@@ -296,13 +339,19 @@ static int msm_set_laddr(struct slim_controller *ctrl,
 	buf[5] = ead->instance;
 	/* Logical address for this EA */
 	buf[6] = laddr;
+
+	ret = pm_runtime_get_sync(dev->dev);
+	if (ret < 0) {
+		pm_runtime_set_suspended(dev->dev);
+		dev_err(dev->dev, "runtime-pm vote failed:%d\n", ret);
+		return ret;
+	}
 	/**
 	 * Retries are needed since bus may lose sync when multiple devices
 	 * are coming up and reporting present
 	 */
 	msg.wbuf = buf;
 	msg.num_bytes = 7;
-
 retry_laddr:
 	ret = slim_processtxn(&dev->ctrl, &txn);
 
@@ -317,6 +366,7 @@ retry_laddr:
 			dev_err(dev->dev, "set LADDR failed:ret:%d\n", ret);
 		}
 	}
+	pm_runtime_put(dev->dev);
 	return ret;
 }
 
@@ -444,6 +494,8 @@ static int msm_slim_probe(struct platform_device *pdev)
 
 	dev->ctrl.set_laddr = msm_set_laddr;
 	dev->ctrl.xfer_msg = msm_xfer_msg;
+	dev->ctrl.wakeup =  msm_clk_pause_wakeup;
+
 	dev->ctrl.tx.n = MSM_TX_MSGS;
 	dev->ctrl.rx.n = MSM_RX_MSGS;
 	dev->ctrl.tx.sl_sz = SLIM_MSGQ_BUF_LEN;
@@ -541,6 +593,12 @@ static int msm_slim_probe(struct platform_device *pdev)
 	 */
 	mb();
 
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, MSM_SLIM_AUTOSUSPEND);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
 	dev_dbg(dev->dev, "MSM SB controller is up:ver:0x%x!\n", dev->ver);
 	return 0;
 
@@ -558,11 +616,99 @@ static int msm_slim_remove(struct platform_device *pdev)
 {
 	struct msm_slim_ctrl *dev = platform_get_drvdata(pdev);
 
+	pm_runtime_disable(&pdev->dev);
 	slim_del_controller(&dev->ctrl);
 	destroy_workqueue(dev->rxwq);
 	return 0;
 }
 
+/**
+ * If PM_RUNTIME is not defined, these 2 functions become helper
+ * functions to be called from system suspend/resume.
+ */
+#ifdef CONFIG_PM
+static int msm_slim_runtime_suspend(struct device *device)
+{
+	struct platform_device *pdev = to_platform_device(device);
+	struct msm_slim_ctrl *dev = platform_get_drvdata(pdev);
+	int ret;
+
+	dev_dbg(device, "pm_runtime: suspending...\n");
+	ret = slim_ctrl_clk_pause(&dev->ctrl, false, SLIM_CLK_UNSPECIFIED);
+	if (ret)
+		dev_err(device, "clk pause not entered:%d", ret);
+	else {
+		clk_disable_unprepare(dev->hclk);
+		clk_disable_unprepare(dev->rclk);
+	}
+	return ret;
+}
+
+static int msm_slim_runtime_resume(struct device *device)
+{
+	struct platform_device *pdev = to_platform_device(device);
+	struct msm_slim_ctrl *dev = platform_get_drvdata(pdev);
+	int ret = 0;
+
+	dev_dbg(device, "pm_runtime: resuming...\n");
+	ret = slim_ctrl_clk_pause(&dev->ctrl, true, 0);
+	if (ret)
+		dev_err(device, "clk pause not exited:%d", ret);
+	return ret;
+}
+#endif
+
+#ifdef CONFIG_PM_SLEEP
+static int msm_slim_suspend(struct device *dev)
+{
+	int ret = 0;
+
+	if (!pm_runtime_enabled(dev) ||
+		(!pm_runtime_suspended(dev))) {
+		dev_dbg(dev, "system suspend");
+		ret = msm_slim_runtime_suspend(dev);
+	}
+	if (ret == -EISCONN) {
+		/**
+		* If the clock pause failed due to active channels, there is
+		* a possibility that some audio stream is active during suspend
+		* We dont want to return suspend failure in that case so that
+		* display and relevant components can still go to suspend.
+		* If there is some other error, then it should prevent
+		* system level suspend
+		*/
+		ret = 0;
+	}
+	return ret;
+}
+
+static int msm_slim_resume(struct device *dev)
+{
+	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
+		int ret;
+
+		dev_dbg(dev, "system resume");
+		ret = msm_slim_runtime_resume(dev);
+		if (!ret) {
+			pm_runtime_mark_last_busy(dev);
+			pm_request_autosuspend(dev);
+		}
+		return ret;
+
+	}
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct dev_pm_ops msm_slim_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(msm_slim_suspend, msm_slim_resume)
+	SET_RUNTIME_PM_OPS(
+			   msm_slim_runtime_suspend,
+			   msm_slim_runtime_resume,
+			   NULL
+	)
+};
+
 static const struct of_device_id msm_slim_dt_match[] = {
 	{
 		.compatible = "qcom,slim-msm",
@@ -577,6 +723,7 @@ static struct platform_driver msm_slim_driver = {
 		.name = MSM_SLIM_NAME,
 		.owner = THIS_MODULE,
 		.of_match_table = msm_slim_dt_match,
+		.pm = &msm_slim_dev_pm_ops,
 	},
 };
 module_platform_driver(msm_slim_driver);
diff --git a/drivers/slimbus/slim-qcom.h b/drivers/slimbus/slim-qcom.h
index 115a8b8..b678c3a 100644
--- a/drivers/slimbus/slim-qcom.h
+++ b/drivers/slimbus/slim-qcom.h
@@ -25,6 +25,7 @@
 #define SLIM_ROOT_FREQ 24576000
 #define INIT_MX_RETRIES 10
 #define DEF_RETRY_MS	10
+#define MSM_SLIM_AUTOSUSPEND 1000
 
 /* MAX message size over control channel */
 #define SLIM_MSGQ_BUF_LEN	40
-- 
1.8.2.1
