From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH] dt-bindings: pinctrl: Move mcp23s08 from gpio
Date: Mon, 9 Oct 2017 12:29:07 +0200
Message-ID: <20171009102907.vnfx3aot3yryqsef@earth>
References: <20171005075002.9901-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jpyipejgld2wy4ux"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171005075002.9901-1-poeschel@lemonage.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--jpyipejgld2wy4ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 05, 2017 at 09:50:02AM +0200, Lars Poeschel wrote:
> The mcp23s08 driver was moved from gpio to pinctrl. This moves it's
> devicetree binding doc as well. So driver and binding doc are in sync
> again.
>=20
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> ---
>  .../bindings/{gpio/gpio-mcp23s08.txt =3D> pinctrl/pinctrl-mcp23s08.txt} =
    | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{gpio/gpio-mcp23s08.txt =3D> pi=
nctrl/pinctrl-mcp23s08.txt} (100%)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt b/D=
ocumentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
> rename to Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

--jpyipejgld2wy4ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnbT3AACgkQ2O7X88g7
+poBnRAAkX3zSXF6sDg6iCWcb4c8bxsqwJmA09N7/tpYT+QxJ/KwofeO1f2N3r3y
0bJcH3L2DbWKAmLKFKMV7yVorVwSQ0HaMErY+BcAjKhPkYq/dNwK9qPBrqiLJUsB
/imCf2nmylihW1bruMG0soHOM/WzizXq6LL4xJRnGGOTF8R7NDTYkuNQxYaQDls5
0X9qLnG7lbTx22PJKxEve7hh0IWw8OWXV9tH/Qj7F3D6WEgz3Jshj0NCfqQr13W0
RgrTeHZ7LBlNeeNDPwWA/m5WjWsZyogUO1E4oYrVK6hb+7mIkVd+UOcHt13urKe2
YSfdYMpwag+hupYZLoNZrFzZ30r/Zqq2VgSGfR+vN/kd58d8ZjJovvLmnKiG9ynX
rrkgmCHQdjCtiMNbrzfeJJX2242AHqzP7dIrFdeqU9dGUw9u+TdNLEYw7LzIAjgd
eC31uPEPLN40mBjJGxevgOaUOYoVxDWrUZCXUFMk5lsGZeuGxR6wf58cHNMB96sq
86SeBBy5sh8898a+HnnWTtAmBFQrxWFG3t84/l4WFI7iTz8LyqlDZVdSzpsAPYCi
pF7wVWvE8r3rsyFFAAMa0+kjioki7w4rp1i4zRIQ/TfiwE2f6PCwBlHw03tqvBEU
qcr1pLWpVXh51HW0Tg7raU5vVx5z+e8P8YzizNWiZc33uHHM38E=
=PcoF
-----END PGP SIGNATURE-----

--jpyipejgld2wy4ux--
