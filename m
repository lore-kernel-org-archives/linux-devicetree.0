From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 05/10] clocksource/drivers/ostm: Document renesas-ostm timer DT bindings
Date: Thu,  9 Feb 2017 00:14:39 +0100
Message-ID: <1486595685-10232-5-git-send-email-daniel.lezcano@linaro.org>
References: <20170208231208.GB12695@mai>
 <1486595685-10232-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486595685-10232-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../devicetree/bindings/timer/renesas,ostm.txt     | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.txt b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
new file mode 100644
index 0000000..be3ae0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
@@ -0,0 +1,30 @@
+* Renesas OS Timer (OSTM)
+
+The OSTM is a multi-channel 32-bit timer/counter with fixed clock
+source that can operate in either interval count down timer or free-running
+compare match mode.
+
+Channels are independent from each other.
+
+Required Properties:
+
+  - compatible: must be one or more of the following:
+    - "renesas,r7s72100-ostm" for the r7s72100 OSTM
+    - "renesas,ostm" for any OSTM
+		This is a fallback for the above renesas,*-ostm entries
+
+  - reg: base address and length of the register block for a timer channel.
+
+  - interrupts: interrupt specifier for the timer channel.
+
+  - clocks: clock specifier for the timer channel.
+
+Example: R7S72100 (RZ/A1H) OSTM node
+
+	ostm0: timer@fcfec000 {
+		compatible = "renesas,r7s72100-ostm", "renesas,ostm";
+		reg = <0xfcfec000 0x30>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
+		power-domains = <&cpg_clocks>;
+	};
-- 
2.7.4
