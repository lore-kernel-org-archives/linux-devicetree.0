From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 1/6] drm/stm: ltdc: Add panel-bridge support
Date: Fri, 02 Jun 2017 13:41:34 -0700
Message-ID: <87y3ta86m9.fsf@eliezer.anholt.net>
References: <1496414235-20098-1-git-send-email-philippe.cornu@st.com>
 <1496414235-20098-2-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1981082363=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1496414235-20098-2-git-send-email-philippe.cornu@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Yannick Fertre <yannick.fertre@st.com>, Neil Armstrong <narmstrong@baylibre.com>, Archit Taneja <architt@codeaurora.org>, Chris Zhong <zyw@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Xinliang Liu <xinliang.liu@linaro.org>, zourongrong@gmail.com, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>, Mark Yao <mark.yao@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Philippe Cornu <philippe.cornu@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel Fernandez <gabriel.fernandez@st.com>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

--===============1981082363==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Philippe CORNU <philippe.cornu@st.com> writes:

> Add the panel-bridge support for both panels & bridges (used by DSI host &
> HDMI/LVDS bridges).

This looks like a great cleanup.  Just a couple of things I noticed, and
hopefully once the DT is reviewed we can merge it.  I've also
resubmitted the panel-bridge patch so that hopefully we can land it
soon.

