From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: msm8996: Drop model
Date: Wed,  5 Sep 2018 20:35:17 +0200
Message-ID: <20180905183517.9390-4-niklas.cassel@linaro.org>
References: <20180905183517.9390-1-niklas.cassel@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905183517.9390-1-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

DTS board files should always specify model and compatible.

All DTS board files that includes msm8996.dtsi
already specifies model and compatible, and will thus
override the model and compatible in msm8996.dtsi.

Drop model from msm8916.dtsi, since it is only a source of confusion.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index cd3865e7a270..b4d635bb81ac 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -16,8 +16,6 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 
 / {
-	model = "Qualcomm Technologies, Inc. MSM8996";
-
 	interrupt-parent = <&intc>;
 
 	#address-cells = <2>;
-- 
2.17.1
