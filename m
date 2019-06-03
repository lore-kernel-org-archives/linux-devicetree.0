From: Qii Wang <qii.wang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: i3c: Document MediaTek I3C master bindings
Date: Mon, 3 Jun 2019 11:51:02 +0800
Message-ID: <1559533863-10292-2-git-send-email-qii.wang@mediatek.com>
References: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559533863-10292-1-git-send-email-qii.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bbrezillon@kernel.org
Cc: matthias.bgg@gmail.com, linux-i3c@lists.infradead.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com, liguo.zhang@mediatek.com, xinping.qian@mediatek.com
List-Id: devicetree@vger.kernel.org

Document MediaTek I3C master DT bindings.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 .../devicetree/bindings/i3c/mtk,i3c-master.txt     |   50 ++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt

diff --git a/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
new file mode 100644
index 0000000..89ec380
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/mtk,i3c-master.txt
@@ -0,0 +1,50 @@
+Bindings for MediaTek I3C master block
+=====================================
+
+Required properties:
+--------------------
+- compatible: shall be "mediatek,i3c-master"
+- reg: physical base address of the controller and apdma base, length of
+  memory mapped region.
+- reg-names: should be "main" for controller and "dma" for apdma.
+- interrupts: interrupt number to the cpu.
+- clock-div: the fixed value for frequency divider of clock source in i3c
+  module. Each IC may be different.
+- clocks: clock name from clock manager.
+- clock-names: must include "main" and "dma".
+
+Mandatory properties defined by the generic binding (see
+Documentation/devicetree/bindings/i3c/i3c.txt for more details):
+
+- #address-cells: shall be set to 3
+- #size-cells: shall be set to 0
+
+Optional properties defined by the generic binding (see
+Documentation/devicetree/bindings/i3c/i3c.txt for more details):
+
+- i2c-scl-hz
+- i3c-scl-hz
+
+I3C device connected on the bus follow the generic description (see
+Documentation/devicetree/bindings/i3c/i3c.txt for more details).
+
+Example:
+
+	i3c0: i3c@1100d000 {
+		compatible = "mediatek,i3c-master";
+		reg = <0x1100d000 0x100>,
+		      <0x11000300 0x80>;
+		reg-names = "main", "dma";
+		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_LOW>;
+		clock-div = <16>;
+		clocks = <&i3c0_ck>, <&ap_dma_ck>;
+		clock-names = "main", "dma";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-scl-hz = <100000>;
+
+		nunchuk: nunchuk@52 {
+			compatible = "nintendo,nunchuk";
+			reg = <0x52 0x80000010 0>;
+		};
+	};
-- 
1.7.9.5
