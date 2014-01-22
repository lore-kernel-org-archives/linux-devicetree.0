From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/15] watchdog: orion: Remove unneeded BRIDGE_CAUSE
 clear
Date: Wed, 22 Jan 2014 19:56:55 -0300
Message-ID: <20140122225654.GB30763@localhost>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-7-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140121233537.GS18269@obsidianresearch.com>
 <20140122164904.GB27273@localhost>
 <20140122173417.GT18269@obsidianresearch.com>
 <52E02AB6.7040104@gmail.com>
 <20140122205213.GW18269@obsidianresearch.com>
 <20140122221237.GA30763@localhost>
 <20140122223117.GX18269@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140122223117.GX18269-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 22, 2014 at 03:31:17PM -0700, Jason Gunthorpe wrote:
> On Wed, Jan 22, 2014 at 07:12:38PM -0300, Ezequiel Garcia wrote:
> > On Wed, Jan 22, 2014 at 01:52:13PM -0700, Jason Gunthorpe wrote:
> > > > Clearing BRIDGE_CAUSE will only clear all currently pending ups=
tream
> > > > IRQs, of course. If WDT IRQ will be re-raised right after that =
in
> > > > BRIDGE_CAUSE depends on the actual HW implementation, i.e. we d=
o no
> > > > clear the causing IRQ itself but just what it raised in BRIDGE_=
CAUSE.
> > >=20
> > > Which is why it makes no sense to clear it one time at kernel sta=
rt.
> > >=20
> >=20
> > So, it seems we need to handle irq_startup(), as you suggested.
> > I've just tested the attached patch, and it's working fine: the dri=
ver's
> > probe() fully stops the watchdog, and then request_irq() acks and
> > pending interrupts, through the added irq_startup().
> >=20
> > How does it look?
>=20
> Looks sane to me.
>=20
> I looked some more and there are other drivers (eg irq-metag-ext) tha=
t
> take this same approach.
>=20

Yup, I took that one as a starting point.

[..]
> I looked at the irq-orion driver a bit more and noticed this:
>=20
>         ret =3D irq_alloc_domain_generic_chips(domain, nrirqs, 1, np-=
>name,
>                              handle_level_irq, clr, 0, IRQ_GC_INIT_MA=
SK_CACHE);
>                            ^^^^^^^^^^^^^^^^^^^^^
> Shouldn't it be handle_edge_irq? Otherwise who is calling irq_ack? Ho=
w
> does this work at all? :)
>=20

I'm not familiar with the differences between handle_level_irq and
handle_edge_irq, but -AFAICS- both seem to ack the IRQ.

In fact handle_level_irq(), masks and acks the IRQ as the first thing.
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
