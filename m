From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2] arm64: dts: sdm845: Add videocc node
Date: Mon,  3 Dec 2018 11:36:29 -0800
Message-ID: <20181203193629.58505-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Taniya Das <tdas@codeaurora.org>

This adds the video clock controller node to sdm845 based on the examples
in the bindings.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Add #reset-cells = <1>.
- Sort properly.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1419b0098cb3..3f6bf5750918 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,videocc-sdm845.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qusb2.h>
 #include <dt-bindings/reset/qcom,sdm845-aoss.h>
@@ -1256,6 +1257,14 @@
 			};
 		};
 
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,sdm845-videocc";
+			reg = <0xab00000 0x10000>;
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sdm845-dispcc";
 			reg = <0xaf00000 0x10000>;
-- 
2.20.0.rc1.387.gf8505762e3-goog
