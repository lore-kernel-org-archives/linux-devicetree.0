From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/3] dmaengine: sun6i: Add support for Allwinner A64
Date: Fri, 8 Sep 2017 16:39:13 +0200
Message-ID: <20170908143913.6ga64ssakvk2mjis@flea.lan>
References: <20170830233609.13855-4-stefan.bruens@rwth-aachen.de>
 <20170901003135.10058-1-andre.przywara@arm.com>
 <20170901060445.vboici7qxfkztp3s@flea>
 <743ae23a-372a-762b-c345-b914f09fd718@arm.com>
 <20170904070415.e6nclz5n23bo7f4v@flea>
 <d3d32839-12a8-71fa-cfec-03055d64388d@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mw5xc3xt6qcvg4z7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d3d32839-12a8-71fa-cfec-03055d64388d@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Cc: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>, linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--mw5xc3xt6qcvg4z7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 04, 2017 at 09:14:52AM +0100, Andr=E9 Przywara wrote:
> > And obviously, while maintaining the stability of the binding of those
> > hundreds properties.
> >=20
> > Or, you can base all this on the compatible, and be done with it once
> > and for all.
>=20
> What I am after is to cover SoCs which *don't* have differences in their
> register layout, for instance A83T, H3, A64, R40.
> In an ideal world we could have reused the H3 compatible string,
> adjusting the number of channels for each SoC in the DT.
>=20
> So I see that having a generic compatible name will not fly, as we now
> have differences which should not be modelled by DT properties.
> But I still think we should try to cover those non-register differences
> (number of channels) with a DT property, to allow reusing the existing
> driver code whenever possible. As is stands with this series, the R40
> support should just be a matter of:
> 	compatible =3D "allwinner,sun8i-r40-dma",
> 		     "allwinner,sun50i-a64-dma";

I just suggested the exact same thing, and then saw your mail, so I
guess we have an agreement :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mw5xc3xt6qcvg4z7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZsquRAAoJEBx+YmzsjxAg1NkP+wd9vfGoWbV35Gx6OGu9b0B/
AiaOdLOaVG7fWfYP9mEUZFJoEGd+B5nT9ziNB6oeSBVwwfehefP2J15gAU/nlta1
53lac2FJ8vKNsVk30aJ0/v7f2cb4rUETzgmTN1lS1y/bcpw8nU0ik7qc3td5dYj6
2E9Xd9Mxy3u2LhOQ9YzeANB9BpdY9cASVxbFoRtVWwaROhd6equIh2qtZ+KlBPFe
FW1trleqC1rPCWQ5PBf0C83ZwdXq0r+RwMZRCjZzjf/W0fVkPRmU9xiLxDh/2xPw
oPJvefkio42KFi6RsnnlL5QPMVAonU1g3v8wPVJoqp5+0qdw1x65mUE6xA3zDkRy
HKIRB8zkwc9htjOLhpCaH9g5915cIwmJrtnlndCIhD0l+ZTO1psunxmgPW2LzwCu
PROj3mgITfrc/WpQ2XsTZa6ADjoHP28k5W+kJ2P3nKUk76n9ZM2qKGe94tIk+R/c
S6GAKOEz7ijFWV5HcIUx5zFBmfWwMPz8aKUGRAdxpWHxxKD653gSmZ9l6Xi8JHcI
C5YxyA6Ox29JaTR0jZngQnFr1A7kVTzlTRXDr3gBT0kWyshR909mkL478Tqq4qoq
LpIyPbfmcARy1oCb2hu48jW4a3n0eqx9WoZCMhi4cmW+zg6up5v5wsR7LO56EsvE
0lJ7eTIMsj37pzO4e74A
=5LPq
-----END PGP SIGNATURE-----

--mw5xc3xt6qcvg4z7--
