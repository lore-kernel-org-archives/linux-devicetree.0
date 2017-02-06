From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 4/5] drm: convert drivers to use
 drm_of_find_panel_or_bridge
Date: Mon, 06 Feb 2017 12:07:52 +0100
Message-ID: <1486379272.3005.50.camel@pengutronix.de>
References: <20170204033635.10250-1-robh@kernel.org>
         <20170204033635.10250-5-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170204033635.10250-5-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xinliang Liu <z.liuxinliang@hisi>
List-Id: devicetree@vger.kernel.org

On Fri, 2017-02-03 at 21:36 -0600, Rob Herring wrote:
> Similar to the previous commit, convert drivers open coding OF graph
> parsing to use drm_of_find_panel_or_bridge instead.
> 
> This changes some error messages to debug messages (in the graph core).
> Graph connections are often "no connects" depending on the particular
> board, so we want to avoid spurious messages. Plus the kernel is not a
> DT validator.
> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 64 ++++-------------
>  drivers/gpu/drm/bridge/nxp-ptn3460.c             | 16 ++---
>  drivers/gpu/drm/bridge/parade-ps8622.c           | 16 ++---
>  drivers/gpu/drm/bridge/tc358767.c                | 27 +------
>  drivers/gpu/drm/exynos/exynos_dp.c               | 35 ++++-----
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c        | 49 ++++---------
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c     |  5 +-
>  drivers/gpu/drm/imx/imx-ldb.c                    | 28 ++------
>  drivers/gpu/drm/imx/parallel-display.c           | 35 ++-------
>  drivers/gpu/drm/mediatek/mtk_dsi.c               | 23 ++----
>  drivers/gpu/drm/mxsfb/mxsfb_out.c                | 36 ++--------
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c  | 26 ++-----
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                | 17 ++---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c               | 90 ++----------------------
>  14 files changed, 88 insertions(+), 379 deletions(-)
> 
[...]
> diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
> index 516d06490465..e670993906b8 100644
> --- a/drivers/gpu/drm/imx/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/imx-ldb.c
> @@ -649,7 +649,7 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
>  
>  	for_each_child_of_node(np, child) {
>  		struct imx_ldb_channel *channel;
> -		struct device_node *ep;
> +		struct device_node *remote;
>  		int bus_format;
>  
>  		ret = of_property_read_u32(child, "reg", &i);
> @@ -673,27 +673,11 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
>  		 * The output port is port@4 with an external 4-port mux or
>  		 * port@2 with the internal 2-port mux.
>  		 */
> -		ep = of_graph_get_endpoint_by_regs(child,
> -						   imx_ldb->lvds_mux ? 4 : 2,
> -						   -1);
> -		if (ep) {
> -			struct device_node *remote;
> -
> -			remote = of_graph_get_remote_port_parent(ep);
> -			of_node_put(ep);
> -			if (remote) {
> -				channel->panel = of_drm_find_panel(remote);
> -				channel->bridge = of_drm_find_bridge(remote);
> -			} else
> -				return -EPROBE_DEFER;
> -			of_node_put(remote);
> -
> -			if (!channel->panel && !channel->bridge) {
> -				dev_err(dev, "panel/bridge not found: %s\n",
> -					remote->full_name);
> -				return -EPROBE_DEFER;
> -			}
> -		}
> +		ret = drm_of_find_panel_or_bridge(fsl_dev->np,

s/fsl_dev->np/child/

> +						  imx_ldb->lvds_mux ? 4 : 2, 0,

Same comment as for the mediatek changes, this now requires that the
endpoints have no reg property set or reg = <0>. This is fine for LVDS
links, and I am not aware of any device trees that set the reg propertiy
in their LVDS output endpoints, so that should be fine.

> +						  &channel->panel, &channel->bridge);
> +		if (ret)
> +			return ret;
>
>  		/* panel ddc only if there is no bridge */
>  		if (!channel->bridge) {
> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> index 8582a83c0d9b..eb3a0201853a 100644
> --- a/drivers/gpu/drm/imx/parallel-display.c
> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -210,7 +210,7 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct drm_device *drm = data;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *ep;
> +	struct device_node *remote;
>  	const u8 *edidp;
>  	struct imx_parallel_display *imxpd;
>  	int ret;
> @@ -239,36 +239,9 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
>  	imxpd->bus_format = bus_format;
>  
>  	/* port@1 is the output port */
> -	ep = of_graph_get_endpoint_by_regs(np, 1, -1);
> -	if (ep) {
> -		struct device_node *remote;
> -
> -		remote = of_graph_get_remote_port_parent(ep);
> -		if (!remote) {
> -			dev_warn(dev, "endpoint %s not connected\n",
> -				 ep->full_name);
> -			of_node_put(ep);
> -			return -ENODEV;
> -		}
> -		of_node_put(ep);
> -
> -		imxpd->panel = of_drm_find_panel(remote);
> -		if (imxpd->panel) {
> -			dev_dbg(dev, "found panel %s\n", remote->full_name);
> -		} else {
> -			imxpd->bridge = of_drm_find_bridge(remote);
> -			if (imxpd->bridge)
> -				dev_dbg(dev, "found bridge %s\n",
> -					remote->full_name);
> -		}
> -		if (!imxpd->panel && !imxpd->bridge) {
> -			dev_dbg(dev, "waiting for panel or bridge %s\n",
> -				remote->full_name);
> -			of_node_put(remote);
> -			return -EPROBE_DEFER;
> -		}
> -		of_node_put(remote);
> -	}
> +	ret = drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel, &imxpd->bridge);
> +	if (ret)
> +		return ret;
>  
>  	imxpd->dev = dev;

The parallel-display change looks good to me.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 2c42f90809d8..14140579f8d4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -16,11 +16,11 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_panel.h>
> +#include <drm/drm_of.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> -#include <linux/of_graph.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <video/videomode.h>
> @@ -819,7 +819,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  {
>  	struct mtk_dsi *dsi;
>  	struct device *dev = &pdev->dev;
> -	struct device_node *remote_node, *endpoint;
>  	struct resource *regs;
>  	int comp_id;
>  	int ret;
> @@ -831,22 +830,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  	dsi->host.ops = &mtk_dsi_ops;
>  	dsi->host.dev = dev;
>  
> -	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> -	if (endpoint) {
> -		remote_node = of_graph_get_remote_port_parent(endpoint);
> -		if (!remote_node) {
> -			dev_err(dev, "No panel connected\n");
> -			return -ENODEV;
> -		}
> -
> -		dsi->bridge = of_drm_find_bridge(remote_node);
> -		dsi->panel = of_drm_find_panel(remote_node);
> -		of_node_put(remote_node);
> -		if (!dsi->bridge && !dsi->panel) {
> -			dev_info(dev, "Waiting for bridge or panel driver\n");
> -			return -EPROBE_DEFER;
> -		}
> -	}
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> +					  &dsi->panel, &dsi->bridge);
> +	if (ret)
> +		return ret;

Looks fine and also fixes a missing of_node_put on the endpoint node.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
