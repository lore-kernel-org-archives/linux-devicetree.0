From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC 4/4] arm64: dts: qcom: add wake up interrupts for GPIOs
Date: Tue, 31 Jul 2018 16:44:21 -0600
Message-ID: <20180731224421.29062-5-ilina@codeaurora.org>
References: <20180731224421.29062-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731224421.29062-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, sboyd@chromium.org, evgreen@chromium.org, linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

GPIOs that are wakeup capable have interrupt lines that are routed to
the always-on interrupt controller (PDC) in parallel to the pinctrl. The
interrupts listed here are the wake up lines corresponding to GPIOs.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 8ccce42885c1..96ef18ced85b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -720,6 +720,75 @@
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupts-extended = <&pdc 30 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 31 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 32 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 33 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 34 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 35 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 36 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 37 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 38 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 39 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 41 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 42 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 43 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 44 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 45 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 46 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 47 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 49 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 50 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 51 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 52 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 54 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 55 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 56 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 57 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 58 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 59 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 60 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 61 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 62 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 63 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 64 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 65 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 66 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 67 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 68 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 69 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 70 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 71 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 72 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 73 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 74 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 75 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 76 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 77 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 79 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 80 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 81 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 82 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 83 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 84 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 85 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 86 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 90 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 91 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 92 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 95 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 96 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 97 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 98 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 99 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 100 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 102 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 103 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 104 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 105 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 106 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 107 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 108 IRQ_TYPE_LEVEL_HIGH>;
 
 			qup_i2c0_default: qup-i2c0-default {
 				pinmux {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
