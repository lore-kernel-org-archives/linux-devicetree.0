From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 2/4] ARM: DT: STiH407: Add i2c12 pin definition
Date: Tue, 12 Apr 2016 14:57:26 +0100
Message-ID: <1460469448-9065-3-git-send-email-peter.griffin@linaro.org>
References: <1460469448-9065-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460469448-9065-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add DT pinctrl definitions for SSC12 controller.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 87e75bf..e647751 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -203,6 +203,15 @@
 				};
 			};
 
+			i2c12 {
+				pinctrl_i2c12_default: i2c12-default {
+					st,pins {
+						sda = <&pio3 6 ALT2 BIDIR>;
+						scl = <&pio3 7 ALT2 BIDIR>;
+					};
+				};
+			};
+
 			keyscan {
 				pinctrl_keyscan: keyscan {
 					st,pins {
-- 
1.9.1
