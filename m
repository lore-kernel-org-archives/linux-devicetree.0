From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 1/6] dt-bindings: interrupt-controller: add DT binding for the Marvell GICP
Date: Wed, 21 Jun 2017 15:29:12 +0200
Message-ID: <20170621132917.14187-2-thomas.petazzoni@free-electrons.com>
References: <20170621132917.14187-1-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170621132917.14187-1-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds the Device Tree binding documentation for the Marvell
GICP, an extension to the GIC that allows to trigger GIC SPI interrupts
using memory transactions. It is used by the ICU unit in the Marvell
CP110 block to turn wired interrupts inside the CP into SPI interrupts
at the GIC level in the AP.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../bindings/interrupt-controller/marvell,gicp.txt | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt b/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
new file mode 100644
index 0000000..64a00ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,gicp.txt
@@ -0,0 +1,27 @@
+Marvell GICP Controller
+-----------------------
+
+GICP is a Marvell extension of the GIC that allows to trigger GIC SPI
+interrupts by doing a memory transaction. It is used by the ICU
+located in the Marvell CP110 to turn wired interrupts inside the CP
+into GIC SPI interrupts.
+
+Required properties:
+
+- compatible: Must be "marvell,ap806-gicp"
+
+- reg: Must be the address and size of the GICP SPI registers
+
+- marvell,spi-ranges: tuples of GIC SPI interrupts ranges available
+  for this GICP
+
+- msi-controller: indicates that this is an MSI controller
+
+Example:
+
+gicp_spi: gicp-spi@3f0040 {
+	compatible = "marvell,ap806-gicp";
+	reg = <0x3f0040 0x10>;
+	marvell,spi-ranges = <64 64>, <288 64>;
+	msi-controller;
+};
-- 
2.9.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
