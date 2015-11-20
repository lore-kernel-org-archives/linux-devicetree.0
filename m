From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/11] dt-bindings: clock: add description of LPC32xx clock controller
Date: Fri, 20 Nov 2015 03:05:01 +0200
Message-ID: <1447981511-29653-2-git-send-email-vz@mleia.com>
References: <1447981511-29653-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447981511-29653-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

NXP LPC32xx SoC has a clocking and power control unit (CPC) as a part
of system control block (SCB). CPC is supplied by two external
oscillators and it manages core and most of peripheral
clocks, the change adds description of DT bindings for clock
controller found on LPC32xx SoC series.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/clock/nxp,lpc3220-clk.txt  | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt b/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
new file mode 100644
index 0000000..20cbca3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nxp,lpc3220-clk.txt
@@ -0,0 +1,30 @@
+NXP LPC32xx Clock Controller
+
+Required properties:
+- compatible: should be "nxp,lpc3220-clk"
+- reg:  should contain clock controller registers location and length
+- #clock-cells: must be 1, the cell holds id of a clock provided by the
+  clock controller
+- clocks: phandles of external oscillators, the list must contain one
+  32768 Hz oscillator and may have one optional high frequency oscillator
+- clock-names: list of external oscillator clock names, must contain
+  "xtal_32k" and may have optional "xtal"
+
+Examples:
+
+	/* System Control Block */
+	scb {
+		compatible = "simple-bus";
+		ranges = <0x0 0x040004000 0x00001000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		clk: clock-controller@0 {
+			compatible = "nxp,lpc3220-clk";
+			reg = <0x00 0x114>;
+			#clock-cells = <1>;
+
+			clocks = <&xtal_32k>, <&xtal>;
+			clock-names = "xtal_32k", "xtal";
+		};
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
