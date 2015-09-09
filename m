From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 2/5] dt-bindings: Add a binding for Mediatek xHCI host
 controller
Date: Tue, 8 Sep 2015 19:30:40 -0500
Message-ID: <55EF7DB0.7040607@kernel.org>
References: <1441693083-8440-1-git-send-email-chunfeng.yun@mediatek.com>
 <1441693083-8440-3-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441693083-8440-3-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/08/2015 01:18 AM, Chunfeng Yun wrote:
> add a DT binding documentation of xHCI host controller for the
> MT8173 SoC from Mediatek.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/mt8173-xhci.txt        | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> new file mode 100644
> index 0000000..d851bf1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> @@ -0,0 +1,52 @@
> +MT8173 xHCI
> +
> +The device node for Mediatek SOC USB3.0 host controller
> +
> +Required properties:
> + - compatible : should contain "mediatek,mt8173-xhci"
> + - reg : specifies physical base address and size of the registers,
> +	the first one for MAC, the second for IPPC
> + - interrupts : interrupt used by the controller
> + - power-domains : a phandle to USB power domain node to control USB's
> +	mtcmos
> + - vusb33-supply : regulator of USB avdd3.3v
> +
> + - clocks : a list of phandle + clock-specifier pairs, one for each
> +	entry in clock-names
> + - clock-names : must contain
> +	"sys_ck": for clock of xHCI MAC
> +	"wakeup_deb_p0": for USB wakeup debounce clock of port0
> +	"wakeup_deb_p0": for USB wakeup debounce clock of port1
> +
> + - phys : a list of phandle + phy specifier pairs
> + - usb3-lpm-capable : supports USB3.0 LPM
> + - mediatek,syscon-wakeup : phandle to syscon used to access USB wakeup
> +	control register

Wake-up should probably be done in some generic way. That said, I don't
have a specific suggestion other than make it optional.

> + - mediatek,wakeup-src : 1: ip sleep wakeup mode; 2: line state wakeup
> +	mode; Others means don't enable wakeup source of USB

This should be optional rather than any other value meaning disabled.

> +
> +Optional properties:
> + - vbus-supply : reference to the VBUS regulator;
> +
> +Example:
> +usb30: usb@11270000 {
> +	compatible = "mediatek,mt8173-xhci";
> +	reg = <0 0x11270000 0 0x1000>,
> +	      <0 0x11280700 0 0x0100>;
> +	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> +	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> +	clocks = <&topckgen CLK_TOP_USB30_SEL>,
> +		 <&pericfg CLK_PERI_USB0>,
> +		 <&pericfg CLK_PERI_USB1>;
> +	clock-names = "sys_ck",
> +		      "wakeup_deb_p0",
> +		      "wakeup_deb_p1";
> +	phys = <&phy_port0 PHY_TYPE_USB3>,
> +	       <&phy_port1 PHY_TYPE_USB2>;
> +	vusb33-supply = <&mt6397_vusb_reg>;
> +	vbus-supply = <&usb_p1_vbus>;
> +	usb3-lpm-capable;
> +	mediatek,syscon-wakeup = <&pericfg>;
> +	mediatek,wakeup-src = <1>;
> +	status = "okay";
> +};
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
