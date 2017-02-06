From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/5] drm: convert drivers to use of_graph_get_remote_node
Date: Mon, 6 Feb 2017 11:17:00 +0100
Message-ID: <53de6816-fcba-3142-650a-5a56c5631f5e@baylibre.com>
References: <20170204033635.10250-1-robh@kernel.org>
 <20170204033635.10250-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170204033635.10250-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puc>
List-Id: devicetree@vger.kernel.org

On 02/04/2017 04:36 AM, Rob Herring wrote:
> Convert drivers to use the new of_graph_get_remote_node() helper
> instead of parsing the endpoint node and then getting the remote device
> node. Now drivers can just specify the device node and which
> port/endpoint and get back the connected remote device node. The details
> of the graph binding are nicely abstracted into the core OF graph code.
> 
> This changes some error messages to debug messages (in the graph core).
> Graph connections are often "no connects" depending on the particular
> board, so we want to avoid spurious messages. Plus the kernel is not a
> DT validator.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c                 | 22 ++-------
>  drivers/gpu/drm/arm/malidp_drv.c                | 29 ++---------
>  drivers/gpu/drm/bridge/adv7511/adv7533.c        | 12 +----
>  drivers/gpu/drm/bridge/dumb-vga-dac.c           | 15 ++----
>  drivers/gpu/drm/bridge/ti-tfp410.c              | 15 ++----
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c         | 16 +-----
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c         | 13 ++---
>  drivers/gpu/drm/exynos/exynos_drm_mic.c         | 27 +---------
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    | 26 ++--------
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 30 +----------
>  drivers/gpu/drm/mediatek/mtk_dpi.c              | 12 ++---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c             | 26 ++--------
>  drivers/gpu/drm/meson/meson_drv.c               | 12 ++---
>  drivers/gpu/drm/meson/meson_venc_cvbs.c         | 19 ++-----
>  drivers/gpu/drm/msm/dsi/dsi_host.c              |  3 +-
>  drivers/gpu/drm/msm/mdp/mdp4/mdp4_kms.c         | 28 +----------
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     | 18 +++----
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c            | 11 +----
>  drivers/gpu/drm/tilcdc/tilcdc_external.c        | 66 +++----------------------
>  drivers/gpu/drm/vc4/vc4_dpi.c                   | 15 ++----
>  20 files changed, 64 insertions(+), 351 deletions(-)
> 
[...]
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index ff1f6019b97b..37cb9c755ed7 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -163,14 +163,14 @@ static struct drm_driver meson_driver = {
>  
>  static bool meson_vpu_has_available_connectors(struct device *dev)
>  {
> -	struct device_node *ep, *remote;
> +	struct device_node *remote;
> +	int i;
>  
> -	/* Parses each endpoint and check if remote exists */
> -	for_each_endpoint_of_node(dev->of_node, ep) {
> -		/* If the endpoint node exists, consider it enabled */
> -		remote = of_graph_get_remote_port(ep);
> -		if (remote)
> +	for_each_of_graph_remote_node(dev->of_node, remote, i, 2) {
> +		if (remote) {
> +			of_node_put(remote);
>  			return true;
> +		}
>  	}
>  
>  	return false;
> diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> index a2bcc70a03ef..8566de2edb62 100644
> --- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> @@ -217,25 +217,14 @@ static const struct drm_encoder_helper_funcs
>  
>  static bool meson_venc_cvbs_connector_is_available(struct meson_drm *priv)
>  {
> -	struct device_node *ep, *remote;
> +	struct device_node *remote;
>  
> -	/* CVBS VDAC output is on the first port, first endpoint */
> -	ep = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
> -	if (!ep)
> +	remote = of_graph_get_remote_node(priv->dev->of_node, 0, 0);
> +	if (!remote)
>  		return false;
>  
> -
> -	/* If the endpoint node exists, consider it enabled */
> -	remote = of_graph_get_remote_port(ep);
> -	if (remote) {
> -		of_node_put(ep);
> -		return true;
> -	}
> -
> -	of_node_put(ep);
>  	of_node_put(remote);
> -
> -	return false;
> +	return true;
>  }
>  
>  int meson_venc_cvbs_create(struct meson_drm *priv)
[...]

Hi Rob,

For the meson changes :
Acked-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Thanks !
Neil
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
