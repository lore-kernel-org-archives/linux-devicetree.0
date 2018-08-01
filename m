From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RESEND RFC 3/4] arm64: dts: msm: add PDC device bindings for sdm845
Date: Tue, 31 Jul 2018 20:00:20 -0600
Message-ID: <20180801020021.9782-4-ilina@codeaurora.org>
References: <20180801020021.9782-1-ilina@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801020021.9782-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, swboyd@chromium.org, evgreen@chromium.org, linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc: rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add PDC interrupt controller device bindings for SDM845.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2acc17ce1a9c..8ccce42885c1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1213,6 +1213,15 @@
 			};
 		};

+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sdm845-pdc";
+			reg = <0xb220000 0x30000>;
+			qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		timer@17c90000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
