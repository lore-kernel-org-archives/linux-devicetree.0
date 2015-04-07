From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: irqchip heirarchy DT "break" series awareness?
Date: Tue, 7 Apr 2015 13:06:38 +0000
Message-ID: <20150407130638.GE7873@io.lakedaemon.net>
References: <20150406144647.GC7873@io.lakedaemon.net>
 <20150407115922.5d4c6233@free-electrons.com>
 <5523AFAF.6040000@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5523AFAF.6040000-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 07, 2015 at 11:21:35AM +0100, Marc Zyngier wrote:
> Hi Thomas,
> 
> On 07/04/15 10:59, Thomas Petazzoni wrote:
> 
> > But the point of the slides stand: even for a piece of hardware as
> > well-documented as the GIC, as widely used as the GIC, with as many
> > bright and smart engineers looking into it, the community has not been
> > able to put out a DT binding that can be kept stable. How can we expect
> > such a DT binding stability to occur for undocumented hardware, or
> > SoC-specific hardware blocks that are definitely a lot less used than
> > the GIC ?
> 
> The problem at hand is not so much the GIC itself, but the fact that
> only the GIC was described in DT. The GIC binding is unchanged, but some
> additional hardware is now described.

Well, if that were the case we wouldn't have a break in DT
compatibility.  I suppose what we're going for here is "removed GIC
binding properties (arm,routable-irqs) that didn't describe hardware".
Similar for crossbar and the others that were inappropriately relying on
gic_arch_extn implementation to model the (incorrect) hardware
description.

> If the relationship between the GIC and the shadow interrupt controllers
> had been described, we would have avoided breaking the compatibility. I
> guess it was too tempting to reuse pre-DT mechanisms and to forget about
> this entirely.

I'm not sure tempting is the right word.  Everyone has known since this
project began that we were striving to describe the hardware.  I suspect
the reason we got to where we are is that people *assumed* the code was
describing the hardware, and so wrote bindings reflecting their
understanding.  iow, we don't have enough hardware engineers reviewing
bindings :-P

Be that as it may, I'm not trying to rehash the decision.  It's clearly
the correct thing to do.  Otherwise, I wouldn't have pulled it in.  What
I am trying to do here is make sure a) we have full awareness by
everybody not directly involved, and b) make sure I have my ducks in a
row if ThomasG/Linus raises questions regarding the pull request.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
