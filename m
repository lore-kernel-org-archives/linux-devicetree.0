From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v3 1/5] dt-bindings: Add usb3.0 phy binding for MT65xx SoCs
Date: Wed, 22 Jul 2015 22:05:41 +0800
Message-ID: <1437573945-31586-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1437573945-31586-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437573945-31586-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, John Crispin <blogic@openwrt.org>, Daniel Kurtz <djkurtz@chromium.org>
List-Id: devicetree@vger.kernel.org

add a DT binding documentation of usb3.0 phy for MT65xx
SoCs from Mediatek.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/phy/phy-mt65xx-u3.txt       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mt65xx-u3.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-mt65xx-u3.txt b/Documentation/devicetree/bindings/phy/phy-mt65xx-u3.txt
new file mode 100644
index 0000000..752abc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-mt65xx-u3.txt
@@ -0,0 +1,21 @@
+MT65xx USB3.0 PHY
+
+The device node for Mediatek SOC usb3.0 phy
+
+Required properties:
+ - compatible : Should be "mediatek,mt8173-u3phy"
+ - reg        : Offset and length of registers for phy domain
+ - clocks     : must support all clocks that phy need
+ - clock-names: should be "u3phya_ref" for u3phya reference clock.
+ - #phy-cells : must be 1 for the phy
+
+Example:
+
+u3phy: usb-phy@11290000 {
+	compatible = "mediatek,mt8173-u3phy";
+	reg = <0 0x11290000 0 0x3000>;
+	clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+	clock-names = "u3phya_ref";
+	#phy-cells = <1>;
+	status = "okay";
+};
-- 
1.8.1.1.dirty
