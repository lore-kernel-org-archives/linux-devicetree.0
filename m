From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] arm: sunxi: add support for V3s SoC
Date: Thu, 12 Jan 2017 18:17:13 +0100
Message-ID: <20170112171713.vzlhoak3ykr3aomp@lukather>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-2-icenowy@aosc.xyz>
 <20170110180926.ilqtygttpfgbetvu@lukather>
 <2706391484163632@web1g.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z6tfcngwivu7rwau"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBJPU33BQKGQEIMEZIVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2706391484163632-/w1NKm4lK9luio3avFS2gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--z6tfcngwivu7rwau
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;4601;0c
On Thu, Jan 12, 2017 at 03:40:32AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 11.01.2017, 02:09, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Tue, Jan 03, 2017 at 11:16:25PM +0800, Icenowy Zheng wrote:
> >> =C2=A0Allwinner V3s is a low-end single-core Cortex-A7 SoC, with 64MB
> >> =C2=A0integrated DRAM, and several peripherals.
> >>
> >> =C2=A0Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
> >> =C2=A0---
> >> =C2=A0=C2=A0Documentation/arm/sunxi/README | 4 ++++
> >> =C2=A0=C2=A0arch/arm/mach-sunxi/sunxi.c | 1 +
> >> =C2=A0=C2=A02 files changed, 5 insertions(+)
> >>
> >> =C2=A0diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/=
sunxi/README
> >> =C2=A0index cd0243302bc1..91ec8f2055be 100644
> >> =C2=A0--- a/Documentation/arm/sunxi/README
> >> =C2=A0+++ b/Documentation/arm/sunxi/README
> >> =C2=A0@@ -67,6 +67,10 @@ SunXi family
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+ Datashee=
t
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0http://dl.linux-sunxi.org/H3/Allwinner_H3_Datasheet_V1.0.pdf
> >>
> >> =C2=A0+ - Allwinner V3s (sun8i)
> >> =C2=A0+ + Datasheet
> >> =C2=A0+ https://www.goprawn.com/forum/allwinner-cams/783-allwinner-v3s=
-soc-datasheet
> >> =C2=A0+
> >
> > Please don't put random links in there, but at least something that we
> > know will be there in a couple of weeks/monthes/years
>=20
> Is http://linux-sunxi.org/File:Allwinner_V3s_Datasheet_V1.0.pdf acceptabl=
e?

It's much better, yes.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--z6tfcngwivu7rwau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7oZAAoJEBx+YmzsjxAgycYQAIZYVz58JQH8O9t/dfHyfn8T
Ai0hVu6FTsjSUt9qZCbs1SqiydNxDpmfTlgrdlOgJfFmorD+Y5HjfGqmos35X/UC
YPyd2qyA7IBYbUYJROsgqL3mLG5edJgh9ct0t0rb2SlQg2/6Fj7pLmhiDfpmyqlo
f4PvSvNl0nyEnDUbTJ301d07AOs+u80oDGfH8eCHWQuDMUo2QS+2dU0XF9UphkTH
mQ6uzGtBl/Pjo0rtm9igzvSuf/UfTROOMy/2QRoJ5XFZT5PRVC+b20AAPZjKX/6Z
vzNoWjP5YjKERJ+RZ/DE+mYQl0DpC9GAtzXU5feJhXJNiijv/5x+gAHsW7iXnQ3X
o/8n/hGSEF0e07qjitkmQMFpgY9gfnm0AngmFzVRPl2rzYRQBX1ZcMo1esC7KsWb
ikPJFRVzwbVmRRjT3nl4f3Kb6Ix2diIN2XamS7nl0zXDKo89ONex5hU3avJZp+zd
JZ7DX9bsL5EMyAwPIQ84+X3F170DG/qpiyx5rWHK9R2HiLF9w4QJ8BLsvRsQthET
AIvBM2F7P164pNFS3ztKyJeRaJuSNOxyVJgCu7nvI9dM0/NDpaldC58QpZ95e09P
1cAnQeMgWLfi0tRtcI82ClBOx8cvRNprxXO3lMzVXpE9FokctGmmJ9wMdkOXsDvM
95Wu/kF7lFL2mdZGWHjJ
=0yRi
-----END PGP SIGNATURE-----

--z6tfcngwivu7rwau--
