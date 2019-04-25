From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH] arm64: dts: pms405: increase s3 max voltage
Date: Thu, 25 Apr 2019 13:34:29 +0200
Message-ID: <20190425113429.14321-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Increase s3 max voltage in accordance to QCS404 CPR Fusing Guide Rev 6.0

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 2c3127167e3c..6910fc663fe1 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -64,7 +64,7 @@
 		regulator-boot-on;
 		regulator-name = "vdd_apc";
 		regulator-min-microvolt = <1048000>;
-		regulator-max-microvolt = <1352000>;
+		regulator-max-microvolt = <1384000>;
 	};
 };
 
-- 
2.20.1
