From: Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 04/11] of: irq: document properties for wakeup interrupt parent
Date: Tue,  7 May 2019 14:37:42 -0600
Message-ID: <20190507203749.3384-5-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com, bjorn.andersson@linaro.org, dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some interrupt controllers in a SoC, are always powered on and have a
select interrupts routed to them, so that they can wakeup the SoC from
suspend. Add wakeup-parent DT property to refer to these interrupt
controllers.

If the interrupts routed to the wakeup parent are not sequential, than a
map needs to exist to associate the same interrupt line on multiple
interrupt controllers. Providing this map in every driver is cumbersome.
Let's add this in the device tree and document the properties to map the
interrupt specifiers

Cc: devicetree@vger.kernel.org
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v5:
	- Update documentation to describe masks in the example
Changes in v4:
	- Added this documentation
---
 .../interrupt-controller/interrupts.txt       | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
index 8a3c40829899..e3e43f5d5566 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
@@ -108,3 +108,57 @@ commonly used:
 			sensitivity = <7>;
 		};
 	};
+
+3) Interrupt wakeup parent
+--------------------------
+
+Some interrupt controllers in a SoC, are always powered on and have a select
+interrupts routed to them, so that they can wakeup the SoC from suspend. These
+interrupt controllers do not fall into the category of a parent interrupt
+controller and can be specified by the "wakeup-parent" property and contain a
+single phandle referring to the wakeup capable interrupt controller.
+
+   Example:
+	wakeup-parent = <&pdc_intc>;
+
+
+4) Interrupt mapping
+--------------------
+
+Sometimes interrupts may be detected by more than one interrupt controller
+(depending on which controller is active). The interrupt controllers may not
+be in hierarchy and therefore the interrupt controller driver is required to
+establish the relationship between the same interrupt at different interrupt
+controllers. If these interrupts are not sequential then a map needs to be
+specified to help identify these interrupts.
+
+Mapping the interrupt specifiers in the device tree can be done using the
+"irqdomain-map" property. The property contains interrupt specifier at the
+current interrupt controller followed by the interrupt specifier at the mapped
+interrupt controller.
+
+   irqdomain-map = <incoming-interrupt-specifier mapped-interrupt-specifier>
+
+The optional properties "irqdomain-map-mask" and "irqdomain-map-pass-thru" may
+be provided to help interpret the valid bits of the incoming and mapped
+interrupt specifiers respectively.
+
+   Example:
+	intc: interrupt-controller@17a00000 {
+		#interrupt-cells = <3>;
+	};
+
+	pinctrl@3400000 {
+		#interrupt-cells = <2>;
+		irqdomain-map = <22 0 &intc 36 0>, <24 0 &intc 37 0>;
+		irqdomain-map-mask = <0xff 0>;
+		irqdomain-map-pass-thru = <0 0xff>;
+	};
+
+In the above example, the input interrupt specifier map-mask <0xff 0> applied
+on the incoming interrupt specifier of the map <22 0>, <24 0>, returns the
+input interrupt 22, 24 etc. The second argument being irq type is immaterial
+from the map and is used from the incoming request instead. The pass-thru
+specifier parses the output interrupt specifier from the rest of the unparsed
+argments from the map <&intc 36 0>, <&intc 37 0> etc to return the output
+interrupt 36, 37 etc.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
