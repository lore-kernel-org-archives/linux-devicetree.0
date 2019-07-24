From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v8 04/11] dt-bindings: usb: mtu3: add properties about USB
 Role Switch
Date: Wed, 24 Jul 2019 16:50:38 +0800
Message-ID: <1563958245-6321-5-git-send-email-chunfeng.yun@mediatek.com>
References: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Badhri Jagan Sridharan <badhri@google.com>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Now the USB Role Switch is supported, so add properties about it,
and modify some description related.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v8 no changes
v7 no changes
v6 no changes

v5 changes:
 1. modify decription about extcon and vbus-supply properties
 2. make this patch depend on [1]

 [1]: [v3] dt-binding: usb: add usb-role-switch property
      https://patchwork.kernel.org/patch/10934835/

v4 no changes
v3 no changes

v2 changes:
  1. fix typo
  2. refer new binding about connector property
---
 .../devicetree/bindings/usb/mediatek,mtu3.txt          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
index 3382b5cb471d..3a8300205cdb 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
@@ -28,8 +28,13 @@ Optional properties:
 	parent's address space
  - extcon : external connector for vbus and idpin changes detection, needed
 	when supports dual-role mode.
+	it's considered valid for compatibility reasons, not allowed for
+	new bindings, and use "usb-role-switch" property instead.
  - vbus-supply : reference to the VBUS regulator, needed when supports
 	dual-role mode.
+	it's considered valid for compatibility reasons, not allowed for
+	new bindings, and put into a usb-connector node.
+	see connector/usb-connector.txt.
  - pinctrl-names : a pinctrl state named "default" is optional, and need be
 	defined if auto drd switch is enabled, that means the property dr_mode
 	is set as "otg", and meanwhile the property "mediatek,enable-manual-drd"
@@ -39,6 +44,8 @@ Optional properties:
 
  - maximum-speed : valid arguments are "super-speed", "high-speed" and
 	"full-speed"; refer to usb/generic.txt
+ - usb-role-switch : use USB Role Switch to support dual-role switch, but
+	not extcon; see usb/generic.txt.
  - enable-manual-drd : supports manual dual-role switch via debugfs; usually
 	used when receptacle is TYPE-A and also wants to support dual-role
 	mode.
@@ -61,6 +68,9 @@ The xhci should be added as subnode to mtu3 as shown in the following example
 if host mode is enabled. The DT binding details of xhci can be found in:
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt
 
+The port would be added as subnode if use "usb-role-switch" property.
+	see graph.txt
+
 Example:
 ssusb: usb@11271000 {
 	compatible = "mediatek,mt8173-mtu3";
-- 
2.21.0
