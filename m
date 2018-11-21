From: Lina Iyer <ilina@codeaurora.org>
Subject: [RFC v3 3/3] arm64: dts: msm: add PDC wake irq maps for GPIOs for SDM845
Date: Tue, 20 Nov 2018 17:06:48 -0700
Message-ID: <20181121000648.29262-4-ilina@codeaurora.org>
References: <20181121000648.29262-1-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121000648.29262-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, evgreen@chromium.org, marc.zyngier@arm.com
Cc: linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add PDC wakeup irq for GPIOs and the wakeup parent for TLMM.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 8e15392a6f64..79835310933b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -821,6 +821,24 @@
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			wake-parent = <&pdc>;
+			wake-irq =
+				<1 30>, <3 31>, <5 32>, <10 33>, <11 34>,
+				<20 35>, <22 36>, <24 37>, <26 38>, <30 39>,
+				<31 117>, <32 41>, <34 42>, <36 43>, <37 44>,
+				<38 45>, <39 46>, <40 47>, <41 115>, <43 49>,
+				<44 50>, <46 51>, <48 52>, <49 118>, <52 54>,
+				<53 55>, <54 56>, <56 57>, <57 58>, <58 59>,
+				<59 60>, <60 61>, <61 62>, <62 63>, <63 64>,
+				<64 65>, <66 66>, <68 67>, <71 68>, <73 69>,
+				<77 70>, <78 71>, <79 72>, <80 73>, <84 74>,
+				<85 75>, <86 76>, <88 77>, <89 116>, <91 79>,
+				<92 80>, <95 81>, <96 82>, <97 83>, <101 84>,
+				<103 85>, <104 86>, <115 90>, <116 91>,
+				<117 92>, <118 93>, <119 94>, <120 95>,
+				<121 96>, <122 97>, <123 98>, <124 99>,
+				<125 100>, <127 102>, <128 103>, <129 104>,
+				<130 105>, <132 106>, <133 107>, <145 108>;
 
 			qup_i2c0_default: qup-i2c0-default {
 				pinmux {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
