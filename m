From: Kedareswara rao Appana <appana.durga.rao-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 2/3] Documentation: DT: vdma: Add clock support for dmas
Date: Fri, 13 May 2016 12:33:30 +0530
Message-ID: <1463123011-4911-3-git-send-email-appanad@xilinx.com>
References: <1463123011-4911-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463123011-4911-1-git-send-email-appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, luis-HiykPkW1eAzzDCI4PIEvbQC/G2K4zDHf@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch updates the binding doc with clock description
for AXI DMA's.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Kedareswara rao Appana <appanad-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
Changes for v5:
---> None.
Changes for v4:
---> None.
Changes for v3:
---> Added clock support for all the AXI DMA's.
Changes for v2:
--> Listed down all the clocks supported by the h/w
    as suggested by the Datta.
--> Used IP clock names instead of shortcut clock name

 .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt        | 15 +++++++=
++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.t=
xt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
index fcc2b65..a1f2683 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
@@ -21,6 +21,18 @@ Required properties:
 - dma-channel child node: Should have at least one channel and can hav=
e up to
 	two channels per device. This node specifies the properties of each
 	DMA channel (see child node properties below).
+- clocks: Input clock specifier. Refer to common clock bindings.
+- clock-names: List of input clocks
+	For VDMA:
+	Required elements: "s_axi_lite_aclk"
+	Optional elements: "m_axi_mm2s_aclk" "m_axi_s2mm_aclk",
+			   "m_axis_mm2s_aclk", "s_axis_s2mm_aclk"
+	For CDMA:
+	Required elements: "s_axi_lite_aclk", "m_axi_aclk"
+	FOR AXIDMA:
+	Required elements: "s_axi_lite_aclk"
+	Optional elements: "m_axi_mm2s_aclk", "m_axi_s2mm_aclk",
+			   "m_axi_sg_aclk"
=20
 Required properties for VDMA:
 - xlnx,num-fstores: Should be the number of framebuffers as configured=
 in h/w.
@@ -60,6 +72,9 @@ axi_vdma_0: axivdma@40030000 {
 	xlnx,num-fstores =3D <0x8>;
 	xlnx,flush-fsync =3D <0x1>;
 	xlnx,addrwidth =3D <0x20>;
+	clocks =3D <&clk 0>, <&clk 1>, <&clk 2>, <&clk 3>, <&clk 4>;
+	clock-names =3D "s_axi_lite_aclk", "m_axi_mm2s_aclk", "m_axi_s2mm_acl=
k",
+		      "m_axis_mm2s_aclk", "s_axis_s2mm_aclk";
 	dma-channel@40030000 {
 		compatible =3D "xlnx,axi-vdma-mm2s-channel";
 		interrupts =3D < 0 54 4 >;
--=20
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
