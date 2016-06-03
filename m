From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH] dt documentation: etnaviv: add devicetree bindings
Date: Fri, 03 Jun 2016 15:58:55 +0100
Message-ID: <E1b8qYp-0005n7-9D@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Etnaviv follows the same priciple as imx-drm to have a virtual
master device node to bind all the individual GPU cores together
into one DRM device.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
This was supposed to be merged along with Etnaviv, but for whatever
reason, Etnaviv was merged without this patch.  Can someone please
merge this?  I won't be re-sending this as I'm deleting it from my
tree.

 .../bindings/drm/etnaviv/etnaviv-drm.txt           | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/etnaviv/etnaviv-drm.txt

diff --git a/Documentation/devicetree/bindings/drm/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/drm/etnaviv/etnaviv-drm.txt
new file mode 100644
index 000000000000..e27082bdba0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/etnaviv/etnaviv-drm.txt
@@ -0,0 +1,44 @@
+Etnaviv DRM master device
+================================
+
+The Etnaviv DRM master device is a virtual device needed to list all
+Vivante GPU cores that comprise the GPU subsystem.
+
+Required properties:
+- compatible: Should be "fsl,imx-gpu-subsystem"
+- cores: Should contain a list of phandles pointing to Vivante GPU devices
+
+example:
+
+gpu-subsystem {
+	compatible = "fsl,imx-gpu-subsystem";
+	cores = <&gpu_2d>, <&gpu_3d>;
+};
+
+
+Vivante GPU core devices
+====================
+
+Required properties:
+- compatible: Should be "vivante,gc"
+- reg: should be register base and length as documented in the
+  datasheet
+- interrupts: Should contain the cores interrupt line
+- clocks: should contain one clock for entry in clock-names
+  see Documentation/devicetree/bindings/clock/clock-bindings.txt
+- clock-names:
+   - "bus":    AXI/register clock
+   - "core":   GPU core clock
+   - "shader": Shader clock (only required if GPU has feature PIPE_3D)
+
+example:
+
+gpu_3d: gpu@00130000 {
+	compatible = "vivante,gc";
+	reg = <0x00130000 0x4000>;
+	interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&clks IMX6QDL_CLK_GPU3D_AXI>,
+	         <&clks IMX6QDL_CLK_GPU3D_CORE>,
+	         <&clks IMX6QDL_CLK_GPU3D_SHADER>;
+	clock-names = "bus", "core", "shader";
+};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
