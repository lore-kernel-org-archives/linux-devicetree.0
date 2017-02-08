From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/5] drm: convert drivers to use
 drm_of_find_panel_or_bridge
Date: Wed, 8 Feb 2017 08:46:32 +0100
Message-ID: <20170208074632.n35dqoz2rz24ncx3@lukather>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-5-robh@kernel.org>
 <20170206100301.fatil7cvasuyhnqw@lukather>
 <20170206173201.wkv5snwhvkrjruwi@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mu54eljhbyxgxtil"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170206173201.wkv5snwhvkrjruwi@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Xinliang Liu <z.liuxinliang@hisi>
List-Id: devicetree@vger.kernel.org


--mu54eljhbyxgxtil
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Feb 06, 2017 at 11:32:01AM -0600, Rob Herring wrote:
> On Mon, Feb 06, 2017 at 11:03:01AM +0100, Maxime Ripard wrote:
> > Hi Rob,
> >=20
> > On Fri, Feb 03, 2017 at 09:36:34PM -0600, Rob Herring wrote:
> > > Similar to the previous commit, convert drivers open coding OF graph
> > > parsing to use drm_of_find_panel_or_bridge instead.
> > >=20
> > > This changes some error messages to debug messages (in the graph core=
).
> > > Graph connections are often "no connects" depending on the particular
> > > board, so we want to avoid spurious messages. Plus the kernel is not a
> > > DT validator.
> > >=20
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> >=20
> > [..]
> >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4=
i/sun4i_rgb.c
> > > index f5e86fe7750e..4720725b0fb0 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> > > @@ -15,6 +15,7 @@
> > >  #include <drm/drmP.h>
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_crtc_helper.h>
> > > +#include <drm/drm_of.h>
> > >  #include <drm/drm_panel.h>
> > > =20
> > >  #include "sun4i_drv.h"
> > > @@ -217,12 +218,10 @@ int sun4i_rgb_init(struct drm_device *drm)
> > >  	rgb->drv =3D drv;
> > >  	encoder =3D &rgb->encoder;
> > > =20
> > > -	tcon->panel =3D sun4i_tcon_find_panel(tcon->dev->of_node);
> > > -	encoder->bridge =3D sun4i_tcon_find_bridge(tcon->dev->of_node);
> > > -	if (IS_ERR(tcon->panel) && IS_ERR(encoder->bridge)) {
> > > -		dev_info(drm->dev, "No panel or bridge found... RGB output disable=
d\n");
> > > -		return 0;
> > > -	}
> > > +	ret =3D drm_of_find_panel_or_bridge(tcon->dev->of_node, 1, 0,
> > > +					  &tcon->panel, &encoder->bridge);
> > > +	if (ret)
> > > +		return ret;
> >=20
> > It used to ignore the error if it couldn't find the bridge. This will
> > break the probe.
>=20
> Well, I got it half right. :) The probe does that, but this needs to=20
> too.
>=20
> > > =20
> > >  	drm_encoder_helper_add(&rgb->encoder,
> > >  			       &sun4i_rgb_enc_helper_funcs);
> > > @@ -239,7 +238,7 @@ int sun4i_rgb_init(struct drm_device *drm)
> > >  	/* The RGB encoder can only work with the TCON channel 0 */
> > >  	rgb->encoder.possible_crtcs =3D BIT(0);
> > > =20
> > > -	if (!IS_ERR(tcon->panel)) {
> > > +	if (tcon->panel) {
> > >  		drm_connector_helper_add(&rgb->connector,
> > >  					 &sun4i_rgb_con_helper_funcs);
> > >  		ret =3D drm_connector_init(drm, &rgb->connector,
> > > @@ -260,7 +259,7 @@ int sun4i_rgb_init(struct drm_device *drm)
> > >  		}
> > >  	}
> > > =20
> > > -	if (!IS_ERR(encoder->bridge)) {
> > > +	if (encoder->bridge) {
> > >  		encoder->bridge->encoder =3D &rgb->encoder;
> > > =20
> > >  		ret =3D drm_bridge_attach(drm, encoder->bridge);
> > > @@ -268,8 +267,6 @@ int sun4i_rgb_init(struct drm_device *drm)
> > >  			dev_err(drm->dev, "Couldn't attach our bridge\n");
> > >  			goto err_cleanup_connector;
> > >  		}
> > > -	} else {
> > > -		encoder->bridge =3D NULL;
> > >  	}
> > > =20
> > >  	return 0;
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun=
4i/sun4i_tcon.c
> > > index ea2906f87cb9..2e4e365cecf9 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> > > @@ -15,13 +15,12 @@
> > >  #include <drm/drm_crtc.h>
> > >  #include <drm/drm_crtc_helper.h>
> > >  #include <drm/drm_modes.h>
> > > -#include <drm/drm_panel.h>
> > > +#include <drm/drm_of.h>
> > > =20
> > >  #include <linux/component.h>
> > >  #include <linux/ioport.h>
> > >  #include <linux/of_address.h>
> > >  #include <linux/of_device.h>
> > > -#include <linux/of_graph.h>
> > >  #include <linux/of_irq.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/reset.h>
> > > @@ -405,74 +404,6 @@ static int sun4i_tcon_init_regmap(struct device =
*dev,
> > >  	return 0;
> > >  }
> > > =20
> > > -struct drm_panel *sun4i_tcon_find_panel(struct device_node *node)
> > > -{
> > > -	struct device_node *port, *remote, *child;
> > > -	struct device_node *end_node =3D NULL;
> > > -
> > > -	/* Inputs are listed first, then outputs */
> > > -	port =3D of_graph_get_port_by_id(node, 1);
> > > -
> > > -	/*
> > > -	 * Our first output is the RGB interface where the panel will
> > > -	 * be connected.
> > > -	 */
> > > -	for_each_child_of_node(port, child) {
> > > -		u32 reg;
> > > -
> > > -		of_property_read_u32(child, "reg", &reg);
> > > -		if (reg =3D=3D 0)
> > > -			end_node =3D child;
> > > -	}
> > > -
> > > -	if (!end_node) {
> > > -		DRM_DEBUG_DRIVER("Missing panel endpoint\n");
> > > -		return ERR_PTR(-ENODEV);
> > > -	}
> > > -
> > > -	remote =3D of_graph_get_remote_port_parent(end_node);
> > > -	if (!remote) {
> > > -		DRM_DEBUG_DRIVER("Unable to parse remote node\n");
> > > -		return ERR_PTR(-EINVAL);
> > > -	}
> > > -
> > > -	return of_drm_find_panel(remote) ?: ERR_PTR(-EPROBE_DEFER);
> >=20
> > And the panel is only one of our endpoints, which is optional, while
> > other endpoints are mandatory. This means that we might very well have
> > an endpoint that is not a panel or a bridge. In this case, I think
> > your function will return an error and will be treated as such, while
> > it's really the expected behaviour.
> >=20
> > I think it's better to leave this driver alone for now, it's not as
> > trivial as it looks, and will require some testing to get things
> > right. I'll try to get my head around how to use your new (very
> > welcome) helpers.
>=20
> Well, certainly it needs testing. But this is one of the easier examples=
=20
> because you are requesting a specific port/endpoint number. It's the=20
> drivers that just loop over all the endpoints that give me more=20
> problems.

Oh, right... I missed that you were giving the port and endpoint
numbers..

> Anyway, this is 4.12 material, so I'll make the fix above and want=20
> to leave this in for now.=20

Ok, I'll test it, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mu54eljhbyxgxtil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmszUAAoJEBx+YmzsjxAgPqsQAKUiCNEH6e3qStaB+pC+999I
93jaMcr+Ag26u3wY9fDRrAGHwCr8ch/cofOZH0MaOSH/8pYQ2L1SOHFhwemH4wnR
IuXfIsNWGWLzIwXM9fodurfMbtHGwy5hkHVNNlbGSC0Z9b1XlIyz2BWBnz3XR4Bt
kTOIJXSzL3yUSTG3QRs5Zz7BMsaDf6HV2tQx8e0cjTG8zrbX6qv5AdSfqkxltnOW
Qy0O5dd0wkwOgSsCEj6KIx8bcjVDM2QSiNk/SSorevk/hnSZQFWqsaniITXSOq+O
B/8CjF5B4ynhxDBR2FWeSCL5lazrF8hqj1xEB8F8pOBO/N7kWD7d4s5Oo60rFtcz
HttXYh21iWxs9kPPP9aG9y1fATEL9UETTS1W43D4iqMa/CuSM1JVTxkpQh+Il89z
jdXmZPsr70H1TcFCwV9pABJZmQ2RkzjVaydJYinUaS7kBCuPU9QvPT0du61jK3H0
QGCw/zb9n9X44GaP8ZqOXCnia6P5w2JYXI0IUsJDlknRh2Ptc8qOA1gz37GyJReP
JmYBzliRFEPPdudZiOwZjki663+SKKJ98kxcuAmYz5HO9k8d3XKaJJSHtIv+sFdQ
IdtRSZ1SondYEAUwwcGYRMfLY0StZ/9PLmn+OAmB9rGOPG+8iguKQ1yB6ClUsfEW
bcK4pi1U6RdCzgsoEoQM
=otq1
-----END PGP SIGNATURE-----

--mu54eljhbyxgxtil--
