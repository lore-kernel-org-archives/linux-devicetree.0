From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 4/4] ARM: sti: Add STiH407 reset controller support.
Date: Wed,  2 Jul 2014 15:08:49 +0100
Message-ID: <1404310129-14667-5-git-send-email-peter.griffin@linaro.org>
References: <1404310129-14667-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404310129-14667-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the reset controller DT nodes for the powerdown,
 softreset and picophy controllers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/stih407.dtsi b/arch/arm/boot/dts/stih407.dtsi
index 4f9024f..d2f1aaa 100644
--- a/arch/arm/boot/dts/stih407.dtsi
+++ b/arch/arm/boot/dts/stih407.dtsi
@@ -8,6 +8,7 @@
  */
 #include "stih407-clock.dtsi"
 #include "stih407-pinctrl.dtsi"
+#include <dt-bindings/reset-controller/stih407-resets.h>
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -63,6 +64,21 @@
 		ranges;
 		compatible = "simple-bus";
 
+		powerdown: powerdown-controller {
+			compatible = "st,stih407-powerdown";
+			#reset-cells = <1>;
+		};
+
+		softreset: softreset-controller {
+			compatible = "st,stih407-softreset";
+			#reset-cells = <1>;
+		};
+
+		picophyreset: picophyreset-controller {
+			compatible = "st,stih407-picophyreset";
+			#reset-cells = <1>;
+		};
+
 		syscfg_sbc: sbc-syscfg@9620000 {
 			compatible = "st,stih407-sbc-syscfg", "syscon";
 			reg = <0x9620000 0x1000>;
-- 
1.9.1
