From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/4] pinctrl: sunxi: add allwinner A83T PIO controller
 support
Date: Thu, 24 Sep 2015 12:15:03 +0200
Message-ID: <20150924101503.GQ4684@lukather>
References: <1442936337-3104-1-git-send-email-vishnupatekar0510@gmail.com>
 <1442936337-3104-3-git-send-email-vishnupatekar0510@gmail.com>
 <CAGb2v66gd9qe-yPwENp8e6incjiN7OhXKk00=1gbkofvKrM9og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W+nSBPrhyZdnT2dj"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66gd9qe-yPwENp8e6incjiN7OhXKk00=1gbkofvKrM9og@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Linus Walleij <linus.walleij@linaro.org>, Jens Kuske <jenskuske@gmail.com>, Hans De Goede <hdegoede@redhat.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--W+nSBPrhyZdnT2dj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 12:06:56AM +0800, Chen-Yu Tsai wrote:
> > +static const struct sunxi_pinctrl_desc sun8i_a83t_pinctrl_data =3D {
> > +       .pins =3D sun8i_a83t_pins,
> > +       .npins =3D ARRAY_SIZE(sun8i_a83t_pins),
> > +       .irq_banks =3D 3,
>=20
> Do you know if there's a hole at where PA_EINT interrupt registers
> should be? AFAIK we aren't handling that properly, but that is outside
> the scope of this patch.

Judging from the A83t datasheet, PB seems to be the first IRQ bank, so
it should be fine.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--W+nSBPrhyZdnT2dj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWA80nAAoJEBx+YmzsjxAgc5oQAKHCw/z5KoIdQIvc6f0oDzXY
5qUywmnPglcpOxHddCHA2CQU8hYts6YU3glsEPe6K803iCnvLWysMBiZBd9X3wKQ
HS58q8J5XT76Q8Bmsklumjs+Ou4DlvZq79dm4VweefPo1CZoc/f4baPVtuW6IRjq
izHGWxjB1aHgg80ebQEbAt4002LEOVINOL0IwRBanDlE192JZ9TuKdiunbc7sXz/
sNT8wKdbNt6kZhmZTi/4YkvgBx5bgQXce+PGXJIRPyM7daIZdLh27z/8bzTLNjJl
JMaWximN2/JxIU2N/0YAD8IIUWrtg3eoSkAa1rhpJzS1t0vl9yGbnDwGIrx7mAwj
bBI/YKY1YjYV2IbLy30xM413u/XmtlEbUVRq0nIhr2M6sgBCCkKVhosCEvLMMCl2
mZqbVl8WItCI4GCdCZEwoi4vnKi+oLsDnT9J9JP8slNbjRt08O7w7VC/diwzSBDA
rU9+1p+/1ByEy0hliouyMi1gCsPB/e+uOBz5nZVaBcD5PuyYAjacySeco0mPAzZ1
188wy3nWTDURuYbXesOUr8CiugnC5WDVSH+iXheYatZt51/+mAreaD1okLSp/FGc
9ap5+kpL+CaTSa4UG4sbrjcHbcEa2Vdg/HFaj3QFjf2pP8N7chT+fBLxSXNHOwyF
9Cu2G5rzNrBkQgJbn+/W
=OZMX
-----END PGP SIGNATURE-----

--W+nSBPrhyZdnT2dj--
