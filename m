From: <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/6] dt-bindings: Add a binding for Mediatek xHCI host controller
Date: Wed, 27 May 2015 19:47:59 +0800
Message-ID: <1432727283-20303-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1432727283-20303-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432727283-20303-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Chunfeng Yun <chunfeng.yun@mediatek.com>

add a DT binding documentation of xHCI host controller for
the MT8173 SoC from Mediatek.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 Documentation/devicetree/bindings/usb/mt8173-xhci.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mt8173-xhci.txt

diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
new file mode 100644
index 0000000..da28570
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
@@ -0,0 +1,19 @@
+MT65XX xhci
+
+The device node for Mediatek SOC usb3.0 host controller
+
+Required properties:
+ - compatible : supports "mediatek,mt8173-xhci", "generic-xhci"
+ - reg        : Offset and length of registers
+ - interrupts : Interrupt; mode, number and trigger
+ - usb-phy : the phy that xhci will bind
+ - usb3-lpm-capable: suppots USB3 LPM
+
+Example:
+usb: usb30@11270000 {
+	compatible = "mediatek,mt8173-xhci", "generic-xhci";
+	reg = <0 0x11270000 0 0x1000>;
+	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+	usb-phy = <&u3phy>;
+	usb3-lpm-capable;
+};
-- 
1.8.1.1.dirty
