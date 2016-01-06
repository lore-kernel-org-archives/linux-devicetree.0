From: Vinay Simha BN <vinaysimha@inforcecomputing.com>
Subject: [PATCH] arm64: dts: qcom: apq8016-sbc: leds: bt and wlan
Date: Wed,  6 Jan 2016 12:12:24 +0530
Message-ID: <1452062554-4167-1-git-send-email-vinaysimha@inforcecomputing.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, Andy Gross <agross@codeaurora.org>
Cc: Vinay Simha BN <vinaysimha@inforcecomputing.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Olof Johansson <olof@lixom.net>, Archit Taneja <architt@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT
	AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

BT LED   - PMIC - MPP_03
WLAN LED - PMIC - MPP_02

Signed-off-by: Vinay Simha BN <vinaysimha@inforcecomputing.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 7bb0ab8..37ca0c8 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -94,14 +94,14 @@
 		led@5 {
 			label = "apq8016-sbc:yellow:wifi";
 			gpios = <&pm8916_mpps 2 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "wlan";
+			linux,default-trigger = "rfkill0";
 			default-state = "off";
 		};
 
 		led@6 {
 			label = "apq8016-sbc:blue:bt";
 			gpios = <&pm8916_mpps 3 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "bt";
+			linux,default-trigger = "rfkill1";
 			default-state = "off";
 		};
 	};
-- 
2.1.2
