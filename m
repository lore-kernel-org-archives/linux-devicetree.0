From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: add NAND controller node
 for A23/A33
Date: Thu, 25 Aug 2016 22:53:43 +0200
Message-ID: <20160825205343.GJ32598@lukather>
References: <20160823135546.60179-1-icenowy@aosc.xyz>
 <20160824060222.GT2598@lukather>
 <16141472026895@web4j.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBY5V7W6QKGQEC5WUSPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <16141472026895-ECYPE5Ced+Nuio3avFS2gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 24, 2016 at 04:21:35PM +0800, Icenowy Zheng wrote:
> Hi Maxime,
>=20
> 24.08.2016, 14:02, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > Hi,
> >
> > On Tue, Aug 23, 2016 at 09:55:46PM +0800, Icenowy Zheng wrote:
> >> =C2=A0A23/A33 has a NAND controller which can now be used properly.
> >>
> >> =C2=A0Add a device node for it.
> >>
> >> =C2=A0The DMA function cannot work because of changed DMA IP block, so=
 it's
> >> =C2=A0temporarily removed in the device node. However, with PIO mode i=
t can still
> >> =C2=A0work.
> >
> > What is preventing the NAND driver to work with DMA with the sun6i driv=
er?
>
> It seems that under sun6i we should use dedicated rx and tx DMAs, but not=
 a
> "rxtx" DMA.

Ah, I see. I just applied your patch, thanks!
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

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv1rXAAoJEBx+YmzsjxAgnKoP/2b0u2VfPMMj5Ujo/0CCSVmP
SxU8g+zv54IlF7UgafnyIb0qahT48ZNmppnR6tFEKq848qcbtw/80VGCnACdlAlJ
PSbV4bQNBqW8toDvWDjvq2KdddPCxfaOJLk718ZpHR5wkvG6lyGFkQCsDOTKNfas
B2GGtGOc0AMl/YRk9DldVobqVPa1k7/mRPwnD5OheW29ExgRX0XpfCThAsNaaeQj
4c5PeksXNLullJM5wcwnpYqNkEybxRCanln6eW7f7NAgNeEyBMY5UYJqoV/NvcV7
PjA/wZi9bbSNi0sMEU2tm4w+hp9TUrGkOeIZGQRSCNSxVDaI9x6Nw+3xd+uwEPI9
FkDDMFQXQI343XdUJxAtWseCd1dhrSNspAa6eGFJ/jD77R7dvKafOMU0VKXlqTFD
hgRuvz/xjGphTW9mu90YwVq7G6e4cZ1Nh390alhXj9Zyfl6k2srJ9G7eAvl2MQgB
ZzYjwVr3/R/aVpMQYBSAMkEMo3ldR26j7fBLnF3mggYMa4XZJ7UN/sT0F7cccHI8
t9DR20W5AwiPnceDvnvmg97ST/yzEvDWho5hJULu5yo1HIo6ugiYFdNOg6HqU3ii
HoaiOO99qLcaOqWbvvXidq1v6EaddhucqmAvci/rX3+l49FNLmftEHHI3O/eJJro
mgAuhum8G1IjhXhkJP6p
=aVsc
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--
