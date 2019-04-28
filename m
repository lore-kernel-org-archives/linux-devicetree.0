From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] dt-binding: usb: add usb-role-switch property
Date: Sun, 28 Apr 2019 20:27:46 +0800
Message-ID: <5756e05930f5e6a3940ad9d019399c8e63d24f18.1556454324.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Yu Chen <chenyu56@huawei.com>, linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add a property usb-role-switch to tell Dual-Role controller driver
that use USB Role Switch framework to handle the role switch between
host mode and device mode, it's useful when the driver has already
supported other ways, such as extcon framework etc.

Cc: Biju Das <biju.das@bp.renesas.com>
Cc: Yu Chen <chenyu56@huawei.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v1:
the property is discussed in:
[v2,2/7] dt-bindings: usb: renesas_usb3: add usb-role-switch property
https://patchwork.kernel.org/patch/10852497/

Mediatek and Hisilicon also try to use it:
[v4,3/6] dt-bindings: usb: mtu3: add properties about USB Role Switch
https://patchwork.kernel.org/patch/10918385/
[v4,6/6] usb: mtu3: register a USB Role Switch for dual role mode
https://patchwork.kernel.org/patch/10918367/

[v6,10/13] usb: dwc3: Registering a role switch in the DRD code
https://patchwork.kernel.org/patch/10909981/
---
 Documentation/devicetree/bindings/usb/generic.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index 0a74ab8dfdc2..c73950b72513 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -30,6 +30,9 @@ Optional properties:
 			optional for OTG device.
  - adp-disable: tells OTG controllers we want to disable OTG ADP, ADP is
 			optional for OTG device.
+ - usb-role-switch: tells Dual-Role USB controller driver that we want to use
+			USB Role Switch framework to handle the role switch
+			between host mode and device mode.
 
 This is an attribute to a USB controller such as:
 
-- 
2.21.0
