From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 10/19] drm/sun4i: hdmi: Rename internal DDC clock to
 avoid name collision
Date: Fri, 2 Jun 2017 21:30:12 +0200
Message-ID: <20170602193012.xwuziggyx6evmusz@flea.lan>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-11-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7y53a2smtra3yz4w"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170602101024.18940-11-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--7y53a2smtra3yz4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2017 at 06:10:15PM +0800, Chen-Yu Tsai wrote:
> The DDC parent clock on the A31 SoC is also conveniently named
> "hdmi-ddc", which results in a name collision when the hdmi driver
> registers its internal DDC divider clock.
>=20
> Rename the internal clock to "hdmi-ddc-divider".
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm=
/sun4i/sun4i_hdmi_ddc_clk.c
> index e1071838f487..9a6b6243e977 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
> @@ -125,7 +125,7 @@ static int _sun4i_ddc_create(struct sun4i_hdmi *hdmi,=
 struct clk *parent,
>  	if (!ddc)
>  		return -ENOMEM;
> =20
> -	init.name =3D "hdmi-ddc";
> +	init.name =3D "hdmi-ddc-divider";

Can't we rename the CCU clock instead? Having the clock called
hdmi-ddc being the actual clock output on the DDC bus feels more
natural.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7y53a2smtra3yz4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZMbzEAAoJEBx+YmzsjxAg+W0P/0PxhdeQ1+8PIIiKtkbF2xFr
NTcNMGvLcni1Hi3NWyLE/V6p91o/XmC3VdTKvF4Xz2u75YWKLiT+adorC36TYOkf
2PTESXtN4EuMjVGc9rLixF9kW/GSYMZbgQJzYyH09aUkmCQtdRDQcO59bdvUXvDv
WaUWL5mrHcllBh+MgR/+6psXLnmcB0XXXcRAbB4LmrjNKB9A51uay/iITUVteDo1
3I4XA0dRv8FeFAUPA4zMLOMYjdsMuYVNWYu5S8+0oJt78EbmX9xOQJ7Abfpr3XB4
peo+oTA6XXibnaTOhLTTqSFJJI9VNu6wEv+uw/AVb5sx+OjEqRVS9pGiN6q2xx0s
YfBtN8xPmexM7qQFktgWTL7ODKIwa6w2izv1n536OlzJXxApPdgbWlxJw6SHuQj7
QWnjghOP1B1XjleLH+fOO47Ocfesd5dfIvDhM1Vf8S6quzFWTlPBFoRrB3C1PJc0
bcs3ZTT+DUHAftT5AmdUlqNUhreNnGNC9X77tloOis4YIsYRA8GknQx3V2AlLpRy
QwIw2YIZfqHERla4GGIQg0h00583J0A79aXbtUcxgzhvGQv4JKc/C9ZGuykBpUPP
uoZ9A7XOydDJ/JF6/3P7pv3aFfDx0IAO86euPYOlDCbte8qyKHsIQlOT8gOwcAs4
OjAluf9xndDmUSXnXX0b
=lGDu
-----END PGP SIGNATURE-----

--7y53a2smtra3yz4w--
