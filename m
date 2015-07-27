From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 5/7] ARM: dts: apq8064: add pm8921 mpp support
Date: Mon, 27 Jul 2015 14:52:02 +0100
Message-ID: <1438005122-16475-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds pmic pm8921 mpp gpio controller node.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 647a7e0..da214f1 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -320,6 +320,18 @@
 					#gpio-cells = <2>;
 
 				};
+
+				pm8921_mpps: mpps@50 {
+					compatible = "qcom,pm8921-mpp";
+					reg = <0x50>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupts =
+					<128 1>, <129 1>, <130 1>, <131 1>,
+					<132 1>, <133 1>, <134 1>, <135 1>,
+					<136 1>, <137 1>, <138 1>, <139 1>;
+				};
+
 			};
 		};
 
-- 
1.9.1
