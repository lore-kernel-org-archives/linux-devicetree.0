From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH 6/7] arm64: dts: qcom: Add MSM8916 restart device node
Date: Wed,  1 Apr 2015 18:05:14 +0300
Message-ID: <1427900715-26273-7-git-send-email-ivan.ivanov@linaro.org>
References: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the restart node so we can reboot the device.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 02a4916..c95592d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -77,6 +77,11 @@
 		ranges = <0 0 0 0xffffffff>;
 		compatible = "simple-bus";

+		restart@4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0x4ab000 0x4>;
+		};
+
 		pinctrl@1000000 {
 			compatible = "qcom,msm8916-pinctrl";
 			reg = <0x1000000 0x300000>;
--
1.9.1
