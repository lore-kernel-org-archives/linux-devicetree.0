From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] Re: [PATCH] ARM: sun8i: h2+: add support for
 Banana Pi M2 Zero board
Date: Thu, 2 Nov 2017 16:50:03 +0100
Message-ID: <20171102155003.vp7uve4ypyn4sb6j@flea>
References: <20171101093814.19177-1-icenowy@aosc.io>
 <20171102090248.wnvj7dpphn5uqsut@flea>
 <8327eaeaa12b99f9962a53c9f02ddd6d@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2m26jq6xavuqoedt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8327eaeaa12b99f9962a53c9f02ddd6d@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--2m26jq6xavuqoedt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2017 at 05:07:30PM +0800, Icenowy Zheng wrote:
> > > +&mmc0 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&mmc0_pins_a>;
> > > +	vmmc-supply =3D <&reg_vcc3v3>;
> > > +	bus-width =3D <4>;
> > > +	/*
> > > +	 * In different revisions the board have different card detect
> > > +	 * configuration.
> > > +	 */
> >=20
> > Which ones?
>=20
> In the sample batch (1.2V fixed voltage) the card detect is normal
> (PF6 low as inserted), however in the final batch (1.1V/1.3V
> switchable) it's inverted at PF6 (high as inserted).

Then just use the final version's.

> > > +&usbphy {
> > > +	usb0_id_det-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
> > > +	/* USB OTG VBUS is directly connected to 5V without any regulators
> > > */
> >=20
> > So it cannot operate in OTG, but it's host only?
>=20
> It can operate in OTG -- you can power the board via the OTG port,
> as the VBUS is not gated from 5V at all, so 5V power at VBUS will
> power up the board. Yes, it's a bit unsafe, but the board designer
> did it.

What will provide the 5v in the first place then if a USB device is
connected to the micro-USB connector?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2m26jq6xavuqoedt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ+z6rAAoJEBx+YmzsjxAgIyIQALhq/FwwL19d3lVtvKvfUx06
Sr3dVxd/0RYKsYxri9EqE3Wd5ZblJreQj1qzs4wIFcHZq+8/44JqSTmKe6xWmtKS
cGxT5G5iDnna4Hv6pVb96WYl3SECkeoKBanJKTluQQMeo6b2BPRxnYP+p78vrTVS
X+DxJRs0PtZsHoDP2wfQ9tniCuWkU5rQ+8Y5LukZ1N2R/W+cZxjK6Sq5oT0xt/dF
kbmwZbkL/6XUblqB3b9VlmuykLB4rl0w8dB6EUEhFQsiJAIQELSHAGbsdCd5lDHA
3IhIUa5vTrAaPPGjZLEo3gCbLbhBYhSAR7jr/9GeOeRu+v1E27vQZMZM7Useidks
FrJDHRJtNVJo7Sxsw4XJzlWMgwUPwsowCCrmx+HtCTAdLTl6oD2G7T7jpoE4aLrB
hgYnqS7AJQ3MAfzYfpQ9UrQ6lkW4o7HW6aMYY8nm+VXpXPr3F8xzfafw+VFYDtNv
7VBiVabWrLgpzqpmdMAnAPTD6oFOIPjf58BkSVPNdVxWCjT/B/h/m4kH+HLz3MEK
bVMFQ+rrk26xryun8Btcqh//FSuHFJVt1NohQ9i5r9TCSTb0/VIIzw30RX2Tn8CU
6ua80n843Qlk1I8Jagz2E4IFWKLN+raEgnvcLxyrOn6I3dZ+qUnNx0kVQeodY5Ke
Tr5niwXdCtp+itfcZZCb
=xqAF
-----END PGP SIGNATURE-----

--2m26jq6xavuqoedt--
