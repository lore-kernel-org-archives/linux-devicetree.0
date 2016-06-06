From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 2/2] soc: qcom: wcnss_ctrl: Make wcnss_ctrl parent the other components
Date: Mon,  6 Jun 2016 16:58:20 -0700
Message-ID: <1465257500-28176-2-git-send-email-bjorn.andersson@linaro.org>
References: <1465257500-28176-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1465257500-28176-1-git-send-email-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We need the signal from wcnss_ctrl indicating that the firmware is up
and running before we can communicate with the other components of the
chip. So make these other components children of the wcnss_ctrl device,
so they can be probed in order.

The process seems to take between 1/2-5 seconds, so this is done in a
worker, instead of holding up the probe.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- None

Changes since v2:
- None

Changes since v1:
- Clean up return information from wcnss_download_nv (success vs cbc expected)

 drivers/soc/qcom/wcnss_ctrl.c       | 125 ++++++++++++++++++++++++++++++------
 include/linux/soc/qcom/wcnss_ctrl.h |   8 +++
 2 files changed, 114 insertions(+), 19 deletions(-)
 create mode 100644 include/linux/soc/qcom/wcnss_ctrl.h

diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
index c544f3d2c6ee..520aedd29965 100644
--- a/drivers/soc/qcom/wcnss_ctrl.c
+++ b/drivers/soc/qcom/wcnss_ctrl.c
@@ -1,4 +1,5 @@
 /*
+ * Copyright (c) 2016, Linaro Ltd.
  * Copyright (c) 2015, Sony Mobile Communications Inc.
  *
  * This program is free software; you can redistribute it and/or modify
@@ -14,8 +15,16 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/smd.h>
+#include <linux/io.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/soc/qcom/wcnss_ctrl.h>
 
 #define WCNSS_REQUEST_TIMEOUT	(5 * HZ)
+#define WCNSS_CBC_TIMEOUT	(10 * HZ)
+
+#define WCNSS_ACK_DONE_BOOTING	1
+#define WCNSS_ACK_COLD_BOOTING	2
 
 #define NV_FRAGMENT_SIZE	3072
 #define NVBIN_FILE		"wlan/prima/WCNSS_qcom_wlan_nv.bin"
@@ -25,17 +34,19 @@
  * @dev:	device handle
  * @channel:	SMD channel handle
  * @ack:	completion for outstanding requests
+ * @cbc:	completion for cbc complete indication
  * @ack_status:	status of the outstanding request
- * @download_nv_work: worker for uploading nv binary
+ * @probe_work: worker for uploading nv binary
  */
 struct wcnss_ctrl {
 	struct device *dev;
 	struct qcom_smd_channel *channel;
 
 	struct completion ack;
+	struct completion cbc;
 	int ack_status;
 
-	struct work_struct download_nv_work;
+	struct work_struct probe_work;
 };
 
 /* message types */
