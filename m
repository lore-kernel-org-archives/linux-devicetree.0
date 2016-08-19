From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] firmware: qcom: scm: add a video command for state setting
Date: Fri, 19 Aug 2016 18:53:17 +0300
Message-ID: <1471622000-1906-2-git-send-email-stanimir.varbanov@linaro.org>
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471622000-1906-1-git-send-email-stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This scm call is used to change the video core state, more
specifically it is used to suspend and resume the core.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/firmware/qcom_scm-32.c | 18 ++++++++++++++++++
 drivers/firmware/qcom_scm-64.c | 16 ++++++++++++++++
 drivers/firmware/qcom_scm.c    | 16 ++++++++++++++++
 drivers/firmware/qcom_scm.h    |  2 ++
 include/linux/qcom_scm.h       |  2 ++
 5 files changed, 54 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index c6aeedbdcbb0..82c1d8d0d36b 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -560,3 +560,21 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 
 	return ret ? : le32_to_cpu(out);
 }
+
+int __qcom_scm_video_set_state(struct device *dev, u32 state, u32 spare)
+{
+	struct {
+		__le32 state;
+		__le32 spare;
+	} req;
+	__le32 scm_ret = 0;
+	int ret;
+
+	req.state = cpu_to_le32(state);
+	req.spare = cpu_to_le32(spare);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_VIDEO_SET_STATE,
+			    &req, sizeof(req), &scm_ret, sizeof(scm_ret));
+
+	return ret ? : le32_to_cpu(scm_ret);
+}
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 4a0f5ead4fb5..68484ea2aa51 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -358,3 +358,19 @@ int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 
 	return ret ? : res.a1;
 }
+
+int __qcom_scm_video_set_state(struct device *dev, u32 state, u32 spare)
+{
+	struct qcom_scm_desc desc = {0};
+	struct arm_smccc_res res;
+	int ret;
+
+	desc.args[0] = state;
+	desc.args[1] = spare;
+	desc.arginfo = QCOM_SCM_ARGS(2);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_BOOT, QCOM_SCM_VIDEO_SET_STATE,
+			    &desc, &res);
+
+	return ret ? : res.a1;
+}
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index e64a501adbf4..3b0e31c48639 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -317,6 +317,22 @@ bool qcom_scm_is_available(void)
 }
 EXPORT_SYMBOL(qcom_scm_is_available);
 
+int qcom_scm_video_set_state(u32 state, u32 spare)
+{
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = __qcom_scm_video_set_state(__scm->dev, state, spare);
+
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+EXPORT_SYMBOL(qcom_scm_video_set_state);
+
 static int qcom_scm_probe(struct platform_device *pdev)
 {
 	struct qcom_scm *scm;
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 3584b00fe7e6..4830559b2639 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -15,6 +15,8 @@
 #define QCOM_SCM_SVC_BOOT		0x1
 #define QCOM_SCM_BOOT_ADDR		0x1
 #define QCOM_SCM_BOOT_ADDR_MC		0x11
+#define QCOM_SCM_VIDEO_SET_STATE	0xa
+extern int __qcom_scm_video_set_state(struct device *dev, u32 state, u32 spare);
 
 #define QCOM_SCM_FLAG_HLOS		0x01
 #define QCOM_SCM_FLAG_COLDBOOT_MC	0x02
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index cc32ab852fbc..2ece81a6b078 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -46,4 +46,6 @@ extern void qcom_scm_cpu_power_down(u32 flags);
 
 extern u32 qcom_scm_get_version(void);
 
+extern int qcom_scm_video_set_state(u32 state, u32 spare);
+
 #endif
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
