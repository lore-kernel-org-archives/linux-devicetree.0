From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v6 04/12] dt-binding: gce: add binding for gce event property
Date: Thu, 16 May 2019 17:02:16 +0800
Message-ID: <20190516090224.59070-5-bibby.hsieh@mediatek.com>
References: <20190516090224.59070-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516090224.59070-1-bibby.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU <ck.hu@mediatek.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Nicolas Boichat <drinkcat@chromium.org>, YT Shen <yt.shen@mediatek.com>, Daoyuan Huang <daoyuan.huang@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsimediatek/mtkcam/drv/fdvt/4.0/cam_fdvt_v4l2.cppeh@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, ginny.chen@mediatek.com, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: devicetree@vger.kernel.org

Client hardware would send event to GCE hardware,
mediatek,gce-event-names and mediatek,gce-events
can be used to present the event.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index dceab63ccd06..265bb58da7bd 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -35,6 +35,8 @@ Required properties for a client device:
 Optional properties for a client device:
 - mediatek,gce-client-reg: u32, specify the sub-system id which is corresponding
   to the register address.
+- mediatek,gce-events: u32, the event number defined in
+  'dt-bindings/gce/mt8173-gce.h' or 'dt-binding/gce/mt8183-gce.h'.
 
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h'
 or 'dt-binding/gce/mt8183-gce.h'. Such as sub-system ids, thread priority, event ids.
@@ -57,8 +59,8 @@ Example for a client device:
 		compatible = "mediatek,mt8173-mmsys";
 		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
 			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
-		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
-				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
+		mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
+				      <CMDQ_EVENT_MDP_RSZ0_SOF>;
 		mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>,
 					  <&gce SUBSYS_1401XXXX 0x2000 0x100>;
 		...
-- 
2.18.0
