From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/6] dt-bindings: usb: mtk-xhci: support USB wakeup for MT8183
Date: Wed, 28 Aug 2019 14:20:57 +0800
Message-ID: <1566973261-21677-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1566973261-21677-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566973261-21677-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Support USB wakeup by ip-sleep mode for MT8183

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
index 266c2d917a28..9a0a9eb0456f 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
@@ -41,6 +41,7 @@ Optional properties:
 	"wakeup-source", and has two arguments:
 	- the first one : register base address of the glue layer in syscon;
 	- the second one : hardware version of the glue layer
+		- 0 : used by mt8183 etc
 		- 1 : used by mt8173 etc
 		- 2 : used by mt2712 etc
  - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
-- 
2.23.0
