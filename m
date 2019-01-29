From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 5/6] arm64: dts: apq8096-db820c: Add HDMI display support
Date: Tue, 29 Jan 2019 13:23:34 +0000
Message-ID: <20190129132335.30695-6-srinivas.kandagatla@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Archit Taneja <architt@codeaurora.org>

The APQ8096 DB820c platform provides HDMI output. The MDSS block on
8x96 supports a direct HDMI out. Populate the MDSS, MDP and HDMI DT
nodes. Also, add the HDMI HPD and DDC pinctrl nodes with the bias
and driver strength specified for this platform.

Signed-off-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../boot/dts/qcom/apq8096-db820c-pins.dtsi    | 52 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi  | 27 ++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi
index 6a573875d45a..1c0d06f59d00 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c-pins.dtsi
@@ -62,4 +62,56 @@
 			bias-disable;
 		};
 	};
+
+	hdmi_hpd_active: hdmi_hpd_active {
+		mux {
+			pins = "gpio34";
+			function = "hdmi_hot";
+		};
+
+		config {
+			pins = "gpio34";
+			bias-pull-down;
+			drive-strength = <16>;
+		};
+	};
+
+	hdmi_hpd_suspend: hdmi_hpd_suspend {
+		mux {
+			pins = "gpio34";
+			function = "hdmi_hot";
+		};
+
+		config {
+			pins = "gpio34";
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	hdmi_ddc_active: hdmi_ddc_active {
+		mux {
+			pins = "gpio32", "gpio33";
+			function = "hdmi_ddc";
+		};
+
+		config {
+			pins = "gpio32", "gpio33";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	hdmi_ddc_suspend: hdmi_ddc_suspend {
+		mux {
+			pins = "gpio32", "gpio33";
+			function = "hdmi_ddc";
+		};
+
+		config {
+			pins = "gpio32", "gpio33";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 6d50449fbcdf..1e78f0b47c89 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -452,6 +452,33 @@
 				perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
 			};
 		};
+
+		mdss@900000 {
+			status = "okay";
+
+			mdp@901000 {
+				status = "okay";
+			};
+
+			hdmi-phy@9a0600 {
+				status = "okay";
+
+				vddio-supply = <&pm8994_l12>;
+				vcca-supply = <&pm8994_l28>;
+				#phy-cells = <0>;
+			};
+
+			hdmi-tx@9a0000 {
+				status = "okay";
+
+				pinctrl-names = "default", "sleep";
+				pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
+				pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
+
+				core-vdda-supply = <&pm8994_l12>;
+				core-vcc-supply = <&pm8994_s4>;
+			};
+		};
 	};
 
 
-- 
2.20.1
