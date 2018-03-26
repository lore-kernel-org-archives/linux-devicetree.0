From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/7] ARM: dts: sun7i: Add pinmux settings for LCD0 RGB888
 output.
Date: Mon, 26 Mar 2018 12:01:14 +0200
Message-ID: <20180326100114.fa7vjw342ad6vrb6@flea>
References: <1521662593-25468-1-git-send-email-giulio.benetti@micronovasrl.com>
 <1521662593-25468-4-git-send-email-giulio.benetti@micronovasrl.com>
 <1521986953.5301.4.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0732784742=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1521986953.5301.4.camel@paulk.fr>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <contact@paulk.fr>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Giulio Benetti <giulio.benetti@micronovasrl.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0732784742==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kvyug2bhn367ymkd"
Content-Disposition: inline


--kvyug2bhn367ymkd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 25, 2018 at 04:09:13PM +0200, Paul Kocialkowski wrote:
> Le mercredi 21 mars 2018 =E0 21:03 +0100, Giulio Benetti a =E9crit :
> > The A20 supports RGB888 with H/V sync from LCD0. Add a pinmux setting
> > for the needed pins.
> >=20
> > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> > ---
> >  arch/arm/boot/dts/sun7i-a20.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi
> > b/arch/arm/boot/dts/sun7i-a20.dtsi
> > index efb5607..bfe6728 100644
> > --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> > +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> > @@ -922,6 +922,14 @@
> >  				pins =3D "PI20", "PI21";
> >  				function =3D "uart7";
> >  			};
> > +
> > +			lcd0_rgb888_pins: lcd0-rgb888-pins {
>=20
> It would be more consistent with other pins definitions to have
> underscores in both names and to indicate the index, such as:
> lcd0_rgb888_pins: lcd0_rgb888_pins@0 {

Both your suggestions will generate DTC warnings, and we'd like to get
rid of them eventually :)

> This way, other set of pins for LCD (PH0-PH27) can be declared as @1
> when they are needed in the future.

A better idea would be to call it lcd0-rgb888-pd-pins, and introduce
the ph variant when it's done.

Maxime



--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--kvyug2bhn367ymkd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlq4xOkACgkQ0rTAlCFN
r3QwMQ/+KtpVlKKnNuCBTlk+QQBWB9RbdhcRiowimtbvNrdC76o1Euhug/HUHSky
IMa98Ip9Y6qXKD11OPws+sCIUitYz3CrQ6wjgXFmt0Ez5c555tbW3Pppx5Z6Xes/
OMPxenqwvrLUVnip14V5twoDR/uUmidR6fN4V8KY7/QBU6o2z4XvkCVfjkomkuF7
PxVBCUS7ZQgN6fLES5pDh9U3u4k7L8m0XO6hZiLjLERNO2YzkD9oNM9I2A5yi8T9
F4yoh93JTVBAn6X8mz9LRyd3+1CK9q0UbZIeXPoZ29lzc3hP8kwd9j91r2Evjx0P
SBdeXnAhZdwhmTntub0x3dBC1sVRwj2Mip44roxccpgyVjWDJfHn7fqcyIBQhkW+
lbrqq2tC9PeljoGe5JiBnHE7zk47xXj7m2K0KRe2/HVUDjJmIHMvdqbM2q5j9sA+
iVItxjgSTZCQhVqS1yqMHsIqupsG4IId3YqkoYHHVSqXi21nXLqy2SklWnkQplPy
/tY7n208rqD9gGbVIk/G2GCRgslsqUimYvtlvJg9ryKMOLn53NeZbpNxMCFXbg1R
1zWMOYUOEMK5unpZrl8cEtV55sGxrFzFoqALf53DPesckaQR3PS2Ohl87vhDNAqY
rtNQijtgNZmBatSgUjJEuZ8of9YHqyGaZVTnAi6TRtO+/OLZNCo=
=FPMJ
-----END PGP SIGNATURE-----

--kvyug2bhn367ymkd--

--===============0732784742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0732784742==--
