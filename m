From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: dt-bindings: Add PM6150x compatibles" to the regulator tree
Date: Fri,  4 Oct 2019 18:52:42 +0100 (BST)
Message-ID: <20191004175242.C0B6B2741EF2@ypsilon.sirena.org.uk>
References: <1570183734-30706-2-git-send-email-kgunda@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1570183734-30706-2-git-send-email-kgunda@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kiran Gunda <kgunda@codeaurora.org>
Cc: Andy Gross <agross@kernel.org>, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

The patch

   regulator: dt-bindings: Add PM6150x compatibles

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 0c06b311c053ab12a9690e17a98ff4e4a90ab3e5 Mon Sep 17 00:00:00 2001
From: Kiran Gunda <kgunda@codeaurora.org>
Date: Fri, 4 Oct 2019 15:38:53 +0530
Subject: [PATCH] regulator: dt-bindings: Add PM6150x compatibles

Add PM6150 and PM6150L compatibles for Qualcomm SC7180 platfrom.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Link: https://lore.kernel.org/r/1570183734-30706-2-git-send-email-kgunda@codeaurora.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index bab9f71140b8..97c3e0b7611c 100644
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
2.20.1
