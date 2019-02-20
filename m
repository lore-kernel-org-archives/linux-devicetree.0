From: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
Subject: [RFC PATCH V0 1/7] dt-bindings: mt8183: Add binding for FD shared
 memory
Date: Wed, 20 Feb 2019 15:48:07 +0800
Message-ID: <1550648893-42050-2-git-send-email-Jerry-Ch.chen@mediatek.com>
References: <1550648893-42050-1-git-send-email-Jerry-Ch.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550648893-42050-1-git-send-email-Jerry-Ch.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, Jerry-ch Chen <jerry-ch.chen@mediatek.com>, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the binding for describing the shared memory
used to exchange meta data between the co-processor and Face
Detection (FD) unit of the camera system on Mediatek SoCs.

Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
---
 .../mediatek,reserve-memory-fd_smem.txt            | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt

diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt
new file mode 100644
index 0000000..52ae507
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-fd_smem.txt
@@ -0,0 +1,44 @@
+Mediatek FD Shared Memory binding
+
+This binding describes the shared memory, which serves the purpose of
+describing the shared memory region used to exchange data between Face
+Detection hardware (FD) and co-processor in Mediatek SoCs.
+
+The co-processor doesn't have the iommu so we need to use the physical
+address to access the shared buffer in the firmware.
+
+The Face Detection hardware (FD) can access memory through mt8183 IOMMU so
+it can use dma address to access the memory region.
+(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
+
+
+Required properties:
+
+- compatible: must be "mediatek,reserve-memory-fd_smem"
+
+- reg: required for static allocation (see reserved-memory.txt for
+  the detailed usage)
+
+- alloc-range: required for dynamic allocation. The range must
+  between 0x00000400 and 0x100000000 due to the co-processer's
+  addressing limitation
+
+- size: required for dynamic allocation. The unit is bytes.
+  for Face Detection Unit, you need 1 MB at least.
+
+
+Example:
+
+The following example shows the FD shared memory setup for MT8183.
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		reserve-memory-fd_smem {
+			compatible = "mediatek,reserve-memory-fd_smem";
+			size = <0 0x00100000>;
+			alignment = <0 0x1000>;
+			alloc-ranges = <0 0x40000000 0 0x100000000>;
+		};
+	};
\ No newline at end of file
-- 
1.9.1
