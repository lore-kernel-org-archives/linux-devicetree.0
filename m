From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH] arm64: dts: qcom: Enable eMMC on apq8016-sbc board
Date: Thu,  1 Oct 2015 12:59:31 +0300
Message-ID: <1443693571-32068-1-git-send-email-georgi.djakov@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org
Cc: georgi.djakov@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable the eMMC on the APQ8016 SBC board (also known as DragonBoard 410c),
so that we can use its internal storage.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 3fc3be447edd..8cea426e58af 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -86,3 +86,7 @@
 		};
 	};
 };
+
+&sdhc_1 {
+	status = "okay";
+};
