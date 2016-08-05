From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/4] dt-bindings: interrupt-controller: add DT binding for Marvell 7K/8K PIC
Date: Fri,  5 Aug 2016 16:55:18 +0200
Message-ID: <1470408921-447-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470408921-447-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470408921-447-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds the Device Tree binding description for the PIC
interrupt controller available in the ARM64 Marvell Armada 7K/8K SoCs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../interrupt-controller/marvell,armada-8k-pic.txt | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt
new file mode 100644
index 0000000..86a7b4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,armada-8k-pic.txt
@@ -0,0 +1,25 @@
+Marvell Armada 7K/8K PIC Interrupt controller
+---------------------------------------------
+
+This is the Device Tree binding for the PIC, a secondary interrupt
+controller available on the Marvell Armada 7K/8K ARM64 SoCs, and
+typically connected to the GIC as the primary interrupt controller.
+
+Required properties:
+- compatible: should be "marvell,armada-8k-pic"
+- interrupt-controller: identifies the node as an interrupt controller
+- #interrupt-cells: the number of cells to define interrupts on this
+  controller. Should be 1
+- reg: the register area for the PIC interrupt controller
+- interrupts: the interrupt to the primary interrupt controller,
+  typically the GIC
+
+Example:
+
+	pic: interrupt-controller@3f0100 {
+		compatible = "marvell,armada-8k-pic";
+		reg = <0x3f0100 0x10>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 15 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
