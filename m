From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/5] drm: convert drivers to use of_graph_get_remote_node
Date: Mon, 06 Feb 2017 11:52:59 +0100
Message-ID: <1486378379.3005.43.camel@pengutronix.de>
References: <20170204033635.10250-1-robh@kernel.org>
         <20170204033635.10250-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170204033635.10250-4-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang@hisi>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-02-03 at 21:36 -0600, Rob Herring wrote:
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
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 90fb831ef031..dbd554c09a39 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -661,7 +661,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct mtk_dpi *dpi;
>  	struct resource *mem;
> -	struct device_node *ep, *bridge_node = NULL;
> +	struct device_node *bridge_node;
>  	int comp_id;
>  	int ret;
>  
> @@ -706,15 +706,9 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
> -	if (ep) {
> -		bridge_node = of_graph_get_remote_port_parent(ep);
> -		of_node_put(ep);
> -	}
> -	if (!bridge_node) {
> -		dev_err(dev, "Failed to find bridge node\n");
> +	bridge_node = of_graph_get_remote_node(dev->of_node, 0, 0);

Note that before this change, of_graph_get_next_endpoint would just
choose the first port/endpoint without restrictions to their reg
properties, whereas the new code requires reg to be either not set or
set to zero.
As the former is the case for the mt8173 dpi->hdmi link, which is the
only use of this driver, this should be fine.

[...]
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 0e8c4d9af340..f14e472812ce 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1433,7 +1433,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *cec_np, *port, *ep, *remote, *i2c_np;
> +	struct device_node *cec_np, *remote, *i2c_np;
>  	struct platform_device *cec_pdev;
>  	struct regmap *regmap;
>  	struct resource *mem;
> @@ -1485,29 +1485,9 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>  	if (IS_ERR(hdmi->regs))
>  		return PTR_ERR(hdmi->regs);
>  
> -	port = of_graph_get_port_by_id(np, 1);
> -	if (!port) {
> -		dev_err(dev, "Missing output port node\n");
> +	remote = of_graph_get_remote_node(np, 1, 0);
> +	if (!remote)
>  		return -EINVAL;
> -	}
> -
> -	ep = of_get_child_by_name(port, "endpoint");
> -	if (!ep) {
> -		dev_err(dev, "Missing endpoint node in port %s\n",
> -			port->full_name);
> -		of_node_put(port);
> -		return -EINVAL;
> -	}
> -	of_node_put(port);
> -
> -	remote = of_graph_get_remote_port_parent(ep);
> -	if (!remote) {
> -		dev_err(dev, "Missing connector/bridge node for endpoint %s\n",
> -			ep->full_name);
> -		of_node_put(ep);
> -		return -EINVAL;
> -	}
> -	of_node_put(ep);

Same as above. TMDS links reasonably have only one endpoint in the
source port, and the mt8173-evb DT has no reg property set.

Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
for the mediatek changes.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
