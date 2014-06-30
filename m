From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] usb: gadget: pxa27x_udc device-tree documentation
Date: Mon, 30 Jun 2014 09:49:13 +0100
Message-ID: <20140630084913.GO7262@leverpostej>
References: <1403427899-32154-1-git-send-email-robert.jarzmik@free.fr>
 <1403427899-32154-2-git-send-email-robert.jarzmik@free.fr>
 <20140625103357.GC14495@leverpostej>
 <87zjh07okm.fsf@free.fr>
 <20140626085950.GJ15240@leverpostej>
 <87fviooygi.fsf@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87fviooygi.fsf-GANU6spQydw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 29, 2014 at 10:29:49AM +0100, Robert Jarzmik wrote:
> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
> 
> > On Wed, Jun 25, 2014 at 08:54:01PM +0100, Robert Jarzmik wrote:
> >> > The name of the clock input doesn't make sense.
> >> I don't understand. With [1] does it make any more sense ? If not you'll have to
> >> expand a bit more the "doesn't make sense".
> >
> > My concern is that clock-names is supposed to describe the name of the
> > input clock line from the view of the IP block. "pxa27x-udc" doesn't
> > sound like the name of a clock input line from the view of the UDC
> > block.
> >
> > I assume the clock input line you care about has a more specific name
> > than "pxa27x-udc"?
> Not as far as I know. The technical reference manual call it "udc clock", so
> it's even "less" specific ...

Not from the point of view of the device. The clock-names are namespaced
to the particular binding, so they're equally specific.

Given the above I'd recommend naming the clock "udc" or "udc_clk". That
doesn't pretend to be overly specific, and matches the TRM.

> Marvell engineers have probably the internal schematics and the name of the
> clock, but outsiders like me only have "udc" ...

Sure, not having the full specs is always a pain.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
