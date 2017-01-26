From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 1/2] dt-bindings: document renesas-ostm timer
Date: Thu, 26 Jan 2017 11:44:30 -0500
Message-ID: <20170126164431.11995-2-chris.brandt@renesas.com>
References: <20170126164431.11995-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170126164431.11995-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
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


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
