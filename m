From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v2 18/29] drm/sun4i: dw-hdmi: Add quirk for setting TMDS
 clock
Date: Mon, 8 Oct 2018 11:14:06 +0200
Message-ID: <20181008091406.yjs2u22fmj72e4rj@flea>
References: <20181007093905.11253-1-jernej.skrabec@siol.net>
 <20181007093905.11253-19-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1354319521=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181007093905.11253-19-jernej.skrabec@siol.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, wens@csie.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1354319521==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4nrl5kiexzifpjc7"
Content-Disposition: inline


--4nrl5kiexzifpjc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 07, 2018 at 11:38:54AM +0200, Jernej Skrabec wrote:
> It turns out that H6 HDMI BSP kernel driver doesn't change TMDS rate at
> all. At this point it is not clear whether it is just not necessary or
> it would cause some kind of issues.
>=20
> Add a quirk for it.
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 5 ++++-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4=
i/sun8i_dw_hdmi.c
> index ec122136ee9d..e9e93f174b35 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -165,7 +165,9 @@ static int sun8i_dw_hdmi_bind(struct device *dev, str=
uct device *master,
>  		goto err_disable_clk_tmds;
>  	}
> =20
> -	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
> +	if (hdmi->quirks->set_rate)
> +		drm_encoder_helper_add(encoder,
> +				       &sun8i_dw_hdmi_encoder_helper_funcs);

That seems a bit backward, it only works because we only have mode_set
at the moment, and the only thing it does is changing the clock
rate. As soon as we change one of these two assumptions, the code will
break.

Why not just return in mode_set if that boolean is true?

>  	drm_encoder_init(drm, encoder, &sun8i_dw_hdmi_encoder_funcs,
>  			 DRM_MODE_ENCODER_TMDS, NULL);
> =20
> @@ -235,6 +237,7 @@ static int sun8i_dw_hdmi_remove(struct platform_devic=
e *pdev)
> =20
>  static const struct sun8i_dw_hdmi_quirks sun8i_a83t_quirks =3D {
>  	.mode_valid =3D sun8i_dw_hdmi_mode_valid_a83t,
> +	.set_rate =3D true,
>  };
> =20
>  static const struct of_device_id sun8i_dw_hdmi_dt_ids[] =3D {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4=
i/sun8i_dw_hdmi.h
> index a645b8bc9f58..f9eb663865a4 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> @@ -173,6 +173,7 @@ struct sun8i_hdmi_phy {
>  struct sun8i_dw_hdmi_quirks {
>  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>  					   const struct drm_display_mode *mode);
> +	bool set_rate;

This triggers a check in checkpatch. You should address them (and
there's several in your series).

With both addressed,
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4nrl5kiexzifpjc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlu7H90ACgkQ0rTAlCFN
r3RDVQ//UsnNe06VS+oeSCOXymJ0QJAdJgKi0c4yRLULRFP/RMNSo1B6pclCFnqd
Lb6k+GQNHA14iomXWWF/ZOPsMo1UXInR/4lLbzo05S+bB7k/1E7ArvPT+zyEbJCc
ma/y52Tkn+6KqthW08mArJ5qtl/S508c/iN44Bt1TbBxd5bqzVxO6Ex689hiiOxj
ki09L78/+dG7I93vUtc96hqlw1kJyxVHCKF0QfohzG3AO6PbVsJGsgEf70pTLxHm
XYJzs0V9hDuIBIDzed9zYRwCElzyIug5fkf0htL5490P5R2ko/OZEOCrwbgcdM51
wXoI9S/y5Kb6KfDb078UbcGYHPui9lTDaqG19AEQoY8EgL+kailHg8EEQU6DmEus
nwQebiPdA9pz09+Nw/k7TzkHWE2yvpXQoy1MqlsO/QyrhztfBCnsC0GM5R6v43j6
X+f9gi44mEMbRtkpo3VBzDPj8/8bfmEZrYCOf5kHQKNwfWxZBdhsA7vjlNkFPPHT
jGgg/Bpss9jvlyQi+kl0ywk1esVkryx3Sj07V7g4k9wC0yEv8Itkd9/3mRXNBtOU
DTbV3ll5AsKdTjsCVGkqBcxLK9cAcVQId6M724f8ISXXWmbG3U1vkZexvU3OtPOg
DRNdAxl895tijb3IYllb0WarIctjkQ6OoM7Y6IwXRaInh/kAm9s=
=v5Md
-----END PGP SIGNATURE-----

--4nrl5kiexzifpjc7--

--===============1354319521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1354319521==--