@@ -48,6 +59,11 @@ enum {
 	WCNSS_UPLOAD_CAL_RESP,
 	WCNSS_DOWNLOAD_CAL_REQ,
 	WCNSS_DOWNLOAD_CAL_RESP,
+	WCNSS_VBAT_LEVEL_IND,
+	WCNSS_BUILD_VERSION_REQ,
+	WCNSS_BUILD_VERSION_RESP,
+	WCNSS_PM_CONFIG_REQ,
+	WCNSS_CBC_COMPLETE_IND,
 };
 
 /**
@@ -128,7 +144,7 @@ static int wcnss_ctrl_smd_callback(struct qcom_smd_channel *channel,
 			 version->major, version->minor,
 			 version->version, version->revision);
 
-		schedule_work(&wcnss->download_nv_work);
+		complete(&wcnss->ack);
 		break;
 	case WCNSS_DOWNLOAD_NV_RESP:
 		if (count != sizeof(*nvresp)) {
@@ -141,6 +157,10 @@ static int wcnss_ctrl_smd_callback(struct qcom_smd_channel *channel,
 		wcnss->ack_status = nvresp->status;
 		complete(&wcnss->ack);
 		break;
+	case WCNSS_CBC_COMPLETE_IND:
+		dev_dbg(wcnss->dev, "cold boot complete\n");
+		complete(&wcnss->cbc);
+		break;
 	default:
 		dev_info(wcnss->dev, "unknown message type %d\n", hdr->type);
 		break;
@@ -156,20 +176,32 @@ static int wcnss_ctrl_smd_callback(struct qcom_smd_channel *channel,
 static int wcnss_request_version(struct wcnss_ctrl *wcnss)
 {
 	struct wcnss_msg_hdr msg;
+	int ret;
 
 	msg.type = WCNSS_VERSION_REQ;
 	msg.len = sizeof(msg);
+	ret = qcom_smd_send(wcnss->channel, &msg, sizeof(msg));
+	if (ret < 0)
+		return ret;
+
+	ret = wait_for_completion_timeout(&wcnss->ack, WCNSS_CBC_TIMEOUT);
+	if (!ret) {
+		dev_err(wcnss->dev, "timeout waiting for version response\n");
+		return -ETIMEDOUT;
+	}
 
-	return qcom_smd_send(wcnss->channel, &msg, sizeof(msg));
+	return 0;
 }
 
 /**
  * wcnss_download_nv() - send nv binary to WCNSS
- * @work:	work struct to acquire wcnss context
+ * @wcnss:	wcnss_ctrl state handle
+ * @expect_cbc:	indicator to caller that an cbc event is expected
+ *
+ * Returns 0 on success. Negative errno on failure.
  */
-static void wcnss_download_nv(struct work_struct *work)
+static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 {
-	struct wcnss_ctrl *wcnss = container_of(work, struct wcnss_ctrl, download_nv_work);
 	struct wcnss_download_nv_req *req;
 	const struct firmware *fw;
 	const void *data;
@@ -178,10 +210,10 @@ static void wcnss_download_nv(struct work_struct *work)
 
 	req = kzalloc(sizeof(*req) + NV_FRAGMENT_SIZE, GFP_KERNEL);
 	if (!req)
-		return;
+		return -ENOMEM;
 
 	ret = request_firmware(&fw, NVBIN_FILE, wcnss->dev);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(wcnss->dev, "Failed to load nv file %s: %d\n",
 			NVBIN_FILE, ret);
 		goto free_req;
@@ -207,7 +239,7 @@ static void wcnss_download_nv(struct work_struct *work)
 		memcpy(req->fragment, data, req->frag_size);
 
 		ret = qcom_smd_send(wcnss->channel, req, req->hdr.len);
-		if (ret) {
+		if (ret < 0) {
 			dev_err(wcnss->dev, "failed to send smd packet\n");
 			goto release_fw;
 		}
@@ -220,16 +252,58 @@ static void wcnss_download_nv(struct work_struct *work)
 	} while (left > 0);
 
 	ret = wait_for_completion_timeout(&wcnss->ack, WCNSS_REQUEST_TIMEOUT);
-	if (!ret)
+	if (!ret) {
 		dev_err(wcnss->dev, "timeout waiting for nv upload ack\n");
-	else if (wcnss->ack_status != 1)
-		dev_err(wcnss->dev, "nv upload response failed err: %d\n",
-			wcnss->ack_status);
+		ret = -ETIMEDOUT;
+	} else {
+		*expect_cbc = wcnss->ack_status == WCNSS_ACK_COLD_BOOTING;
+		ret = 0;
+	}
 
 release_fw:
 	release_firmware(fw);
 free_req:
 	kfree(req);
+
+	return ret;
+}
+
+/**
+ * qcom_wcnss_open_channel() - open additional SMD channel to WCNSS
+ * @wcnss:	wcnss handle, retrieved from drvdata
+ * @name:	SMD channel name
+ * @cb:		callback to handle incoming data on the channel
+ */
+struct qcom_smd_channel *qcom_wcnss_open_channel(void *wcnss, const char *name, qcom_smd_cb_t cb)
+{
+	struct wcnss_ctrl *_wcnss = wcnss;
+
+	return qcom_smd_open_channel(_wcnss->channel, name, cb);
+}
+EXPORT_SYMBOL(qcom_wcnss_open_channel);
+
+static void wcnss_async_probe(struct work_struct *work)
+{
+	struct wcnss_ctrl *wcnss = container_of(work, struct wcnss_ctrl, probe_work);
+	bool expect_cbc;
+	int ret;
+
+	ret = wcnss_request_version(wcnss);
+	if (ret < 0)
+		return;
+
+	ret = wcnss_download_nv(wcnss, &expect_cbc);
+	if (ret < 0)
+		return;
+
+	/* Wait for pending cold boot completion if indicated by the nv downloader */
+	if (expect_cbc) {
+		ret = wait_for_completion_timeout(&wcnss->cbc, WCNSS_REQUEST_TIMEOUT);
+		if (!ret)
+			dev_err(wcnss->dev, "expected cold boot completion\n");
+	}
+
+	of_platform_populate(wcnss->dev->of_node, NULL, NULL, wcnss->dev);
 }
 
 static int wcnss_ctrl_probe(struct qcom_smd_device *sdev)
