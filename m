From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/7] dt-bindings: firmware: scm: re-order compatible list
Date: Wed,  7 Aug 2019 12:39:52 +0530
Message-ID: <20190807070957.30655-3-sibis@codeaurora.org>
References: <20190807070957.30655-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807070957.30655-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org
Cc: mark.rutland@arm.com, agross@kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

re-order compatible list to maintain sort order.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 41f133a4e2fa7..d19be836df533 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -9,13 +9,13 @@ Required properties:
 - compatible: must contain one of the following:
  * "qcom,scm-apq8064"
  * "qcom,scm-apq8084"
+ * "qcom,scm-ipq4019"
  * "qcom,scm-msm8660"
  * "qcom,scm-msm8916"
  * "qcom,scm-msm8960"
  * "qcom,scm-msm8974"
  * "qcom,scm-msm8996"
  * "qcom,scm-msm8998"
- * "qcom,scm-ipq4019"
  * "qcom,scm-sdm845"
  and:
  * "qcom,scm"
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
