From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404-evb: Change the compatible to distinguish platforms
Date: Mon,  4 Mar 2019 21:14:24 +0100
Message-ID: <20190304201424.16951-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Khasim Syed Mohammed <khasim.mohammed@linaro.org>

The compatible flag should be different for each board to match
with the dtb and to let the bootloader pick the appropriate dtb.

Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb-1000.dts | 3 ++-
 arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-1000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-1000.dts
index 2c14903d808e..937eb4555ffe 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-1000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-1000.dts
@@ -7,5 +7,6 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. QCS404 EVB 1000";
-	compatible = "qcom,qcs404-evb";
+	compatible = "qcom,qcs404-evb-1000", "qcom,qcs404-evb",
+		     "qcom,qcs404";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
index 11269ad3de0d..da4ac896b56f 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts
@@ -7,5 +7,6 @@
 
 / {
 	model = "Qualcomm Technologies, Inc. QCS404 EVB 4000";
-	compatible = "qcom,qcs404-evb";
+	compatible = "qcom,qcs404-evb-4000", "qcom,qcs404-evb",
+		     "qcom,qcs404";
 };
-- 
2.20.1
