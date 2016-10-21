From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 5/6] ARM: sunxi: Remove useless allwinner,pull property
Date: Fri, 21 Oct 2016 12:40:08 +0200
Message-ID: <20161021104008.lsonnfjcpjlxgsff@lukather>
References: <cover.f893b02a9f816dad8fad3986672b05c4b211e2b1.1476971126.git-series.maxime.ripard@free-electrons.com>
 <42e249454ccf6b14e9ec266cb8d42a24f6d71d7b.1476971126.git-series.maxime.ripard@free-electrons.com>
 <20161020173848.be9cf97854f8933b3ce90d55@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xa2m3bvryotdr2ou"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161020173848.be9cf97854f8933b3ce90d55-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xa2m3bvryotdr2ou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 20, 2016 at 05:38:48PM +0200, Jean-Francois Moine wrote:
> On Thu, 20 Oct 2016 15:49:06 +0200
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > The allwinner,pull property set to NO_PULL was really considered our
> > default (and wasn't even changing the default value in the code).
> >=20
> > Remove these properties to make it obvious that we do not set anything =
in
> > such a case.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/ntc-gr8-evb.dts                     |  4 +-
> >  arch/arm/boot/dts/ntc-gr8.dtsi                        | 14 +-----
> >  arch/arm/boot/dts/sun4i-a10-a1000.dts                 |  2 +-
> >  arch/arm/boot/dts/sun4i-a10-cubieboard.dts            |  1 +-
> >  arch/arm/boot/dts/sun4i-a10-dserve-dsrv9703c.dts      |  4 +-
> >  arch/arm/boot/dts/sun4i-a10-gemei-g9.dts              |  1 +-
> >  arch/arm/boot/dts/sun4i-a10-hackberry.dts             |  2 +-
> >  arch/arm/boot/dts/sun4i-a10-inet1.dts                 |  2 +-
> >  arch/arm/boot/dts/sun4i-a10-jesurun-q5.dts            |  2 +-
> >  arch/arm/boot/dts/sun4i-a10-marsboard.dts             |  1 +-
> >  arch/arm/boot/dts/sun4i-a10-mk802.dts                 |  3 +-
> >  arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts        |  2 +-
> >  arch/arm/boot/dts/sun4i-a10-pcduino.dts               |  2 +-
> >  arch/arm/boot/dts/sun4i-a10-pcduino2.dts              |  1 +-
> >  arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts      |  3 +-
> >  arch/arm/boot/dts/sun4i-a10.dtsi                      | 24 +--------
> >  arch/arm/boot/dts/sun5i-a10s-auxtek-t003.dts          |  1 +-
> >  arch/arm/boot/dts/sun5i-a10s-auxtek-t004.dts          |  2 +-
> >  arch/arm/boot/dts/sun5i-a10s-mk802.dts                |  2 +-
> >  arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts      |  2 +-
> >  arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts         |  2 +-
> >  arch/arm/boot/dts/sun5i-a10s-wobo-i5.dts              |  2 +-
> >  arch/arm/boot/dts/sun5i-a10s.dtsi                     |  7 +--
> >  arch/arm/boot/dts/sun5i-a13-hsg-h702.dts              |  1 +-
> >  arch/arm/boot/dts/sun5i-a13-olinuxino-micro.dts       |  3 +-
> >  arch/arm/boot/dts/sun5i-a13-olinuxino.dts             |  2 +-
> >  arch/arm/boot/dts/sun5i-a13-utoo-p66.dts              |  1 +-
> >  arch/arm/boot/dts/sun5i-a13.dtsi                      |  3 +-
> >  arch/arm/boot/dts/sun5i-r8-chip.dts                   |  2 +-
> >  arch/arm/boot/dts/sun5i-reference-design-tablet.dtsi  |  2 +-
> >  arch/arm/boot/dts/sun5i.dtsi                          |  7 +--
> >  arch/arm/boot/dts/sun6i-a31-app4-evb1.dts             |  1 +-
> >  arch/arm/boot/dts/sun6i-a31-colombus.dts              |  1 +-
> >  arch/arm/boot/dts/sun6i-a31-hummingbird.dts           |  2 +-
> >  arch/arm/boot/dts/sun6i-a31-i7.dts                    |  2 +-
> >  arch/arm/boot/dts/sun6i-a31-m9.dts                    |  2 +-
> >  arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts      |  2 +-
> >  arch/arm/boot/dts/sun6i-a31.dtsi                      | 13 +----
> >  arch/arm/boot/dts/sun6i-a31s-primo81.dts              |  1 +-
> >  arch/arm/boot/dts/sun6i-a31s-sina31s.dts              |  1 +-
> >  arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts      |  3 +-
> >  arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts      |  3 +-
> >  arch/arm/boot/dts/sun7i-a20-bananapi.dts              |  2 +-
> >  arch/arm/boot/dts/sun7i-a20-bananapro.dts             |  5 +--
> >  arch/arm/boot/dts/sun7i-a20-cubieboard2.dts           |  1 +-
> >  arch/arm/boot/dts/sun7i-a20-cubietruck.dts            |  6 +--
> >  arch/arm/boot/dts/sun7i-a20-hummingbird.dts           |  4 +-
> >  arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts             |  4 +-
> >  arch/arm/boot/dts/sun7i-a20-itead-ibox.dts            |  1 +-
> >  arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts             |  2 +-
> >  arch/arm/boot/dts/sun7i-a20-m3.dts                    |  1 +-
> >  arch/arm/boot/dts/sun7i-a20-mk808c.dts                |  2 +-
> >  arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts        |  4 +-
> >  arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts        |  2 +-
> >  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2-emmc.dts  |  1 +-
> >  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts       |  3 +-
> >  arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts       |  1 +-
> >  arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts         |  4 +-
> >  arch/arm/boot/dts/sun7i-a20-orangepi.dts              |  4 +-
> >  arch/arm/boot/dts/sun7i-a20-pcduino3-nano.dts         |  3 +-
> >  arch/arm/boot/dts/sun7i-a20-pcduino3.dts              |  2 +-
> >  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts        |  3 +-
> >  arch/arm/boot/dts/sun7i-a20-wits-pro-a20-dkt.dts      |  1 +-
> >  arch/arm/boot/dts/sun7i-a20.dtsi                      | 37 +----------=
--
> >  arch/arm/boot/dts/sun8i-a23-a33.dtsi                  | 10 +---
> >  arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts |  1 +-
> >  arch/arm/boot/dts/sun8i-a23-polaroid-mid2809pxe04.dts |  1 +-
> >  arch/arm/boot/dts/sun8i-a33-inet-d978-rev2.dts        |  1 +-
> >  arch/arm/boot/dts/sun8i-a33-olinuxino.dts             |  3 +-
> >  arch/arm/boot/dts/sun8i-a33.dtsi                      |  1 +-
> >  arch/arm/boot/dts/sun8i-a83t.dtsi                     |  3 +-
> >  arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts       |  3 +-
> >  arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts             |  2 +-
> >  arch/arm/boot/dts/sun8i-h3-orangepi-2.dts             |  4 +-
> >  arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts          |  3 +-
> >  arch/arm/boot/dts/sun8i-h3-orangepi-one.dts           |  3 +-
> >  arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts            |  3 +-
> >  arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts          |  1 +-
> >  arch/arm/boot/dts/sun8i-h3.dtsi                       | 12 +----
> >  arch/arm/boot/dts/sun8i-r16-parrot.dts                |  3 +-
> >  arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi  |  2 +-
> >  arch/arm/boot/dts/sun9i-a80-cubieboard4.dts           |  1 +-
> >  arch/arm/boot/dts/sun9i-a80-optimus.dts               |  4 +-
> >  arch/arm/boot/dts/sun9i-a80.dtsi                      |  6 +--
> >  arch/arm/boot/dts/sunxi-common-regulators.dtsi        |  4 +-
> >  85 files changed, 0 insertions(+), 302 deletions(-)
> 	[snip]
>=20
> Is it really usefull to change all these files while in a previous
> patch you were writing:
> > The generic pin configuration and multiplexing should be preferred now,
> > even though we still support the old one.
> ?

I assume you wanted to comment on the sixth patch.

Yes, it's useful, because that way we avoid using a deprecated
binding, that we would have to mix the newer binding which would be
completely inconsistent, and that way we use the generic binding that
everyone uses everywhere.

The backward compatibility is just here to avoid breaking the ABI.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xa2m3bvryotdr2ou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCfCEAAoJEBx+YmzsjxAgX2sP/Ay0BIp6WdMtQZx6ixpWIb53
DUctkZpseuemdzJeaR0LzTzRYs25hzkDZoBbvzX1vxIi1mqVoCX99anHN9fhNQki
iCcaFFj+bXM8psHErZjTs0Fj7z9U8SM1yYXysQXpMgcyH/dAvHS9WlE60127YXMS
BE2oCo0iyb0ngKiJ3INx3twfuEVWLAmxBntnWLANDSUvhN4S2/8jUYGEhwvrPsmG
0iyOM4E07SWn/TDZwUtvlPUcAEzjhMv7Qxz4GMV0FQ/apBVLjXao5EuUXqk63LVu
ftDtHYT5iuyJ4RmuvpPrnHe1INdySkNuHgHkeKP1MFXcY1WKXQc+Y86f/IfQj/l+
0M3Bx2OPkUTlE+3caH+5PsbGDgdklL1fi4gOsyfyR/7I+MSg15dlDUrC1Zi4PYBa
xAL2De8O5V5JsjdwLvSwvcrpVqDfouKG8x8h6qsj8mEAxUl+R+HN5Bb/1RCjQ8Kb
0cfk+DS+xFVqOxbMAIupL1ltIb+JjK1oRUyXWs1k0siwR2dBpXguHgA59fl1iSf1
knFJW7aTjJ9ZKLYayAZ5J+pIsyIYjehQn6WI37UjIEU3f1Xg1G4hA/Trh7HfoRDH
ONelzgKcXkStZMn3czpS22L8gveKPDoxTQO0JX6s4QYXXhkkXGliS74OwO9tyzwq
qRlGi7ta3Q/3dHXs/g8y
=pILu
-----END PGP SIGNATURE-----

--xa2m3bvryotdr2ou--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
