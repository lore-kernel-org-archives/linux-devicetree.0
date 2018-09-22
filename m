Return-Path: <SRS0=eRJM=ME=the-dreams.de=wsa@kernel.org>
Date: Sat, 22 Sep 2018 20:44:43 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/4] pinctrl: sh-pfc: r8a77470: Add SDHI2 voltage switch
Message-ID: <20180922184443.GD841@kunai>
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline
In-Reply-To: <1537530911-443-3-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>


--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 12:55:09PM +0100, Fabrizio Castro wrote:
> Add SH_PFC_PIN_CFG_IO_VOLTAGE definition for the SDHI2 pins
> capable of switching voltage. Please note that with the
> RZ/G1C only 1 bit of the POC Control Register is used to
> control each interface.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

In general:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> +	if (_bank =3D=3D 4 && _pin >=3D 14 && _pin <=3D 19)
> +		return 1;
> +
> +	return -EINVAL;

I'd like a tad better to bail out on the error case and have the main
path returning on the good case, but no strong opinion...


--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlumjZoACgkQFA3kzBSg
KbaayA//eVvTh3L96tCoXR4xHg7QxXNS+Gd+6qSr55sk7nRRj/QGytJ8g6QmTtIX
IkDccLXqHCOUIoMdWCPzX1+nMndDbOZKk4pZPR5Ymg/RN4MzurEBVTYXV9MBneD5
8m0Rz7kfeJhKYram7F5vDj9IkhVk+wab8jhbA4Lz8wTJtLD45y5c3sOhdWCe2h5z
jcgCuE48Kpjp3eJ3NmCynFh0DSb/OOpZMVckxXF3d+2S4g0vDZvZOWQXzLj25VqV
LBTNUqi1CNTvt5llHGsB+RdOpvB5syzO25QmwgTXKbUQlFEIO91Qa9ab7Wit9nCx
kLDOISlBpj676j5CW+kMbX+ps4AsC5gemcBTm8uwwlZbuGEPIkK4lG2YoJe2PRum
OONlK1JajQV6BTiu4uBXRgddyyP1n+hh3icXjD7ny00HzJoTBdtLEZ1c0kn+o/vk
jMKMG+LLX0zPPCQkI4Fpkx0FGw/Jq8kjnvKsnItdsKpACsry3DhbCMNy2MsiE2CL
qk/wPht+Urak3OkaXV2GNDxDYBZzRfCOiWan/8mOCMMWNEZSv7s8K35w1w36d5OS
ewsgeBGAJ+Y0ckVEbSuVoDyF432sHyz9boIIrVEtR5STgMdUMwtbk7jItkEb1A2T
sTUwWknxoFQZSB2MtoK3qAKI1ZAVgA4pl8pB5ulNmfmxWeg45NI=
=8Vv8
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
