From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 5/7] arm64: dts: msm8998-mtp: Add pm8005_s1 regulator
Date: Thu,  6 Jun 2019 11:51:03 -0700
Message-ID: <20190606185103.39788-1-jeffrey.l.hugo@gmail.com>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org, niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The pm8005_s1 is VDD_GFX, and needs to be on to enable the GPU.
This should be hooked up to the GPU CPR, but we don't have support for that
yet, so until then, just turn on the regulator and keep it on so that we
can focus on basic GPU bringup.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index f09f3e03f708..108667ce4f31 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -27,6 +27,23 @@
 	status = "okay";
 };
 
+&pm8005_lsid1 {
+	pm8005-regulators {
+		compatible = "qcom,pm8005-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+
+		pm8005_s1: s1 { /* VDD_GFX supply */
+			regulator-min-microvolt = <524000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-enable-ramp-delay = <500>;
+
+			/* hack until we rig up the gpu consumer */
+			regulator-always-on;
+		};
+	};
+};
+
 &qusb2phy {
 	status = "okay";
 
-- 
2.17.1
