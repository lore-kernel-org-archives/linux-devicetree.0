From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 11/13] dt-bindings: usb: mtu3: add a optional property to disable u3ports
Date: Fri, 13 Oct 2017 17:10:47 +0800
Message-ID: <734731752b911000fc84ae6f201ae5cd42ebb8af.1507885127.git.chunfeng.yun@mediatek.com>
References: <6dc39e99240f25c83f8c36d23361ec89dcfb33ce.1507885126.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6dc39e99240f25c83f8c36d23361ec89dcfb33ce.1507885126.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a new optional property to disable u3ports

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtu3.txt      |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
index 49f5476..7c611d1 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
@@ -44,6 +44,8 @@ Optional properties:
  - mediatek,enable-wakeup : supports ip sleep wakeup used by host mode
  - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
 	control register, it depends on "mediatek,enable-wakeup".
+ - mediatek,u3p-dis-msk : mask to disable u3ports, bit0 for u3port0,
+	bit1 for u3port1, ... etc;
 
 Sub-nodes:
 The xhci should be added as subnode to mtu3 as shown in the following example
-- 
1.7.9.5
