From: <min.guo@mediatek.com>
Subject: [PATCH v3 1/4] dt-bindings: usb: musb: Add support for MediaTek musb controller
Date: Thu, 17 Jan 2019 15:15:45 +0800
Message-ID: <1547709348-17506-2-git-send-email-min.guo@mediatek.com>
References: <1547709348-17506-1-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547709348-17506-1-git-send-email-min.guo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, tony@atomide.com, hdegoede@redhat.com, Min Guo <min.guo@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Min Guo <min.guo@mediatek.com>

This adds support for MediaTek musb controller in
host, peripheral and otg mode.

Signed-off-by: Min Guo <min.guo@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,musb.txt      | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt

diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
new file mode 100644
index 0000000..3e3f671
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
@@ -0,0 +1,43 @@
+MediaTek musb DRD/OTG controller
+-------------------------------------------
+
+Required properties:
+ - compatible      : should be "mediatek,mtk-musb"
+ - reg             : specifies physical base address and size of
+   the registers
+ - interrupts      : interrupt used by musb controller
+ - interrupt-names : must be "mc"
+ - phys            : PHY specifier for the OTG phy
+ - dr_mode         : should be one of "host", "peripheral" or "otg",
+   refer to usb/generic.txt
+ - clocks          : a list of phandle + clock-specifier pairs, one for
+   each entry in clock-names
+ - clock-names     : must contain "main", "mcu", "univpll"
+   for clocks of controller
+
+Optional properties:
+ - extcon : external connector for VBUS and IDPIN changes detection,
+   needed when supports dual-role mode.
+ - vbus-supply : reference to the VBUS regulator, needed when supports
+   dual-role mode.
+ - power-domains   : a phandle to USB power domain node to control USB's
+   MTCMOS
+
+Example:
+
+usb2: usb@11200000 {
+	compatible = "mediatek,mt2701-musb",
+		     "mediatek,mtk-musb";
+	reg = <0 0x11200000 0 0x1000>;
+	interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+	interrupt-names = "mc";
+	phys = <&u2port2 PHY_TYPE_USB2>;
+	vbus-supply = <&usb_vbus>;
+	extcon = <&extcon_usb>;
+	dr_mode = "otg";
+	clocks = <&pericfg CLK_PERI_USB0>,
+		 <&pericfg CLK_PERI_USB0_MCU>,
+		 <&pericfg CLK_PERI_USB_SLV>;
+	clock-names = "main","mcu","univpll";
+	power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
+};
-- 
1.9.1
