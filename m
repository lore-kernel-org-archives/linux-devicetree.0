From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404: sdcc1: enable HS400
Date: Thu,  3 Jan 2019 21:34:55 +0100
Message-ID: <1546547695-15345-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org
List-Id: devicetree@vger.kernel.org

The controller can support EXT_CSD_CARD_TYPE_HS400_1_8V cards.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index a39924e..2c2c9b0 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -127,6 +127,7 @@
 	status = "ok";
 
 	mmc-ddr-1_8v;
+	mmc-hs400-1_8v;
 	bus-width = <8>;
 	non-removable;
 
-- 
2.7.4
