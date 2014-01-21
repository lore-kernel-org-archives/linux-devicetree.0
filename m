From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 14/15] watchdog: orion: Allow to build on any Orion
 platform
Date: Tue, 21 Jan 2014 07:04:35 -0300
Message-ID: <20140121100434.GC3577@localhost>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-15-git-send-email-ezequiel.garcia@free-electrons.com>
 <52DE40BD.10700@gmail.com>
 <20140121094501.GA13396@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140121094501.GA13396-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew, Sebastian:

On Tue, Jan 21, 2014 at 10:45:01AM +0100, Andrew Lunn wrote:
> On Tue, Jan 21, 2014 at 10:41:17AM +0100, Sebastian Hesselbarth wrote=
:
> > On 01/21/14 10:12, Ezequiel Garcia wrote:
> > >After getting rid of all the mach-specific code, it's now possible
> > >to allow builds in any Orion platform.
> > >
> > >Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>
> > >---
> > >  drivers/watchdog/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > >index 5be6e91..1689f72 100644
> > >--- a/drivers/watchdog/Kconfig
> > >+++ b/drivers/watchdog/Kconfig
> > >@@ -282,7 +282,7 @@ config DAVINCI_WATCHDOG
> > >
> > >  config ORION_WATCHDOG
> > >  	tristate "Orion watchdog"
> > >-	depends on ARCH_ORION5X || ARCH_KIRKWOOD || ARCH_DOVE
> > >+	depends on PLAT_ORION
[..]
> >=20
> > while above is true now, I tend to rather have ARCH_MVEBU added her=
e.
> > We really want to get rid of both !ARCH_MVEBU and PLAT_ORION and th=
is
> > unnecessarily will make it more complicated.
> >=20
> > I haven't checked why ARCH_MVEBU at all added PLAT_ORION as depende=
ncy,
> > but IIRC it was just because of a missing mbus driver? If it is jus=
t
> > this, we should also remove PLAT_ORION from ARCH_MVEBU to have a cl=
ean
> > cut between new common arch and existing sub-archs.
>=20

Hm... not sure why we depend on PLAT_ORION. I'll take a look.

> I took a look at this when moving DT kirkwood into mach-mvebu. There
> is nothing in plat-orion which ARCH_MVEBU needs. So i agree with
> Sebastian, it should be PLAT_ORION || ARCH_MVEBU.
>=20

OK, will do.

Thanks!
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
