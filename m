From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 4/4] drm/panel: p079zca: support Innolux P097PFG panel
Date: Tue, 10 Jul 2018 12:59:28 +0200
Message-ID: <20180710105928.GN1504@ulmo>
References: <20180702102721.3546-1-heiko@sntech.de>
 <20180702102721.3546-5-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1149338656=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180702102721.3546-5-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, hl@rock-chips.com, briannorris@chromium.org, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org


--===============1149338656==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qi3SIpffvxS/TM8d"
Content-Disposition: inline


--qi3SIpffvxS/TM8d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2018 at 12:27:21PM +0200, Heiko Stuebner wrote:
> From: Lin Huang <hl@rock-chips.com>
>=20
> Support Innolux P097PFG 9.7" 1536x2048 TFT LCD panel, it reuse
> the Innolux P079ZCA panel driver.
>=20
> Changes in v2:
> - None
> Changes in v3:
> - None
> Changes in v4:
> - None
> Changes in v5:
> - Document source of init-commands
> - 4 lanes per DSI interface
>=20
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c | 200 +++++++++++++++++-
>  1 file changed, 196 insertions(+), 4 deletions(-)

Applied with two small changes, see below.

> diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/=
drm/panel/panel-innolux-p079zca.c
> index 630b0c2549ef..8d25b87bfbd6 100644
> --- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> +++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
> @@ -20,6 +20,15 @@
> =20
>  #include <video/mipi_display.h>
> =20
> +struct panel_init_cmd {
> +	int len;

I changed the type here to size_t for consistency.

> +	const char *data;
> +};
> +
> +#define _INIT_CMD(...) { \
> +	.len =3D sizeof((char[]){__VA_ARGS__}), \
> +	.data =3D (char[]){__VA_ARGS__} }
> +
>  struct panel_desc {
>  	const struct drm_display_mode *modes;
>  	unsigned int bpc;
> @@ -30,6 +39,7 @@ struct panel_desc {
> =20
>  	unsigned long flags;
>  	enum mipi_dsi_pixel_format format;
> +	const struct panel_init_cmd *init_cmds;
>  	unsigned int lanes;
>  	const char * const *supply_names;
>  	unsigned int num_supplies;
> @@ -121,13 +131,43 @@ static int innolux_panel_prepare(struct drm_panel *=
panel)
>  	if (err < 0)
>  		return err;
> =20
> -	/* T2: 15ms - 1000ms */
> -	usleep_range(15000, 16000);
> +	/* p079zca: t2 (20ms), p097pfg: t4 (15ms) */
> +	usleep_range(20000, 21000);
> =20
>  	gpiod_set_value_cansleep(innolux->enable_gpio, 1);
> =20
> -	/* T4: 15ms - 1000ms */
> -	usleep_range(15000, 16000);
> +	/* p079zca: t4, p097pfg: t5 */
> +	usleep_range(20000, 21000);
> +
> +	if (innolux->desc->init_cmds) {
> +		const struct panel_init_cmd *cmds =3D
> +					innolux->desc->init_cmds;
> +		int i;

I made this unsigned.

Thierry

--qi3SIpffvxS/TM8d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEkZAACgkQ3SOs138+
s6FwsQ/+N/cFVjeZX8z087RvxJQ+AU8jhZzuE9DxbqUyfLMGoM9a1WpW5MT4QP8c
wCNY/K68aB3Ipt4BUf2hz/YZZJc3C/V9G5OhABTcwf0OVNzE0IVwUsb3J2gvu3XU
CU/MsvvHu9etFJ9am4kkm5QQHwYXO5i1ZCuJWSrenBfL6IaWS6k3ZTYKl4t+f9mA
p+K5qxqCnlA2kQXzLu3b1FcogjP5HUX7k/ghFoNh8PeAVNoMZpPqSFLePGxem4z+
ITcht2pwKDKpE+ovETw6jRhCVETM37RhX7LYwg1emuOz114hprvnj87D8eWG3TSD
fb39I8ACR+IfK+sT8/ppX4TR5F41++07OdL8TriUcUuuuHq1Vm6cidqVKokFzfY4
iymNaFmZPKGCU3MDwMI+PuSGo9aPgIM+fo0Y+XkZyajDGqNCZcZrasCoTF78tGjV
YhcOHff49dgCbJNjwZ6nnKu9tI0VzA2YfOnBpKONdzIgJUnQJEEhlzuBMY2zT9K9
chkNAdnOeOGaaewL2IcoBda2h1MgGrmoNlMWGUNJe4T1gp2FTDOiQc+uyrl6BmMI
OXAe5Lgm/bUkUL5MJ6KT1UYmkFOZigp6g//CVPnkHKoLGXnFoGGyEtaCVSt4wsyH
NfTvRtQIFSIUTTw+Ap/Su2Wj0vVrj/Qm9otDMukiC6s39gEMHN8=
=HoHv
-----END PGP SIGNATURE-----

--qi3SIpffvxS/TM8d--

--===============1149338656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1149338656==--
