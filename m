From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/6] soc: qcom: smem: Update max processor count
Date: Mon, 29 Jul 2019 17:36:28 +0530
Message-ID: <20190729120633.20451-2-sibis@codeaurora.org>
References: <20190729120633.20451-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729120633.20451-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org
Cc: mark.rutland@arm.com, agross@kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Update max processor count to reflect the number of
co-processors on SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index f27c00d82ae49..bef8502625f96 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -84,7 +84,7 @@
 #define SMEM_GLOBAL_HOST	0xfffe
 
 /* Max number of processors/hosts in a system */
-#define SMEM_HOST_COUNT		10
+#define SMEM_HOST_COUNT		11
 
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
