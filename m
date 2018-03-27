From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2 4/5] drm: bridge: lvds-encoder: allow specifying the
 input bus format
Date: Tue, 27 Mar 2018 12:27:41 +0200
Message-ID: <20180327102741.GN27746@w540>
References: <20180326212447.7380-1-peda@axentia.se>
 <20180326212447.7380-5-peda@axentia.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0092873175=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180326212447.7380-5-peda@axentia.se>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Rosin <peda@axentia.se>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0092873175==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0rSojgWGcpz+ezC3"
Content-Disposition: inline


--0rSojgWGcpz+ezC3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Peter, Laurent,
   thanks for the patches,

On Mon, Mar 26, 2018 at 11:24:46PM +0200, Peter Rosin wrote:
> If the bridge changes the bus format, allow this to be described in
> the bridge, instead of providing false information about the bus
> format of the connector or panel.
>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  .../bindings/display/bridge/lvds-transmitter.txt   |  6 ++++++
>  drivers/gpu/drm/bridge/lvds-encoder.c              | 25 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> index 50220190c203..8d40a2069252 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> @@ -30,6 +30,12 @@ Required properties:
>    device-specific version corresponding to the device first
>    followed by the generic version.
>
> +Optional properties:
> +
> +- interface-pix-fmt:
> +  List of valid input bus formats of the encoder. Recognized bus formats
> +  are listed in ../bus-format.txt
> +

This comments applies here and to [3/5] as well.

Are we sure we want the supported bridge input format defined in DT
bindings?

Again, I may be biased, but as I see this, each bridge driver should
list its supported formats with MEDIA_BUS_FMT_ fourcc codes and return
the currently 'active' one when requested by the preceding bridge.

I understand for this driver, being compatible with both a generic lvds
encoder and a specific chip, the supported input formats are
different, but I would have used the 'of_device_id.data' field for
this and leave this out from DT bindings.

This makes the translation routine here implemented not required if
I'm not wrong...

Thanks
   j

>  Required nodes:
>
>  This device has two video ports. Their connections are modeled using the OF
> diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
> index 75b0d3f6e4de..b78619b5560a 100644
> --- a/drivers/gpu/drm/bridge/lvds-encoder.c
> +++ b/drivers/gpu/drm/bridge/lvds-encoder.c
> @@ -9,6 +9,7 @@
>
>  #include <drm/drmP.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>
>  #include <linux/of_graph.h>
> @@ -16,6 +17,8 @@
>  struct lvds_encoder {
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
> +	int num_bus_formats;
> +	u32 *bus_formats;
>  };
>
>  static int lvds_encoder_attach(struct drm_bridge *bridge)
> @@ -28,8 +31,22 @@ static int lvds_encoder_attach(struct drm_bridge *bridge)
>  				 bridge);
>  }
>
> +static int lvds_encoder_input_formats(struct drm_bridge *bridge,
> +				      const u32 **bus_formats)
> +{
> +	struct lvds_encoder *lvds_encoder = container_of(bridge,
> +							 struct lvds_encoder,
> +							 bridge);
> +
> +	if (lvds_encoder->num_bus_formats)
> +		*bus_formats = lvds_encoder->bus_formats;
> +
> +	return lvds_encoder->num_bus_formats;
> +}
> +
>  static struct drm_bridge_funcs funcs = {
>  	.attach = lvds_encoder_attach,
> +	.input_formats = lvds_encoder_input_formats,
>  };
>
>  static int lvds_encoder_probe(struct platform_device *pdev)
> @@ -39,6 +56,7 @@ static int lvds_encoder_probe(struct platform_device *pdev)
>  	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct lvds_encoder *lvds_encoder;
> +	int ret;
>
>  	lvds_encoder = devm_kzalloc(&pdev->dev, sizeof(*lvds_encoder),
>  				    GFP_KERNEL);
> @@ -79,6 +97,12 @@ static int lvds_encoder_probe(struct platform_device *pdev)
>  	if (IS_ERR(lvds_encoder->panel_bridge))
>  		return PTR_ERR(lvds_encoder->panel_bridge);
>
> +	ret = drm_of_bus_formats(pdev->dev.of_node, "interface-pix-fmt",
> +				 &lvds_encoder->bus_formats);
> +	if (ret < 0)
> +		return ret;
> +	lvds_encoder->num_bus_formats = ret;
> +
>  	/* The panel_bridge bridge is attached to the panel's of_node,
>  	 * but we need a bridge attached to our of_node for our user
>  	 * to look up.
> @@ -96,6 +120,7 @@ static int lvds_encoder_remove(struct platform_device *pdev)
>  {
>  	struct lvds_encoder *lvds_encoder = platform_get_drvdata(pdev);
>
> +	kfree(lvds_encoder->bus_formats);
>  	drm_bridge_remove(&lvds_encoder->bridge);
>
>  	return 0;
> --
> 2.11.0
>

--0rSojgWGcpz+ezC3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJauhydAAoJEHI0Bo8WoVY8VhoP/3wcofqjGkUMyG+H/358+CoA
0mmlysbzk0LSU0tnEAO3M8Vt9tg1EwW5KQwAMYyDHpdpo6+32xAwz12b/qsqtBzJ
EorOZkqeL54+eQX4eHl9HXFxkN2cvGcwul1bC/OaFGwxno4tID3EnfoHYmLcu75z
MBf/OCAO6/5TfQfnXTZqDLhlO5uw/BHfRGuKKcanu2ecYVtb9gB94fNmA6Kc3AW/
IKb7gxgXdBLHysDLjSkGoc49Bd6PS5wVSP1cPyyy+iGVUepD3biIIK/dd5zqo3Ai
tC+cF9+HVvc6UTxD7F9CV/YDE2wi7t8a6Bsr7Wx5i4INI4BLEV57flJUBZbeWtyN
PZQvHeIwg8WmKI13Fsp2MPgqmJAJVdPKKEKXh6E22DMXVm9LL2GyqF6dObvEzDej
1voUKP/K1j52GISJ3tEn/X51g9ldoKQCN9epe512aqZLiG4o8RGQw+rbzOC5skG5
f3MwU//xeA0xPuElRun7uVMdhfpVbVeJCqLFZMrY+0jv7wo0pEKEiHfyHX1zq+eQ
0b5PgVoAlrzUrj2hSl19GZMVhRkVwcHYUO1/EDFalH2JTRnZNiyLdTNEkqHvf18/
j00ERpEK/hMf6Enh9XvImsYnsVucHnX9FiKlH1CCyS8xl2+LNLxCL+ofHzENnCxW
VZbtzTA1tGZXj0ltRJfT
=C36s
-----END PGP SIGNATURE-----

--0rSojgWGcpz+ezC3--

--===============0092873175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0092873175==--
