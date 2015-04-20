From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: [PATCH v2 4/7] arm64: dts: qcom: Add SPMI PMIC Arbiter node for MSM8916
Date: Mon, 20 Apr 2015 10:45:38 +0300
Message-ID: <1429515941-15334-5-git-send-email-ivan.ivanov@linaro.org>
References: <1429515941-15334-1-git-send-email-ivan.ivanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429515941-15334-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add SPMI PMIC Arbiter configuration nodes for MSM8916.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index f212b83..92c96eb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -192,5 +192,23 @@
 				status = "disabled";
 			};
 		};
+
+		spmi_bus: spmi@200f000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x200f000 0x001000>,
+			      <0x2400000 0x400000>,
+			      <0x2c00000 0x400000>,
+			      <0x3800000 0x200000>,
+			      <0x200a000 0x002100>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 190 IRQ_TYPE_NONE>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
 	};
 };
--
1.9.1
