From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v2 4/7] dt-bindings: pinctrl: mcp23s08: add documentation
 for irq-open-drain
Date: Sun, 8 Oct 2017 23:15:37 +0200
Message-ID: <20171008211537.x5guehawe3e4x6cq@earth>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
 <1507266491-73971-5-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xdngcljtt35tg73w"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507266491-73971-5-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, poeschel@lemonage.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--xdngcljtt35tg73w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 06, 2017 at 01:08:08PM +0800, Phil Reid wrote:
> This flag set the mcp23s08 device series irq type to open drain active lo=
w.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.t=
xt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> index 8a5bf99..7a0808f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> @@ -58,6 +58,8 @@ Optional device specific properties:
>          On devices with only one interrupt output this property is usele=
ss.
>  - microchip,irq-active-high: Sets the INTPOL flag in the IOCON register.=
 This
>          configures the IRQ output polarity as active high.
> +- microchip,irq-open-drain: Sets the ODR flag in the IOCON register. This
> +        configures the IRQ output as open drain active low.
> =20
>  Example I2C (with interrupt):
>  gpiom1: gpio@20 {
> --=20
> 1.8.3.1
>=20

--xdngcljtt35tg73w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnalXkACgkQ2O7X88g7
+ppkZg//RCZS6GBAbVbJ9DyPsd3iyp6QZP8gMb6tefWs5JtFjv5g2XE/XMoOlaTy
2gyx1XWojJF7/T6F/BtR1LSBpy42iqytS679+iBIg0ohLto7ZPOddRf2AHxPJc8S
AW3PhiNDeYLFw+1hvUgfvZlxJYphnifs2iPajDlhtHDBCCJSvjja5jrUJwc5ng9d
larX1ZnM9Gwaxg8JgmA1aNKEVhD6Zudh7p1ZPsJxL16ZxTsvCGBX1tKhn4iTMC66
KaKcBhADO8M9zzh16kIWyQ0JWQ2xi8Ml1yeMsYAXf4EK6fw7xjEY8m+xrdHIlWLB
Xwc3WZc89lWyKMJCibwtAn0XnFw+BvP3/ueXN8x9plyeLjH1c0bS88Zi0AlO6aoN
2HbRhu1V4hyVrw82tX/9upyZksBbg/xxglLumEOpwyvottnymDXB2JjNFVgntgWY
R5cMkfKHHVYAPisPLfzdux56ng+Q49jQeficometOYUF5e+Xt4NO2VvXPExq3Nl7
W5f+m4zAce2fMoZGLqlTg96GwjDVkBMNEnU+nZu+R/b5+SuWEB7VS4XEPr5OKc1G
9CjBKogGJV/DxjBvm3xE3E7k5vSY1nci55p28pxBXKRQcQF1kVp1N5vo7kERaEtV
DFtNJsJQ8wAlNlOjB4+o8D2uD82bZNpNr7FgJsDhKcR/B85dNh8=
=bWC+
-----END PGP SIGNATURE-----

--xdngcljtt35tg73w--
