From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: chosen: Add clocksource and clockevent
 selection
Date: Mon, 18 Dec 2017 20:46:37 +0100
Message-ID: <20171218204637.0ea1545c@bbrezillon>
References: <20171213185313.20017-1-alexandre.belloni@free-electrons.com>
        <20171213185313.20017-2-alexandre.belloni@free-electrons.com>
        <20171215113242.skmh5nzr7wqdmvnw@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215113242.skmh5nzr7wqdmvnw-agMKViyK24J5pKCnmE3YQBJ8xKzm50AiAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Dec 2017 11:32:42 +0000
Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:

> Hi,
> 
> On Wed, Dec 13, 2017 at 07:53:11PM +0100, Alexandre Belloni wrote:
> > The clocksource and clockevent timer are probed early in the boot process.
> > At that time it is difficult for linux to know whether a particular timer
> > can be used as the clocksource or the clockevent or by another driver,
> > especially when they are all identical or have similar features.  
> 
> I think that to solve this problem, we need to stop treating
> clocksources and clockevent devices as completely separate device types,
> and instead treat them as particular cases of a more general clock
> device.
> 
> That way, a driver can register a single device, with flags saying
> whether it is:
> 
> * a clocksource only
> * a clockevent device only
> * both a clocksource and clockevent device
> * both, but mutually exclusive at runtime
> 
> ... and thus drivers don't have to make an impossible decision up-front
> as to how the device should be used.
> 
> As more devices get registered, the core timekeeping code can improve on
> its choices and re-assign devices.

I'm coming back to the Atmel TCB use case. Say you have 2 'timers' one
has been assigned 2 channels (a channel is what I call TC in my
previous explanation) and the other one only one channel. Both timers
are capable of acting as a clockevent or a clocksource device (not
both at the same time). Now, the question is, how do you decide which
one is assigned the clocksource role and which one is assigned the
clkevent role. Do you plan to pass the expected clocksource/clkevent
properties (precision, max value, wraparound period, ...) through the
device tree so that the framework can decide which timer is best suited
for a specific feature?

> 
> That doesn't solve the case where a clock device may use resources we
> want for something else, but I think we can solve that separately.
> 
> Thanks,
> Mark.
> 
> > Until now, multiple strategies have been used to solve that:
> >  - use Kconfig option as MXC_USE_EPIT or ATMEL_TCB_CLKSRC_BLOCK
> >  - use a kernel parameter as the "clocksource" early_param in mach-omap2
> >  - registering the first seen timer as a clockevent and the second one as
> >  a clocksource as in rk_timer_init or dw_apb_timer_init
> > 
> > Add a linux,clocksource and a linux,clockevent node in chosen with a timer
> > property pointing to the timer to use. Other properties, like the targeted
> > precision may be added later.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/chosen.txt | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > index e3b13ea7d2ae..c7ee3ecb5276 100644
> > --- a/Documentation/devicetree/bindings/chosen.txt
> > +++ b/Documentation/devicetree/bindings/chosen.txt
> > @@ -120,3 +120,23 @@ e.g.
> >  While this property does not represent a real hardware, the address
> >  and the size are expressed in #address-cells and #size-cells,
> >  respectively, of the root node.
> > +
> > +linux,clocksource and linux,clockevent
> > +--------------------------------------
> > +
> > +Those nodes have a timer property. This property is a phandle to the timer to be
> > +chosen as the clocksource or clockevent. This is only useful when the platform
> > +has multiple identical timers and it is not possible to let linux make the
> > +correct choice.
> > +
> > +/ {
> > +	chosen {
> > +		linux,clocksource {
> > +			timer = <&timer0>;
> > +		};
> > +
> > +		linux,clockevent {
> > +			timer = <&timer1>;
> > +		};
> > +	};
> > +};
> > -- 
> > 2.15.1
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html  
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
