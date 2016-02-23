From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 05/12] ARM: dts: apq8064: add spi5 device node.
Date: Tue, 23 Feb 2016 14:14:33 +0000
Message-ID: <1456236873-2649-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1456236639-1379-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1456236639-1379-1-git-send-email-srinivas.kandagatla@linaro.org>
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
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds spi5 device node, spi5 is used on ifc6410 on the
expansion connector.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-pins.dtsi | 38 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064.dtsi      | 14 ++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
index ce15c67..0b7b10e 100644
--- a/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
@@ -64,6 +64,44 @@
 		};
 	};
 
+	spi5_default: spi5_default {
+		pinmux {
+			pins = "gpio51", "gpio52", "gpio54";
+			function = "gsbi5";
+		};
+
+		pinmux_cs {
+			function = "gpio";
+			pins = "gpio53";
+		};
+
+		pinconf {
+			pins = "gpio51", "gpio52", "gpio54";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		pinconf_cs {
+			pins = "gpio53";
+			drive-strength = <16>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	spi5_sleep: spi5_sleep {
+		pinmux {
+			function = "gpio";
+			pins = "gpio51", "gpio52", "gpio53", "gpio54";
+		};
+
+		pinconf {
+			pins = "gpio51", "gpio52", "gpio53", "gpio54";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
 	gsbi6_uart_2pins: gsbi6_uart_2pins {
 		mux {
 			pins = "gpio14", "gpio15";
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 3fb66b9..3fefb2e 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -236,6 +236,7 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
+
 		};
 
 		gsbi2: gsbi@12480000 {
@@ -304,6 +305,19 @@
 				clock-names = "core", "iface";
 				status = "disabled";
 			};
+
+			gsbi5_spi: spi@1a280000 {
+				compatible = "qcom,spi-qup-v1.1.1";
+				reg = <0x1a280000 0x1000>;
+				interrupts = <0 155 0>;
+				pinctrl-0 = <&spi5_default &spi5_sleep>;
+				pinctrl-names = "default", "sleep";
+				clocks = <&gcc GSBI5_QUP_CLK>, <&gcc GSBI5_H_CLK>;
+				clock-names = "core", "iface";
+				status = "disabled";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		gsbi6: gsbi@16500000 {
-- 
1.9.1
