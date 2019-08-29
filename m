From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: qcs404: add sleep clk fixed rate oscillator
Date: Thu, 29 Aug 2019 22:03:39 +0200
Message-ID: <20190829200340.15498-1-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This fixed rate clock is required for the operation of some devices
(ie watchdog).

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a97eeb4569c0..131d8046d3be 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -22,6 +22,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
 		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
 	};
 
 	cpus {
-- 
2.22.0
