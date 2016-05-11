From: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [Patch v4 4/8] firmware: qcom: scm: Generalize shared error map
Date: Wed, 11 May 2016 09:15:54 -0500
Message-ID: <1462976158-26016-5-git-send-email-andy.gross@linaro.org>
References: <1462976158-26016-1-git-send-email-andy.gross@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462976158-26016-1-git-send-email-andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, jilai wang <jilaiw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch moves the qcom_scm_remap_error function to the include file
where can be used by both the 32 and 64 bit versions of the code.

Reviewed-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/firmware/qcom_scm-32.c | 17 -----------------
 drivers/firmware/qcom_scm.h    | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 5be6a12..4388d13 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -168,23 +168,6 @@ static inline void *qcom_scm_get_response_buffer(const struct qcom_scm_response
 	return (void *)rsp + le32_to_cpu(rsp->buf_offset);
 }
 
-static int qcom_scm_remap_error(int err)
-{
-	pr_err("qcom_scm_call failed with error code %d\n", err);
-	switch (err) {
-	case QCOM_SCM_ERROR:
-		return -EIO;
-	case QCOM_SCM_EINVAL_ADDR:
-	case QCOM_SCM_EINVAL_ARG:
-		return -EINVAL;
-	case QCOM_SCM_EOPNOTSUPP:
-		return -EOPNOTSUPP;
-	case QCOM_SCM_ENOMEM:
-		return -ENOMEM;
-	}
-	return -EINVAL;
-}
-
 static u32 smc(u32 cmd_addr)
 {
 	int context_id;
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 2cce75c..7dcc733 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -44,4 +44,20 @@ extern int __qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 #define QCOM_SCM_ERROR		-1
 #define QCOM_SCM_INTERRUPTED	1
 
+static inline int qcom_scm_remap_error(int err)
+{
+	switch (err) {
+	case QCOM_SCM_ERROR:
+		return -EIO;
+	case QCOM_SCM_EINVAL_ADDR:
+	case QCOM_SCM_EINVAL_ARG:
+		return -EINVAL;
+	case QCOM_SCM_EOPNOTSUPP:
+		return -EOPNOTSUPP;
+	case QCOM_SCM_ENOMEM:
+		return -ENOMEM;
+	}
+	return -EINVAL;
+}
+
 #endif
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
