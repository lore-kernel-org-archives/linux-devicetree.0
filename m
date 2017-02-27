From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 8/8] ARM: sun8i: a33: Add the Mali OPPs
Date: Mon, 27 Feb 2017 15:40:57 +0100
Message-ID: <20170227144057.in7uclundvd77s5q@lukather>
References: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
 <2e4a4f3f2f584f65f3c2d5e78f589015c651198d.1486655917.git-series.maxime.ripard@free-electrons.com>
 <20170215234029.3vfh25gxtvz44dsw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1289174578=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170215234029.3vfh25gxtvz44dsw@rob-hp-laptop>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Chen-Yu Tsai <wens@csie.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1289174578==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vlqthyvsp4cqgzwc"
Content-Disposition: inline


--vlqthyvsp4cqgzwc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2017 at 05:40:29PM -0600, Rob Herring wrote:
> On Thu, Feb 09, 2017 at 05:39:22PM +0100, Maxime Ripard wrote:
> > The Mali GPU in the A33 has various operating frequencies used in the
> > Allwinner BSP.
> >=20
> > Add them to our DT.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm/boot/dts/sun8i-a33.dtsi | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i=
-a33.dtsi
> > index 043b1b017276..e1b0abfee42f 100644
> > --- a/arch/arm/boot/dts/sun8i-a33.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a33.dtsi
> > @@ -101,6 +101,22 @@
> >  		status =3D "disabled";
> >  	};
> > =20
> > +	mali_opp_table: opp_table1 {
>=20
> gpu-opp-table

Applied with that change. Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vlqthyvsp4cqgzwc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYtDp5AAoJEBx+YmzsjxAgUCYP/3QB1y2wH9sSn2RY8/KkUq40
B9PW7zWPs4HK0kDloEBlIlAmvqcfZqnjXE5dAmPy0sWKfCT3VEbX7BaxkIdA5STU
mvJVdpd544sE/Rj5Pd4z1a+dJjYRMSRYhIkDeyvnAjFo7nvvNv5yRQmN8H4XW2ce
qF6GylTO+bufxqM1oqF3qGhpwfm4ezyLc+sMCv0DMzuVZPjXkIwmZNZytB/jHgyq
ttaV6jUzbpwtxALLhcGZQUanFTlzXD3v/cCE1OW5P6Pdc9OC0CU3dGQYp+sFxweJ
qDXtx/rEFpHPJ9XdVbs9d5KlsEphbep+RkKOQ0qIjgDvdd8/N6I/RZBUblPoCMaV
pYEpEq/+Xe6l5zqusyPhGIFZ3bRH55b7owkSmOM0YQwH8DQdzq7E52n4mkR14ixJ
zNV0TgWTwqM40lijsVD/qeIpOlLBFxgABuUnCsPjpUCY2e8Rin7ZCMyJUPN6KWos
Ni48r053krU8HWgLzvoJySS/nFP03Tk/T+azUe4z8Ml5FpwVWMiPnAEYEs06AoNc
D3j/V5qId0OYAeAfABKmnl2TkP4LoBYD9/L0B5McuVsOgXdLtl4xW6kEEpS4+yt2
wmhf0e/NWcZPxik2nYtN5RsuasJ+feeUF9gUC4FGNHIaAUQSBN9HtLTiAFfHSAiI
/BCtGbbFoukHMdFYfgVI
=+uJf
-----END PGP SIGNATURE-----

--vlqthyvsp4cqgzwc--

--===============1289174578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1289174578==--
