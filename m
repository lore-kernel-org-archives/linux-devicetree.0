From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 5/7] ARM: dts: ifc6410: enable MDP support
Date: Tue, 28 Jul 2015 13:54:18 +0100
Message-ID: <1438088058-17522-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch enables MDP support on IFC6410.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 1fc2ea5..1ab71f1 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -111,6 +111,16 @@
 			regulator-boot-on;
 		};
 
+		hdmi: qcom,hdmi-tx@4a00000 {
+			status = "okay";
+			core-vdda-supply = <&pm8921_hdmi_switch>;
+			hdmi-mux-supply = <&ext_3p3v>;
+		};
+
+		mdp: qcom,mdp@5100000 {
+			status = "okay";
+		};
+
 		gsbi3: gsbi@16200000 {
 			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C>;
-- 
1.9.1
