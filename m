From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH] ARM: sun8i: h2+: add support for
 Banana Pi M2 Zero board
Date: Mon, 13 Nov 2017 09:20:59 +0100
Message-ID: <20171113082059.cxi7diuy6dvremlo@flea.lan>
References: <20171101093814.19177-1-icenowy@aosc.io>
 <20171102090248.wnvj7dpphn5uqsut@flea>
 <8327eaeaa12b99f9962a53c9f02ddd6d@aosc.io>
 <20171102155003.vp7uve4ypyn4sb6j@flea>
 <b548b74e04b29ec8c3cddb7cc42f2b4e@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ns3k6ftyitpkkxmj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b548b74e04b29ec8c3cddb7cc42f2b4e-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ns3k6ftyitpkkxmj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 03, 2017 at 07:53:17AM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2017-11-02 23:50=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Thu, Nov 02, 2017 at 05:07:30PM +0800, Icenowy Zheng wrote:
> > > > > +&mmc0 {
> > > > > +	pinctrl-names =3D "default";
> > > > > +	pinctrl-0 =3D <&mmc0_pins_a>;
> > > > > +	vmmc-supply =3D <&reg_vcc3v3>;
> > > > > +	bus-width =3D <4>;
> > > > > +	/*
> > > > > +	 * In different revisions the board have different card detect
> > > > > +	 * configuration.
> > > > > +	 */
> > > >
> > > > Which ones?
> > >=20
> > > In the sample batch (1.2V fixed voltage) the card detect is normal
> > > (PF6 low as inserted), however in the final batch (1.1V/1.3V
> > > switchable) it's inverted at PF6 (high as inserted).
> >=20
> > Then just use the final version's.
> >=20
> > > > > +&usbphy {
> > > > > +	usb0_id_det-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
> > > > > +	/* USB OTG VBUS is directly connected to 5V without any regulat=
ors
> > > > > */
> > > >
> > > > So it cannot operate in OTG, but it's host only?
> > >=20
> > > It can operate in OTG -- you can power the board via the OTG port,
> > > as the VBUS is not gated from 5V at all, so 5V power at VBUS will
> > > power up the board. Yes, it's a bit unsafe, but the board designer
> > > did it.
> >=20
> > What will provide the 5v in the first place then if a USB device is
> > connected to the micro-USB connector?
>=20
> There're two micro-USB connectors, one is power-only and another is
> OTG. The Vbus of these two connectors are connected together, so
> the external USB device will be powered just by the power input
> from the power-only USB port.

Can you put that in the comment?

Thanks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ns3k6ftyitpkkxmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaCVXrAAoJEBx+YmzsjxAgWb4P/jlDdzJXP/JbEsONU8JRlXtp
sPKJDIMcYYXuiNgJ2acMUiJTdXtTXBbPaoZgqVYSsGXuWveei+69IaIGAV4dsnGs
qBoPf2FdRBqFim82WA9O8OEINWvCSnC3zcJCOlg+72lqJppYeuEK1HO8TeZl/H+Y
DFHHVI4zpprsO0x97lppjdcQqbLptkW6AaOeK7FBDQa4lZf3gWje8czuR084BZmm
WZTwf0M/2CLp1OJzs3DXGdCNevfX9U3GTAI6uNuqtu23/70NOXYn8TBJP0Ggcjs+
GO/09TnilrkbKllmKDWEVvqswmUy8m3dr9sTS5pdsiUHav5j4dtJtVOCHOamM8YA
RmRpF+OfToxy5xo7BiY1IAPxHKexotoW1XHRZXAO5r80FVCnA75jyRkbRv8Ti0Zs
Xei3RauT+ZM7HXz4rQhWzM5q8BQGWeDhDYZTsOdj2ii1ESTE1P01r8QlbPBLYPH5
HKCX9Nz2XGr29XdA5g2II6HquT5sxkZ7dKGXpW6+pXJTxw8f6kVkjzEp01VbGdYV
tD8pO1SOs2Y02V9cajyUPqfr4lH3Dsau5XQFIb5+V+nq5T5wYoc6YZNWzZqWBnGK
w2hdYFBtNSr994B/1uDjYGvEu+WXhXXpLqb6hLRo09BxSxAXGZ7Jz3ziNBnOJFrl
lRcownuC/cscJwI8EL/6
=GKOr
-----END PGP SIGNATURE-----

--ns3k6ftyitpkkxmj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
