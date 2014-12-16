From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v3 2/3] irqchip: vf610-mscm: dt-bindings: add MSCM bindings
Date: Tue, 16 Dec 2014 22:45:46 +0100
Message-ID: <1418766347-6225-3-git-send-email-stefan@agner.ch>
References: <1418766347-6225-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418766347-6225-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add binding documentation for Miscellaneous System Control Module
found in Freescale Vybrid SoC's.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 .../bindings/arm/freescale/fsl,vf610-mscm.txt         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm.txt
new file mode 100644
index 0000000..e051b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm.txt
@@ -0,0 +1,19 @@
+Freescale Vybrid Miscellaneous System Control Module
+
+The MSCM IP contains Access Control and TrustZone Security hardware,
+CPU Configuration registers and Interrupt Router control.
+
+Required properties:
+- compatible : "fsl,vf610-mscm", "syscon"
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Two cells, interrupt number and flags (IRQ type)
+- reg : the register range of the MSCM module
+
+Example:
+	mscm: mscm@40001000 {
+		compatible = "fsl,vf610-mscm", "syscon";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&intc>;
+		reg = <0x40001000 0x1000>;
+	}
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
