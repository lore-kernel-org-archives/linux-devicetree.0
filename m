From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 4/8] drm/sun4i: add support for sun8i DE2 mixers and
 display engines
Date: Mon, 20 Mar 2017 11:26:26 +0100
Message-ID: <20170320102626.24awzyrq32gomntt@lukather>
References: <20170316204748.8596-1-icenowy@aosc.xyz>
 <20170316204748.8596-5-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1712408329=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170316204748.8596-5-icenowy@aosc.xyz>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1712408329==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ngju2ghew5huzmaq"
Content-Disposition: inline


--ngju2ghew5huzmaq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 17, 2017 at 04:47:44AM +0800, Icenowy Zheng wrote:
> Allwinner have a new "Display Engine 2.0" in there new SoCs, which comes
> in a new "Display Engine" (mixers instead of old backends and
> frontends).
>=20
> Add support for the mixer on Allwinner V3s SoC; it's the simplest one.
>=20
> Currently a lot of functions are still missing -- more investigations
> are needed to gain enough infomation for them.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Changes in v2:
> - Rebase on current linux-next (with Chen-Yu's some refactors)
> - Removed currently broken overlay plane.
>=20
>  drivers/gpu/drm/sun4i/Kconfig       |   9 +
>  drivers/gpu/drm/sun4i/Makefile      |   3 +-
>  drivers/gpu/drm/sun4i/sun4i_crtc.c  |  14 +-
>  drivers/gpu/drm/sun4i/sun4i_crtc.h  |   2 +
>  drivers/gpu/drm/sun4i/sun4i_drv.c   |   1 +
>  drivers/gpu/drm/sun4i/sun4i_drv.h   |   1 +
>  drivers/gpu/drm/sun4i/sun4i_layer.c |  94 +++++++--
>  drivers/gpu/drm/sun4i/sun4i_layer.h |   3 +
>  drivers/gpu/drm/sun4i/sun4i_tcon.c  |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 385 ++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 166 ++++++++++++++++
>  11 files changed, 658 insertions(+), 22 deletions(-)
>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_mixer.c
>  create mode 100644 drivers/gpu/drm/sun4i/sun8i_mixer.h
>=20
> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> index a4b357db8856..0fa989f955e7 100644
> --- a/drivers/gpu/drm/sun4i/Kconfig
> +++ b/drivers/gpu/drm/sun4i/Kconfig
> @@ -12,3 +12,12 @@ config DRM_SUN4I
>  	  Choose this option if you have an Allwinner SoC with a
>  	  Display Engine. If M is selected the module will be called
>  	  sun4i-drm.
> +
> +config DRM_SUN4I_DE2
> +	bool "Support Display Engine 2.0"
> +	depends on DRM_SUN4I
> +	default MACH_SUN8I
> +	select SUN8I_DE2_CCU
> +	help
> +	  Choose this option if you have an Allwinner SoC with a
> +	  "Display Engine 2.0".
> diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makef=
ile
> index 59b757350a1f..3e7e2b2eb386 100644
> --- a/drivers/gpu/drm/sun4i/Makefile
> +++ b/drivers/gpu/drm/sun4i/Makefile
> @@ -1,5 +1,7 @@
>  sun4i-drm-y +=3D sun4i_drv.o
>  sun4i-drm-y +=3D sun4i_framebuffer.o
> +sun4i-drm-y +=3D sun4i_backend.o
> +sun4i-drm-$(CONFIG_DRM_SUN4I_DE2) +=3D sun8i_mixer.o
> =20
>  sun4i-tcon-y +=3D sun4i_tcon.o
>  sun4i-tcon-y +=3D sun4i_rgb.o
> @@ -8,6 +10,5 @@ sun4i-tcon-y +=3D sun4i_crtc.o
>  sun4i-tcon-y +=3D sun4i_layer.o
> =20
>  obj-$(CONFIG_DRM_SUN4I)		+=3D sun4i-drm.o sun4i-tcon.o
> -obj-$(CONFIG_DRM_SUN4I)		+=3D sun4i_backend.o
>  obj-$(CONFIG_DRM_SUN4I)		+=3D sun6i_drc.o
>  obj-$(CONFIG_DRM_SUN4I)		+=3D sun4i_tv.o
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/s=
un4i_crtc.c
> index 3c876c3a356a..bf2aa0ffd35c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -26,8 +26,8 @@
>  #include <video/videomode.h>
> =20
>  #include "sun4i_backend.h"
> +#include "sun8i_mixer.h"
>  #include "sun4i_crtc.h"
> -#include "sun4i_drv.h"
>  #include "sun4i_layer.h"
>  #include "sun4i_tcon.h"
> =20
> @@ -56,7 +56,10 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc *c=
rtc,
> =20
>  	DRM_DEBUG_DRIVER("Committing plane changes\n");
> =20
> -	sun4i_backend_commit(scrtc->backend);
> +	if (scrtc->backend)
> +		sun4i_backend_commit(scrtc->backend);
> +	else if (scrtc->mixer)
> +		sun8i_mixer_commit(scrtc->mixer);

As I told you already, you should be using functions pointers and just
call whatever is stored in that pointer

>  	if (event) {
>  		crtc->state->event =3D NULL;
> @@ -136,6 +139,7 @@ static const struct drm_crtc_funcs sun4i_crtc_funcs =
=3D {
> =20
>  struct sun4i_crtc *sun4i_crtc_init(struct drm_device *drm,
>  				   struct sun4i_backend *backend,
> +				   struct sun8i_mixer *mixer,
>  				   struct sun4i_tcon *tcon)
>  {
>  	struct sun4i_crtc *scrtc;
> @@ -146,10 +150,14 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_devic=
e *drm,
>  	if (!scrtc)
>  		return ERR_PTR(-ENOMEM);
>  	scrtc->backend =3D backend;
> +	scrtc->mixer =3D mixer;
>  	scrtc->tcon =3D tcon;
> =20
>  	/* Create our layers */
> -	scrtc->layers =3D sun4i_layers_init(drm, scrtc->backend);
> +	if (backend)
> +		scrtc->layers =3D sun4i_layers_init(drm, backend);
> +	else if (mixer)
> +		scrtc->layers =3D sun8i_layers_init(drm, mixer);

Same thing here.

>  	if (IS_ERR(scrtc->layers)) {
>  		dev_err(drm->dev, "Couldn't create the planes\n");
>  		return NULL;
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.h b/drivers/gpu/drm/sun4i/s=
un4i_crtc.h
> index 230cb8f0d601..5783579e9c3c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.h
> @@ -18,6 +18,7 @@ struct sun4i_crtc {
>  	struct drm_pending_vblank_event	*event;
> =20
>  	struct sun4i_backend		*backend;
> +	struct sun8i_mixer		*mixer;
>  	struct sun4i_tcon		*tcon;
>  	struct sun4i_layer		**layers;
>  };
> @@ -29,6 +30,7 @@ static inline struct sun4i_crtc *drm_crtc_to_sun4i_crtc=
(struct drm_crtc *crtc)
> =20
>  struct sun4i_crtc *sun4i_crtc_init(struct drm_device *drm,
>  				   struct sun4i_backend *backend,
> +				   struct sun8i_mixer *mixer,
>  				   struct sun4i_tcon *tcon);
> =20
>  #endif /* _SUN4I_CRTC_H_ */
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index 767bbadcc85d..e78b8aaa4019 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -304,6 +304,7 @@ static const struct of_device_id sun4i_drv_of_table[]=
 =3D {
>  	{ .compatible =3D "allwinner,sun6i-a31-display-engine" },
>  	{ .compatible =3D "allwinner,sun6i-a31s-display-engine" },
>  	{ .compatible =3D "allwinner,sun8i-a33-display-engine" },
> +	{ .compatible =3D "allwinner,sun8i-v3s-display-engine" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sun4i_drv_of_table);
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.h b/drivers/gpu/drm/sun4i/su=
n4i_drv.h
> index 5df50126ff52..00506b99816a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.h
> @@ -18,6 +18,7 @@
> =20
>  struct sun4i_drv {
>  	struct sun4i_backend	*backend;
> +	struct sun8i_mixer	*mixer;

I don't think you need to store the mixer pointer both in the CRTC and
the main structure.

>  	struct sun4i_tcon	*tcon;
> =20
>  	struct drm_fbdev_cma	*fbdev;
> diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/=
sun4i_layer.c
> index f26bde5b9117..356253142c60 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
> @@ -16,49 +16,63 @@
>  #include <drm/drmP.h>
> =20
>  #include "sun4i_backend.h"
> +#include "sun8i_mixer.h"
>  #include "sun4i_layer.h"
> =20
>  struct sun4i_plane_desc {
>  	       enum drm_plane_type     type;
> +	       /* Pipe is not used in sun8i-mixer */
>  	       u8                      pipe;
>  	       const uint32_t          *formats;
>  	       uint32_t                nformats;
>  };
> =20
> -static int sun4i_backend_layer_atomic_check(struct drm_plane *plane,
> +static int sun4i_layer_atomic_check(struct drm_plane *plane,
>  					    struct drm_plane_state *state)
>  {
>  	return 0;
>  }

And there's no reason to share the layers code. The formats supported
are likely to be different, the constraints will be, and there's no
code to share at all, since the registers are not the same.

Just create a new one.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ngju2ghew5huzmaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYz65RAAoJEBx+YmzsjxAgA1EQAIlFJy8ypNg5cbziTUZuAdAH
1I/tqhvuBalH5nLXT/wJjIDYUd+Zv1JZP1z1bp09QaBPXQrgQRKBk6omSPDa962p
uuXrYwwn8piOVWvbRwWSaW3ETkDCaYWvOxWCLXKXcgEKEPYnsM5oXcvTq0/IEzlc
Lb56EG5C7kb+Tgyh2Fe51oO4BmWqFY9ghgOSWo4mGmDEeS2zrxXA1BIbY9wYlIJG
ZIcPoX8pJ9yCkkZ8/8/0kmpj0otl25yOT3nNo0WP2it9m3CHw0/5BpQ2VHNCiYv2
WtYMzGCxJMBpFiqplywhK4eeZV5yVx/htoEFy9oOV3FXxoHvjlFy7it2qSemnbhC
KnjNcHzyPI4FzOHEtirgG6a2s7WmxKmxFzODnXFFE0jrS5Y2qCF3yl/GISUJ60KZ
GNMFU8qVaf5c/uWbPDHHLiqoAxpZmt1mUmswFyc+q7yaTqkaFiT99oxEBZudS6vw
5y3ezMfDLqN9ZOYjB9elqW5kIcFMN4QTSYTDz7lCKvYUvyR9UhIoERr37arCOCew
vQWno70D00iiwhuhfXq+Bm9eapanY3e2KpzyytK3uGDJzXKsjOwc16XmjNCF3bTE
zCHtAThiA4yreczBNMoUSCf+L5yy5rkIoW4bVMM0yHtEPz44L9LOfHkTW07nFqyw
n1mF4mSOVOa669z/xqw7
=ihzh
-----END PGP SIGNATURE-----

--ngju2ghew5huzmaq--

--===============1712408329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1712408329==--
