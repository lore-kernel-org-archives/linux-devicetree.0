From: Lina Iyer <ilina@codeaurora.org>
Subject: [RFC v3 2/3] dt-bindings: sdm845-pinctrl: add wakeup interrupt parent for GPIO
Date: Tue, 20 Nov 2018 17:06:47 -0700
Message-ID: <20181121000648.29262-3-ilina@codeaurora.org>
References: <20181121000648.29262-1-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121000648.29262-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, evgreen@chromium.org, marc.zyngier@arm.com
Cc: linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, thierry.reding@gmail.com, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SDM845 SoC has an always-on interrupt controller (PDC) with select GPIO
routed to the PDC as interrupts that can be used to wake the system up
from deep low power modes and suspend.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  | 31 ++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
index 665aadb5ea28..bedfa0b57fa6 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
@@ -29,6 +29,17 @@ SDM845 platform.
 	Definition: must be 2. Specifying the pin number and flags, as defined
 		    in <dt-bindings/interrupt-controller/irq.h>
 
+- wakeup-parent:
+	Usage: optional
+	Value type: <phandle>
+	Definition: A phandle to the wakeup interrupt controller for the SoC.
+
+- wakeup-irq:
+	Usage: optional:
+	Value type: <u32 array>
+	Definition: Specifies the map of the gpio and the corresponding PDC
+	            output port.
+
 - gpio-controller:
 	Usage: required
 	Value type: <none>
@@ -53,7 +64,6 @@ pin, a group, or a list of pins or groups. This configuration can include the
 mux function to select on those pin(s)/group(s), and various pin configuration
 parameters, such as pull-up, drive strength, etc.
 
-
 PIN CONFIGURATION NODES:
 
 The name of each subnode is not important; all subnodes should be enumerated
@@ -160,6 +170,25 @@ Example:
 		#gpio-cells = <2>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		wake-parent = <&pdc>;
+		wake-irq =
+			<1 30>, <3 31>, <5 32>, <10 33>, <11 34>,
+			<20 35>, <22 36>, <24 37>, <26 38>, <30 39>,
+			<31 117>, <32 41>, <34 42>, <36 43>, <37 44>,
+			<38 45>, <39 46>, <40 47>, <41 115>, <43 49>,
+			<44 50>, <46 51>, <48 52>, <49 118>, <52 54>,
+			<53 55>, <54 56>, <56 57>, <57 58>, <58 59>,
+			<59 60>, <60 61>, <61 62>, <62 63>, <63 64>,
+			<64 65>, <66 66>, <68 67>, <71 68>, <73 69>,
+			<77 70>, <78 71>, <79 72>, <80 73>, <84 74>,
+			<85 75>, <86 76>, <88 77>, <89 116>, <91 79>,
+			<92 80>, <95 81>, <96 82>, <97 83>, <101 84>,
+			<103 85>, <104 86>, <115 90>, <116 91>,
+			<117 92>, <118 93>, <119 94>, <120 95>,
+			<121 96>, <122 97>, <123 98>, <124 99>,
+			<125 100>, <127 102>, <128 103>, <129 104>,
+			<130 105>, <132 106>, <133 107>, <145 108>;
+
 
 		qup9_active: qup9-active {
 			mux {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
