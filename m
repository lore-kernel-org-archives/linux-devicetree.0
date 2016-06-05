From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2,3/5] dt-bindings: mtu3: add devicetree bindings
Date: Sun, 5 Jun 2016 17:33:32 +0800
Message-ID: <1465119212.11651.141.camel@mhfsdcap03>
References: <1464673962-11506-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1464673962-11506-4-git-send-email-chunfeng.yun@mediatek.com>
	 <5751874C.9070100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5751874C.9070100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2016-06-03 at 15:34 +0200, Matthias Brugger wrote:
> 
> On 31/05/16 07:52, Chunfeng Yun wrote:
> > add a DT binding doc for MediaTek USB3 DRD driver
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   Documentation/devicetree/bindings/usb/mtu3.txt |   85 ++++++++++++++++++++++++
> >   1 file changed, 85 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/usb/mtu3.txt
> >
> > diff --git a/Documentation/devicetree/bindings/usb/mtu3.txt b/Documentation/devicetree/bindings/usb/mtu3.txt
> > new file mode 100644
> > index 0000000..571ae8b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/mtu3.txt
> 
> The file should be called mt8173-mtu3.txt to be in line with mt8173-xhci.txt
> Ok, I will rename it
> 
> > @@ -0,0 +1,85 @@
> > +The device node for Mediatek USB3.0 DRD controller
> > +
> > +Required properties:
> > + - compatible : should be "mediatek,mt8173-mtu3"
> > + - reg : specifies physical base address and size of the registers
> > + - reg-names: should be "mac" for device IP and "ippc" for IP port control
> > + - interrupts : interrupt used by the device IP
> > + - power-domains : a phandle to USB power domain node to control USB's
> > +	mtcmos
> > + - vusb33-supply : regulator of USB avdd3.3v
> > + - clocks : a list of phandle + clock-specifier pairs, one for each
> > +	entry in clock-names
> > + - clock-names : must contain "sys_ck" for clock of controller;
> > +	"wakeup_deb_p0" and "wakeup_deb_p1" are optional, they are
> > +	depends on "mediatek,enable-wakeup"
> > + - phys : a list of phandle + phy specifier pairs
> > + - dr_mode : should be one of "host", "peripheral" or "otg",
> > +	refer to usb/generic.txt
> > +
> > +Optional properties:
> > + - #address-cells, #size-cells : should be '2' if the device has sub-nodes
> > +	with 'reg' property
> > + - ranges : allows valid 1:1 translation between child's address space and
> > +	parent's address space
> > + - extcon : external connector for vbus and idpin changes detection, needed
> > +	when supports dual-role mode.
> > + - vbus-supply : reference to the VBUS regulator, needed when supports
> > +	dual-role mode.
> > + - pinctl-names : a pinctrl state named "default" must be defined,
> > +	"id_float" and "id_ground" are optinal which depends on
> > +	"mediatek,enable-manual-drd"
> 
> So pinctrl is optional, but if you put it, you need at least "default"?
Yes, the first one is "default".

> 
> Apart from that, DT maintainers prefer to have the binding patches at 
> the beginning of a series, so it's easier for them to not oversee any.
> Ok.

Thanks a lot.
> Regards,
> Matthias



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
