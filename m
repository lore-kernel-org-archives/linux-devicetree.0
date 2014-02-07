From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 05/19] watchdog: orion: Make sure the watchdog is
 initially stopped
Date: Fri, 7 Feb 2014 07:40:45 -0300
Message-ID: <20140207104044.GA11063@localhost>
References: <1391707226-18258-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391707226-18258-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <52F43ED0.4050808@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52F43ED0.4050808-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 06, 2014 at 06:02:56PM -0800, Guenter Roeck wrote:
> On 02/06/2014 09:20 AM, Ezequiel Garcia wrote:
> > Having the watchdog initially fully stopped is important to avoid
> > any spurious watchdog triggers, in case the registers are not in
> > its reset state.
> >
> > Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> > Tested-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Tested-by: Willy Tarreau <w@1wt.eu>
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >   drivers/watchdog/orion_wdt.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_=
wdt.c
> > index 6746033..2dbeee9 100644
> > --- a/drivers/watchdog/orion_wdt.c
> > +++ b/drivers/watchdog/orion_wdt.c
> > @@ -142,6 +142,9 @@ static int orion_wdt_probe(struct platform_devi=
ce *pdev)
> >   	orion_wdt.max_timeout =3D wdt_max_duration;
> >   	watchdog_init_timeout(&orion_wdt, heartbeat, &pdev->dev);
> >
> > +	/* Let's make sure the watchdog is fully stopped */
> > +	orion_wdt_stop(&orion_wdt);
> > +
>=20
> Actually we just had that in another driver, and I stumbled over it t=
here.
>=20
> Problem with stopping the watchdog in probe unconditionally is that y=
ou can
> use it to defeat nowayout: unload the module, then load it again,
> and the watchdog is stopped even if nowayout is true.
>=20

Hm... I see.

> Is this really what you want ? Or, in other words, what is the proble=
m
> you are trying to solve ?
>=20

Well, this is related to the discussion about the bootloader not
reseting the watchdog properly, provoking spurious watchdog triggering.

Jason Gunthorpe explained [1] that we needed a particular sequence:

 1. Disable WDT
 2. Clear bridge
 3. Enable WDT

We added the irq handling to satisfy (2), and the watchdog stop for (1)=
=2E

The watchdog stop was agreed specifically [2].

Ideas?

[1] http://www.spinics.net/lists/arm-kernel/msg302340.html
[2] http://www.spinics.net/lists/arm-kernel/msg302507.html

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
