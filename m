Return-Path: <SRS0=9em4=OX=linaro.org=loic.poulain@kernel.org>
From: Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] arm64: dts: apq8016-sbc: Increase load on l11 for SDCARD
Date: Fri, 14 Dec 2018 12:01:02 +0100
Message-Id: <1544785262-15821-1-git-send-email-loic.poulain@linaro.org>
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, migusa@arrowjapan.com, Loic Poulain <loic.poulain@linaro.org>
List-ID: <devicetree@vger.kernel.org>

In the same way as for msm8974-hammerhead, l11 load, used for SDCARD
VMMC, needs to be increased in order to prevent any voltage drop issues
(due to limited current) happening with some SDCARDS or during specific
operations (e.g. write).

Tested on Dragonboard-410c and DART-SD410 boards.

Fixes: 4c7d53d16d77 (arm64: dts: apq8016-sbc: add regulators support)
Reported-by: Manabu Igusa <migusa@arrowjapan.com>
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 4c3dda5..653344d 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -580,6 +580,8 @@
 	l11 {
 		regulator-min-microvolt = <1750000>;
 		regulator-max-microvolt = <3337000>;
+		regulator-allow-set-load;
+		regulator-system-load = <200000>;
 	};
 
 	l12 {
-- 
2.7.4
