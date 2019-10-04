From: Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1 1/2]  regulator: dt-bindings: Add PM6150x compatibles
Date: Fri,  4 Oct 2019 15:38:53 +0530
Message-ID: <1570183734-30706-2-git-send-email-kgunda@codeaurora.org>
References: <1570183734-30706-1-git-send-email-kgunda@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570183734-30706-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kiran Gunda <kgunda@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add PM6150 and PM6150L compatibles for Qualcomm SC7180 platfrom.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index bab9f71..97c3e0b 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -28,6 +28,8 @@ Supported regulator node names:
 	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
 	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
 	PMI8998:	bob
+	PM6150:         smps1 - smps5, ldo1 - ldo19
+	PM6150L:        smps1 - smps8, ldo1 - ldo11, bob
 
 ========================
 First Level Nodes - PMIC
@@ -43,6 +45,8 @@ First Level Nodes - PMIC
 		    "qcom,pm8150l-rpmh-regulators"
 		    "qcom,pm8998-rpmh-regulators"
 		    "qcom,pmi8998-rpmh-regulators"
+		    "qcom,pm6150-rpmh-regulators"
+		    "qcom,pm6150l-rpmh-regulators"
 
 - qcom,pmic-id
 	Usage:      required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
