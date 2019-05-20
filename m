From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: h6: add watchdog node
Date: Mon, 20 May 2019 16:44:04 +0200
Message-ID: <20190520144404.zprbuqt3d7uuxgr2@flea>
References: <20190518152355.11134-1-peron.clem@gmail.com>
 <20190518152355.11134-3-peron.clem@gmail.com>
 <20190520073652.itk452vrpnicta5v@flea>
 <CAJiuCceEL9xH45P6Gj99YTir_1tkyraf5HefDNfm9p+UtdLs8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ilnq5ytbw3qmunv6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJiuCceEL9xH45P6Gj99YTir_1tkyraf5HefDNfm9p+UtdLs8w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--ilnq5ytbw3qmunv6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 20, 2019 at 10:21:40AM +0200, Cl=E9ment P=E9ron wrote:
> Hi,
>
> On Mon, 20 May 2019 at 09:36, Maxime Ripard <maxime.ripard@bootlin.com> w=
rote:
> >
> > On Sat, May 18, 2019 at 05:23:53PM +0200, Cl=E9ment P=E9ron wrote:
> > > Allwinner H6 has a watchog node which seems broken
> > > on some boards.
> > >
> > > Test has been performed on several boards.
> > >
> > > Chen-Yu Tsai boards:
> > > Pine H64 - H6448BA 7782 =3D> OK
> > > OrangePi Lite 2 - H8068BA 61C2 =3D> KO
> > >
> > > Martin Ayotte boards:
> > > Pine H64 - H8069BA 6892 =3D> OK
> > > OrangePi 3 - HA047BA 69W2 =3D> KO
> > > OrangePi One Plus - H7310BA 6842 =3D> KO
> > > OrangePi Lite2 - H6448BA 6662 =3D> KO
> > >
> > > Cl=E9ment P=E9ron board:
> > > Beelink GS1 - H7309BA 6842 =3D> KO
> > >
> > > As it seems not fixable for now, declare the node
> > > but leave it disable with a comment.
> > >
> > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> >
> > If it doesn't work most boards, then why do we need to merge that
> > patch in the first place?
>
> My personnal opinion, is that having the IP declared and disabled with
> a comment saying "it's broken on some boards" in the device-tree is
> better than not having at all.
>
> This will explicit say "the IP exist but don't use it!".
> Maybe some people with a functionnal board would like to explicitly
> use it on their dts.

Yeah, that makes sense. Chen-Yu, any opinion on the matter?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ilnq5ytbw3qmunv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOK9NAAKCRDj7w1vZxhR
xTPcAP41As2dmsqJWuZDGwrGeXjz5+67O+gfyWMVpwNTjBfB3wD+LDkh8o3xUFs7
x5b2IjWeOW15lbD6dJpdtyxuRX4coQg=
=178x
-----END PGP SIGNATURE-----

--ilnq5ytbw3qmunv6--
