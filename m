From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v2 02/10] dt-binding: gce: add binding for gce event property
Date: Wed, 6 Mar 2019 17:50:27 +0800
Message-ID: <1551865835-50974-3-git-send-email-bibby.hsieh@mediatek.com>
References: <1551865835-50974-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551865835-50974-1-git-send-email-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, kendrick.hsu@mediatek.com, Frederic Chen <Frederic.Chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

cmdq driver provide a function that get event number
from device node for client.
add specification for #event-cells,
mediatek,gce-event-names, mediatek,gce-events.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 9c0d982..812698f 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -21,12 +21,20 @@ Required properties:
 	priority: Priority of GCE thread.
 	atomic_exec: GCE processing continuous packets of commands in atomic
 		way.
+- #event-cells: Should be 1.
+	<&phandle event_number>
+	phandle: Label name of a gce node.
+	event_number: the event number defined in 'dt-bindings/gce/mt8173-gce.h'
+		      or 'dt-binding/gce/mt8183-gce.h'.
 
 Required properties for a client device:
 - mboxes: Client use mailbox to communicate with GCE, it should have this
   property and list of phandle, mailbox specifiers.
 - mediatek,gce-subsys: u32, specify the sub-system id which is corresponding
   to the register address.
+- mediatek,gce-event-names: the event name can be defined by user.
+- mediatek,gce-events: u32, the event number defined in
+  'dt-bindings/gce/mt8173-gce.h' or 'dt-binding/gce/mt8183-gce.h'.
 
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h'
 or 'dt-binding/gce/mt8183-gce.h'. Such as sub-system ids, thread priority, event ids.
@@ -41,6 +49,7 @@ Example:
 		clock-names = "gce";
 		thread-num = CMDQ_THR_MAX_COUNT;
 		#mbox-cells = <3>;
+		#event-cells = <1>;
 	};
 
 Example for a client device:
@@ -50,8 +59,9 @@ Example for a client device:
 		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
 			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
 		mediatek,gce-subsys = <SUBSYS_1400XXXX>;
-		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
-				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
-
+		mediatek,gce-event-names = "rdma0_sof",
+					   "rsz0_sof";
+		mediatek,gce-events = <&gce CMDQ_EVENT_MDP_RDMA0_SOF>,
+				      <&gce CMDQ_EVENT_MDP_RSZ0_SOF>;
 		...
 	};
-- 
1.9.1
