From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v2 7/7] pinctrl: mcp23s08: remove unused variables from
 pinconf_set
Date: Sun, 8 Oct 2017 23:12:27 +0200
Message-ID: <20171008211227.ye63jjbvjlxu4czh@earth>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
 <1507266491-73971-8-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2muw7nddynsrgcwa"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507266491-73971-8-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, poeschel@lemonage.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--2muw7nddynsrgcwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 06, 2017 at 01:08:11PM +0800, Phil Reid wrote:
> Variable mask and val are not used in the mcp_pinconf_set().
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Thanks, those are leftovers from before I added mcp_set_bit.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

> ---
>  drivers/pinctrl/pinctrl-mcp23s08.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index 8dceaa1..8e461cc 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -279,8 +279,7 @@ static int mcp_pinconf_set(struct pinctrl_dev *pctlde=
v, unsigned int pin,
>  {
>  	struct mcp23s08 *mcp =3D pinctrl_dev_get_drvdata(pctldev);
>  	enum pin_config_param param;
> -	u32 arg, mask;
> -	u16 val;
> +	u32 arg;
>  	int ret =3D 0;
>  	int i;
> =20
> @@ -290,8 +289,6 @@ static int mcp_pinconf_set(struct pinctrl_dev *pctlde=
v, unsigned int pin,
> =20
>  		switch (param) {
>  		case PIN_CONFIG_BIAS_PULL_UP:
> -			val =3D arg ? 0xFFFF : 0x0000;
> -			mask =3D BIT(pin);
>  			ret =3D mcp_set_bit(mcp, MCP_GPPU, pin, arg);
>  			break;
>  		default:
> --=20
> 1.8.3.1
>=20

--2muw7nddynsrgcwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnalLgACgkQ2O7X88g7
+pqN4A/8DTUeiuA8sau6qJ6yTc6H7qa62pn/8SYMF3viHb8BYDlH5e/Rt8oQdGpJ
45HQc+VSn5ACGyT3yl2Ja5cq7rRbohMzzkouIa5p2flfne5rbjBZyutamUAjd0NG
hRVayKNhTMeyA3ddgToFJcoOaEGR78PVEF0ZdLkf9+NBDK6M5sXBhUdFE7jXGDxn
goPAMg48LMVNF7HN3E+9Rj/ioONJAX9OXgcFEE2u/HDAHBJQm78udXEan6FzZsvQ
x0aNGWsWtOQtmiUV5u3RpjIC9OwPfixqFVg+UKkuiY/U70pspvxrMsMGUQQv7ra5
qYpYBqUlRLo8JYFLL3+W8RuKUrUzMK4ZpwGtpMgzOq+xVLzZHgY38CFbVpYfHfWd
WF2iRVrIARmg7Q/CWGkrThXl4lS2RgvTvXzH2z8uytb6sebjEcJ4x5MJ8S5hsHpP
Mr/H0X62D7V8IseTbpfpjmR2rJH1QIMPKvatw0/XM/5sJsFm62w4q62YSjrhrP1K
dPKUKxNjCsCPYlzae/ZJNkE5ImjcBxSy0EKbjMWAZKLR8x3jmrB3vTHHleZZapym
Px0IVrR8itpkVZH7MOqxVcpnmWNV8W5cNmzjIt41Hhcu0ftDJtxMoQ29YOqUr6mE
33HB+IkutWG+zoKN+W155dHKvuOhcf0M2Rbr+9MKerovqh8Yj80=
=RWMV
-----END PGP SIGNATURE-----

--2muw7nddynsrgcwa--
