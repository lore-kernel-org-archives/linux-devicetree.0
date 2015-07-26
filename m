From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: Add a binding for Mediatek xHCI
 host controller
Date: Sun, 26 Jul 2015 11:45:25 +0800
Message-ID: <1437882325.3040.22.camel@mhfsdcap03>
References: <1437573945-31586-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1437573945-31586-3-git-send-email-chunfeng.yun@mediatek.com>
	 <20150722142208.GC15809@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150722142208.GC15809@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Wed, 2015-07-22 at 15:22 +0100, Mark Rutland wrote:
> On Wed, Jul 22, 2015 at 03:05:42PM +0100, Chunfeng Yun wrote:
> > add a DT binding documentation of xHCI host controller for the
> > MT8173 SoC from Mediatek.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/mt8173-xhci.txt        | 50 ++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mt8173-xhci.txt b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > new file mode 100644
> > index 0000000..444494d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mt8173-xhci.txt
> > @@ -0,0 +1,50 @@
> > +MT65XX xhci
> > +
> > +The device node for Mediatek SOC usb3.0 host controller
> > +
> > +Required properties:
> > + - compatible : supports "mediatek,mt8173-xhci"
> > + - reg        : Offset and length of registers
> 
> Your example has multiple reg entries.
> 
> Please list what each entry is, and the order you expect them in.
> 
Ok
> > + - interrupts : Interrupt mode, number and trigger mode
> > + - power-domains: to enable usb's mtcmos
> > + - vusb33-supply:  regulator of usb avdd3.3v
> > + - clocks     : must support all clocks that xhci needs
> > + - clock-names: should be "sys_mac" for sys and mac clocks, and
> > +	"wakeup_deb_p0", "wakeup_deb_p1" for wakeup debounce control
> > +	clocks
> > + - phys	: the phys that xhci will bind, currently supports up to two
> > +	phys, so phy index should not greater than one.
> > + - phy-names : should be "phy-X" format, X equals to 0 or 1
> 
> This seems somewhat pointless.
> 
I'll describe it more exactly.

> > + - usb3-lpm-capable: supports USB3 LPM
> > + - mediatek,usb-wakeup: to access usb wakeup control register
> 
> What exactly does this property imply?
> 
There are some control registers for usb wakeup which are put in another
module, here to get the node of that module, and then use regmap and
syscon to operate it.

> > + - mediatek,wakeup-src: 1: ip sleep wakeup mode; 2: line state wakeup
> > +	mode; others means don't enable wakeup source of usb
> 
> This sounds like configuration rather than a hardware property. Why do
> you think this needs to be in the DT?
> 
Yes, it's better to put it in the DT. 

> > + - mediatek,u2port-num: the number should not greater than the number
> > +	of phys
> 
> What exactly does this property imply?
> 
On some platform, it only makes use of partial usb ports, so disable
others to save power.

> Mark.
> 
> > +
> > +Optional properties:
> > + - vbus-supply : reference to the VBUS regulator;
> > +
> > +Example:
> > +usb: usb30@11270000 {
> > +	compatible = "mediatek,mt8173-xhci";
> > +	reg = <0 0x11270000 0 0x4000>,
> > +	      <0 0x11280000 0 0x0800>;
> > +	interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> > +	power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> > +	clocks = <&topckgen CLK_TOP_USB30_SEL>,
> > +		 <&pericfg CLK_PERI_USB0>,
> > +		 <&pericfg CLK_PERI_USB1>;
> > +	clock-names = "sys_mac",
> > +		      "wakeup_deb_p0",
> > +		      "wakeup_deb_p1";
> > +	phys = <&u3phy 0>, <&u3phy 1>;
> > +	phy-names = "phy-0", "phy-1";
> > +	vusb33-supply = <&mt6397_vusb_reg>;
> > +	vbus-supply = <&usb_p1_vbus>;
> > +	usb3-lpm-capable;
> > +	mediatek,usb-wakeup = <&pericfg>;
> > +	mediatek,wakeup-src = <1>;
> > +	mediatek,u2port-num = <2>;
> > +	status = "okay";
> > +};
> > -- 
> > 1.8.1.1.dirty
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
