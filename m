From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 8/9 v2] usb: usb251xb: Add max power/current dts property
 support
Date: Thu, 21 Sep 2017 20:10:22 +0300
Message-ID: <20170921171022.GA13721@mobilestation>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-9-fancer.lancer@gmail.com>
 <20170920205255.5txbub3y6v6avolh@rob-hp-laptop>
 <20170920212739.GB3547@mobilestation>
 <CAL_Jsq+ftbGSQOOor_1L9NO9h7rjYm9nB26PxNOPgyHU6k3j_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+ftbGSQOOor_1L9NO9h7rjYm9nB26PxNOPgyHU6k3j_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 11:26:04AM -0500, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Sep 20, 2017 at 4:27 PM, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Sep 20, 2017 at 03:52:55PM -0500, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >> On Sat, Sep 16, 2017 at 01:42:19PM +0300, Serge Semin wrote:
> >> > This parameters may be varied in accordance with hardware specifics.
> >> > So lets add the corresponding settings to the usb251x driver dts
> >> > specification.
> >> >
> >> > Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> > ---
> >> >  Documentation/devicetree/bindings/usb/usb251xb.txt   |  6 ++++++
> >> >  drivers/usb/misc/usb251xb.c                          | 20 ++++++++++++++++----
> >> >  2 files changed, 22 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> >> > index 3d84626d3..dd59a32e7 100644
> >> > --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> >> > +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> >> > @@ -44,6 +44,12 @@ Optional properties :
> >> >     device connected.
> >> >   - sp-disabled-ports : Specifies the ports which will be self-power disabled
> >> >   - bp-disabled-ports : Specifies the ports which will be bus-power disabled
> >> > + - sp-max-{power,current} : Indicates the power/current consumed by hub from
> >> > +   an upstream port (VBUS) when operation as a self-powered hub. The value
> >> > +   is given in mA in a 0 - 100 range (default is 1mA).
> >> > + - bp-max-{power,current} : Indicates the power/current consumed by hub from
> >> > +   an upstream port (VBUS) when operation as a bus-powered hub. The value
> >> > +   is given in mA in a 0 - 510 range (default is 100mA).
> >>
> >> These need units as defined in property-units.txt.
> >>
> >
> > Ok.
> >
> >> Why do you need power and current? Can't you calculate power?
> >>
> >
> > These are different parameters of the device. They got different configuration
> > registers and descriptions:
> > max_power* - ... This value also includes the power consumption of a
> > permanently attached peripheral if the hub is configured as a compound
> > device, and the embedded peripheral reports 0mA in its descriptors.
> > max_current* - ... This value does NOT include the power consumption of a
> > permanently attached peripheral if the hub is configured as a compound
> > device.
> 
> Then the names here should somehow reflect the above. Perhaps
> "composite-current" and "hub-current" or something like that.
> 

I left the naming in accordance with the device datasheet. I thought it would be
better since the driver user would still need to consult with the device
documentation to properly set them. I don't really get how the difference is reflected
with the naming declared there though. So what naming would you prefer then? Might be
something like:
{sp,bp}-max-total-current - for so named {sp,bp}-max-power, since it includes all the
permanently attached peripherals.
{sp,bp}-max-removable-current - for so named {sp,bp}-max-current, since it doesn't
include the permanently attached peripherals.

Or is it better to leave it in compliance with the documentation naming?

> >
> > Additionally as you can see, they both are measured in "mA", so it isn't
> > a real physical power.
> 
> Well, I can't because there's no units.
> 

What this line means then?
- sp-max-{power,current} : ... The value is given in mA in a 0 - 100 range (default is 1mA).
- bp-max-{power,current} : ... The value is given in mA in a 0 - 510 range (default is 100mA).

Maybe I don't know something and the description line should state the units somehow
clearer?

> Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
