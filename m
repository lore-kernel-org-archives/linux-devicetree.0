From: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH 04/14] pinctrl: sunxi: v3: really
 introduce support for V3
Date: Mon, 18 Mar 2019 12:05:12 +0100
Message-ID: <ef0c3061986b7456605a61f835f2a2003cf4c678.camel@bootlin.com>
References: <20190312152256.35574-1-icenowy@aosc.io>
	 <20190312152256.35574-5-icenowy@aosc.io>
	 <20190312153654.25r5orlw7qjtlhbt@flea>
	 <7B6C1341-BAB5-48C5-9E60-11BCEAC3D0CD@aosc.io>
Reply-To: paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCOO3QWNR4KRB3HWXXSAKGQE7JAB3KQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <7B6C1341-BAB5-48C5-9E60-11BCEAC3D0CD-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Le mardi 12 mars 2019 =C3=A0 23:45 +0800, Icenowy Zheng a =C3=A9crit :
>=20
> =E4=BA=8E 2019=E5=B9=B43=E6=9C=8812=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
11:36:54, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
> > On Tue, Mar 12, 2019 at 11:22:46PM +0800, Icenowy Zheng wrote:
> > > Introduce the GPIO pins that is only available on V3 (not on V3s) to
> > the
> > > V3 pinctrl driver.
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > > ---
> > >  drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c | 291
> > +++++++++++++++++++++--
> > >  drivers/pinctrl/sunxi/pinctrl-sunxi.h    |   2 +
> > >  2 files changed, 275 insertions(+), 18 deletions(-)
> > >=20
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
> > b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
> > > index 6704ce8e5e3d..54c210871a95 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3.c
> > > @@ -1,5 +1,5 @@
> > >  /*
> > > - * Allwinner V3s SoCs pinctrl driver.
> > > + * Allwinner V3/V3s SoCs pinctrl driver.
> > >   *
> > >   * Copyright (C) 2016 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> > >   *
> > > @@ -23,7 +23,7 @@
> > > =20
> > >  #include "pinctrl-sunxi.h"
> > > =20
> > > -static const struct sunxi_desc_pin sun8i_v3s_pins[] =3D {
> > > +static const struct sunxi_desc_pin sun8i_v3_v3s_pins[] =3D {
> >=20
> > I'm not sure all that remaining is worth it to be honest. It adds a
> > lot of noise for no particular reason (and the same goes for renaming
> > the file itself)
>=20
> Maybe keeping names is okay "for historial reasons".
>=20
> In fact I want to keep them.

My two cents about this: kernel development is plagued by the unability
to rename and rework things as soon as backward compatibility is
involved. I believe that renaming and reworking things is quite a good
thing to do when it leads to a situation that is easier to understand
and makes more sense.

In this case, I don't see any blockers that would prevent us from doing
this, so I am strongly in favor of it. I really don't see how increased
noise and "historical reasons" make up for better clarity.

Cheers,

Paul

> > Maxime
>=20
> --=20
> =E4=BD=BF=E7=94=A8 K-9 Mail =E5=8F=91=E9=80=81=E8=87=AA=E6=88=91=E7=9A=84=
Android=E8=AE=BE=E5=A4=87=E3=80=82
>=20
--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
