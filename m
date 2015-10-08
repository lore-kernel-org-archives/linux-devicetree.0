From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 1/5] dt-bindings: Add usb3.0 phy binding for MT65xx
 SoCs
Date: Thu, 8 Oct 2015 19:27:39 +0800
Message-ID: <1444303659.26198.1.camel@mhfsdcap03>
References: <1443495698-32233-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1443495698-32233-2-git-send-email-chunfeng.yun@mediatek.com>
	 <560AA37E.2090106@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <560AA37E.2090106-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Tue, 2015-09-29 at 17:43 +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 09/29/2015 06:01 AM, Chunfeng Yun wrote:
> 
> > add a DT binding documentation of usb3.0 phy for MT65xx
> > SoCs from Mediatek.
> >
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   .../devicetree/bindings/phy/phy-mt65xx-usb.txt     | 68 ++++++++++++++++++++++
> >   1 file changed, 68 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
> >
> > diff --git a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
> > new file mode 100644
> > index 0000000..00100cf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
> > @@ -0,0 +1,68 @@
> > +mt65xx USB3.0 PHY binding
> > +--------------------------
> > +
> > +This binding describes a usb3.0 phy for mt65xx platforms of Medaitek SoC.
> > +
> > +Required properties (controller (parent) node):
> > + - compatible	: should be "mediatek,mt8173-u3phy"
> > + - reg		: offset and length of register for phy, exclude port's
> > +		  register.
> > + - clocks	: a list of phandle + clock-specifier pairs, one for each
> > +		  entry in clock-names
> > + - clock-names	: must contain
> > +		  "u3phya_ref": for reference clock of usb3.0 analog phy.
> > +
> > +Required nodes	: a sub-node is required for each port the controller
> > +		  provides. Address range information including the usual
> > +		  'reg' property is used inside these nodes to describe
> > +		  the controller's topology.
> > +
> > +Required properties (port (child) node):
> > +- reg		: address and length of the register set for the port.
> > +- #phy-cells	: should be 1 (See second example)
> > +		  cell after port phandle is phy type from:
> > +			- PHY_TYPE_USB2
> > +			- PHY_TYPE_USB3
> > +
> > +Example:
> > +
> > +u3phy: usb-phy@11290000 {
> > +	compatible = "mediatek,mt8173-u3phy";
> > +	reg = <0 0x11290000 0 0x800>;
> > +	clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
> > +	clock-names = "u3phya_ref";
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +	ranges;
> 
>     You don't describe the above 3 props neither as mandatory nor optional.
> 
I will describe them as mandatory properties later.

> [...]
> > +Specifying phy control of devices
> > +---------------------------------
> > +
> > +Device nodes should specify the configuration required in their "phys"
> > +property, containing a phandle to the phy port node and a device type;
> > +phy-names for each port are optional.
> > +
> > +Example:
> > +
> > +#include <dt-bindings/phy/phy.h>
> > +
> > +usb30: usb@11270000 {
> > +	...
> > +	phys = <&phy_port0 PHY_TYPE_USB3>;
> > +	phy-names = "usb3-0";
> > +	...
> > +};
> 
>     Isn't the above already described in 
> Documentation/devicetree/bindings/phy/phy-bindings.txt?
> 
The usage is already described in phy-bindings.txt.
But many phy binding documents include a simple example, so I add it
too.

Thanks a lot

> MBR, Sergei
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
