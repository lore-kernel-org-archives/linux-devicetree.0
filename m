From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 01/15] ARM: Introduce atomic MMIO modify
Date: Tue, 21 Jan 2014 07:46:38 -0300
Message-ID: <20140121104637.GD3577@localhost>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <3512865.jTEvHVvFLA@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3512865.jTEvHVvFLA@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 21, 2014 at 10:45:21AM +0100, Arnd Bergmann wrote:
> On Tuesday 21 January 2014 06:12:27 Ezequiel Garcia wrote:
> > Some SoC have MMIO regions that are shared across orthogonal
> > subsystems. This commit implements a possible solution for the
> > thread-safe access of such regions through a spinlock-protected API=
=2E
> >=20
> > Concurrent access is protected with a single spinlock for the
> > entire MMIO address space. While this protects shared-registers,
> > it also serializes access to unrelated/unshared registers.
> >=20
> > We add relaxed and non-relaxed variants, by using writel_relaxed an=
d writel,
> > respectively. The rationale for this is that some users may not req=
uire
> > register write completion but only thread-safe access to a register=
=2E
> >=20
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> You add the new atomic mmio interfaces in an ARM global header file,
> but at the same time make them ARM-only. I'm not opposed to having
> interfaces like that, but I'm not convinced they are actually needed
> for this case and if we go there, it needs to be done more carefully
> and should be available for all architectures so that portable driver=
s
> can use them.
>=20

Yes, true. We've discussed about this and even post an arch-generic API=
:

http://lwn.net/Articles/564709/

In the end it was decided to keep it ARM-specific for now:

http://www.spinics.net/lists/arm-kernel/msg271773.html

Just for reference, the last posted patchset for the atomic I/O API
is this:

http://www.spinics.net/lists/arm-kernel/msg292775.html

> It also seems to duplicate functionality that is already present in
> regmap-mmio.
>=20

Yes, this is true. We tried to use regmap-mmio/syscon but we need this
to initialize the clocksource which is too early for that to work:

https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg484535.htm=
l

--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
