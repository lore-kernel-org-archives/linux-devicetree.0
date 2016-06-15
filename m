From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4,2/5] dt-bindings: mt8173-mtu3: add devicetree bindings
Date: Wed, 15 Jun 2016 11:07:17 +0800
Message-ID: <1465960040-768-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1465960040-768-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1465960040-768-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

add a DT binding doc for MediaTek USB3 DRD driver

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/usb/mt8173-mtu3.txt        |   86 ++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mt8173-mtu3.txt

diff --git a/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt b/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
new file mode 100644
index 0000000..12f3c2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
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
+ - enable-manual-drd : supports manual dual-role switch via debugfs; usually
+	used when receptacle is TYPE-A and also wants to support dual-role
+	mode.
+ - mediatek,enable-wakeup : supports ip sleep wakeup used by host mode
+ - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
+	control register, it depends on "mediatek,enable-wakeup".
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
