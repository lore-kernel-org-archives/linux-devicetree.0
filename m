From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 02/12] drm/etnaviv: add devicetree bindings
Date: Fri,  4 Dec 2015 14:59:54 +0100
Message-ID: <1449237604-19064-3-git-send-email-l.stach@pengutronix.de>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449237604-19064-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Etnaviv follows the same priciple as imx-drm to have a virtual
master device node to bind all the individual GPU cores together
into one DRM device.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../bindings/display/etnaviv/etnaviv-drm.txt       | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt

diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
new file mode 100644
index 000000000000..19fde29dc1d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
@@ -0,0 +1,46 @@
+Etnaviv DRM master device
+================================
+
+The Etnaviv DRM master device is a virtual device needed to list all
+Vivante GPU cores that comprise the GPU subsystem.
+
+Required properties:
+- compatible: Should be one of
+    "fsl,imx-gpu-subsystem"
+    "marvell,dove-gpu-subsystem"
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
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
