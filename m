Return-Path: <SRS0=Hqmr=J3=linaro.org=loic.poulain@kernel.org>
From: Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] arm: dts: qcom: db410c: Fix Bluetooth LED trigger
Date: Wed, 11 Jul 2018 14:18:23 +0200
Message-Id: <1531311503-2777-1-git-send-email-loic.poulain@linaro.org>
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org
Cc: niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Current LED trigger, 'bt', is not known/used by any existing driver.
Fix this by renaming it to 'bluetooth-power' trigger which is
controlled by the Bluetooth subsystem.

Fixes: 9943230c8860 ("arm64: dts: qcom: Add apq8016-sbc board LED's related device nodes")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: add 'Fixes' tag

 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 9ff8487..78ce397 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -338,7 +338,7 @@
 			led@6 {
 				label = "apq8016-sbc:blue:bt";
 				gpios = <&pm8916_mpps 3 GPIO_ACTIVE_HIGH>;
-				linux,default-trigger = "bt";
+				linux,default-trigger = "bluetooth-power";
 				default-state = "off";
 			};
 		};
-- 
2.7.4
