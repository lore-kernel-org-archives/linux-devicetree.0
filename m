From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC 2/2] mux: mmio-based syscon mux controller
Date: Wed, 19 Apr 2017 18:32:34 +0200
Message-ID: <1492619554.2970.176.camel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
         <20170413154812.19597-2-p.zabel@pengutronix.de>
         <58fd5844-f24a-37cc-be81-26a716251860@gmail.com>
         <1492602613.2970.92.camel@pengutronix.de>
         <e4d4b515-e799-9594-f88a-de9d8a5d14bb@axentia.se>
         <1492615640.2970.145.camel@pengutronix.de>
         <c45fb784-e4ef-c5a8-3ae9-df1870c9e4a6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c45fb784-e4ef-c5a8-3ae9-df1870c9e4a6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-04-19 at 09:23 -0700, Steve Longerbeam wrote:
> 
> On 04/19/2017 08:27 AM, Philipp Zabel wrote:
> > On Wed, 2017-04-19 at 13:58 +0200, Peter Rosin wrote:
> >> On 2017-04-19 13:50, Philipp Zabel wrote:
> >>> On Thu, 2017-04-13 at 18:09 -0700, Steve Longerbeam wrote:
> >>>>
> >>>> On 04/13/2017 08:48 AM, Philipp Zabel wrote:
> >>>>> This adds a driver for mmio-based syscon multiplexers controlled by a
> >>>>> single bitfield in a syscon register range.
> >>>>>
> >>>>> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >>>>> ---
> >>>>>   drivers/mux/Kconfig      |  13 +++++
> >>>>>   drivers/mux/Makefile     |   1 +
> >>>>>   drivers/mux/mux-syscon.c | 130 +++++++++++++++++++++++++++++++++++++++++++++++
> >>>>>   3 files changed, 144 insertions(+)
> >>>>>   create mode 100644 drivers/mux/mux-syscon.c
> >>>>>
> >>>>> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> >>>>> index 86668b4d2fc52..a5e6a3b01ac24 100644
> >>>>> --- a/drivers/mux/Kconfig
> >>>>> +++ b/drivers/mux/Kconfig
> >>>>> @@ -43,4 +43,17 @@ config MUX_GPIO
> >>>>>   	  To compile the driver as a module, choose M here: the module will
> >>>>>   	  be called mux-gpio.
> >>>>>
> >>>>> +config MUX_SYSCON
> >>>>
> >>>> my preference would be CONFIG_MUX_MMIO.
> >>>>
> >>>>> +	tristate "MMIO bitfield-controlled Multiplexer"
> >>>>
> >>>> "MMIO register bitfield-controlled Multiplexer"
> >>>>
> >>>> The rest looks good to me.
> >>>
> >>> I'll change those. mux-syscon.c should probably be renamed to
> >>> mux-mmio.c, too.
> >>
> >> I think I disagree. But I'm not familiar with syscon so I don't know.
> >> IIUC, syscon uses regmap to do mmio and this driver requires syscon
> >> to get at the regmap, and in the end this driver doesn't know anything
> >> about mmio. All it knows is syscon/regmap.
> >
> > That is a good point. Right now there is nothing MMIO about the driver
> > except for the hardware that I want it to handle.
> >
> >>  If some warped syscon
> >> thing shows up that wraps something other than mmio in its regmap,
> >> this driver wouldn't care about it. And syscon is something that
> >> is also known in the DT world. Given that, I think everything in this
> >> driver should be named syscon and not mmio.
> >>
> 
> My argument against using the name "syscon" in the device tree is that
> it is referring to a subsystem in the Linux kernel. Besides the fact
> that "syscon" does not clearly describe, at least to me, what sort of
> device this mux is.

If I'm not mistaken, this point was not about the DT compatible
property, just about the driver name.

I'm also in favor of keeping the "syscon" name out of the device tree as
far as it is still possible, for the same reasons. The i.MX6 muxes are
MMIO register bitfield muxes, but not "syscon muxes".

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
