From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 05/19] watchdog: orion: Make sure the watchdog is
 initially stopped
Date: Mon, 10 Feb 2014 09:22:24 -0300
Message-ID: <20140210122223.GF10872@localhost>
References: <1391707226-18258-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391707226-18258-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <52F43ED0.4050808@roeck-us.net>
 <20140207104044.GA11063@localhost>
 <20140207174314.GB16263@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140207174314.GB16263-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 07, 2014 at 10:43:14AM -0700, Jason Gunthorpe wrote:
> On Fri, Feb 07, 2014 at 07:40:45AM -0300, Ezequiel Garcia wrote:
>=20
> > Well, this is related to the discussion about the bootloader not
> > reseting the watchdog properly, provoking spurious watchdog trigger=
ing.
> >=20
> > Jason Gunthorpe explained [1] that we needed a particular sequence:
> >=20
> >  1. Disable WDT
> >  2. Clear bridge
> >  3. Enable WDT
> >=20
> > We added the irq handling to satisfy (2), and the watchdog stop for=
 (1).
>=20
> The issue here is the driver configures two 'machine kill' elements:
> the PANIC IRQ and the RstOut setup.
>=20
> Before configuring either of those the driver needs to ensure that an=
y
> old watchdog events are cleared out of the HW. We must not get a
> spurious event.=20
>=20
> I agree not disabling an already functional and properly configured
> counter from the bootloader is desirable.
>=20
> So lets break it down a bit..
>=20
> 1) The IRQ:
>   It looks like the cause bit latches high on watchdog timer
>   expiration but has no side effect unless it is unmasked.
>=20
>   The new IRQ flow code ensures the bit is cleared during request_irq
>   so no old events can trigger the IRQ. Thus it is solved now.
>=20

Agreed.

> 3) The timer itself:
>   The WDT is just a general timer with an optional hookup to the
>   rst control. If it is harmlessly counting but not resetting we need
>   to stop that before enabling rst out.
>=20

Actually, the current flow is to:

1. Disable rst out and then disable the counter, in probe().

2. Enable the counter, and then enable rst out, in start().

> So, how about this for psuedo-code in probe:
>=20
> if (readl(RSTOUTn) & WDRstOutEn)
> {
>     /* Watchdog is configured and may be down counting,
>        don't touch it */
>     request_irq(..);
> }
> else
> {
>     /* Watchdog is not configured, fully disable the timer
>        and configure for watchdog operation. */
>     disable_watchdog();
>     request_irq();
>     writel(RSTOUTn), .. WDRstOutEn);
> }
>=20

Sounds good, although it seems to me it's actually simpler:

  /* Let's make sure the watchdog is fully stopped, unless
   * it's explicitly enabled and running
   */
  if ( !(wdt_rst_out_en && wdt_timer_enabled) ) {
    watchdog_stop();
  }

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
