From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 1/7] dt-bindings: usb: mtu3: support USB wakeup for MT8183
Date: Wed, 28 Aug 2019 15:34:25 +0800
Message-ID: <1566977671-22191-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1566977671-22191-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566977671-22191-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Support USB wakeup by ip-sleep mode for MT8183

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
index 3382b5cb471d..ed954bedcd2f 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
@@ -48,6 +48,7 @@ Optional properties:
 	"wakeup-source", and has two arguments:
 	- the first one : register base address of the glue layer in syscon;
 	- the second one : hardware version of the glue layer
+		- 0 : used by mt8183 etc
 		- 1 : used by mt8173 etc
 		- 2 : used by mt2712 etc
  - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
-- 
2.23.0
