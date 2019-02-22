From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v3 5/9] dt-bindings: sdm845-pinctrl: add wakeup interrupt parent for GPIO
Date: Fri, 22 Feb 2019 15:18:46 -0700
Message-ID: <20190222221850.26939-6-ilina@codeaurora.org>
References: <20190222221850.26939-1-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222221850.26939-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com
Cc: linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com, bjorn.andersson@linaro.org, dianders@chromium.org, linus.walleij@linaro.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SDM845 SoC has an always-on interrupt controller (PDC) with select GPIO
routed to the PDC as interrupts that can be used to wake the system up
from deep low power modes and suspend.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
index 665aadb5ea28..f0fedbc5d41a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
@@ -29,6 +29,11 @@ SDM845 platform.
 	Definition: must be 2. Specifying the pin number and flags, as defined
 		    in <dt-bindings/interrupt-controller/irq.h>
 
+- wakeup-parent:
+	Usage: optional
+	Value type: <phandle>
+	Definition: A phandle to the wakeup interrupt controller for the SoC.
+
 - gpio-controller:
 	Usage: required
 	Value type: <none>
@@ -53,7 +58,6 @@ pin, a group, or a list of pins or groups. This configuration can include the
 mux function to select on those pin(s)/group(s), and various pin configuration
 parameters, such as pull-up, drive strength, etc.
 
-
 PIN CONFIGURATION NODES:
 
 The name of each subnode is not important; all subnodes should be enumerated
@@ -160,6 +164,7 @@ Example:
 		#gpio-cells = <2>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+		wake-parent = <&pdc_intc>;
 
 		qup9_active: qup9-active {
 			mux {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
