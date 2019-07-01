From: <qii.wang@mediatek.com>
Subject: [PATCH] dt-bindings: i3c: cdns: Use correct cells for I2C device
Date: Mon, 1 Jul 2019 14:42:02 +0800
Message-ID: <1561963322-11513-1-git-send-email-qii.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bbrezillon@kernel.org
Cc: robh+dt@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, qii.wang@mediatek.com, matthias.bgg@gmail.com
List-Id: devicetree@vger.kernel.org

From: Qii Wang <qii.wang@mediatek.com>

I2C device reg should be "reg = <0x52 0x0 0x10>;"

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 .../devicetree/bindings/i3c/cdns,i3c-master.txt    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
index 69da211..1cf6182 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
@@ -38,6 +38,6 @@ Example:
 
 		nunchuk: nunchuk@52 {
 			compatible = "nintendo,nunchuk";
-			reg = <0x52 0x80000010 0>;
+			reg = <0x52 0x0 0x10>;
 		};
 	};
-- 
1.7.9.5
