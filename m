From: Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v4 1/7] [media] dt-bindings: Add a binding for Video Data Order Adapter
Date: Fri, 20 Jan 2017 15:00:19 +0100
Message-ID: <20170120140025.3338-2-m.tretter@pengutronix.de>
References: <20170120140025.3338-1-m.tretter@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120140025.3338-1-m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add a DT binding documentation for the Video Data Order Adapter (VDOA)
of the Freescale i.MX6 SoC.

Also, add the compatible property and correct clock to the device tree
to match the documentation.

Signed-off-by: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/media/fsl-vdoa.txt          | 21 +++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl.dtsi                      |  2 ++
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt

diff --git a/Documentation/devicetree/bindings/media/fsl-vdoa.txt b/Documentation/devicetree/bindings/media/fsl-vdoa.txt
new file mode 100644
index 000000000000..6c5628530bb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl-vdoa.txt
@@ -0,0 +1,21 @@
+Freescale Video Data Order Adapter
+==================================
+
+The Video Data Order Adapter (VDOA) is present on the i.MX6q. Its sole purpose
+is to reorder video data from the macroblock tiled order produced by the CODA
+960 VPU to the conventional raster-scan order for scanout.
+
+Required properties:
+- compatible: must be "fsl,imx6q-vdoa"
+- reg: the register base and size for the device registers
+- interrupts: the VDOA interrupt
+- clocks: the vdoa clock
+
+Example:
+
+vdoa@21e4000 {
+        compatible = "fsl,imx6q-vdoa";
+        reg = <0x021e4000 0x4000>;
+        interrupts = <0 18 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks IMX6QDL_CLK_VDOA>;
+};
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 89b834f3fa17..a227e8be5378 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1158,8 +1158,10 @@
 			};
 
 			vdoa@021e4000 {
+				compatible = "fsl,imx6q-vdoa";
 				reg = <0x021e4000 0x4000>;
 				interrupts = <0 18 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6QDL_CLK_VDOA>;
 			};
 
 			uart2: serial@021e8000 {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