> -static struct drm_encoder *ltdc_rgb_encoder_create(struct drm_device *dd=
ev)
> +static int ltdc_encoder_init(struct drm_device *ddev)
>  {
> +	struct ltdc_device *ldev =3D ddev->dev_private;
>  	struct drm_encoder *encoder;
> +	int ret;
>=20=20
>  	encoder =3D devm_kzalloc(ddev->dev, sizeof(*encoder), GFP_KERNEL);
>  	if (!encoder)
> -		return NULL;
> +		return -ENOMEM;
>=20=20
>  	encoder->possible_crtcs =3D CRTC_MASK;
>  	encoder->possible_clones =3D 0; /* No cloning support */
>=20=20
> -	drm_encoder_init(ddev, encoder, &ltdc_rgb_encoder_funcs,
> +	drm_encoder_init(ddev, encoder, &ltdc_encoder_funcs,
>  			 DRM_MODE_ENCODER_DPI, NULL);
>=20=20
> -	drm_encoder_helper_add(encoder, &ltdc_rgb_encoder_helper_funcs);
> -
> -	DRM_DEBUG_DRIVER("RGB encoder:%d created\n", encoder->base.id);
> -
> -	return encoder;
> -}
> -
> -/*
> - * DRM_CONNECTOR
> - */
> -
> -static int ltdc_rgb_connector_get_modes(struct drm_connector *connector)
> -{
> -	struct drm_device *ddev =3D connector->dev;
> -	struct ltdc_device *ldev =3D ddev->dev_private;
> -	int ret =3D 0;
> -
> -	DRM_DEBUG_DRIVER("\n");
> -
> -	if (ldev->panel)
> -		ret =3D drm_panel_get_modes(ldev->panel);
> -
> -	return ret < 0 ? 0 : ret;
> -}
> -
> -static struct drm_connector_helper_funcs ltdc_rgb_connector_helper_funcs=
 =3D {
> -	.get_modes =3D ltdc_rgb_connector_get_modes,
> -};
> -
> -static enum drm_connector_status
> -ltdc_rgb_connector_detect(struct drm_connector *connector, bool force)
> -{
> -	struct ltdc_device *ldev =3D connector_to_ltdc(connector);
> -
> -	return ldev->panel ? connector_status_connected :
> -	       connector_status_disconnected;
> -}
> -
> -static void ltdc_rgb_connector_destroy(struct drm_connector *connector)
> -{
> -	DRM_DEBUG_DRIVER("\n");
> -
> -	drm_connector_unregister(connector);
> -	drm_connector_cleanup(connector);
> -}
> -
> -static const struct drm_connector_funcs ltdc_rgb_connector_funcs =3D {
> -	.dpms =3D drm_atomic_helper_connector_dpms,
> -	.fill_modes =3D drm_helper_probe_single_connector_modes,
> -	.detect =3D ltdc_rgb_connector_detect,
> -	.destroy =3D ltdc_rgb_connector_destroy,
> -	.reset =3D drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> -};
> -
> -struct drm_connector *ltdc_rgb_connector_create(struct drm_device *ddev)
> -{
> -	struct drm_connector *connector;
> -	int err;
> -
> -	connector =3D devm_kzalloc(ddev->dev, sizeof(*connector), GFP_KERNEL);
> -	if (!connector) {
> -		DRM_ERROR("Failed to allocate connector\n");
> -		return NULL;
> -	}
> -
> -	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> +	drm_encoder_helper_add(encoder, NULL);

I think the funcs table should be NULL by default, so you can just drop
this line.

>=20=20
> -	err =3D drm_connector_init(ddev, connector, &ltdc_rgb_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DPI);
> -	if (err) {
> -		DRM_ERROR("Failed to initialize connector\n");
> -		return NULL;
> +	ret =3D drm_bridge_attach(encoder, ldev->bridge, NULL);
> +	if (ret) {
> +		drm_encoder_cleanup(encoder);
> +		return -EINVAL;
>  	}
>=20=20
> -	drm_connector_helper_add(connector, &ltdc_rgb_connector_helper_funcs);
> -
> -	DRM_DEBUG_DRIVER("RGB connector:%d created\n", connector->base.id);
> +	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
>=20=20
> -	return connector;
> +	return 0;
>  }



> @@ -1129,9 +988,9 @@ int ltdc_load(struct drm_device *ddev)
>  	ddev->irq_enabled =3D 1;
>=20=20
>  	return 0;
> +
>  err:
> -	if (ldev->panel)
> -		drm_panel_detach(ldev->panel);
> +	drm_panel_bridge_remove(bridge);
>=20=20
>  	clk_disable_unprepare(ldev->pixel_clk);
>=20=20
> @@ -1146,8 +1005,7 @@ void ltdc_unload(struct drm_device *ddev)
>=20=20
>  	drm_vblank_cleanup(ddev);
>=20=20
> -	if (ldev->panel)
> -		drm_panel_detach(ldev->panel);
> +	drm_panel_bridge_remove(ldev->bridge);

If you had no panel, this would try to kfree some other module's bridge
structure.  I guess you could track ldev->is_panel_bridge (like I did
for vc4) and conditionally drm_panel_bridge_remove().

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkxzX4ACgkQtdYpNtH8
nugW4A/+JhJ3cBsNLSqBfH9MPLTgMyyo2gS+jimFNHYqFIvv4p/HqRsILvuKb0gF
N4+6R1zFZYD8TZzkfUzAmludjwEg6yIKM0rL3NquOAly51M4pVf07+KYss0Tnz6q
tRIRLdp0lSMwA8lDwMQADsrrBBajNEbm/6gmAoMZhLU22pthyN3VpfiE/ChtV9Zx
cuMErl3qPwbxHeksbvArrBi1mR0e+socmx9ACr2QBTIjR0N39KgPmCjx8OBjYWbN
aJThg2laMuMeg47mZgDy32llptoKWByiNfQGPkBeVxZfo1mYvnxtR1n+bKzwUQm+
i05fU3SFGheJaifx1SrWw3gctnAgQOfYvdoeYmgb1/KHUm6ym4fDb8ycVD+OxOYO
dIg6WJ6s8uVRVXDWfbEnjIaS2r9SPB8vgXJ964tWhG/F9fV1sUvtF/VR4l/wjdsU
xjeqv/MMOhp9MxnXyZJ/5lAFbFafGxoISY+AZdzK93lc9LKhJHoRrE+8BwG9yARz
vJks2XJTmVRr04I/z1hlOj7VMe3OD+CCKpbPyUUVlJhix1qlc86YAIeQB3rPOhKh
LpafUbiw6Ocb25w7frogN3yd1XXyUrz/k7laA7IxnSph6+waNnJ6mZvobgTe3Qig
sWKMejS4o33gc5+P1wEAEnd0IHKN0gT//GvwrVw6TnPxXnKkBkE=
=bf9L
-----END PGP SIGNATURE-----
--=-=-=--

--===============1981082363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1981082363==--
