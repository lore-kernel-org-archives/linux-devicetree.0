From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 4/6] drm/panel: simple: Add ability to override
 typical timing
Date: Mon, 19 Feb 2018 16:25:55 +0100
Message-ID: <20180219152555.GN11455@ulmo>
References: <20180208174855.55620-1-seanpaul@chromium.org>
 <20180208174855.55620-5-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1180069235=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180208174855.55620-5-seanpaul@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-Id: devicetree@vger.kernel.org


--===============1180069235==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="57SHPaztv6dlLu/a"
Content-Disposition: inline


--57SHPaztv6dlLu/a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 08, 2018 at 12:48:51PM -0500, Sean Paul wrote:
> This patch adds the ability to override the typical display timing for a
> given panel. This is useful for devices which have timing constraints
> that do not apply across the entire display driver (eg: to avoid
> crosstalk between panel and digitizer on certain laptops). The rules are
> as follows:
>=20
> - panel must not specify fixed mode (since the override mode will
>   either be the same as the fixed mode, or we'll be unable to
>   check the bounds of the overried)
> - panel must specify at least one display_timing range which will be
>   used to ensure the override mode fits within its bounds
>=20
> Changes in v2:
>  - Parse the full display-timings node (using the native-mode) (Rob)
> Changes in v3:
>  - No longer parse display-timings subnode, use panel-timing (Rob)
>=20
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: St=C3=A9phane Marchesin <marcheu@chromium.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 67 ++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index 5591984a392b..87488392bca1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -34,6 +34,7 @@
>  #include <drm/drm_panel.h>
> =20
>  #include <video/display_timing.h>
> +#include <video/of_display_timing.h>
>  #include <video/videomode.h>
> =20
>  struct panel_desc {
> @@ -87,6 +88,8 @@ struct panel_simple {
>  	struct i2c_adapter *ddc;
> =20
>  	struct gpio_desc *enable_gpio;
> +
> +	struct drm_display_mode override_mode;
>  };
> =20
>  static inline struct panel_simple *to_panel_simple(struct drm_panel *pan=
el)
> @@ -99,11 +102,22 @@ static int panel_simple_get_fixed_modes(struct panel=
_simple *panel)
>  	struct drm_connector *connector =3D panel->base.connector;
>  	struct drm_device *drm =3D panel->base.drm;
>  	struct drm_display_mode *mode;
> +	bool has_override =3D panel->override_mode.type;
>  	unsigned int i, num =3D 0;
> =20
>  	if (!panel->desc)
>  		return 0;
> =20
> +	if (has_override) {
> +		mode =3D drm_mode_duplicate(drm, &panel->override_mode);
> +		if (mode) {
> +			drm_mode_probed_add(connector, mode);
> +			num++;
> +		} else {
> +			dev_err(drm->dev, "failed to add override mode\n");
> +		}
> +	}

Do we really want to continue after this? Shouldn't the override mode
simply override everything else? That is, if users do override the mode,
do we want to give them additional modes to potentially choose from?
Presumably the reason why the user had to override is because the fixed
one didn't work.

Actually, we should only ever have either the display timings specified
or a fixed mode. Anything else is rather bogus.

> +
>  	for (i =3D 0; i < panel->desc->num_timings; i++) {
>  		const struct display_timing *dt =3D &panel->desc->timings[i];
>  		struct videomode vm;
> @@ -120,7 +134,7 @@ static int panel_simple_get_fixed_modes(struct panel_=
simple *panel)
> =20
>  		mode->type |=3D DRM_MODE_TYPE_DRIVER;
> =20
> -		if (panel->desc->num_timings =3D=3D 1)
> +		if (panel->desc->num_timings =3D=3D 1 && !has_override)
>  			mode->type |=3D DRM_MODE_TYPE_PREFERRED;
> =20
>  		drm_mode_probed_add(connector, mode);
> @@ -291,10 +305,58 @@ static const struct drm_panel_funcs panel_simple_fu=
ncs =3D {
>  	.get_timings =3D panel_simple_get_timings,
>  };
> =20
> +#define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
> +	(to_check->field.typ >=3D bounds->field.min && \
> +	 to_check->field.typ <=3D bounds->field.max)
> +static void panel_simple_add_override_mode(struct device *dev,
> +					   struct panel_simple *panel,
> +					   const struct display_timing *ot)
> +{
> +	const struct panel_desc *desc =3D panel->desc;
> +	struct videomode vm;
> +	int i;

unsigned int, please.

> +
> +	if (desc->num_modes) {
> +		dev_err(dev, "Reject override mode: panel has a fixed mode\n");
> +		return;
> +	}
> +	if (!desc->num_timings) {
> +		dev_err(dev, "Reject override mode: no timings specified\n");
> +		return;
> +	}

Perhaps these should be WARN_ON() to be annoying, but let the driver
continue with the override mode? Again, this is something that we should
catch during review (when a new compatible is added, or a new driver, we
should make sure that it always comes with a timing).

WARN_ON() is probably enough to let people know when they test that they
forgot something.

> +
> +	for (i =3D 0; i < panel->desc->num_timings; i++) {
> +		const struct display_timing *dt =3D &panel->desc->timings[i];
> +
> +		if (!PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hactive) ||
> +		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hfront_porch) ||
> +		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hback_porch) ||
> +		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, hsync_len) ||
> +		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vactive) ||
> +		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vfront_porch) ||
> +		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vback_porch) ||
> +		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vsync_len))
> +			continue;
> +
> +		if (ot->flags !=3D dt->flags)
> +			continue;
> +
> +		videomode_from_timing(ot, &vm);
> +		drm_display_mode_from_videomode(&vm, &panel->override_mode);
> +		panel->override_mode.type |=3D DRM_MODE_TYPE_DRIVER |
> +					     DRM_MODE_TYPE_PREFERRED;
> +		return;
> +	}
> +
> +	dev_err(dev, "Reject override mode: No display_timing found\n");

