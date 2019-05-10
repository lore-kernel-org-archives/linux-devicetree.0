From: Jungo Lin <jungo.lin@mediatek.com>
Subject: [RFC, V2,
 01/11] dt-bindings: mt8183: Add binding for ISP Pass 1 reserved memory
Date: Fri, 10 May 2019 09:57:47 +0800
Message-ID: <20190510015755.51495-2-jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <Jungo Lin <jungo.lin@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, suleiman@chromium.org, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, ryan.yu@mediatek.com, Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com, Jungo Lin <jungo.lin@mediatek.com>, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, seraph.huang@mediatek.com, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the binding for describing the reserved
shared memory used to exchange ISP configuration and tuning
data between the co-processor and Pass 1 (P1) unit of the
camera ISP system on Mediatek SoCs.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 .../mediatek,reserve-memory-cam-smem.txt      | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt

diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt
new file mode 100644
index 000000000000..65a967cff91e
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,reserve-memory-cam-smem.txt
@@ -0,0 +1,42 @@
+Mediatek ISP Pass 1 Shared Memory binding
+
+This binding describes the shared memory, which serves the purpose of
+describing the shared memory region used to exchange data between Pass 1
+unit of Image Signal Processor (ISP) and the co-processor in Mediatek
+SoCs.
+
+The co-processor doesn't have the iommu so we need to use the physical
+address to access the shared buffer in the firmware.
+
+The Pass 1 unit of ISP can access memory through the iommu so it
+uses the dma address to access the memory region.
+(See iommu/mediatek,iommu.txt for the detailed description of Mediatek IOMMU)
+
+For additional details about reserved memory regions see reserved-memory.txt
+
+Required properties:
+
+- compatible: must be "mediatek,reserve-memory-cam-smem"
+
+- size: required for dynamic allocation. The unit is bytes.
+
+- alloc-range: required for dynamic allocation. The range must
+  between 0x40000000 and 0x100000000 due to the co-processer's
+  addressing limitation.
+
+Example:
+
+The following example shows the ISP Pass 1 shared memory setup for MT8183.
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		cam_mem_reserved: cam_mem_region {
+			compatible = "mediatek,reserve-memory-cam-smem";
+			size = <0 0x1400000>;
+			no-map;
+			alignment = <0 0x1000>;
+			alloc-ranges = <0 0x40000000 0 0x10000000>;
+		};
+	};
-- 
2.18.0
