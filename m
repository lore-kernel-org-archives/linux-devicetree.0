From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 1/5] dt-bindings: Add usb3.0 phy binding for MT65xx
 SoCs
Date: Fri, 11 Sep 2015 11:34:22 +0800
Message-ID: <1441942462.25974.0.camel@mhfsdcap03>
References: <1441693083-8440-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1441693083-8440-2-git-send-email-chunfeng.yun@mediatek.com>
	 <55EF7A70.1080701@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55EF7A70.1080701-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
On Tue, 2015-09-08 at 19:16 -0500, Rob Herring wrote:
> On 09/08/2015 01:17 AM, Chunfeng Yun wrote:
> > add a DT binding documentation of usb3.0 phy for MT65xx
> > SoCs from Mediatek.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> One comment, otherwise:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> > ---
> >  .../devicetree/bindings/phy/phy-mt65xx-usb.txt     | 69 ++++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
> > new file mode 100644
> > index 0000000..5812d20
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
> > @@ -0,0 +1,69 @@
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
> > +		  the controller's topology. These nodes are translated
> > +		  by the driver's .xlate() function.
> 
> The last sentence is Linux specific. Please remove.
> 
Ok, I will remove it later. Thanks
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
> > +	status = "okay";
> > +
> > +	phy_port0: port@11290800 {
> > +		reg = <0 0x11290800 0 0x800>;
> > +		#phy-cells = <1>;
> > +		status = "okay";
> > +	};
> > +
> > +	phy_port1: port@11291000 {
> > +		reg = <0 0x11291000 0 0x800>;
> > +		#phy-cells = <1>;
> > +		status = "okay";
> > +	};
> > +};
> > +
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
> > 
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
