From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 06/14] ARM: dts: apq8064: add pm8921 pwrkey support
Date: Fri, 18 Sep 2015 13:31:25 +0100
Message-ID: <1442579485-20187-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds support to pm8921 power button.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 1d4fa2b..4a2f159 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -380,6 +380,14 @@
 					allow-set-time;
 				};
 
+				pwrkey@1c {
+					compatible = "qcom,pm8921-pwrkey";
+					reg = <0x1c>;
+					interrupt-parent = <&pmicintc>;
+					interrupts = <50 1>, <51 1>;
+					debounce = <15625>;
+					pull-up;
+				};
 			};
 		};
 
-- 
1.9.1
