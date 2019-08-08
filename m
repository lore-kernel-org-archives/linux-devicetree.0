From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/2] regulator: dt-bindings: Add PM8150x compatibles
Date: Thu,  8 Aug 2019 15:03:42 +0530
Message-ID: <20190808093343.5600-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add PM8150, PM8150L and PM8009 compatibles for these PMICs found
in some Qualcomm platforms.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index 14d2eee96b3d..1a9cab50503a 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -25,6 +25,9 @@ Supported regulator node names:
 	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
 	PMI8998:	bob
 	PM8005:		smps1 - smps4
+	PM8150:		smps1 - smps10, ldo1 - ldo18
+	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
+	PM8009:		smps1 - smps2, ld01 - ldo7
 
 ========================
 First Level Nodes - PMIC
@@ -35,7 +38,10 @@ First Level Nodes - PMIC
 	Value type: <string>
 	Definition: Must be one of: "qcom,pm8998-rpmh-regulators",
 		    "qcom,pmi8998-rpmh-regulators" or
-		    "qcom,pm8005-rpmh-regulators".
+		    "qcom,pm8005-rpmh-regulators" or
+		    "qcom,pm8150-rpmh-regulators" or
+		    "qcom,pm8150l-rpmh-regulators" or
+		    "qcom,pm8009-rpmh-regulators".
 
 - qcom,pmic-id
 	Usage:      required
-- 
2.20.1
