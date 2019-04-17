From: Frederic Chen <frederic.chen@mediatek.com>
Subject: [RFC PATCH V1 3/6] dt-bindings: mt8183: Added DIP dt-bindings
Date: Wed, 17 Apr 2019 18:45:08 +0800
Message-ID: <20190417104511.21514-4-frederic.chen@mediatek.com>
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190417104511.21514-1-frederic.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds DT binding documentation for the Digital Image
Processing (DIP) unit of camera ISP system on Mediatek's SoCs.

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 .../bindings/media/mediatek,mt8183-dip.txt    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
new file mode 100644
index 000000000000..0e1994bf82f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-dip.txt
@@ -0,0 +1,35 @@
+* Mediatek Digital Image Processor (DIP)
+
+Digital Image Processor (DIP) unit in Mediatek ISP system is responsible for
+image content adjustment according to the tuning parameters. DIP can process
+the image form memory buffer and output the processed image to multiple output
+buffers. Furthermore, it can support demosaicing and noise reduction on the
+images.
+
+Required properties:
+- compatible: "mediatek,mt8183-dip"
+- reg: Physical base address and length of the function block register space
+- interrupts: interrupt number to the cpu
+- iommus: should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- mediatek,larb: must contain the local arbiters in the current Socs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+- clocks: must contain the local arbiters 5 (LARB5) and DIP clock
+- clock-names: must contain DIP_CG_IMG_LARB5 and DIP_CG_IMG_DIP
+
+Example:
+	dip: dip@15022000 {
+		compatible = "mediatek,mt8183-dip";
+		mediatek,larb = <&larb5>;
+		mediatek,mdp3 = <&mdp_rdma0>;
+		mediatek,vpu = <&vpu>;
+		iommus = <&iommu M4U_PORT_CAM_IMGI>;
+		reg = <0 0x15022000 0 0x6000>;
+		interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&imgsys CLK_IMG_LARB5>,
+			 <&imgsys CLK_IMG_DIP>;
+		clock-names = "DIP_CG_IMG_LARB5",
+			      "DIP_CG_IMG_DIP";
+	};
-- 
2.18.0
