From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Sat, 30 May 2009 18:56:37 +0100
Message-ID: <20090530175636.GA6335@sirena.org.uk>
References: <20090527234801.GP6805@pengutronix.de>
	<4A1DD3A0.3010501@freescale.com>
	<20090528000707.GR6805@pengutronix.de>
	<20090527.171525.204909140.davem@davemloft.net>
	<20090528103745.GA19523@sirena.org.uk>
	<fa686aa40905281532l76996593ocdc36760eb468e04@mail.gmail.com>
	<20090529123411.GB14650@rakim.wolfsonmicro.main>
	<1243677166.440.12.camel@pasglop>
	<20090530102153.GA6910@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090530102153.GA6910-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org, timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 30, 2009 at 11:21:53AM +0100, Russell King - ARM Linux wrote:

> I think the first thing to do is to get an accurate description of the
> problem before thinking about how to come up with solutions.  I saw
> that this kept coming up in Mark's emails, so I asked him about it
> in private.

I have had these discussions in one form or another several times so
I've not really been going into any of the issues in enormous detail in
this thread.

> 2. inter-relationships between several clocks.  To take his example,
>    for clocking a DAC and ADC, you may have three clocks (dac_clk,
>    adc_clk and bclk).  You may want dac_clk to be xkHz, adc_clk ykHz
>    and bclk (which could well be related to both) to be zkHz.  For
>    each of these, you might be able to accept an error of so-many-
>    percent.

More generally this is a desire for a framework which can take the set
of clocks and constraints on them and automatically implement a viable
configuration for the system.  Since there are tradeoffs involved it's
not as straightfoward as it might be.  The things that give me headaches
when I consider this include:

 - PLLs/FLLs with varying degrees of configurability are available on
   some devices but burn power when used (this is one of the issues with
   the accuracy consideration you mention).
 - Many of the clocks can be either an input or an output.
 - Pretty much any aspect of the desired configuration can change at run
   time based on any part of the system - some of it is policy.

Within any one system there are normally simplifying assumptions which
make life a lot easier but these aren't available to generic code.

I think this is a solvable problem but it's not trivial and depends on
the clock API implementation improvements you have mentioned - since the
audio clocking is generally tied into the rest of the system clocking a
free standing solution is not going to cover everything.

> I believe (2) is an entirely separate problem to the device tree, and
> really shouldn't concern the device tree beyond, maybe, providing the
> contraints for individual clock _sources_.

That's not the impression that a lot of the device tree users give - the
expectation people seem to have is that they can put all the system
configuration that needs to be done into the device tree.  This means
that we end up needing to be able to either have software that can
decide the configuration for itself or be able to express the various
options in the device tree so that the configuration can be handed to
the kernel that way.  Given the whole OS neutrality thing I'm not sure
how far we can go beyond simply describing the hardware which tends to
suggest that automatic configuration is going to be needed to make
people happy.

> (1) on the other hand is related, but is not really a device tree problem.
> It's a problem with the way people use the API (even though that wrong
> usage is explicitly documented as being wrong, this doesn't stop people
> being lazy.)

I agree entirely with this; while there's work to do in this area I
don't see any fundamental problem with describing clock trees in either
the kernel or a device tree style format.
