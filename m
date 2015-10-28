From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add binding docs for Cirrus
 Logic/Wolfson Arizona devices
Date: Wed, 28 Oct 2015 09:18:16 +0000
Message-ID: <20151028091816.GM5828@x1>
References: <1445961719-1020-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1445961719-1020-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <56308FB4.8010707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56308FB4.8010707-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 28 Oct 2015, Chanwoo Choi wrote:

> Hi Charles,
>=20
> On 2015=EB=85=84 10=EC=9B=94 28=EC=9D=BC 01:01, Charles Keepax wrote:
> > Add device tree binding documentation for the Arizona drivers
> > to the MAINTAINERS file.
> >
> > Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> > ---
> >
> > Changes since v2:
> >  - Moved all the maintainer updates into this patch
> >
> > Thanks,
> > Charles
> >
> >  MAINTAINERS |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0658fec..4dc45de 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11392,6 +11392,9 @@ T:	git https://github.com/CirrusLogic/linux=
-drivers.git
> >  W:	https://github.com/CirrusLogic/linux-drivers/wiki
> >  S:	Supported
> >  F:	Documentation/hwmon/wm83??
> > +F:	Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> > +F:	Documentation/devicetree/bindings/regulator/arizona-regulator.t=
xt
> > +F:	Documentation/devicetree/bindings/mfd/arizona.txt
> >  F:	arch/arm/mach-s3c64xx/mach-crag6410*
> >  F:	drivers/clk/clk-wm83*.c
> >  F:	drivers/extcon/extcon-arizona.c
> >
>=20
> [for extcon]
> Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Will apply this retroactively.  Thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
