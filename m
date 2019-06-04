From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH] arm64: dts: msm8996: fix PSCI entry-latency-us
Date: Tue,  4 Jun 2019 14:29:31 +0200
Message-ID: <20190604122931.22235-1-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: amit.kucheria@linaro.org, bjorn.andersson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The current entry-latency-us is too short.
The proper way to convert between the device tree properties
from the vendor tree to the upstream PSCI device tree properties is:

entry-latency-us = qcom,time-overhead - qcom,latency-us

which gives

entry-latency-us = 210 - 80 = 130

Fixes: f6aee7af59b6 ("arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states")
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b7cf2a17dcb5..e8c03b5c8990 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -174,7 +174,7 @@
 				compatible = "arm,idle-state";
 				idle-state-name = "standalone-power-collapse";
 				arm,psci-suspend-param = <0x00000004>;
-				entry-latency-us = <40>;
+				entry-latency-us = <130>;
 				exit-latency-us = <80>;
 				min-residency-us = <300>;
 			};
-- 
2.21.0
