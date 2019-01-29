From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 6/6] arm64: dts: db820c: Add sound card support
Date: Tue, 29 Jan 2019 13:23:35 +0000
Message-ID: <20190129132335.30695-7-srinivas.kandagatla@linaro.org>
References: <20190129132335.30695-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129132335.30695-1-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: andy.gross@linaro.org
Cc: linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds support both digital and analog audio on DB820c.
This board has HDMI port and 3.5mm audio jack to support both digital
and analog audio respectively.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../dts/qcom/apq8096-db820c-pmic-pins.dtsi    |   9 ++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  |  98 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8996-pins.dtsi    |  46 ++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 140 ++++++++++++++++++
 4 files changed, 293 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi
index a6ad3d7fe655..7c5045949c01 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c-pmic-pins.dtsi
@@ -36,6 +36,15 @@
 		};
 	};
 
+
+	audio_mclk: clk_div1 {
+		pinconf {
+			pins = "gpio15";
+			function = "func1";
+			power-source = <PM8994_GPIO_S4>; // 1.8V
+		};
+	};
+
 	volume_up_gpio: pm8996_gpio2 {
 		pinconf {
 			pins = "gpio2";
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 1e78f0b47c89..56f78405587e 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -18,6 +18,8 @@
 #include "apq8096-db820c-pmic-pins.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 /*
  * GPIO name legend: proper name = the GPIO line is used as GPIO
@@ -63,6 +65,7 @@
 	};
 
 	clocks {
+		compatible = "simple-bus";
 		divclk4: divclk4 {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -72,6 +75,15 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&divclk4_pin_a>;
 		};
+
+		div1_mclk: divclk1 {
+			compatible = "gpio-gate-clock";
+			pinctrl-0 = <&audio_mclk>;
+			pinctrl-names = "default";
+			clocks = <&rpmcc RPM_SMD_DIV_CLK1>;
+			#clock-cells = <0>;
+			enable-gpios = <&pm8994_gpios 15 0>;
+		};
 	};
 
 	soc {
@@ -453,6 +465,16 @@
 			};
 		};
 
+		slim_msm: slim@91c0000 {
+			ngd@1 {
+				wcd9335: codec@1{
+					clock-names = "mclk", "slimbus";
+					clocks = <&div1_mclk>,
+						 <&rpmcc RPM_SMD_BB_CLK1>;
+				};
+			};
+		};
+
 		mdss@900000 {
 			status = "okay";
 
@@ -479,6 +501,10 @@
 				core-vcc-supply = <&pm8994_s4>;
 			};
 		};
+
+		remoteproc@2080000 {
+			status = "okay";
+		};
 	};
 
 
@@ -666,3 +692,75 @@
 		};
 	};
 };
