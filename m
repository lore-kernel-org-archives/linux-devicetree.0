From: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Subject: [RFC PATCH V3 1/3] dt-bindings: mt8183: Added FD dt-bindings
Date: Fri, 6 Sep 2019 18:11:23 +0800
Message-ID: <20190906101125.3784-2-Jerry-Ch.chen@mediatek.com>
References: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org, lkml@metux.net
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, po-yang.huang@mediatek.com, Jerry-ch Chen <jerry-ch.chen@mediatek.com>, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, ck.hu@mediatek.com, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>

This patch adds DT binding documentation for the Face Detection (FD)
unit of the Mediatek's mt8183 SoC.

Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
---
 .../bindings/media/mediatek,mt8183-fd.txt     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
new file mode 100644
index 000000000000..46464175b95a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt
@@ -0,0 +1,34 @@
+* Mediatek Face Detection Unit (FD)
+
+Face Detection (FD) unit is a typical memory-to-memory HW device.
+It provides hardware accelerated face detection function, and it
+is able to detect different poses of faces. FD will writre result
+of detected face into memory as output.
+
+Required properties:
+- compatible: "mediatek,mt8183-fd"
+- mediatek,scp : the node of system control processor (SCP), see
+  Documentation/devicetree/bindings/remoteproc/mtk,scp.txt for details.
+- iommus: should point to the 3 entries:  M4U_PORT_CAM_FDVT_RP,
+  M4U_PORT_CAM_FDVT_WR and M4U_PORT_CAM_FDVT_RB.  (Please see
+  Documentation/devicetree/bindings/iommu/mediatek,iommu.txt for details.)
+- reg: Physical base address and length of the register space.
+- interrupts: interrupt number to the cpu.
+- clocks : must contain the FDVT clock, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- clock-names: must be "fd".
+- power-domain: must be "MT8183_POWER_DOMAIN_ISP".
+
+Example:
+	fd: fd@1502b000 {
+		compatible = "mediatek,mt8183-fd";
+		mediatek,scp = <&scp>;
+		iommus = <&iommu M4U_PORT_CAM_FDVT_RP>,
+			 <&iommu M4U_PORT_CAM_FDVT_WR>,
+			 <&iommu M4U_PORT_CAM_FDVT_RB>;
+		reg = <0 0x1502b000 0 0x1000>;
+		interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&imgsys CLK_IMG_FDVT>;
+		clock-names = "fd";
+		power-domains = <&scpsys MT8183_POWER_DOMAIN_ISP>;
+	};
-- 
2.18.0
