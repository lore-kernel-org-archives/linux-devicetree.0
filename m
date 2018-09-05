From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2 2/3] arm64: dts: msm8916: Drop model and compatible
Date: Wed,  5 Sep 2018 20:35:16 +0200
Message-ID: <20180905183517.9390-3-niklas.cassel@linaro.org>
References: <20180905183517.9390-1-niklas.cassel@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905183517.9390-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

DTS board files should always specify model and compatible.

All DTS board files that includes msm8916.dtsi
already specifies model and compatible, and will thus
override the model and compatible in msm8916.dtsi.

Drop model and compatible from msm8916.dtsi,
since they are only a source of confusion.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 7b32b8990d62..726a45960742 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -18,9 +18,6 @@
 #include <dt-bindings/thermal/thermal.h>
 
 / {
-	model = "Qualcomm Technologies, Inc. MSM8916";
-	compatible = "qcom,msm8916";
-
 	interrupt-parent = <&intc>;
 
 	#address-cells = <2>;
-- 
2.17.1
