From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/3] dt-bindings: firmware: scm: Add MSM8998 and SDM845
Date: Wed, 29 Aug 2018 16:15:05 -0700
Message-ID: <20180829231505.22660-4-bjorn.andersson@linaro.org>
References: <20180829231505.22660-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829231505.22660-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Sricharan R <sricharan@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
List-Id: devicetree@vger.kernel.org

Now that the compatible/clock handling is reworked add compatibles for
MSM8998 and SDM845 to the SCM binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 1c8e24530f7c..41f133a4e2fa 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -14,7 +14,9 @@ Required properties:
  * "qcom,scm-msm8960"
  * "qcom,scm-msm8974"
  * "qcom,scm-msm8996"
+ * "qcom,scm-msm8998"
  * "qcom,scm-ipq4019"
+ * "qcom,scm-sdm845"
  and:
  * "qcom,scm"
 - clocks: Specifies clocks needed by the SCM interface, if any:
-- 
2.18.0
