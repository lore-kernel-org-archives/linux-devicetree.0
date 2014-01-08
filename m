From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Add support for devicetree instantiation
Date: Wed, 8 Jan 2014 11:59:14 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1401081151300.1659-100000@iolanthe.rowland.org>
References: <52CC7117.3010704@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52CC7117.3010704-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 7 Jan 2014, Hans de Goede wrote:

> Hi,
> 
> On 01/07/2014 10:16 PM, Arnd Bergmann wrote:
> > On Tuesday 07 January 2014 22:03:11 Hans de Goede wrote:
> >>>> +
> >>>> +Optional properties:
> >>>> + - clocks: array of clocks
> >>>> + - clock-names: clock names "ahb" and/or "ohci"
> >>>
> >>> Where does "ahb" come from, what does it mean, and how is it relevant
> >>> to generic platforms?
> >>
> >> ahb is an ARM specific thing, so your right it does not belong in a
> >> generic driver. I'll use clk1 and clk2 as names in my next version.
> >
> > While AHB is a bus created by ARM Ltd, it's not actually specific
> > to the ARM architecture. My guess is that it is in fact used on 95%
> > of all SoCs, so I would leave it at that. For the other clock, I
> > think that's actually the bus clock for the USB interface, so I would
> > not call it "ohci" but rather just "usb" or "phy".
> >
> > I think it's important to distinguish the names and not just use
> > "clk1" and "clk2", because the driver may actually want to access
> > a particular clock in some scenario.
> 
> The idea here is to have a generic driver, if a driver needs to know
> about a specific clock, it will likely be another device specific
> driver and it can use its own dt-bindings and clock names. I believe
> that for a generic driver meant to cover common hardware configs,
> simply having X clks and then on power_on enabling clk1, then clk2,
> then clk3, etc. and on power off do the same in reverse other is
> a good approach.

I agree.

Alan Stern


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
