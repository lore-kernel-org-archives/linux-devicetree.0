From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH 4/4] clk: dts: document pxa27x clock binding
Date: Sun, 29 Jun 2014 20:32:24 +0200
Message-ID: <1404066744-13416-5-git-send-email-robert.jarzmik@free.fr>
References: <1404066744-13416-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404066744-13416-1-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the device-tree binding of Marvell PXA based SoCs.
PXA clocks are mostly fixed rate and fixed ratio clocks derived from an
external oscillator, and gated by a register set (CKEN or CKEN*).

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
---
 .../devicetree/bindings/clock/pxa-clock.txt        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/pxa-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/pxa-clock.txt b/Documentation/devicetree/bindings/clock/pxa-clock.txt
new file mode 100644
index 0000000..beb28ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/pxa-clock.txt
@@ -0,0 +1,32 @@
+* Clock bindings for Marvell PXA chips
+
+Required properties:
+- compatible: Should be "marvell,pxa-clocks"
+- reg: Address and length of the CKEN register
+- #clock-cells: Should be <1>
+- clocks: the parent fixed rate clocks
+- clock-indices: the bit index in the CKEN register gating the clock
+- clock-outpout-names: the names of the clocks
+
+The clock consumer should specify the desired clock by having the clock
+ID in its "clocks" phandle cell.
+
+Examples:
+
+pxa2xx_clks: pxa2xx_clks@41300004 {
+	compatible = "marvell,pxa-clocks";
+	clocks = <&clk_14_857mhz>, <&clk_14_857mhz>
+	#clock-cells = <1>;
+	clock-output-names =
+		"pxa27x-ffuart", "pxa27x-btuart";
+	clock-indices = <CKEN_FFUART CKEN_BTUART>
+};
+
+
+* Core clock bindings for Marvell PXA27x chips
+
+Required properties:
+- compatible: Should be "marvell,pxa270-core-clocks"
+- #clock-cells: Should be <1>
+- clocks: the parent fixed rate clock, should be the 13MHz oscillator
+- clock-outpout-names: the names of the 7 core clocks
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
