From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 02/15] clocksource: orion: Use atomic access for
 shared registers
Date: Tue, 21 Jan 2014 07:53:21 -0300
Message-ID: <20140121105320.GA4356@localhost>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <52DE4491.2000505@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52DE4491.2000505-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Daniel,

On Tue, Jan 21, 2014 at 10:57:37AM +0100, Daniel Lezcano wrote:
> On 01/21/2014 10:12 AM, Ezequiel Garcia wrote:
> > Replace the driver-specific thread-safe shared register API
> > by the recently introduced atomic_io_clear_set().
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> in the future, put me in Cc when modifying files in clocksource that=20
> will make my life easier to track the changes.
>=20

Ouch, sorry about that.

[..]
> >   /*
> >    * Free-running clocksource handling.
> > @@ -68,7 +54,8 @@ static int orion_clkevt_next_event(unsigned long =
delta,
> >   {
> >   	/* setup and enable one-shot timer */
> >   	writel(delta, timer_base + TIMER1_VAL);
> > -	orion_timer_ctrl_clrset(TIMER1_RELOAD_EN, TIMER1_EN);
> > +	atomic_io_modify(timer_base + TIMER_CTRL,
> > +		TIMER1_RELOAD_EN | TIMER1_EN, TIMER1_EN);
>=20
> I am not convinced this change is worth.
>=20
> Could you elaborate the race the spinlock should prevent ?
>=20

Sure. Take a look to the patchset that adds the atomic I/O (sorry again=
 for
not Ccing you on that one):

  http://www.spinics.net/lists/arm-kernel/msg292775.html

The TIMER_CTRL register provides clocksource and watchdog control, so w=
e
need a safe way to access the register, since we're sharing it on two
completely unrelated drivers.
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
