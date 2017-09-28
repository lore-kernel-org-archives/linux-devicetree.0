From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 12/12] dt-bindings: usb: mtu3: remove optional pinctrls
Date: Thu, 28 Sep 2017 08:17:20 +0800
Message-ID: <ec8e65205c6e0a83850e11c030ed440d7b9be2e8.1506509659.git.chunfeng.yun@mediatek.com>
References: <fe8df8503f602586bcea4b1598eb09678b1525e3.1506509658.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fe8df8503f602586bcea4b1598eb09678b1525e3.1506509658.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Remove optional pinctrls due to using FORCE/RG_IDDIG to implement
manual switch function.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtu3.txt      |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
index 49c982b..b2271d8 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
@@ -30,9 +30,10 @@ Optional properties:
 	when supports dual-role mode.
  - vbus-supply : reference to the VBUS regulator, needed when supports
 	dual-role mode.
- - pinctl-names : a pinctrl state named "default" must be defined,
-	"id_float" and "id_ground" are optinal which depends on
-	"mediatek,enable-manual-drd"
+ - pinctrl-names : a pinctrl state named "default" is optional, and need be
+	defined if auto drd switch is enabled, that means the property dr_mode
+	is set as "otg", and meanwhile the property "mediatek,enable-manual-drd"
+	is not set.
  - pinctrl-0 : pin control group
 	See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
 
-- 
1.7.9.5
