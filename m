From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v3 2/3] Documentation: DT: vdma: Add clock support for dmas
Date: Thu, 21 Apr 2016 16:08:37 +0530
Message-ID: <1461235118-800-3-git-send-email-appanad@xilinx.com>
References: <1461235118-800-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461235118-800-1-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, anirudh@xilinx.com, punnaia@xilinx.com, shubhraj@xilinx.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch updates the binding doc with clock description
for AXI DMA's.

Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
---
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
2.1.2
