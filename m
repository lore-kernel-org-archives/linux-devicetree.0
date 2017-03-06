From: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/2] dma: xilinx: Edit device tree bindings documentation
Date: Mon,  6 Mar 2017 12:17:38 +0000
Message-ID: <ce2a9ee846013b452e53e05c2be3c7861fa6d169.1488801913.git.roliveir@synopsys.com>
References: <cover.1488801913.git.roliveir@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1488801913.git.roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
In-Reply-To: <cover.1488801913.git.roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
References: <cover.1488801913.git.roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Anurag Kumar Vulisha <anuragku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add reset property documentation for Xilinx DMA

Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
index a2b8bfaec43c..96c469a4717f 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
@@ -40,6 +40,7 @@ Required properties for VDMA:
 Optional properties:
 - xlnx,include-sg: Tells configured for Scatter-mode in
 	the hardware.
+- resets : External reset specifier. See ../../reset/reset.txt for details.
 Optional properties for AXI DMA:
 - xlnx,mcdma: Tells whether configured for multi-channel mode in the hardware.
 Optional properties for VDMA:
@@ -83,6 +84,7 @@ axi_vdma_0: axivdma@40030000 {
 	clocks = <&clk 0>, <&clk 1>, <&clk 2>, <&clk 3>, <&clk 4>;
 	clock-names = "s_axi_lite_aclk", "m_axi_mm2s_aclk", "m_axi_s2mm_aclk",
 		      "m_axis_mm2s_aclk", "s_axis_s2mm_aclk";
+	resets = <&rst 2>;
 	dma-channel@40030000 {
 		compatible = "xlnx,axi-vdma-mm2s-channel";
 		interrupts = < 0 54 4 >;
-- 
2.11.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
