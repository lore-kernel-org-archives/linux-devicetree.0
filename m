From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: Fwd: Re: [PATCH 2/2] ARM: mvebu: dts: Add dts file for DLink
  DNS-327L
Date: Sun, 12 Apr 2015 21:47:35 +0200
Message-ID: <20150412194735.GA27921@lunn.ch>
References: <b6534b962d2cf9d21cb72d43f19a6574@mail.ncrmnt.org>
 <552A6209.9040903@gmail.com>
 <cd7445f789f1082f464d464f77807f12@mail.ncrmnt.org>
 <20150412145857.GA14038@lunn.ch>
 <b172d775afa24cea69a9490f531c6b37@mail.ncrmnt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b172d775afa24cea69a9490f531c6b37-IcawJbj+vY1vZ+LtbKW8tg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew <andrew-g16cbSVCqPUdnm+yROfE0A@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 12, 2015 at 06:41:31PM +0300, Andrew wrote:
> Andrew Lunn ?????????? 12.04.2015 17:58:
> >>Okay, got it.
> >>I'll file a bug about this issue to the the bugzilla. However
> >>something
> >>tells me it might not be cpuidle, but D-link. This one's sounds nasty
> >>and it has been around since 3.16.x. How could it go unnoticed?
> >>Unfortunately I have no other armada-370 hardware to test it.
> >
> >Hi Andrew
> >
> >A few of us here do have hardware to test with. Please give a detailed
> >description of how you reproduce the issue, and your kernel
> >configuration, if different from mvebu_v7_defconfig, or
> >multi_v7_defconfig.
> >
> >	Thanks
> >		Andrew
> 
> 
> arch/arm/configs/mvebu_v7_defconfig has CONFIG_ARM_MVEBU_V7_CPUIDLE=y,
> so it should be sufficient to reproduce the issue. I first encountered
> this issue using that very config and observed it on 2 DNS-327L boxes I
> own.
> 
> All I have to do to trigger the bug - enable cpuidle driver and let
> the box
> sit for some 4-12 hours, till it hard-freezes. If wdt is enabled -
> wdt reboot
> will happen.

That simple! Well i've got a 370RD which has been sat mostly idle for
weeks, using the mvebu_v7_defconfig, with a few addition things turned
on for testing the Ethernet switch on the board. I've not had that
lockup.

One thing you can try to narrow it down is the disable the second idle
mode. Take a look at armada370_idle_driver. Keep the
ARM_CPUIDLE_WFI_STATE but disable the "Deep Idle" state.
      
      Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
