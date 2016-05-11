From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] dt-bindings: mtu3: add devicetree bindings
Date: Wed, 11 May 2016 09:54:09 -0500
Message-ID: <20160511145409.GA23042@rob-hp-laptop>
References: <1462868614-20602-1-git-send-email-chunfeng.yun@mediatek.com>
 <1462868614-20602-4-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1462868614-20602-4-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 10, 2016 at 04:23:31PM +0800, Chunfeng Yun wrote:
> add a DT binding doc for MediaTek USB3 DRD driver
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/mtu3.txt |   86 ++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/mtu3.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/mtu3.txt b/Documentation/devicetree/bindings/usb/mtu3.txt
> new file mode 100644
> index 0000000..ff142a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/mtu3.txt
> @@ -0,0 +1,86 @@
> +The device node for Mediatek USB3.0 DRD controller
> +
> +Required properties:
> + - compatible : should be "mediatek,mt8173-mtu3"
> + - reg : specifies physical base address and size of the registers
> + - reg-names: should be "mac" for device IP and "ippc" for IP port control
> + - interrupts : interrupt used by the device IP
> + - power-domains : a phandle to USB power domain node to control USB's
> +	mtcmos
> + - vusb33-supply : regulator of USB avdd3.3v
> + - clocks : a list of phandle + clock-specifier pairs, one for each
> +	entry in clock-names
> + - clock-names : must contain "sys_ck" for clock of controller;
> +	"wakeup_deb_p0" and "wakeup_deb_p1" are optional, they are
> +	depends on "mediatek,enable-wakeup"
> + - phys : a list of phandle + phy specifier pairs

How many?

> + - dr_mode : should be one of "host", "peripheral" or "otg",
> +	refer to usb/generic.txt
> +
> +Optional properties:
> + - #address-cells, #size-cells : should be '2' if the device has sub-nodes
> +	with 'reg' property
> + - ranges : allows valid 1:1 translation between child's address space and
> +	parent's address space
> + - extcon : external connector for vbus and idpin changes detection, needed
> +	when supports dual-role mode.
> + - vbus-supply : reference to the VBUS regulator, needed when supports
> +	dual-role mode.
> + - pinctl-names : a pinctrl state named "default" must be defined,
> +	"id_float" and "id_ground" are optinal which depends on
> +	"mediatek,enable-manual-drd"
> + - pinctrl-0 : pin control group
> +	See: Documentation/devicetree/bindings/pinctrl/pinctrl-binding.txt
> +
> + - maximum-speed : valid arguments are "super-speed", "high-speed" and
> +	"full-speed"; refer to usb/generic.txt
> + - mediatek,enable-wakeup : supports ip sleep wakeup used by host mode
> + - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
> +	control register, it depends on "mediatek,enable-wakeup".

There is a standard wake-up source binding. That assumes asserting the 
device's irq (or one of the irqs) will cause wake-up.

The syscon-wakeup should probably get implemented as a stacked 
irqdomain.

> + - mediatek,enable-manual-drd : supports manual dual-role switch by sysfs
> +	interface; only used when receptacle is TYPE-A and also wants to support
> +	dual-role mode.

sysfs is a Linux detail that doesn't apply to the binding. Does the 
property mean "the IP block supports or doesn't support switching"  or 
"I want to enable switching feature". Only the former belongs in DT.

As far as the sysfs interface, it should be generic, not Mediatek 
specific.

> +
> +Sub-nodes:
> +The xhci should be added as subnode to mtu3 as shown in the following example
> +if host mode is enabled. The DT binding details of xhci can be found in:
> +Documentation/devicetree/bindings/usb/mt8173-xhci.txt

Is XHCI really a sub-block? It seems mostly independent.

> +
> +Example:
> +ssusb: usb@11271000 {
> +	compatible = "mediatek,mt8173-mtu3";
> +	reg = <0 0x11271000 0 0x3000>,
> +	      <0 0x11280700 0 0x0100>;
> +	reg-names = "mac", "ippc";
> +	interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_LOW>;
> +	phys = <&phy_port0 PHY_TYPE_USB3>,
> +	       <&phy_port1 PHY_TYPE_USB2>;
> +	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> +	clocks = <&topckgen CLK_TOP_USB30_SEL>,
> +		 <&pericfg CLK_PERI_USB0>,
> +		 <&pericfg CLK_PERI_USB1>;
> +	clock-names = "sys_ck",
> +		      "wakeup_deb_p0",
> +		      "wakeup_deb_p1";
> +	vusb33-supply = <&mt6397_vusb_reg>;
> +	vbus-supply = <&usb_p0_vbus>;
> +	extcon = <&extcon_usb>;
> +	dr_mode = "otg";
> +	mediatek,enable-wakeup;
> +	mediatek,syscon-wakeup = <&pericfg>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	ranges;
> +	status = "disabled";
> +
> +	usb_host: xhci@11270000 {
> +		compatible = "mediatek,mt8173-xhci";
> +		reg = <0 0x11270000 0 0x1000>;
> +		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> +		power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> +		clocks = <&topckgen CLK_TOP_USB30_SEL>;
> +		clock-names = "sys_ck";
> +		vusb33-supply = <&mt6397_vusb_reg>;
> +		status = "disabled";
> +	};
> +};
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
