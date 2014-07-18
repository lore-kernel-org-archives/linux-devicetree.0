From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 6/7] ARM: dts: rockchip: add core rk3288 dtsi
Date: Fri, 18 Jul 2014 11:49:03 +0200
Message-ID: <1405681459.GZ6IZjzim5@diego>
References: <4868343.UFgjaXesOn@diego> <14646641.DlFrJR068n@diego> <20140718093551.GE25180@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140718093551.GE25180@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, will.deacon-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

Am Freitag, 18. Juli 2014, 10:35:52 schrieb Mark Rutland:
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               cpu@500 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a12";
> > +                       reg = <0x500>;
> > +               };
> > +               cpu@501 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a12";
> > +                       reg = <0x501>;
> > +               };
> > +               cpu@502 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a12";
> > +                       reg = <0x502>;
> > +               };
> > +               cpu@503 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a12";
> > +                       reg = <0x503>;
> 
> I take it that we can only use one of these for the moment? I didn't see
> the addition of any SMP code.
> 
> Or did I miss that?
> 
> [...]
> 
> > +       timer {
> > +               compatible = "arm,armv7-timer";
> > +               interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> > IRQ_TYPE_LEVEL_HIGH)>, +                            <GIC_PPI 14
> > (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>, +                       
> >     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>, +       
> >                     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
> > IRQ_TYPE_LEVEL_HIGH)>; +               clock-frequency = <24000000>;
> > +       };
> 
> Please say you don't need this clock-frequency property.
> 
> It's a work-around at best, and you won't be able to use Hyp properly.
> I'd really like to discourage use of this property, especially as people
> seem to set it regardless of whether the hardware's correct...
> 
> What's the state of CNTFREQ and CNTVOFF, and is there any chance that
> these are sane?

Both issues you mention are actually connected - timer-issues in smp context 
due to CNTVOFF not being set correctly and CNTFREQ currently not being 
initialized.

I'm very hopeful that both should be resolved in the near future and Will 
should also be able to tell you more about this :-).
So for the short-term I guess the clock-frequency is needed, but we should be 
able to remove it again in the future, once the bootloader is doing the right 
thing.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