@@ -244,25 +318,38 @@ static int wcnss_ctrl_probe(struct qcom_smd_device *sdev)
 	wcnss->channel = sdev->channel;
 
 	init_completion(&wcnss->ack);
-	INIT_WORK(&wcnss->download_nv_work, wcnss_download_nv);
+	init_completion(&wcnss->cbc);
+	INIT_WORK(&wcnss->probe_work, wcnss_async_probe);
 
 	qcom_smd_set_drvdata(sdev->channel, wcnss);
+	dev_set_drvdata(&sdev->dev, wcnss);
+
+	schedule_work(&wcnss->probe_work);
+
+	return 0;
+}
+
+static void wcnss_ctrl_remove(struct qcom_smd_device *sdev)
+{
+	struct wcnss_ctrl *wcnss = qcom_smd_get_drvdata(sdev->channel);
 
-	return wcnss_request_version(wcnss);
+	cancel_work_sync(&wcnss->probe_work);
+	of_platform_depopulate(&sdev->dev);
 }
 
-static const struct qcom_smd_id wcnss_ctrl_smd_match[] = {
-	{ .name = "WCNSS_CTRL" },
+static const struct of_device_id wcnss_ctrl_of_match[] = {
+	{ .compatible = "qcom,wcnss", },
 	{}
 };
 
 static struct qcom_smd_driver wcnss_ctrl_driver = {
 	.probe = wcnss_ctrl_probe,
+	.remove = wcnss_ctrl_remove,
 	.callback = wcnss_ctrl_smd_callback,
-	.smd_match_table = wcnss_ctrl_smd_match,
 	.driver  = {
 		.name  = "qcom_wcnss_ctrl",
 		.owner = THIS_MODULE,
+		.of_match_table = wcnss_ctrl_of_match,
 	},
 };
 
diff --git a/include/linux/soc/qcom/wcnss_ctrl.h b/include/linux/soc/qcom/wcnss_ctrl.h
new file mode 100644
index 000000000000..a37bc5538f19
--- /dev/null
+++ b/include/linux/soc/qcom/wcnss_ctrl.h
@@ -0,0 +1,8 @@
+#ifndef __WCNSS_CTRL_H__
+#define __WCNSS_CTRL_H__
+
+#include <linux/soc/qcom/smd.h>
+
+struct qcom_smd_channel *qcom_wcnss_open_channel(void *wcnss, const char *name, qcom_smd_cb_t cb);
+
+#endif
-- 
2.5.0