+
+&sound {
+	compatible = "qcom,apq8096-sndcard";
+	model = "DB820c";
+	audio-routing =	"RX_BIAS", "MCLK";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	hdmi-dai-link {
+		link-name = "HDMI";
+		cpu {
+			sound-dai = <&q6afedai HDMI_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&hdmi 0>;
+		};
+	};
+
+	slim-dai-link {
+		link-name = "SLIM Playback";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_6_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9335 6>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&wcd9335 1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
index 131878db9852..c7ae88100cb6 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-pins.dtsi
@@ -13,6 +13,52 @@
 
 &msmgpio {
 
+		wcd9xxx_intr {
+			wcd_intr_default: wcd_intr_default{
+				mux {
+					pins = "gpio54";
+					function = "gpio";
+				};
+
+				config {
+					pins = "gpio54";
+					drive-strength = <2>; /* 2 mA */
+					bias-pull-down; /* pull down */
+					input-enable;
+				};
+			};
+		};
+
+
+		cdc_reset_ctrl {
+			cdc_reset_sleep: cdc_reset_sleep {
+				mux {
+					pins = "gpio64";
+					function = "gpio";
+				};
+				config {
+					pins = "gpio64";
+					drive-strength = <16>;
+					bias-disable;
+					output-low;
+				};
+			};
+			cdc_reset_active:cdc_reset_active {
+				mux {
+					pins = "gpio64";
+					function = "gpio";
+				};
+				config {
+					pins = "gpio64";
+					drive-strength = <16>;
+					bias-pull-down;
+					output-high;
+				};
+			};
+		};
+
+
+
 	blsp1_spi0_default: blsp1_spi0_default {
 		pinmux {
 			function = "blsp_spi1";
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b5f23594905c..3c8e1eac8758 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/clock/qcom,gcc-msm8996.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/soc/qcom,apr.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1178,6 +1179,33 @@
 			power-domains = <&mmcc MDSS_GDSC>;
 		};
 
+		lpass_q6_smmu: arm,smmu-lpass_q6@1600000 {
+			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+			reg = <0x1600000 0x20000>;
+			#iommu-cells = <1>;
+			power-domains = <&gcc HLOS1_VOTE_LPASS_CORE_GDSC>;
+
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+		                <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_CORE_SMMU_CLK>,
+				 <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
+			clock-names = "iface", "bus";
+                        status = "okay";
+		};
+
 		agnoc@0 {
 			power-domains = <&gcc AGGRE0_NOC_GDSC>;
 			compatible = "simple-pm-bus";
@@ -1344,6 +1372,66 @@
 			};
 		};
 
+		slimbam:dma@9184000
+		{
+			compatible = "qcom,bam-v1.7.0";
+			qcom,controlled-remotely;
+			reg = <0x9184000 0x32000>;
+			num-channels  = <31>;
+			interrupts = <0 164 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,num-ees = <2>;
+		};
+
+		slim_msm: slim@91c0000 {
+			compatible = "qcom,slim-ngd-v1.5.0";
+			reg = <0x91c0000 0x2C000>;
+			reg-names = "ctrl";
+			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
+			dmas =	<&slimbam 3>, <&slimbam 4>,
+				<&slimbam 5>, <&slimbam 6>;
+			dma-names = "rx", "tx", "tx2", "rx2";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			ngd@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				tasha_ifd: tas-ifd {
+					compatible = "slim217,1a0";
+					reg  = <0 0>;
+				};
+
+				wcd9335: codec@1{
+					pinctrl-0 = <&cdc_reset_active &wcd_intr_default>;
+					pinctrl-names = "default";
+
+					compatible = "slim217,1a0";
+					reg  = <1 0>;
+
+					interrupt-parent = <&msmgpio>;
+					interrupts = <54 IRQ_TYPE_LEVEL_HIGH>,
+						     <53 IRQ_TYPE_LEVEL_HIGH>;
+					interrupt-names  = "intr1", "intr2";
+					interrupt-controller;
+					#interrupt-cells = <1>;
+					reset-gpios = <&msmgpio 64 0>;
+
+					slim-ifc-dev  = <&tasha_ifd>;
+
+					vdd-buck-supply = <&pm8994_s4>;
+					vdd-buck-sido-supply = <&pm8994_s4>;
+					vdd-tx-supply = <&pm8994_s4>;
+					vdd-rx-supply = <&pm8994_s4>;
+					vdd-io-supply = <&pm8994_s4>;
+
+					#sound-dai-cells = <1>;
+				};
+			};
+		};
+
 		gpu@b00000 {
 			compatible = "qcom,adreno-530.2", "qcom,adreno";
 			#stream-id-cells = <16>;
@@ -1473,6 +1561,7 @@
 
 				phys = <&hdmi_phy>;
 				phy-names = "hdmi_phy";
+				#sound-dai-cells = <1>;
 
 				ports {
 					#address-cells = <1>;
@@ -1511,6 +1600,9 @@
 		};
 	};
 
+	sound: sound {
+	};
+
 	adsp-pil {
 		compatible = "qcom,msm8996-adsp-pil";
 
@@ -1537,6 +1629,54 @@
 			mboxes = <&apcs_glb 8>;
 			qcom,smd-edge = <1>;
 			qcom,remote-pid = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			apr {
+				power-domains = <&gcc HLOS1_VOTE_LPASS_ADSP_GDSC>;
+				compatible = "qcom,apr-v2";
+				qcom,smd-channels = "apr_audio_svc";
+				reg = <APR_DOMAIN_ADSP>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				q6core {
+					reg = <APR_SVC_ADSP_CORE>;
+					compatible = "qcom,q6core";
+				};
+
+				q6afe: q6afe {
+					compatible = "qcom,q6afe";
+					reg = <APR_SVC_AFE>;
+					q6afedai: dais {
+						compatible = "qcom,q6afe-dais";
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#sound-dai-cells = <1>;
+						hdmi@1 {
+							reg = <1>;
+						};
+					};
+				};
+
+				q6asm: q6asm {
+					compatible = "qcom,q6asm";
+					reg = <APR_SVC_ASM>;
+					q6asmdai: dais {
+						compatible = "qcom,q6asm-dais";
+						#sound-dai-cells = <1>;
+						iommus = <&lpass_q6_smmu 1>;
+					};
+				};
+
+				q6adm: q6adm {
+					compatible = "qcom,q6adm";
+					reg = <APR_SVC_ADM>;
+					q6routing: routing {
+						compatible = "qcom,q6adm-routing";
+						#sound-dai-cells = <0>;
+					};
+				};
+			};
 		};
 	};
 
-- 
2.20.1
