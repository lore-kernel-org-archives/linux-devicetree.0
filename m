From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 3/6] dt-bindings: usb: mtu3: add properties about USB Role Switch
Date: Fri, 15 Mar 2019 15:38:30 +0800
Message-ID: <1552635513-2378-4-git-send-email-chunfeng.yun@mediatek.com>
References: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Now the USB Role Switch is supported, so add properties about it

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2 changes:
  1. fix typo
  2. refer new binding about connector property
---
 .../devicetree/bindings/usb/mediatek,mtu3.txt          | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
index 3382b5cb471d..359e8d565b54 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
@@ -27,7 +27,9 @@ Optional properties:
  - ranges : allows valid 1:1 translation between child's address space and
 	parent's address space
  - extcon : external connector for vbus and idpin changes detection, needed
-	when supports dual-role mode.
+	when supports dual-role mode; it's consiedered valid for compatibility
+	reasons, and not allowed for new bindings, use the property
+	usb-role-switch instead.
  - vbus-supply : reference to the VBUS regulator, needed when supports
 	dual-role mode.
  - pinctrl-names : a pinctrl state named "default" is optional, and need be
@@ -36,7 +38,8 @@ Optional properties:
 	is not set.
  - pinctrl-0 : pin control group
 	See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
+ - usb-role-switch : use USB Role Switch to support dual-role switch, but
+	not extcon
  - maximum-speed : valid arguments are "super-speed", "high-speed" and
 	"full-speed"; refer to usb/generic.txt
  - enable-manual-drd : supports manual dual-role switch via debugfs; usually
@@ -61,6 +64,9 @@ The xhci should be added as subnode to mtu3 as shown in the following example
 if host mode is enabled. The DT binding details of xhci can be found in:
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
 
+The connector would be added as subnode if receptacle is Micro.
+	see usb/typeb-switch-gpio.txt
+
 Example:
 ssusb: usb@11271000 {
 	compatible = "mediatek,mt8173-mtu3";
-- 
2.20.1
