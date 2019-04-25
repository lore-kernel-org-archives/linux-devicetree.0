From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404-evb: fix l3 min voltage
Date: Thu, 25 Apr 2019 14:34:01 +0200
Message-ID: <20190425123402.18167-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The current l3 min voltage level is not supported by
the regulator (the voltage is not a multiple of the regulator step size),
so a driver requesting this exact voltage would fail, see discussion in:
https://patchwork.kernel.org/comment/22461199/

It was agreed upon to set a min voltage level that is a multiple of the
regulator step size.

There was actually a patch sent that did this:
https://patchwork.kernel.org/patch/10819313/

However, the commit 331ab98f8c4a ("arm64: dts: qcom: qcs404:
Fix voltages l3") that was applied is not identical to that patch.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 6910fc663fe1..9a7d930dcd23 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -118,7 +118,7 @@
 		};
 
 		vreg_l3_1p05: l3 {
-			regulator-min-microvolt = <1050000>;
+			regulator-min-microvolt = <1048000>;
 			regulator-max-microvolt = <1160000>;
 		};
 
-- 
2.20.1
