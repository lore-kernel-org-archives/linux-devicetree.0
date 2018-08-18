From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: [PATCH v2 4/4] dt-bindigs: msm: Update documentation of qcom,llcc
Date: Fri, 17 Aug 2018 17:08:35 -0700
Message-ID: <1534550915-18230-5-git-send-email-vnkgutta@codeaurora.org>
References: <1534550915-18230-1-git-send-email-vnkgutta@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534550915-18230-1-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de, evgreen@chromium.org
Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add reg-names and interrupts for LLCC documentation and the usage
examples. llcc broadcast base is added in addition to llcc base,
which is used for llcc broadcast writes.

Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
index 5e85749..b4b1c86 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
@@ -18,9 +18,22 @@ Properties:
 	Value Type: <prop-encoded-array>
 	Definition: Start address and the the size of the register region.
 
+- reg-names:
+        Usage: required
+        Value Type: <stringlist>
+        Definition: Register region names. Must be "llcc_base", "llcc_bcast_base".
+
+- interrupts:
+	Usage: required
+	Definition: The interrupt is associated with the llcc edac device.
+			It's used for llcc cache single and double bit error detection
+			and reporting.
+
 Example:
 
 	cache-controller@1100000 {
 		compatible = "qcom,sdm845-llcc";
-		reg = <0x1100000 0x250000>;
+		reg = <0x1100000 0x200000>, <0x1300000 0x50000> ;
+		reg-names = "llcc_base", "llcc_bcast_base";
+		interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
