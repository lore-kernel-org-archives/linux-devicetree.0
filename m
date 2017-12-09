From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/7] dt-bindings: soc: mediatek: add bindings document for USB
 wakeup
Date: Sat, 9 Dec 2017 16:45:31 +0800
Message-ID: <1512809136-2779-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1512809136-2779-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1512809136-2779-1-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jean Delvare <jdelvare@suse.de>
List-Id: devicetree@vger.kernel.org

This adds bindings document for the SSUSB-SPM glue layer driver found
in MediaTek SoCs which is used to support usb remote wakeup.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../bindings/soc/mediatek/usb-wakeup.txt           | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/usb-wakeup.txt

diff --git a/Documentation/devicetree/bindings/soc/mediatek/usb-wakeup.txt b/Documentation/devicetree/bindings/soc/mediatek/usb-wakeup.txt
new file mode 100644
index 0000000..313d927
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/usb-wakeup.txt
@@ -0,0 +1,77 @@
+MediaTek USB Wakeup binding
+-----------------------------
+
+The SSUSB-SPM glue layer is used to control some signals of USB
+wakeup, such as IP-SLEEP, LINE-STATE, IDDIG etc, which are mutually
+exclusive.
+
+Required properties (controller (parent) node):
+- compatible: Should be one of:
+	- "mediatek,<soc-model>-uwk","mediatek,usb-wk-v1"
+		soc-model is the name of SoC, supports one of:
+		- mt8173, mt8176
+	- "mediatek,<soc-model>-uwk","mediatek,usb-wk-v2"
+		soc-model is the name of SoC, supports one of:
+		- mt2712
+
+- mediatek,wkc: must contain a syscon phandle, such as pericfg controller
+- #address-cells : should be '1'
+- #size-cells : should be '1'
+
+Required nodes: a sub-node is required for each glue layer provided for
+	each SSUSB IP. Address range information including the usual 'reg'
+	property is used inside these nodes to describe the controller's
+	topology.
+
+Required properties (glue layer (child) node):
+- reg: address and length of the register set within the syscon which is
+	assigned to @mediatek,wkc.
+- #mediatek,uwk-cells: should be 1 (see the second example), cell after
+	glue layer phandle is wakeup type from:
+		- MTU_WK_IP_SLEEP
+		- MTU_WK_LINE_STATE
+	The wakeup types defined in
+		- include/dt-bindings/soc/mediatek,usb-wakeup.h
+
+
+Example:
+
+usb_wakeup: uwk@0 {
+	compatible = "mediatek,mt2712-uwk","mediatek,usb-wk-v2";
+	mediatek,wkc = <&pericfg>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+	status = "okay";
+
+	usb_wk0: uwk@510 {
+		reg = <0x510 0x4>;
+		#mediatek,uwk-cells = <1>;
+		status = "okay";
+	};
+
+	usb_wk1: uwk@514 {
+		reg = <0x514 0x4>;
+		#mediatek,uwk-cells = <1>;
+		status = "okay";
+	};
+};
+
+
+Specifying wakeup control of devices
+---------------------------------
+
+Device nodes should specify the configuration required in their
+"mediatek,uwks" property, containing a phandle to the glue layer
+node and a wakeup type, because each USB controller has just one
+glue layer for wakeup, so only one phandle is supported;
+
+Example:
+
+#include <dt-bindings/soc/mediatek,usb-wakeup.h>
+
+usb_host1: xhci@112c0000 {
+	...
+	mediatek,uwks = <&usb_wk2 MTU_WK_IP_SLEEP>;
+	...
+};
+
-- 
1.9.1
