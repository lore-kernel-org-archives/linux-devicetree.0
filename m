From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v4 2/4] dt-bindings: qcom: Add SDM845 bindings
Date: Fri, 16 Feb 2018 11:35:01 +0530
Message-ID: <20180216060503.22006-3-rnayak@codeaurora.org>
References: <20180216060503.22006-1-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216060503.22006-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sboyd@codeaurora.org, evgreen@chromium.org, bjorn.andersson@linaro.org, dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add a SoC string 'sdm845' for the qualcomm SDM845 SoC

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/qcom.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
index 0ed4d39d7fe1..ee532e705d6c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.txt
+++ b/Documentation/devicetree/bindings/arm/qcom.txt
@@ -26,6 +26,7 @@ The 'SoC' element must be one of the following strings:
 	msm8996
 	mdm9615
 	ipq8074
+	sdm845
 
 The 'board' element must be one of the following strings:
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
