From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v2 03/10] dt-binding: gce: add binding for gce subsys property
Date: Wed, 6 Mar 2019 17:50:28 +0800
Message-ID: <1551865835-50974-4-git-send-email-bibby.hsieh@mediatek.com>
References: <1551865835-50974-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551865835-50974-1-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Frederic Chen <Frederic.Chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

cmdq driver provide a function that get the relationship
of sub system number from device node for client.
add specification for #subsys-cells, mediatek,gce-subsys.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 812698f..07b2adf 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -26,6 +26,13 @@ Required properties:
 	phandle: Label name of a gce node.
 	event_number: the event number defined in 'dt-bindings/gce/mt8173-gce.h'
 		      or 'dt-binding/gce/mt8183-gce.h'.
+#subsys-cells: Should be 2.
+	<&phandle register_base_address subsys_number>
+	phandle: Label name of a gce node.
+	register_base_address: the register base address that client
+			       want to write or read.
+	subsys_number: specify the sub-system id which is corresponding
+		       to the register address.
 
 Required properties for a client device:
 - mboxes: Client use mailbox to communicate with GCE, it should have this
@@ -50,6 +57,7 @@ Example:
 		thread-num = CMDQ_THR_MAX_COUNT;
 		#mbox-cells = <3>;
 		#event-cells = <1>;
+		#subsys-cells = <2>;
 	};
 
 Example for a client device:
@@ -58,7 +66,8 @@ Example for a client device:
 		compatible = "mediatek,mt8173-mmsys";
 		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
 			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
-		mediatek,gce-subsys = <SUBSYS_1400XXXX>;
+		mediatek,gce-subsys = <&gce 0x14000000 SUBSYS_1400XXXX>,
+				      <&gce 0x14010000 SUBSYS_1401XXXX>;
 		mediatek,gce-event-names = "rdma0_sof",
 					   "rsz0_sof";
 		mediatek,gce-events = <&gce CMDQ_EVENT_MDP_RDMA0_SOF>,
-- 
1.9.1
