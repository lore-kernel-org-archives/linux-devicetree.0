From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH] ARM: dts: qcom: msm8974-hammerhead: correct gpios property on magnetometer
Date: Wed, 28 Nov 2018 04:53:35 -0500
Message-ID: <20181128095335.5538-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch correctly sets the gpios property for the ak8963
magnetometer's DRDY pin so that interrupts work properly.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
index fe2b5524a679..551d262a044a 100644
--- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -368,8 +368,7 @@
 				ak8963@f {
 					compatible = "asahi-kasei,ak8963";
 					reg = <0x0f>;
-					// Currently only works in polling mode.
-					// gpios = <&msmgpio 61 0>;
+					gpios = <&msmgpio 67 0>;
 					vid-supply = <&pm8941_lvs1>;
 					vdd-supply = <&pm8941_l17>;
 				};
-- 
2.17.2
