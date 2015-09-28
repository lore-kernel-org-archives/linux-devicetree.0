From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 07/11] ARM: DT: STiH407: Add systrace pin configuration
Date: Mon, 28 Sep 2015 13:37:43 +0100
Message-ID: <1443443867-4099-8-git-send-email-peter.griffin@linaro.org>
References: <1443443867-4099-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443443867-4099-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

This patch adds the pin config for systrace for
STiH407 family silicon.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index d281f9c..7a1bd42 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -846,6 +846,18 @@
 					};
 				};
 			};
+
+			systrace {
+				pinctrl_systrace_default: systrace-default {
+					st,pins {
+						trc_data0 = <&pio11 3 ALT5 OUT>;
+						trc_data1 = <&pio11 4 ALT5 OUT>;
+						trc_data2 = <&pio11 5 ALT5 OUT>;
+						trc_data3 = <&pio11 6 ALT5 OUT>;
+						trc_clk   = <&pio11 7 ALT5 OUT>;
+					};
+				};
+			};
 		};
 
 		pin-controller-front1 {
-- 
1.9.1
