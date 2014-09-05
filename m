From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] Documentation: bcm7120-l2: Add Broadcom BCM7120-style
 L2 binding
Date: Fri, 5 Sep 2014 22:44:36 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1409052224211.5472@nanos>
References: <1409265326-7579-1-git-send-email-f.fainelli@gmail.com> <1409265326-7579-3-git-send-email-f.fainelli@gmail.com> <alpine.DEB.2.10.1409031410580.3333@nanos> <20140903124317.GB3127@leverpostej> <5407490E.7060505@gmail.com> <20140905090528.GG2172@leverpostej>
 <5409FA82.6000703@gmail.com> <alpine.DEB.2.10.1409052113210.5472@nanos> <540A15AA.4000805@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <540A15AA.4000805@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, LKML <linux-kernel@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 5 Sep 2014, Florian Fainelli wrote:
> On 09/05/2014 12:21 PM, Thomas Gleixner wrote:
> > So if I understand correctly what you have is:
> > 
> >                           /- GIC------------->   
> >  Device-irq ---- [routing]
> >                           \- BC irq chip ---->
> > 
> > and you implement it as
> > 
> >  Device-irq ---- [BC irq chip] ---- [GIC] --->
> >                             |
> >                             ----------------->
> > 
> > And the fwd mask is to tell the BC chip to use the GIC and which irq
> > of the GIC, so it can fiddle with the GIC under the hood, right?
> 
> The forward mask really is to tell the BCM7120 l2 interrupt controller:
> bypass me, and output the UART interrupts directly at the GIC level, so
> I think this does match your understanding.
> 
> Not setting the forward mask means you would get the UART interrupts at
> the BCM7120 l2 interrupt controller level, and have to handle them here.
> 
> Hope this helps clarify what this funky piece of hardware does.

Sigh, this stacked interrupt chip nonsense is becoming a plague.

So if you set that bit then the UART driver only sees the GIC as its
interrupt controller and not the L2 thingy. So, the L2 chip only
enables its interrupt unconditionally for that line and the
enable/disable happens at the GIC level.

If that's the case, that's fine with me. It's not pretty, but at least
it does not involve L2 fiddling indirectly with the GIC.

Thanks,

	tglx
