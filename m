From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Wed, 2 Oct 2013 20:33:16 +0100
Message-ID: <20131002193316.GR12758@n2100.arm.linux.org.uk>
References: <20130927151900.GA12758@n2100.arm.linux.org.uk> <CAHCPf3t8=mJn-RCz3C1cY6zqsH9ds8UANKpKx9ZpwPM6WjJt3g@mail.gmail.com> <20130927174916.GD12758@n2100.arm.linux.org.uk> <CAHCPf3sC7bY=p4vpBQFpRUmyPspT_PVjx0rH9cm1ov=SqkO+Vg@mail.gmail.com> <20130927190546.GG12758@n2100.arm.linux.org.uk> <CAHCPf3vxGAzTnY360KC7Yt-DB1FB14Sv_Cn7DBTH6HGZ6y=stg@mail.gmail.com> <CAHCPf3sv3wSbUc9QFVhmYsPc1kqiWYRuOMO7rreuiGSrwyepBQ@mail.gmail.com> <20130927202110.GI12758@n2100.arm.linux.org.uk> <20130928083859.GQ12758@n2100.arm.linux.org.uk> <20130929061303.GB26156@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130929061303.GB26156-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 29, 2013 at 02:13:05PM +0800, Shawn Guo wrote:
> On Sat, Sep 28, 2013 at 09:38:59AM +0100, Russell King - ARM Linux wrote:
> > Okay, the answer is that yes, GPR1 bit 21 should be clear on this version
> > of the hardware, but there's plans to have the IMX6 generate the clock
> > and remove the crystal for the AR8035.
> 
> Be careful, as mentioned in the reply to Matt, in that case, IMX6 can
> only output the clock on pad GPIO_16, and the clock has to be externally
> routed back to IMX6 on pad ENET_REF_CLK, so that ENET can get reference
> clock for RGMII mode.

Let me repeat that in case it was unclear.

The AR8035 on the current boards has a 25MHz crystal, and the AR8035 is
*currently* required to be programmed to generate a 125MHz clock back to
the IMX6 for the transmit timings.

In future, and on the real cubox-i, this crystal will not be present, and
it will be required that the IMX6 generates the 25MHz clock for the
AR8035.

So, for the _existing_ hardware, it is _required_ that the AR8035
generates the transmit clock, and this is fed in on GPIO 16 as
ENET_REF_CLK.  This means that SION for this *must* be set and
GPR1 bit 21 *must* be clear.

So:

> > Now, here's the question for the IMX6 maintainers: how do I avoid having
> > GPR1 bit 21 set - it's unconditionally set by imx6q_1588_init() in
> > arch/arm/mach-imx/mach-imx6q.c.  Moreover, how do I control this from
> > DT?
> 
> GPR1[21] should be cleared only when there is a clock input on pad
> GPIO_16 from external phy or oscillator.  Other than that, GPR1[21]
> should always be set to loop the ENET_PLL clock back to ENET though
> pad GPIO_16, for at least getting PTP (IEEE 1588) work, even in RGMII
> mode.
> 
> So far, we haven't got any user with that setup (external phy or
> oscillator generates clock to pad GPIO_16).  When we do, we can add a
> device tree property for telling that.

We need a property for this if we wish to support the carrier-1 development
board that Solid-run sent out to a load of developers last week.  If not,
I guess those guys like Olof will find that they won't have properly
configured ethernet support on their boards they've received in mainline
kernels.

I think that as a fair number of key kernel developers now have this
board with this requirement, we need to have this DT property provided
even though the final cubox-i will not require it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
