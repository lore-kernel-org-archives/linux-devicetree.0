From: HS Liao <hs.liao@mediatek.com>
Subject: [PATCH v10 1/4] dt-bindings: soc: Add documentation for the MediaTek GCE unit
Date: Thu, 14 Jul 2016 19:28:50 +0800
Message-ID: <1468495733-12178-2-git-send-email-hs.liao@mediatek.com>
References: <1468495733-12178-1-git-send-email-hs.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468495733-12178-1-git-send-email-hs.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, CK HU <ck.hu@mediatek.com>, cawa cheng <cawa.cheng@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Damon Chu <damon.chu@mediatek.com>, Josh-YC Liu <josh-yc.liu@mediatek.com>, Glory Hung <glory.hung@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Monica Wang <monica.wang@mediatek.com>, HS Liao <hs.liao@mediatek.com>
List-Id: devicetree@vger.kernel.org

This adds documentation for the MediaTek Global Command Engine (GCE) unit
found in MT8173 SoCs.

Signed-off-by: HS Liao <hs.liao@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/soc/mediatek/gce.txt       | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/gce.txt

diff --git a/Documentation/devicetree/bindings/soc/mediatek/gce.txt b/Documentation/devicetree/bindings/soc/mediatek/gce.txt
new file mode 100644
index 0000000..2b3e655
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/gce.txt
@@ -0,0 +1,47 @@
+MediaTek GCE
+===============
+
+The Global Command Engine (GCE) is used to help read/write registers with
+critical time limitation, such as updating display configuration during the
+vblank. The GCE can be used to implement the Command Queue (CMDQ) driver.
+
+CMDQ driver uses mailbox framework for communication. Please refer to
+../../mailbox/mailbox.txt for generic information about mailbox device-tree
+bindings.
+
+Required properties:
+- compatible: Must be "mediatek,mt8173-gce"
+- reg: Address range of the GCE unit
+- interrupts: The interrupt signal from the GCE block
+- clock: Clocks according to the common clock binding
+- clock-names: Must be "gce" to stand for GCE clock
+- #mbox-cells: Should be 2
+
+Required properties for a client device:
+- mediatek,gce: If a client asks GCE to access its registers, it should have
+  this property and point to the respective GCE block.
+- mboxes: If a client will communicate with GCE via mailbox, it should have
+  this property and list of phandle, mailbox channel specifiers, and atomic
+  execution flag.
+
+Example:
+
+	gce: gce@10212000 {
+		compatible = "mediatek,mt8173-gce";
+		reg = <0 0x10212000 0 0x1000>;
+		interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg CLK_INFRA_GCE>;
+		clock-names = "gce";
+
+		#mbox-cells = <2>;
+	};
+
+Example for a client device:
+
+	mmsys: clock-controller@14000000 {
+		compatible = "mediatek,mt8173-mmsys";
+		mediatek,gce = <&gce>;
+		mboxes = <&gce 0 1 /* main display with atomic execution */
+			  &gce 1 1>; /* sub display with atomic execution */
+		...
+	};
-- 
1.9.1
