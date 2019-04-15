From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v4 04/12] dt-binding: gce: add binding for gce subsys property
Date: Mon, 15 Apr 2019 20:58:25 +0800
Message-ID: <20190415125833.38704-5-bibby.hsieh@mediatek.com>
References: <20190415125833.38704-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415125833.38704-1-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Frederic Chen <Frederic.Chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

cmdq driver provide a function that get the relationship
of sub system number from device node for client.
add specification for #subsys-cells, mediatek,gce-subsys.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 .../devicetree/bindings/mailbox/mtk-gce.txt       | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 2f175d6b296d..755b30fd6041 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -26,13 +26,20 @@ Required properties:
 	phandle: Label name of a gce node.
 	event_number: the event number defined in 'dt-bindings/gce/mt8173-gce.h'
 		      or 'dt-binding/gce/mt8183-gce.h'.
+- #subsys-cells: Should be 3.
+	<&phandle subsys_number start_offset size>
+	phandle: Label name of a gce node.
+	subsys_number: specify the sub-system id which is corresponding
+		       to the register address.
+	start_offset: the start offset of register address that GCE can access.
+	size: the total size of register address that GCE can access.
 
 Required properties for a client device:
 - mboxes: Client use mailbox to communicate with GCE, it should have this
   property and list of phandle, mailbox specifiers.
-- mediatek,gce-subsys: u32, specify the sub-system id which is corresponding
-  to the register address.
 Optional propertier for a client device:
+- mediatek,gce-client-reg: u32, specify the sub-system id which is corresponding
+  to the register address.
 - mediatek,gce-event-names: the event name can be defined by user.
 - mediatek,gce-events: u32, the event number defined in
   'dt-bindings/gce/mt8173-gce.h' or 'dt-binding/gce/mt8183-gce.h'.
@@ -50,6 +57,7 @@ Example:
 		clock-names = "gce";
 		#mbox-cells = <3>;
 		#event-cells = <1>;
+		#subsys-cells = <3>;
 	};
 
 Example for a client device:
@@ -58,7 +66,8 @@ Example for a client device:
 		compatible = "mediatek,mt8173-mmsys";
 		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
 			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
-		mediatek,gce-subsys = <SUBSYS_1400XXXX>;
+		mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>,
+					  <&gce SUBSYS_1401XXXX 0x2000 0x100>;
 		mediatek,gce-event-names = "rdma0_sof",
 					   "rsz0_sof";
 		mediatek,gce-events = <&gce CMDQ_EVENT_MDP_RDMA0_SOF>,
-- 
2.18.0
