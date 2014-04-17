From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH] clocksource: pit: Add Freescale PIT-RTI devicetree Documentation
Date: Thu, 17 Apr 2014 13:59:49 +0800
Message-ID: <1397714389-10263-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, tglx@linutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>, Shawn Guo <shawn.guo@linaro.org>, Jingchang Lu <b35083@freescale.com>
List-Id: devicetree@vger.kernel.org

This add Freescale Periodic Interrupt Timer (PIT-RTI) devicetree
Documentation, The PIT-RTI binding has already been used on Vybrid,
so this add a binding document for it.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Jingchang Lu <b35083@freescale.com>
---
 .../devicetree/bindings/timer/fsl,vf610-pit.txt     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,vf610-pit.txt

diff --git a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.txt b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.txt
new file mode 100644
index 0000000..67df182
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.txt
@@ -0,0 +1,21 @@
+Freescale Periodic Interrupt Timer (PIT-RTI)
+
+Required properties:
+
+- compatible : should be "fsl,vf610-pit"
+- reg : Specifies base physical address and size of the register set for the
+  clock event device and clock source device.
+- interrupts : Should be the clock event device interrupt.
+- clocks : The clocks provided by the SoC to drive the timer, must contain an
+  entry for each entry in clock-names.
+- clock-names : Must include the "pit" entry.
+
+Example:
+
+pit: pit@40037000 {
+	compatible = "fsl,vf610-pit";
+	reg = <0x40037000 0x1000>;
+	interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&clks VF610_CLK_PIT>;
+	clock-names = "pit";
+};
-- 
1.8.4


