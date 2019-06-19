From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404-evb: fix vdd_apc supply
Date: Wed, 19 Jun 2019 20:16:53 +0200
Message-ID: <20190619181653.29407-1-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jeffrey.l.hugo@gmail.com, niklas.cassel@linaro.org
List-Id: devicetree@vger.kernel.org

The invalid definition in the supply causes the Qualcomm's EVB-1000
and EVB-4000 not to boot.

Fix the boot issue by correctly defining the supply: vdd_s3 (namely
"vdd_apc") is actually connected to vph_pwr.

Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
Tested-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index b6092a742675..11c0a7137823 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -65,7 +65,7 @@
 };
 
 &pms405_spmi_regulators {
-	vdd_s3-supply = <&pms405_s3>;
+	vdd_s3-supply = <&vph_pwr>;
 
 	pms405_s3: s3 {
 		regulator-always-on;
-- 
2.21.0
