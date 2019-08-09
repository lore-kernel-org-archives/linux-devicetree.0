From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/4] regulator: dt-bindings: Sort the compatibles and nodes
Date: Fri,  9 Aug 2019 13:06:13 +0530
Message-ID: <20190809073616.1235-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

It helps to keep sorted order for compatibles and nodes, so sort them

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../regulator/qcom,rpmh-regulator.txt         | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index 1a9cab50503a..bab9f71140b8 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -22,12 +22,12 @@ RPMh resource.
 
 The names used for regulator nodes must match those supported by a given PMIC.
 Supported regulator node names:
-	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
-	PMI8998:	bob
 	PM8005:		smps1 - smps4
+	PM8009:		smps1 - smps2, ldo1 - ldo7
 	PM8150:		smps1 - smps10, ldo1 - ldo18
 	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
-	PM8009:		smps1 - smps2, ld01 - ldo7
+	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
+	PMI8998:	bob
 
 ========================
 First Level Nodes - PMIC
@@ -36,12 +36,13 @@ First Level Nodes - PMIC
 - compatible
 	Usage:      required
 	Value type: <string>
-	Definition: Must be one of: "qcom,pm8998-rpmh-regulators",
-		    "qcom,pmi8998-rpmh-regulators" or
-		    "qcom,pm8005-rpmh-regulators" or
-		    "qcom,pm8150-rpmh-regulators" or
-		    "qcom,pm8150l-rpmh-regulators" or
-		    "qcom,pm8009-rpmh-regulators".
+	Definition: Must be one of below:
+		    "qcom,pm8005-rpmh-regulators"
+		    "qcom,pm8009-rpmh-regulators"
+		    "qcom,pm8150-rpmh-regulators"
+		    "qcom,pm8150l-rpmh-regulators"
+		    "qcom,pm8998-rpmh-regulators"
+		    "qcom,pmi8998-rpmh-regulators"
 
 - qcom,pmic-id
 	Usage:      required
-- 
2.20.1
