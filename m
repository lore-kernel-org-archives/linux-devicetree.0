From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 08/13] ARM: dts: db600c: add pcie support
Date: Tue, 12 Apr 2016 10:33:57 +0100
Message-ID: <1460453642-5809-9-git-send-email-srinivas.kandagatla@linaro.org>
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

This patch adds pcie and regulators required to get on board ATL1C
ethernet working.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi   | 12 +++++++++++
 arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts    | 24 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi
index 7339919..0610f00 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c-pins.dtsi
@@ -6,4 +6,16 @@
 			bias-disable;
 		};
 	};
+
+	pcie_pins: pcie-pinmux {
+		mux {
+			pins = "gpio27";
+			function = "gpio";
+		};
+		conf {
+			pins = "gpio27";
+			drive-strength = <12>;
+			bias-disable;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
index 2c563df..4f2218c 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
@@ -21,6 +21,16 @@
 			regulator-type = "voltage";
 			regulator-boot-on;
 		};
+
+		/* on board fixed 3.3v supply */
+		vcc3v3: vcc3v3 {
+			compatible = "regulator-fixed";
+			regulator-name = "VCC3V3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+		};
+
 	};
 
 	soc {
@@ -109,6 +119,10 @@
 					regulator-max-microvolt = <1900000>;
 					bias-pull-down;
 				};
+
+				lvs6 {
+					bias-pull-down;
+				};
 			};
 		};
 
@@ -135,6 +149,16 @@
 			};
 		};
 
+		pci@1b500000 {
+			status = "okay";
+			vdda-supply = <&pm8921_s3>;
+			vdda_phy-supply = <&pm8921_lvs6>;
+			vdda_refclk-supply = <&vcc3v3>;
+			pinctrl-0 = <&pcie_pins>;
+			pinctrl-names = "default";
+			perst-gpio = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
+		};
+
 		/* OTG */
 		phy@12500000 {
 			status		= "okay";
-- 
2.5.0
