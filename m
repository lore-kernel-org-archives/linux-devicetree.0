From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Sat, 30 May 2009 19:52:46 +1000
Message-ID: <1243677166.440.12.camel@pasglop>
References: <20090527234801.GP6805@pengutronix.de>
	<4A1DD3A0.3010501@freescale.com> <20090528000707.GR6805@pengutronix.de>
	<20090527.171525.204909140.davem@davemloft.net>
	<20090528103745.GA19523@sirena.org.uk>
	<fa686aa40905281532l76996593ocdc36760eb468e04@mail.gmail.com>
	<20090529123411.GB14650@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090529123411.GB14650-HF5t3jzXg/6ND3a5+9QAFujbO/Zr0HzV@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


> Sure.  My only big concern with it is that it compeltely sidesteps
> clocking decisions so there's a lot of codecs it's not going to be
> immediately useful with and I don't have a clear idea how it could be
> extended to be so.  Most other things look like they can be added on
> fairly easily when required.

Regarding clocks ...

Paulus and I had a discussion the other day and he mentioned a very good
idea to represent the clock net in the device-tree.

Basically, do it just like the interrupts.

IE. A device would have a "clocks" property that contain a certain
amount of cells representing a clock source in a clock provider, itself
identified by a "clock-parent" property (default to the actual node
parent). Clock providers would have a #clock-cells to provide the number
of cells a in the "clocks" property for each clock source.

Actually, we could be a little bit smarter since clocks are more messy
than interrupts, and define "clocks" to be a serie of clock-parent
phandle and clock id within that parent. The clock id size is still
represented by the #clock-cells of the clock parent, but we avoid the
pitfall of the interrupt routing that makes it hard to connect to
multiple different PICs.

That would provide the routing, without actual values or capabilities of
each clock, that's orthogonal. But that would allow driver to easily
find their clock "provider" and we could thus provide some simple
infrastructure to register drivers or handlers to perform actions on
those clocks, such as refcounting users, etc...

It may also be useful to define properties in the clock controllers
themselves mapping clock IDs to actual frequencies or things like that
but I'm only half convinced here. IE. Let's start by defining the
-wiring- and leave the -values- (on,off, slewing, freq adjustement,
spreading) to an API between drivers and clock providers for now.

Maybe later with experience with can find good ways to extend the
device-tree representiation to provide actual clock settings and/or
tables.

Cheers,
Ben.
