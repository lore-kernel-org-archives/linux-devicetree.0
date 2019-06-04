From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 01/14] dt-bindings: Add binding for MT2712 MIPI-CSI2
Date: Tue, 4 Jun 2019 18:11:42 +0800
Message-ID: <1559643115-15124-2-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add MIPI-CSI2 dt-binding for Mediatek MT2712 SoC

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../bindings/media/mediatek-mipicsi.txt       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mipicsi.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
new file mode 100644
index 000000000000..e30b6a468129
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-mipicsi.txt
@@ -0,0 +1,58 @@
+* Mediatek MIPI-CSI2 receiver
+
+Mediatek MIPI-CSI2 receiver is the MIPI Signal capture hardware present in Mediatek SoCs
+
+Required properties:
+- compatible: should be "mediatek,mt2712-mipicsi"
+- reg : physical base address of the mipicsi receiver registers and length of
+  memory mapped region.
+- power-domains: a phandle to the power domain, see
+  Documentation/devicetree/bindings/power/power_domain.txt for details.
+- mediatek,larb: must contain the local arbiters in the current Socs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+- iommus: should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- mediatek,seninf_mux_camsv: seninf_mux_camsv the data go through of the mipicsi port
+  any mipicsi port can contain max four seninf_mux_camsv
+  The Total seninf_mux_camsv is six for mt2712
+- mediatek,mipicsiid: the id of the mipicsi port, there are two port for mt2712
+- mediatek,mipicsi: the common component of the two mipicsi port
+- mediatek,mipicsi_max_vc: the number of virtual channel which subdev used
+- mediatek,serdes_link_reg: the register of subdev to get the link status
+
+Example:
+	mipicsi0: mipicsi@10217000 {
+		compatible = "mediatek,mt2712-mipicsi";
+		mediatek,mipicsi = <&mipicsi>;
+		iommus = <&iommu0 M4U_PORT_CAM_DMA0>,
+			 <&iommu0 M4U_PORT_CAM_DMA1>;
+		mediatek,larb = <&larb2>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
+
+		mediatek,seninf_mux_camsv = <&seninf1_mux_camsv0
+					     &seninf2_mux_camsv1
+					     &seninf3_mux_camsv2
+					     &seninf4_mux_camsv3>;
+		reg = <0 0x10217000 0 0x60>,
+		      <0 0x15002100 0 0x4>,
+		      <0 0x15002300 0 0x100>;
+		mediatek,mipicsiid = <0>;
+		mediatek,mipicsi_max_vc = <4>;
+		mediatek,serdes_link_reg = <0x49>;
+	};
+
+	mipicsi1: mipicsi@10218000 {
+		compatible = "mediatek,mt2712-mipicsi";
+		mediatek,mipicsi = <&mipicsi>;
+		iommus = <&iommu0 M4U_PORT_CAM_DMA2>;
+		mediatek,larb = <&larb2>;
+		power-domains = <&scpsys MT2712_POWER_DOMAIN_ISP>;
+		mediatek,seninf_mux_camsv = <&seninf5_mux_camsv4
+					     &seninf6_mux_camsv5>;
+		reg = <0 0x10218000 0 0x60>,
+		      <0 0x15002500 0 0x4>,
+		      <0 0x15002700 0 0x100>;
+		mediatek,mipicsiid = <1>;
+	};
-- 
2.18.0
