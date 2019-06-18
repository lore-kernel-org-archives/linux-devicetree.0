From: Mark Brown <broonie@kernel.org>
Subject: Applied "dt-bindings: qcom_spmi: Document pms405 support" to the regulator tree
Date: Tue, 18 Jun 2019 19:33:19 +0100 (BST)
Message-ID: <20190618183319.8A72B440049@finisterre.sirena.org.uk>
References: <20190617183815.13659-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617183815.13659-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: agross@kernel.org, bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.orgMark Brown <broonie@kernel.org>, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   dt-bindings: qcom_spmi: Document pms405 support

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

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

>From bbd7992e6a32a3a52f3c26c86eba81037651c5c6 Mon Sep 17 00:00:00 2001
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Date: Mon, 17 Jun 2019 11:38:15 -0700
Subject: [PATCH] dt-bindings: qcom_spmi: Document pms405 support

The PMS405 supports 5 SMPS and 13 LDO regulators.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/qcom,spmi-regulator.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index ba94bc2d407a..430b8622bda1 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -10,6 +10,7 @@ Qualcomm SPMI Regulators
 			"qcom,pm8941-regulators"
 			"qcom,pm8994-regulators"
 			"qcom,pmi8994-regulators"
+			"qcom,pms405-regulators"
 
 - interrupts:
 	Usage: optional
@@ -111,6 +112,23 @@ Qualcomm SPMI Regulators
 	Definition: Reference to regulator supplying the input pin, as
 		    described in the data sheet.
 
+- vdd_l1_l2-supply:
+- vdd_l3_l8-supply:
+- vdd_l4-supply:
+- vdd_l5_l6-supply:
+- vdd_l10_l11_l12_l13-supply:
+- vdd_l7-supply:
+- vdd_l9-supply:
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s5-supply
+	Usage: optional (pms405 only)
+	Value type: <phandle>
+	Definition: Reference to regulator supplying the input pin, as
+		    described in the data sheet.
+
 - qcom,saw-reg:
 	Usage: optional
 	Value type: <phandle>
-- 
2.20.1
