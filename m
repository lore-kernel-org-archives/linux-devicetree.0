From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 8/9] dt-bindings: usb: mtk-xhci: add a optional property to disable u3ports
Date: Wed, 27 Sep 2017 17:23:04 +0800
Message-ID: <fd8b6099192ddee3b277f5ca3a699c20fb273ffe.1506503880.git.chunfeng.yun@mediatek.com>
References: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1506503879.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <994382d16d6bdc0f3d7c11b22f1710252e056e34.1506503879.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new optional property to disable u3ports

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.txt  |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
index 5611a2e..2d9b459 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
@@ -38,6 +38,8 @@ Optional properties:
 	mode;
  - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
 	control register, it depends on "mediatek,wakeup-src".
+ - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
+	bit1 for u3port1, ... etc;
  - vbus-supply : reference to the VBUS regulator;
  - usb3-lpm-capable : supports USB3.0 LPM
  - pinctrl-names : a pinctrl state named "default" must be defined
-- 
1.7.9.5
