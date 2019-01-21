From: <min.guo@mediatek.com>
Subject: [PATCH v4 1/6] dt-bindings: usb: musb: Add support for MediaTek musb
 controller
Date: Mon, 21 Jan 2019 20:22:26 +0800
Message-ID: <1548073351-13739-2-git-send-email-min.guo@mediatek.com>
References: <1548073351-13739-1-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548073351-13739-1-git-send-email-min.guo@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, hdegoede@redhat.com, tony@atomide.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Min Guo <min.guo@mediatek.com>, chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Min Guo <min.guo@mediatek.com>

This adds support for MediaTek musb controller in
host, peripheral and otg mode.

Signed-off-by: Min Guo <min.guo@mediatek.com>
---
changes in v4:
suggested by Sergei:
1. String alignment

changes in v3:
1. no changes

changes in v2:
suggested by Bin:
1. Modify DRC to DRD
suggested by Rob:
2. Drop the "<soc-model>-musb" in compatible
3. Remove phy-names
4. Add space after comma in clock-names
---
 .../devicetree/bindings/usb/mediatek,musb.txt      | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt

diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.txt b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
new file mode 100644
index 0000000..4305770
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.txt
@@ -0,0 +1,43 @@
+MediaTek musb DRD/OTG controller
+-------------------------------------------
+
+Required properties:
+ - compatible      : should be "mediatek,mtk-musb"
+ - reg             : specifies physical base address and size of
+                     the registers
+ - interrupts      : interrupt used by musb controller
+ - interrupt-names : must be "mc"
+ - phys            : PHY specifier for the OTG phy
+ - dr_mode         : should be one of "host", "peripheral" or "otg",
+                     refer to usb/generic.txt
+ - clocks          : a list of phandle + clock-specifier pairs, one for
+                     each entry in clock-names
+ - clock-names     : must contain "main", "mcu", "univpll"
+                     for clocks of controller
+
+Optional properties:
+ - extcon          : external connector for VBUS and ID pin changes detection,
+                     needed when supports dual-role mode
+ - vbus-supply     : reference to the VBUS regulator, needed when supports
+                     dual-role mode
+ - power-domains   : a phandle to USB power domain node to control USB's
+                     MTCMOS
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
