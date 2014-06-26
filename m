From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] usb: gadget: pxa27x_udc device-tree documentation
Date: Thu, 26 Jun 2014 09:59:51 +0100
Message-ID: <20140626085950.GJ15240@leverpostej>
References: <1403427899-32154-1-git-send-email-robert.jarzmik@free.fr>
 <1403427899-32154-2-git-send-email-robert.jarzmik@free.fr>
 <20140625103357.GC14495@leverpostej>
 <87zjh07okm.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87zjh07okm.fsf-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 25, 2014 at 08:54:01PM +0100, Robert Jarzmik wrote:
> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
> 
> > On Sun, Jun 22, 2014 at 10:04:58AM +0100, Robert Jarzmik wrote:
> >> index 79729a9..0e4863f 100644
> >> --- a/Documentation/devicetree/bindings/usb/pxa-usb.txt
> >> +++ b/Documentation/devicetree/bindings/usb/pxa-usb.txt
> >> @@ -29,3 +29,23 @@ Example:
> >>  		marvell,port-mode = <2>; /* PMM_GLOBAL_MODE */
> >>  	};
> >>  
> >> +UDC
> >> +
> >> +Required properties:
> >> + - compatible: Should be "marvell,pxa27x-udc" for USB controllers
> >> +   used in device mode.
> >
> > We typically don't like wildcard compatible strings in DT.
> Same as in the other patch, "marvell,pxa270-udc".
> >
> >> +
> >> +Optional properties:
> >> + - "udc-pullup-gpio" - gpio activated to control the USB D+ pullup.
> >> + - "udc-pullup-gpio-inverted" - boolean inverting gpio pullup logic.
> >
> > Use the GPIO bindings.
> OK. I'm presuming in this case you think of something like :
> 	udc-pullup-gpio = <&gpio 22 GPIO_ACTIVE_LOW>
> Which translates into:
> 	"udc-pullup-gpio" - gpio activated to control the USB D+ pullup (see
>         gpio.txt)

Something like that, yes.

> >
> >> +
> >> +Example:
> >> +
> >> +		pxa27x_udc: udc@40600000 {
> >> +			compatible = "marvell,pxa27x-udc";
> >> +			reg = <0x40600000 0x10000>;
> >> +			interrupts = <11>;
> >> +			clocks = <&pxa2xx_clks 11>;
> >> +			clock-names = "pxa27x-udc";
> >
> > Neither of these were mentioned above.
> Ah you mean I shall describe the standard reg, interrupts as mandatory standard
> options I take it. OK.

Yes. While the properties are standard, their precise meanings (e.g.
which interrupt or address space region), and whether a particular
binding uses them is not.

> > The name of the clock input doesn't make sense.
> I don't understand. With [1] does it make any more sense ? If not you'll have to
> expand a bit more the "doesn't make sense".

My concern is that clock-names is supposed to describe the name of the
input clock line from the view of the IP block. "pxa27x-udc" doesn't
sound like the name of a clock input line from the view of the UDC
block.

I assume the clock input line you care about has a more specific name
than "pxa27x-udc"?

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
