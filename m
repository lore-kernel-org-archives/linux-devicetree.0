From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/8] Watchdog support for Armada 375/38x SoC
Date: Fri, 14 Mar 2014 19:35:43 -0300
Message-ID: <20140314223543.GA10868@arch>
References: <1394658715-2017-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <532380EA.7010809@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <532380EA.7010809-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mar 14, Guenter Roeck wrote:
> On 03/12/2014 02:11 PM, Ezequiel Garcia wrote:
> >Third round of the patchset adding support for watchdog on Armada 37=
5 and
> >Armada 38x SoCs.
> >
> >The new Armada 375/385 SoCs have two registers for the watchdog RSTO=
UT:
> >
> >  1. It has a dedicated register (similar to the one in A370/XP)
> >  2. Also has a bit in a shared RSTOUT register.
> >
> >Therefore, in order to support this two-folded RSTOUT, we extend the=
 'reg'
> >property in the watchdog devicetree and require a new pair of cells =
to specify
> >the shared RSTOUT.
> >
> >On the driver side, we need to implement per-SoC stop() and enabled(=
)
> >functions. Such somewhat complex infrastructure is needed to ensure =
the driver
> >performs proper reset of the watchdog timer, by masking and disablin=
g the
> >RSTOUT before the interrupt is enabled.
> >
> >I've pushed a branch so people can test this easily, e.g. ensuring
> >no regressions on Dove, Kirkwood and A370/XP:
> >
> >https://github.com/MISL-EBU-System-SW/mainline-public/tree/wdt_a385_=
a375_v3
> >
> >Changes from v2:
> >
> >   * Cleaned-up usage of atomic_io_modify(), using it only when need=
ed.
> >     For instance, the RSTOUT dedicated register on Armada 370/375/3=
80/XP
> >     can be safely access without any lock.
> >
> >   * Use devm_ioremap_resource() for the non-shared registers. The s=
hared
> >     registers need to use devm_ioremap(), which does not request th=
e
> >     memory region.
> >
> >Changes from v1:
> >
> >   * Reworked entirely!
> >
> >Ezequiel Garcia (8):
> >   watchdog: orion: Introduce a SoC-specific RSTOUT mapping
> >   watchdog: orion: Remove unneeded atomic access
> >   watchdog: orion: Introduce per-SoC stop() function
> >   watchdog: orion: Introduce per-SoC enabled() function
> >   watchdog: orion: Add Armada 375/380 SoC support
> >   ARM: mvebu: Enable Armada 375 watchdog in the devicetree
> >   ARM: mvebu: Enable Armada 380/385 watchdog in the devicetree
> >   ARM: mvebu: Add A375/A380 watchdog binding documentation
> >
> >  .../devicetree/bindings/watchdog/marvel.txt        |   7 +
> >  arch/arm/boot/dts/armada-375.dtsi                  |   6 +
> >  arch/arm/boot/dts/armada-38x.dtsi                  |   7 +
> >  drivers/watchdog/orion_wdt.c                       | 180 +++++++++=
++++++++++--
> >  4 files changed, 188 insertions(+), 12 deletions(-)
> >
> For the series:
> 	Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>=20

Thanks a lot for reviewing the whole patchset. I'll probably sent anoth=
er
round, as per your suggestion to move all the ioremap'ing to its own
function.

That stuff got long and scary enough to deserve its own place.
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
