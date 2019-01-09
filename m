Return-Path: <SRS0=3w+2=PR=linux.intel.com=andriy.shevchenko@kernel.org>
Date: Wed, 9 Jan 2019 18:05:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: sc16is7xx: Add alternative
 clock-frequence property
Message-ID: <20190109160532.GH9170@smile.fi.intel.com>
References: <20181205141133.9305-1-andriy.shevchenko@linux.intel.com>
 <ff94d003-6636-169b-7a89-fdc4bf9c39b5@mentor.com>
 <20181207134844.GH10650@smile.fi.intel.com>
 <720a0834-c0a5-6fe6-3907-8811b2f0d315@mentor.com>
 <20181207170956.GP10650@smile.fi.intel.com>
 <20181219202734.GA31178@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181219202734.GA31178@bogus>
To: Rob Herring <robh@kernel.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-acpi@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org, Georgii Staroselskii <georgii.staroselskii@emlid.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 19, 2018 at 02:27:34PM -0600, Rob Herring wrote:
> On Fri, Dec 07, 2018 at 07:09:56PM +0200, Andy Shevchenko wrote:
> > (Cc: Rafael and linux-acpi. Rafael, a short context for you, there is a device
> >  connected externally to the IoT ACPI-enabled x86-board via I2C bus. The driver
> >  needs a clock frequency used inside that device to perform correctly, since
> >  ACPI has not yet concept of clock provider I proposed to add a property widely
> >  used for other IPs in a similar way, but DT people strongly reject my
> >  approach. If you may have a chance to look and maybe suggest the approach
> >  which satisfies both sides, it would be really nice!)
> 
> One person does not equate to 'DT people'.

Sorry for that.

> Actually, I'm fine with this change. I don't think we should necessarily 
> require using the clock binding in simple cases just needing to know 
> what a particular clock frequency is.
> 
> However, ACPI not having a clock provider is not an argument for DT 
> bindings. The whole notion of sharing them in the first place is flawed.

Yeah, I can't object this. However we have a real customer with real needs.
Perhaps some additional warning should be added to code / device binding to
make clear that this is temporary and exclusively to fill the gap of ACPI
coverage?

> Rob

Thanks for review!
I will rebase and resend later this series.

> 
> > 
> > On Fri, Dec 07, 2018 at 06:05:14PM +0200, Vladimir Zapolskiy wrote:
> > > On 12/07/2018 03:48 PM, Andy Shevchenko wrote:
> > > > On Fri, Dec 07, 2018 at 10:18:26AM +0200, Vladimir Zapolskiy wrote:
> > > >> On 12/05/2018 04:11 PM, Andy Shevchenko wrote:
> > > >>> For the platforms which have no clock provider for the sc16is7xx type of UART,
> > > >>> introduce an alternative clock-frequency property which would be used instead.
> > > >>
> > > >> the subject has a typo in 'clock-frequence', then can you please tell me more,
> > > >> how is it possible that an SC16IS7xx IC has no clock provider connected to it?
> > > > 
> > > > I better ask Grigorii about this, since I have no hardware at my possession.
> > > > 
> > > >> And if there is one, then please just describe it in device tree as well.
> > > > 
> > > > Tell me how to do this for ACPI?
> > > > 
> > > 
> > > I didn't grasp the connection between your update of IC device tree bindings
> > > and ACPI, please elaborate in the context of updating device tree bindings
> > > documentation and supported properties.
> > 
> > OK.
> > 
> > > I do care about purity of device tree bindings of SC16IS7xx IC, which is
> > > found on some of my boards with description in DTB, that's why I object to
> > > this series.
> > 
> > I also support the purity of many drivers and modules in the software (Linux
> > kernel), but because of existing hardware and customers I can't reject their
> > needs. That's why, unfortunately, the drivers' code is full of quirks.
> > 
> > If I would object on each of those cases, I would end up with the OS which
> > supports almost nothing.
> > 
> > > >>> +- clock-frequency: The source clock frequency for the IC.
> > > >>>  
> > > >>
> > > >> I strongly dislike this change, I'm inclined to cast a NAK to the series.
> > > > 
> > > > To be productive, please propose the alternative, otherwise your NAK is nothing
> > > > to do with a real hardware and approach I proposed.
> > > 
> > > As I've said 'clock-frequency' property is not a hardware property of SC16IS7xx
> > > IC, it is a hardware property of some external hardware component, it may
> > > provide a volatile clock rate, which you miss, and it should be described
> > > separately in DT.
> > 
> > I disagree with you.
> > 
> > Crystal or PLL or another clock source, even being external component, still is
> > internal to the blackbox called UART-I2C adapter.
> > 
> > > The current approach with 'clocks' property addresses all cases perfectly,
> > > even if your change is an attempt to solve some actual problem, you haven't
> > > managed to describe it in the commit message.
> > 
> > I will fix the commit message. I agree it's not perfect.
> > 
> > > NAK for the added property, which makes obtaining of the clock supplier
> > > frequency equivocal.
> > 
> > Your NAK is nothing w/o proposed alternative which would work in a case of ACPI
> > enabled platform.
> > 
> > > >> 1. 'clock-frequency' is a very specific device tree property, in my opinion
> > > >>     its presence is justified on sort of clock provider devices only (like I2C
> > > >>     controllers), unfortunately the property was added to a number of device
> > > >>     tree bindings improperly, mainly it was done before introduction of
> > > >>     "assigned-clocks" and "assigned-clock-parents" properties in CCF, and then
> > > >>     it was blindly copied.
> > > > 
> > > > OK, I will wait for your patch to remove such from, for example, 8250_dw.c
> > > > where same problem had been targeted in the same way.
> > > 
> > > I'm not interested to fix legacy device tree binding issues added in 2011,
> > > equally I'm not going to close my eyes on right the same issues, when someone
> > > attempts to spread them further today.
> > 
> > Any proposal, be constructive, please.
> > 
> > > >> 2. SC16IS7xx type of UARTs is a regular clock consumer, ICs always have a valid
> > > >>    clock provider connected to XTAL1 (and XTAL2 in case of a connected
> > > >>    crystal oscillator), thus, if needed, the driver can get input clock rate
> > > >>    by calling standard clk_get_rate(), so the presence of the required 'clocks'
> > > >>    property is sufficient.
> > > > 
> > > > So what?
> > > > There is a hardware, there is a clock provider hidden in it. How you would
> > > > describe it? Platform data? Why?
> > > > 
> > > 
> > > What do you mean by 'hardware'? PCB, SC16IS7xx IC or something else?
> > > 
> > > What do you mean by 'a clock provider hidden in it'?
> > > 
> > > Please find the hidden clock provided and describe it in a proper way, for DTS
> > > changes please reference to Documentation/devicetree/bindings/clock contents.
> > 
> > Again, try to think about the world not being just arm + dts.
> > 
> > > >> 3. In some very specific corner cases it might be needed to add another
> > > >>    "assigned-clocks" and "assigned-clock-parents" properties to a particular
> > > >>    device node on a particular board, but their explicit description in device
> > > >>    tree bindings is not needed.
> > > > 
> > > > Can DT people once in life think outside the box?!
> > > > 
> > > 
> > > The rhetorical question doesn't sound like a nice supporting argument of
> > > your change.
> > > 
> > > Please don't slip into arrogance, and please concentrate on technical aspects.
> > 
> > Please, read your sentence above and tell me what the alternative I have?
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 

-- 
With Best Regards,
Andy Shevchenko
