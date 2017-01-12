From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 1/2] dt-bindings: document renesas-ostm timer
Date: Thu, 12 Jan 2017 13:59:51 -0500
Message-ID: <20170112185952.2780-2-chris.brandt@renesas.com>
References: <20170112185952.2780-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170112185952.2780-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 .../devicetree/bindings/timer/renesas,ostm.txt     | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.txt b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
new file mode 100644
index 0000000..46e1f27
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
@@ -0,0 +1,36 @@
+* Renesas OS Timer (OSTM)
+
+The OSTM comes with 2 independent channels.
+We will use the first channel (OSTM0) as a free running clocksource and the
+second channel (OSTM1) as a interrupt driven clock event.
+
+Additionally we will use the clocksource channel (OTSM0) for the system
+schedule timer sched_clock().
+
+Required Properties:
+
+  - compatible: must be one or more of the following:
+    - "renesas,ostm-r7s72100" for the r7s72100 OSTM
+    - "renesas,ostm" for any OSTM
+      This is a fallback for the above renesas,ostm-* entries
+
+  - reg: base address and length of the registers block for each timer channel.
+    There should be 2 sets of addresses, one for each channel.
+
+  - interrupts: interrupt specifiers for the timers. There should be 2
+    interupts, one for each channel.
+
+  - clocks: a list of phandle + clock-specifier pairs, one for each entry
+    channel. There should be 2 sets, one for each channel.
+
+Example: R7S72100 (RZ/A1H) OSTM node
+
+	ostm: ostm@fcfec000 {
+		compatible = "renesas,ostm-r7s72100", "renesas,ostm";
+		reg = <0xfcfec000 0x30>,
+		      <0xfcfec400 0x30>;
+		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING
+			      GIC_SPI 103 IRQ_TYPE_EDGE_RISING>;
+
+		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>, <&mstp5_clks R7S72100_CLK_OSTM1>;
+	};
-- 
2.10.1