Perhaps something like this, to simplify the code flow:

	if (!panel->override_mode.type)
		dev_err(dev, ...);

Then turn the above return into a break and leave out the below return.

> +	return;
> +}
> +
>  static int panel_simple_probe(struct device *dev, const struct panel_des=
c *desc)
>  {
>  	struct device_node *backlight, *ddc;
>  	struct panel_simple *panel;
> +	struct display_timing dt;
>  	int err;
> =20
>  	panel =3D devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
> @@ -338,6 +400,9 @@ static int panel_simple_probe(struct device *dev, con=
st struct panel_desc *desc)
>  		}
>  	}
> =20
> +	if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
> +		panel_simple_add_override_mode(dev, panel, &dt);

Perahps "panel_simple_parse_override_mode()"? To clarify what exactly
this does. This doesn't actually "add" the mode yet, that's only done
in panel_simple_get_fixed_modes().

Thierry

--57SHPaztv6dlLu/a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlqK7IEACgkQ3SOs138+
s6Ezsg//TIKrt34EjRNkroILHDq8GDHiYCmx6/Wa2ncC0foRK01z/qyRkcDCWWro
LdXyZYiUYYAFRRKWhfwUkwDmPYWdulFE4NGBy/zmQTpEUvUPxqISxr1lFcumomh1
JjCOI8LiGWxsyvcTPuNwh9B8o2mPl9o6YBa0pVdP1zegJLN/Xxqg9rBkpdPRhi/9
xW9EjcDB3tIUHeBVIjOuNOjkundtDPizuNlO5Ewu0xhgKGJU5ipD2ErAzcacQRA9
zpVsNyfEMgEWlKNkAYoTIeS4prKNAUxLgYfI1MQuGmwWN7XAGvbDqRHhgJQmMsc8
R3DbYNJE2j8bCo/vYutfkWN9alsZK54r59E0FYoEr/e3bzND8j8Hw9mLJv0nwya+
iTlBtpWYxfH7XW5iFCok5bhd2K8zQuPo5S+gDvmmlXpi6BR8g3TRaSfKxZitoLva
tKKnhWg2X5KQ9yvRG+VL8aQ+3i0ZyAAiKYVUjVR+JrP8/U8zZN/sxAUSrsym/5Bb
5m/65Ik/jow+YDe5cdb6wwl1a3ugmMrELaxdIPXZOC/cpHGO+C5YdPeAGARq4WOe
pd8QONiNFWRhknFCV2SV/ZcswrRqn4S8+ryd+NQOdYTzVKgMdu4hOjuu8d9sn+ML
g1rvoAGELIYV6H1uK2AK9AUlKes8S1VsBYoL2/jN0+OGJAxm9vA=
=2rcc
-----END PGP SIGNATURE-----

--57SHPaztv6dlLu/a--

--===============1180069235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1180069235==--
