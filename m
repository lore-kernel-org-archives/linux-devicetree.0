Return-Path: <SRS0=xwYl=I5=linaro.org=loic.poulain@kernel.org>
From: Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] arm: dts: qcom: db410c: Fix Bluetooth LED trigger
Date: Mon, 11 Jun 2018 15:18:09 +0200
Message-Id: <1528723089-24904-1-git-send-email-loic.poulain@linaro.org>
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Current LED trigger, 'bt', is not known/used by any existing driver.
Fix this by renaming it to 'bluetooth-power' trigger which is
controlled by the Bluetooth subsystem.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 4c3dda5..16f6477 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -188,7 +188,7 @@
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
