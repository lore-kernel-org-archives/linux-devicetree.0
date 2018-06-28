Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v5 3/6] dt-bindings: Input: Add additional property to qcom pwrkey
Date: Thu, 28 Jun 2018 20:38:47 +0530
Message-Id: <20180628150850.15358-4-vkoul@kernel.org>
In-Reply-To: <20180628150850.15358-1-vkoul@kernel.org>
References: <20180628150850.15358-1-vkoul@kernel.org>
To: linux-input@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Pwrkey and reset have similar properties so add additional
property for linux,code to use the code for sending events.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
index 07bf55f6e0b9..bf719396eadd 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
+++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
@@ -32,6 +32,14 @@ PROPERTIES
 	Definition: presence of this property indicates that the KPDPWR_N pin
 		    should be configured for pull up.
 
+- linux,code:
+	Usage: optional
+	Value type: <u32>
+	Definition: The input key-code associated with the power key.
+		    Use the linux event codes defined in
+		    include/dt-bindings/input/linux-event-codes.h
+		    When property is omitted KEY_POWER is assumed.
+
 EXAMPLE
 
 	pwrkey@800 {
@@ -40,4 +48,5 @@ EXAMPLE
 		interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
 		debounce = <15625>;
 		bias-pull-up;
+		linux,code = <KEY_POWER>;
 	};
-- 
2.14.4
