From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] ohci-platform: Add support for
 devicetree instantiation
Date: Tue, 07 Jan 2014 22:16:16 +0100
Message-ID: <4061478.AqT6BOpdOY@wuerfel>
References: <Pine.LNX.4.44L0.1401061043240.1282-100000@iolanthe.rowland.org> <52CC6B8F.5000404@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDEKVJM7XAHRBQO5WGLAKGQEHMOMA6Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52CC6B8F.5000404-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 07 January 2014 22:03:11 Hans de Goede wrote:
> >> +
> >> +Optional properties:
> >> + - clocks: array of clocks
> >> + - clock-names: clock names "ahb" and/or "ohci"
> >
> > Where does "ahb" come from, what does it mean, and how is it relevant
> > to generic platforms?
> 
> ahb is an ARM specific thing, so your right it does not belong in a
> generic driver. I'll use clk1 and clk2 as names in my next version.

While AHB is a bus created by ARM Ltd, it's not actually specific
to the ARM architecture. My guess is that it is in fact used on 95%
of all SoCs, so I would leave it at that. For the other clock, I
think that's actually the bus clock for the USB interface, so I would
not call it "ohci" but rather just "usb" or "phy".

I think it's important to distinguish the names and not just use
"clk1" and "clk2", because the driver may actually want to access
a particular clock in some scenario.

> > What about platforms that use 3 clocks?
> 
> Ah yes I see some platforms have 3 clocks, I'll also add a clk3.

I guess we should try to find at least one hardware data sheet
for an actual ohci implementation and look at what the clock
inputs are really called. A lot of the drivers seem to incorrectly
use the name for the clock signal inside of the soc, which tends
to be named after who provides it, not what it's used for.

	Arnd
