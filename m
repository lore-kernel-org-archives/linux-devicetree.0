From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH RESEND v2 4/4] ARM64: dts: rockchip: add dts file for RK3399 evaluation board
Date: Mon, 25 Apr 2016 09:37:23 +0200
Message-ID: <4687144.rPskt7YEHJ@diego>
References: <1461304307-14113-1-git-send-email-jay.xu@rock-chips.com> <1461304307-14113-5-git-send-email-jay.xu@rock-chips.com> <571D7723.1020707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571D7723.1020707-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <caesar.upstream-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 25. April 2016, 09:47:15 schrieb Caesar Wang:
> =E5=9C=A8 2016=E5=B9=B404=E6=9C=8822=E6=97=A5 13:51, Jianqun Xu =E5=86=
=99=E9=81=93:
> > This patch add rk3399-evb.dts for RK3399 evaluation board.
> > Tested on RK3399 evb.
> >=20
> > Signed-off-by: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > ---
> > changes in v2:
> > - remove rk808 since without i2c, which will upstream independently
> > - remove es8316 since without i2c, which will upstream independentl=
y
> > - fix codingstyle issues
> >=20
> >   arch/arm64/boot/dts/rockchip/Makefile       |   1 +
> >   arch/arm64/boot/dts/rockchip/rk3399-evb.dts | 122
> >   ++++++++++++++++++++++++++++ 2 files changed, 123 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> > b/arch/arm64/boot/dts/rockchip/Makefile index df37865..7037a16 1006=
44
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -1,6 +1,7 @@
> >=20
> >   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
> >   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
> >   dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
> >=20
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-evb.dtb
> >=20
> >   always		:=3D $(dtb-y)
> >   subdir-y	:=3D $(dts-dirs)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> > b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts new file mode 100644
> > index 0000000..309f870
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb.dts
> > @@ -0,0 +1,122 @@
> > +/*
> > + * Copyright (c) 2016 Fuzhou Rockchip Electronics Co., Ltd
> > + *
> > + * This file is dual-licensed: you can use it either under the ter=
ms
> > + * of the GPL or the X11 license, at your option. Note that this d=
ual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License=
 as
> > + *     published by the Free Software Foundation; either version 2=
 of the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This file is distributed in the hope that it will be useful=
,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty=
 of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See t=
he
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentat=
ion
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use=
,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/o=
r
> > + *     sell copies of the Software, and to permit persons to whom =
the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall=
 be
> > + *     included in all copies or substantial portions of the Softw=
are.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY K=
IND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRAN=
TIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY=
,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +/dts-v1/;
> > +#include <dt-bindings/pwm/pwm.h>
> > +#include "rk3399.dtsi"
> > +
> > +/ {
> > +	compatible =3D "rockchip,rk3399-evb", "rockchip,rk3399";
>=20
> I pick them up in my github.
> (https://github.com/Caesar-github/rockchip/tree/wip/fixes-thermal-042=
5)
>=20
> Can we add the following strings to match the loader (coreboot)?
>   No matter, we can match the loader(coreboot) to bring up the evb bo=
ard
> on now or in the future.
>=20
> ...,"google,rk3399evb-rev3",
> google,rk3399evb-rev2",google,rk3399evb-rev1","google,rk3399evb-rev0"

Yep, that should be no problem ... i.e. we also have this longer list o=
f board=20
matches for the previous veyron boards (both in the dts files as well a=
s the=20
board-binding document)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
