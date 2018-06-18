From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/2] arm64: dts: sdm845: Add rpmh-clk node
Date: Mon, 18 Jun 2018 13:56:16 -0700
Message-ID: <20180618205616.102750-2-dianders@chromium.org>
References: <20180618205616.102750-1-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618205616.102750-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org
Cc: sboyd@kernel.org, tdas@codeaurora.org, rplsssn@codeaurora.org, ilina@codeaurora.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds the rpmh-clk node to sdm845 based on the examples in the
bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
NOTE: to apply this patch cleanly, apply it atop:
  arm64: dts: qcom: sdm845: Add I2C, SPI, and UART9 nodes
  https://patchwork.kernel.org/patch/10462691/

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 19b006293d3b..c61ae815a697 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -1001,6 +1002,11 @@
 					  <WAKE_TCS    3>,
 					  <ACTIVE_TCS  2>,
 					  <CONTROL_TCS 1>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sdm845-rpmh-clk";
+				#clock-cells = <1>;
+			};
 		};
 
 		intc: interrupt-controller@17a00000 {
-- 
2.18.0.rc1.244.gcf134e6275-goog
