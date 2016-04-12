From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 06/13] ARM: dts: db600c: Add eMMC and SD card support
Date: Tue, 12 Apr 2016 10:33:55 +0100
Message-ID: <1460453642-5809-7-git-send-email-srinivas.kandagatla@linaro.org>
References: <1460453642-5809-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1460453642-5809-1-git-send-email-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org, linux-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds eMMC and SD card support with card detect and adding
required regulators.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi   |  9 ++++++
 arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts    | 34 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi

diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi
new file mode 100644
index 0000000..7339919
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi
@@ -0,0 +1,9 @@
+&tlmm_pinmux {
+	card_detect: card-detect {
+		mux {
+			pins = "gpio26";
+			function = "gpio";
+			bias-disable;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
index 6695b00..d921424 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
@@ -1,4 +1,6 @@
 #include "qcom-apq8064-v2.0.dtsi"
+#include "qcom-apq8064-arrow-db600c-pins.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Arrow Electronics, APQ8064 DB600c";
@@ -69,6 +71,20 @@
 					regulator-max-microvolt = <1300000>;
 					qcom,switch-mode-frequency = <3200000>;
 				 };
+
+				l5 {
+					regulator-min-microvolt = <2750000>;
+					regulator-max-microvolt = <3000000>;
+					bias-pull-down;
+					regulator-boot-on;
+					regulator-always-on;
+				};
+
+				l6 {
+					regulator-min-microvolt = <2950000>;
+					regulator-max-microvolt = <2950000>;
+					bias-pull-down;
+				};
 			};
 		};
 
@@ -94,5 +110,23 @@
 				pinctrl-0 = <&gsbi7_uart_2pins>;
 			};
 		};
+
+		amba {
+			/* eMMC */
+			sdcc@12400000 {
+				status = "okay";
+				vmmc-supply = <&pm8921_l5>;
+				vqmmc-supply = <&pm8921_s4>;
+			};
+
+			/* External micro SD card */
+			sdcc@12180000 {
+				status = "okay";
+				vmmc-supply = <&pm8921_l6>;
+				pinctrl-names	= "default";
+				pinctrl-0	= <&card_detect>;
+				cd-gpios	= <&tlmm_pinmux 26 GPIO_ACTIVE_HIGH>;
+			};
+		};
 	};
 };
-- 
2.5.0
