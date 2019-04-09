From: richard.gong@linux.intel.com
Subject: [PATCHv1 1/6] firmware: stratix10-svc: add to support RSU notify
Date: Tue,  9 Apr 2019 13:45:57 -0500
Message-ID: <1554835562-25056-2-git-send-email-richard.gong@linux.intel.com>
References: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, richard.gong@linux.intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

From: Richard Gong <richard.gong@intel.com>

Extend Intel Stratix10 service layer to support RSU notify feature.

RSU is used to provide our customers with protection against loading bad
bitstream onto their devices when those devices are booting from flash

RSU notify provides users with an API to notify the firmware of the
state of hard processor system.

Signed-off-by: Richard Gong <richard.gong@intel.com>
Reviewed-by: Alan Tull <atull@kernel.org>
---
 drivers/firmware/stratix10-svc.c                   | 43 +++++++++++++++-------
 include/linux/firmware/intel/stratix10-smc.h       | 17 +++++++++
 .../linux/firmware/intel/stratix10-svc-client.h    |  6 ++-
 3 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index 6e65148..1426900 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -295,7 +295,12 @@ static void svc_thread_recv_status_ok(struct stratix10_svc_data *p_data,
 	case COMMAND_RECONFIG_STATUS:
 		cb_data->status = BIT(SVC_STATUS_RECONFIG_COMPLETED);
 		break;
+	case COMMAND_RSU_STATUS:
+		cb_data->kaddr1 = &res;
+		cb_data->status = BIT(SVC_STATUS_RSU_OK);
+		break;
 	case COMMAND_RSU_UPDATE:
+	case COMMAND_RSU_NOTIFY:
 		cb_data->status = BIT(SVC_STATUS_RSU_OK);
 		break;
 	default:
@@ -386,6 +391,11 @@ static int svc_normal_to_secure_thread(void *data)
 			a1 = pdata->arg[0];
 			a2 = 0;
 			break;
+		case COMMAND_RSU_NOTIFY:
+			a0 = INTEL_SIP_SMC_RSU_NOTIFY;
+			a1 = pdata->arg[0];
+			a2 = 0;
+			break;
 		default:
 			pr_warn("it shouldn't happen\n");
 			break;
@@ -402,19 +412,6 @@ static int svc_normal_to_secure_thread(void *data)
 			 (unsigned int)res.a1, (unsigned int)res.a2);
 		pr_debug(" res.a3=0x%016x\n", (unsigned int)res.a3);
 
-		if (pdata->command == COMMAND_RSU_STATUS) {
-			if (res.a0 == INTEL_SIP_SMC_RSU_ERROR)
-				cbdata->status = BIT(SVC_STATUS_RSU_ERROR);
-			else
-				cbdata->status = BIT(SVC_STATUS_RSU_OK);
-
-			cbdata->kaddr1 = &res;
-			cbdata->kaddr2 = NULL;
-			cbdata->kaddr3 = NULL;
-			pdata->chan->scl->receive_cb(pdata->chan->scl, cbdata);
-			continue;
-		}
-
 		switch (res.a0) {
 		case INTEL_SIP_SMC_STATUS_OK:
 			svc_thread_recv_status_ok(pdata, cbdata, res);
@@ -438,7 +435,27 @@ static int svc_normal_to_secure_thread(void *data)
 			pr_debug("%s: STATUS_REJECTED\n", __func__);
 			break;
 		case INTEL_SIP_SMC_FPGA_CONFIG_STATUS_ERROR:
+		case INTEL_SIP_SMC_RSU_ERROR:
 			pr_err("%s: STATUS_ERROR\n", __func__);
+			switch (pdata->command) {
+			/* for FPGA mgr */
+			case COMMAND_RECONFIG_DATA_CLAIM:
+			case COMMAND_RECONFIG:
+			case COMMAND_RECONFIG_DATA_SUBMIT:
+			case COMMAND_RECONFIG_STATUS:
+				cbdata->status =
+					BIT(SVC_STATUS_RECONFIG_ERROR);
+				break;
+
+			/* for RSU */
+			case COMMAND_RSU_STATUS:
+			case COMMAND_RSU_UPDATE:
+			case COMMAND_RSU_NOTIFY:
+				cbdata->status =
+					BIT(SVC_STATUS_RSU_ERROR);
+				break;
+			}
+
 			cbdata->status = BIT(SVC_STATUS_RECONFIG_ERROR);
 			cbdata->kaddr1 = NULL;
 			cbdata->kaddr2 = NULL;
diff --git a/include/linux/firmware/intel/stratix10-smc.h b/include/linux/firmware/intel/stratix10-smc.h
index 01684d9..372f275 100644
--- a/include/linux/firmware/intel/stratix10-smc.h
+++ b/include/linux/firmware/intel/stratix10-smc.h
@@ -329,3 +329,20 @@ INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_FPGA_CONFIG_COMPLETED_WRITE)
 	INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_ECC_DBE)
 
 #endif
+
+/*
+ * Request INTEL_SIP_SMC_RSU_NOTIFY
+ *
+ * Sync call used by service driver at EL1 to report HPS sw state is RSU_NOTIFY
+ *
+ * Call register usage:
+ * a0 INTEL_SIP_SMC_RSU_NOTIFY
+ * a1 32bit value representing HPS software status
+ * a2-7 not used
+ *
+ * Return status
+ * a0 INTEL_SIP_SMC_STATUS_OK
+ */
+#define INTEL_SIP_SMC_FUNCID_RSU_NOTIFY 14
+#define INTEL_SIP_SMC_RSU_NOTIFY \
+	INTEL_SIP_SMC_FAST_CALL_VAL(INTEL_SIP_SMC_FUNCID_RSU_NOTIFY)
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index e521f17..eda722c 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -95,6 +95,9 @@ struct stratix10_svc_chan;
  *
  * @COMMAND_RSU_UPDATE: set the offset of the bitstream to boot after reboot,
  * return status is SVC_STATUS_RSU_OK or SVC_STATUS_RSU_ERROR
+ *
+ * @COMMAND_RSU_NOTIFY: report the status of HPS software to firmware, return
+ * status is SVC_STATUS_RSU_OK or SVC_STATUS_RSU_ERROR
  */
 enum stratix10_svc_command_code {
 	COMMAND_NOOP = 0,
@@ -103,7 +106,8 @@ enum stratix10_svc_command_code {
 	COMMAND_RECONFIG_DATA_CLAIM,
 	COMMAND_RECONFIG_STATUS,
 	COMMAND_RSU_STATUS,
-	COMMAND_RSU_UPDATE
+	COMMAND_RSU_UPDATE,
+	COMMAND_RSU_NOTIFY
 };
 
 /**
-- 
2.7.4
