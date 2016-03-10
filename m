From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 17/18] Documentation: dt: add Vybrid DDR memory controller bindings
Date: Wed,  9 Mar 2016 18:16:58 -0800
Message-ID: <1457576219-7971-18-git-send-email-stefan@agner.ch>
References: <1457576219-7971-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457576219-7971-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sergeimir-qv+LCo8X3VpBDgjK7y7TUQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device-tree bindings of Vybrids LPDDR2/DDR3 SDRAM Memory
Controller. Access to the device is required to put the memory
into self-refresh mode.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 .../bindings/arm/freescale/fsl,vf610-ddrmc.txt     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-ddrmc.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-ddrmc.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-ddrmc.txt
new file mode 100644
index 0000000..56a71d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-ddrmc.txt
@@ -0,0 +1,23 @@
+Freescale Vybrid LPDDR2/DDR3 SDRAM Memory Controller
+
+The memory controller supports high performance applications for 16-bit or
+8-bit DDR2, or LPDDR SDRAM memories.
+
+Required properties:
+- compatible:	"fsl,vf610-ddrmc"
+- reg:		the register range of the DDRMC registers
+- clocks:	DDRMC main clock to clock memory and access registers.
+- clock-names:	Must contain "ddrc", matching entry in the clocks property.
+- fsl,has-cke-reset-pulls:
+		States whether pull-down/up are populated on DDR CKE/RESET
+		signals to allow using DDR self-refresh modes (see Vybrid
+		Hardware Development Guide for details).
+
+Example:
+	ddrmc: ddrmc@400ae000 {
+		compatible = "fsl,vf610-ddrmc";
+		reg = <0x400ae000 0x1000>;
+		clocks = <&clks VF610_CLK_DDRMC>;
+		clock-names = "ddrc";
+		fsl,has-cke-reset-pulls;
+	}
-- 
2.7.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
