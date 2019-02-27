From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/3] watchdog: orion: don't enable rstout if an interrupt
 is configured
Date: Wed, 27 Feb 2019 15:07:07 -0800
Message-ID: <20190227230707.GA28635@roeck-us.net>
References: <20171011022958.31268-1-chris.packham@alliedtelesis.co.nz>
 <20171011022958.31268-3-chris.packham@alliedtelesis.co.nz>
 <227eed69-c4c8-01a1-3c6b-6cf95e84a9cd@roeck-us.net>
 <4f82b24c3b244d3eba0f8de8cb25049f@svr-chch-ex1.atlnz.lc>
 <636717314b294a5f9a4ed1ffa44625c4@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <636717314b294a5f9a4ed1ffa44625c4@svr-chch-ex1.atlnz.lc>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "wim@iguana.be" <wim@iguana.be>, "gregory.clement@free-electrons.com" <gregory.clement@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2019 at 08:59:07PM +0000, Chris Packham wrote:
> Hijacking an old thread,
> 
> On 11/10/17 5:30 PM, Chris Packham wrote:
> > On 11/10/17 16:42, Guenter Roeck wrote:
> >> On 10/10/2017 07:29 PM, Chris Packham wrote:
> >>> The orion_wdt_irq invokes panic() so we are going to reset the CPU
> >>> regardless.  By not setting this bit we get a chance to gather debug
> >>> from the panic output before the system is reset.
> >>>
> >>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >>
> >> Unless I am missing something, this assumes that the interrupt is
> >> handled, ie that the system is not stuck with interrupts disabled.
> >> This makes the watchdog less reliable. This added verbosity comes
> >> at a significant cost. I'd like to get input from others if this
> >> is acceptable.
> >>
> >> That would be different if there was a means to configure a pretimeout,
> >> ie a means to tell the system to generate an irq first, followed by a
> >> hard reset if the interrupt is not served. that does not seem to be
> >> the case here, though.
> >>
> > 
> > As far as I can tell there is no pretimeout capability in the orion
> > /armada WDT. I have got a work-in-progress patch that enables the RSTOUT
> > in the interrupt handler which some-what mitigates your concern but
> > still requires the interrupt to be handled at least once.
> > 
> > Another option would be to use one of the spare global timers to provide
> > the interrupt-driven aspect.
> 
> So as Guenter rightly pointed out my original patch meant that we'd hang 
> if we got stuck in a loop with interrupts disabled. Shortly after that 
> that's exactly what happened on my test setup.
> 
> I've now been able to follow-up on the idea of using one of the spare 
> global timers as a pretimeout indication and it's looking pretty 
> promising. The patch is below (beware MUA wrapping). I'll submit it 
> properly but I'm wondering if I should add the timer1 based watchdog as 
> a separate watchdog device or like I have below roll it into the 
> existing watchdog device.
> 

Why not use a pretimeout ? Isn't this exactly what you are doing,
with a fixed pretimeout of timeout / 2 ?

Guenter
