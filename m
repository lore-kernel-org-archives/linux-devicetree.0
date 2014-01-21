From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 03/15] watchdog: orion: Use atomic access for shared
 registers
Date: Tue, 21 Jan 2014 06:42:15 -0300
Message-ID: <20140121094214.GA3577@localhost>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-4-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAOMZO5BKjpkjQGOOAQ5fwmxhg1SYTmTq4Y9tUCZaDSQiosGYyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5BKjpkjQGOOAQ5fwmxhg1SYTmTq4Y9tUCZaDSQiosGYyw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 07:19:52AM -0200, Fabio Estevam wrote:
> On Tue, Jan 21, 2014 at 7:12 AM, Ezequiel Garcia
> <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Since the timer control register is shared with the clocksource dri=
ver,
> > use the recently introduced atomic_io_clear_set() to access such re=
gister.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  drivers/watchdog/orion_wdt.c | 20 ++++----------------
> >  1 file changed, 4 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_=
wdt.c
> > index f7722a4..cf64510 100644
> > --- a/drivers/watchdog/orion_wdt.c
> > +++ b/drivers/watchdog/orion_wdt.c
> > @@ -61,8 +61,6 @@ static int orion_wdt_ping(struct watchdog_device =
*wdt_dev)
> >
> >  static int orion_wdt_start(struct watchdog_device *wdt_dev)
> >  {
> > -       u32 reg;
> > -
> >         spin_lock(&wdt_lock);
>=20
> Shouldn't this spin_lock be dropped now?
>=20

Hm... yes. The watchdog core uses a mutex to serialize all the watchdog=
 hooks:
start, stop, ping, set_timeout, etc. So it seems you're right, the spin=
lock
should be dropped entirely as I see no need for it.

Thanks for the feedback,
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
