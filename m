From: Andy Gross <andy.gross@linaro.org>
Subject: [Patch v5 4/8] firmware: qcom: scm: Generalize shared error map
Date: Thu, 12 May 2016 22:46:57 -0500
Message-ID: <1463111221-6963-5-git-send-email-andy.gross@linaro.org>
References: <1463111221-6963-1-git-send-email-andy.gross@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1463111221-6963-1-git-send-email-andy.gross@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Andy Gross <agross@codeaurora.org>, jilai wang <jilaiw@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch moves the qcom_scm_remap_error function to the include file
where can be used by both the 32 and 64 bit versions of the code.

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Andy Gross <agross@codeaurora.org>
Signed-off-by: Andy Gross <andy.gross@linaro.org>
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
