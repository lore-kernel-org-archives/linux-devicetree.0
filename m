From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 1/3] Documentation: dt-bindings: arm: Document kryo385 cpu
Date: Wed, 31 Jan 2018 21:49:39 +0530
Message-ID: <20180131161941.29865-2-rnayak@codeaurora.org>
References: <20180131161941.29865-1-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180131161941.29865-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, sboyd@codeaurora.org, evgreen@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Document the compatible string for the Kryo385 cpus found in qualcomm
SoCs.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index a0009b72e9be..19611ccb61d9 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -184,6 +184,7 @@ described below.
 			    "nvidia,tegra186-denver"
 			    "qcom,krait"
 			    "qcom,kryo"
+			    "qcom,kryo385"
 			    "qcom,scorpion"
 	- enable-method
 		Value type: <stringlist>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
