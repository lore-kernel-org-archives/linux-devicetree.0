From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 9/9] arm64: allwinner: a64: enable Wi-Fi
 for Pine64
Date: Tue, 23 May 2017 16:44:27 +0200
Message-ID: <20170523144427.vi4szmy4f6gpyj3n@flea.home>
References: <20170518071653.36561-1-icenowy@aosc.io>
 <20170518071653.36561-10-icenowy@aosc.io>
 <CAGb2v66mqMveibKKU9LiBm8jzAOj46hFCK6HvJx0k6077fqLZw@mail.gmail.com>
 <79B00D42-3F95-4D5E-9A23-8E893CCF2462@aosc.io>
 <20170519071922.awmib4qphl6ac6mj@flea.home>
 <16dee602b96510170ee1117cfaae0025@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qzs5ea3iwvdtgeu6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBTMVSHEQKGQEMNY5H5Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <16dee602b96510170ee1117cfaae0025-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qzs5ea3iwvdtgeu6
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2017 at 03:22:28PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-05-19 15:19=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Fri, May 19, 2017 at 11:03:33AM +0800, Icenowy Zheng wrote:
> > > >The patch looks OK, but given the module is removable, I think it
> > > >should be
> > > >an overlay. The overlay would enable WiFi + Bluetooth, and all the
> > > >peripherals needed to connect them.
> > > >
> > > >That way, if the module is not installed, we avoid confusing the use=
r
> > > >with
> > > >unused peripherals, and avoid having live voltage on an unoccupied
> > > >header.
> > >=20
> > > But as this header have specific usage, we will also confuse user
> > > if it's not enabled as its target usage.
> >=20
> > Yet you would enable unused resources.
> >=20
> > This was already pointed out here:
> > https://patchwork.kernel.org/patch/9670235/
>=20
> I think, before we have an official repository of device tree
> overlays (either directly in torvalds/linux or maintained by
> linux-sunxi), we shouldn't rely on device tree overlay
> functionality.

This is a board specific overlay, and having some upstream repository
with all the possible combinations of SoC / daughter board is just not
realistic.

This should be shipped by the board vendors. RPi does that, the
beaglebone does that, the CHIP does that, surely, if it works for
them, it should work for you.

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

--qzs5ea3iwvdtgeu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZJErLAAoJEBx+YmzsjxAgDFUP/iyzI+ae3EvnTyuP1Iyi6apc
t2XzmPqZWyiSRDFfueylI3XqSFw1+c/yGcdTtD8RwLQvyKNTmXoGeMzdVoIdgbJF
p9vyNxmv6IO40Rj731ixYYLutbt5wFYNH6pgOuEhQaFeezJABuhdO8vn1jJvJHAC
8btoJ2Lh1BFv1WZ8bl+yeW9B2cNplBGk0l9FLw0tDJEH7EIiT0HjKESmPN1bRpUU
GWqf3F+AGZ7SEzY8lvDCEqwpaamjaRXw4yMqKyUzDOJKathjAviLzVI5McPSuAQX
oXpYT0VWGDNFlJ2alf4oTi15auAYOn9zLhMPShGsayt1Cd7Qrj6rGkew+dir+Ge9
KzGZJ1OfXYywHD1+D4svwVB/Nz6WMbnLmyMexRBUGsAeMy4Zsa3n6/a6/ujFO5px
KR8dq6uy1/6eRbK2CkMqr2BsjPCsCKZJQsmy+f0QqBKOnbHc/OK45GIjAsKzStB6
VvvgqTvGmiYi0mDGhgsuoTQB+IdSlzRCz/W88w/IfoZSK0hTATP0HNdoCdT3DzZb
hFWEnIaUotUUHq8Utgz5iwXdJHVYGcn/scOIf3xDTs1wQsNfwykRc2YvpUrq6Vv4
DsyMI7mqfWeQ6y2WXt6pVeaM033eLd2GTKsKEgOalDPgldYBMPt1hpwAyatiIehF
ZL0jqWlA0CAuVY1zCNfM
=U8Rk
-----END PGP SIGNATURE-----

--qzs5ea3iwvdtgeu6--
