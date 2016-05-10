From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 3/6] dt-bindings: mtu3: add devicetree bindings
Date: Tue, 10 May 2016 16:23:31 +0800
Message-ID: <1462868614-20602-4-git-send-email-chunfeng.yun@mediatek.com>
References: <1462868614-20602-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1462868614-20602-1-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Biao Huang <biao.huang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, linux-gpio@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

add a DT binding doc for MediaTek USB3 DRD driver

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 Documentation/devicetree/bindings/usb/mtu3.txt |   86 ++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mtu3.txt

diff --git a/Documentation/devicetree/bindings/usb/mtu3.txt b/Documentation/devicetree/bindings/usb/mtu3.txt
new file mode 100644
index 0000000..ff142a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mtu3.txt
@@ -0,0 +1,86 @@
+The device node for Mediatek USB3.0 DRD controller
+
+Required properties:
+ - compatible : should be "mediatek,mt8173-mtu3"
+ - reg : specifies physical base address and size of the registers
+ - reg-names: should be "mac" for device IP and "ippc" for IP port control
+ - interrupts : interrupt used by the device IP
+ - power-domains : a phandle to USB power domain node to control USB's
+	mtcmos
+ - vusb33-supply : regulator of USB avdd3.3v
+ - clocks : a list of phandle + clock-specifier pairs, one for each
+	entry in clock-names
+ - clock-names : must contain "sys_ck" for clock of controller;
+	"wakeup_deb_p0" and "wakeup_deb_p1" are optional, they are
+	depends on "mediatek,enable-wakeup"
+ - phys : a list of phandle + phy specifier pairs
+ - dr_mode : should be one of "host", "peripheral" or "otg",
+	refer to usb/generic.txt
+
+Optional properties:
+ - #address-cells, #size-cells : should be '2' if the device has sub-nodes
+	with 'reg' property
+ - ranges : allows valid 1:1 translation between child's address space and
+	parent's address space
+ - extcon : external connector for vbus and idpin changes detection, needed
+	when supports dual-role mode.
+ - vbus-supply : reference to the VBUS regulator, needed when supports
+	dual-role mode.
+ - pinctl-names : a pinctrl state named "default" must be defined,
+	"id_float" and "id_ground" are optinal which depends on
+	"mediatek,enable-manual-drd"
+ - pinctrl-0 : pin control group
+	See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
+
+ - maximum-speed : valid arguments are "super-speed", "high-speed" and
+	"full-speed"; refer to usb/generic.txt
+ - mediatek,enable-wakeup : supports ip sleep wakeup used by host mode
+ - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
+	control register, it depends on "mediatek,enable-wakeup".
+ - mediatek,enable-manual-drd : supports manual dual-role switch by sysfs
+	interface; only used when receptacle is TYPE-A and also wants to support
+	dual-role mode.
+
+Sub-nodes:
+The xhci should be added as subnode to mtu3 as shown in the following example
+if host mode is enabled. The DT binding details of xhci can be found in:
+Documentation/devicetree/bindings/usb/mt8173-xhci.txt
+
+Example:
+ssusb: usb@11271000 {
+	compatible = "mediatek,mt8173-mtu3";
+	reg = <0 0x11271000 0 0x3000>,
+	      <0 0x11280700 0 0x0100>;
+	reg-names = "mac", "ippc";
+	interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
+	phys = <&phy_port0 PHY_TYPE_USB3>,
+	       <&phy_port1 PHY_TYPE_USB2>;
+	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+	clocks = <&topckgen CLK_TOP_USB30_SEL>,
+		 <&pericfg CLK_PERI_USB0>,
+		 <&pericfg CLK_PERI_USB1>;
+	clock-names = "sys_ck",
+		      "wakeup_deb_p0",
+		      "wakeup_deb_p1";
+	vusb33-supply = <&mt6397_vusb_reg>;
+	vbus-supply = <&usb_p0_vbus>;
+	extcon = <&extcon_usb>;
+	dr_mode = "otg";
+	mediatek,enable-wakeup;
+	mediatek,syscon-wakeup = <&pericfg>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+	ranges;
+	status = "disabled";
+
+	usb_host: xhci@11270000 {
+		compatible = "mediatek,mt8173-xhci";
+		reg = <0 0x11270000 0 0x1000>;
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
+		clocks = <&topckgen CLK_TOP_USB30_SEL>;
+		clock-names = "sys_ck";
+		vusb33-supply = <&mt6397_vusb_reg>;
+		status = "disabled";
+	};
+};
-- 
1.7.9.5
