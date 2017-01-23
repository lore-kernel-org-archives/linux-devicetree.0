From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 1/2] dt-bindings: document renesas-ostm timer
Date: Mon, 23 Jan 2017 08:54:22 -0500
Message-ID: <20170123135423.28780-2-chris.brandt@renesas.com>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170123135423.28780-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
* changed ostm@fcfec000 to timer@fcfec000 in example
* added power-domains in example
v2:
* remove sw implementation specific portions
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
2.10.1
