From: jakob.wuhrer@gmail.com
Subject: [PATCH 1/2] arm64: dts: qcom: Correct "gpiio" typo in msm8996-pins
Date: Fri, 14 Dec 2018 18:01:30 +0100
Message-ID: <1544806891-12516-1-git-send-email-jakob.wuhrer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org
Cc: Jakob Wuhrer <jakobwuhrer@airmail.cc>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jakob Wuhrer <jakobwuhrer@airmail.cc>

gpiio5 is missspelt in msm8996-pins.dtsi, fix that.

Signed-off-by: Jakob Wuhrer <jakobwuhrer@airmail.cc>
---
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index c5c42e9..1d1f7f9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -139,7 +139,7 @@
 		};
 
 		pinconf {
-			pins = "gpio4", "gpiio5", "gpio6", "gpio7";
+			pins = "gpio4", "gpio5", "gpio6", "gpio7";
 			drive-strength = <2>;
 			bias-disable;
 		};
-- 
1.8.3.1
