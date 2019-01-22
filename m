From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 4/5] drm/bridge: lvds-encoder: add dev helper variable
 in .probe()
Date: Tue, 22 Jan 2019 22:55:47 +0200
Message-ID: <20190122205547.GH3264@pendragon.ideasonboard.com>
References: <20181229070649.21308-1-peda@axentia.se>
 <20181229070649.21308-5-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181229070649.21308-5-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

Thank you for the patch.

On Sat, Dec 29, 2018 at 07:07:37AM +0000, Peter Rosin wrote:
> Make the code easier to read and modify.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/lvds-encoder.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
> index 75b0d3f6e4de..f6770e83d49d 100644
> --- a/drivers/gpu/drm/bridge/lvds-encoder.c
> +++ b/drivers/gpu/drm/bridge/lvds-encoder.c
> @@ -34,48 +34,47 @@ static struct drm_bridge_funcs funcs = {
>  
>  static int lvds_encoder_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct device_node *port;
>  	struct device_node *endpoint;
>  	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct lvds_encoder *lvds_encoder;
>  
> -	lvds_encoder = devm_kzalloc(&pdev->dev, sizeof(*lvds_encoder),
> -				    GFP_KERNEL);
> +	lvds_encoder = devm_kzalloc(dev, sizeof(*lvds_encoder), GFP_KERNEL);
>  	if (!lvds_encoder)
>  		return -ENOMEM;
>  
>  	/* Locate the panel DT node. */
> -	port = of_graph_get_port_by_id(pdev->dev.of_node, 1);
> +	port = of_graph_get_port_by_id(dev->of_node, 1);
>  	if (!port) {
> -		dev_dbg(&pdev->dev, "port 1 not found\n");
> +		dev_dbg(dev, "port 1 not found\n");
>  		return -ENXIO;
>  	}
>  
>  	endpoint = of_get_child_by_name(port, "endpoint");
>  	of_node_put(port);
>  	if (!endpoint) {
> -		dev_dbg(&pdev->dev, "no endpoint for port 1\n");
> +		dev_dbg(dev, "no endpoint for port 1\n");
>  		return -ENXIO;
>  	}
>  
>  	panel_node = of_graph_get_remote_port_parent(endpoint);
>  	of_node_put(endpoint);
>  	if (!panel_node) {
> -		dev_dbg(&pdev->dev, "no remote endpoint for port 1\n");
> +		dev_dbg(dev, "no remote endpoint for port 1\n");
>  		return -ENXIO;
>  	}
>  
>  	panel = of_drm_find_panel(panel_node);
>  	of_node_put(panel_node);
>  	if (!panel) {
> -		dev_dbg(&pdev->dev, "panel not found, deferring probe\n");
> +		dev_dbg(dev, "panel not found, deferring probe\n");
>  		return -EPROBE_DEFER;
>  	}
>  
>  	lvds_encoder->panel_bridge =
> -		devm_drm_panel_bridge_add(&pdev->dev,
> -					  panel, DRM_MODE_CONNECTOR_LVDS);
> +		devm_drm_panel_bridge_add(dev, panel, DRM_MODE_CONNECTOR_LVDS);
>  	if (IS_ERR(lvds_encoder->panel_bridge))
>  		return PTR_ERR(lvds_encoder->panel_bridge);
>  
> @@ -83,7 +82,7 @@ static int lvds_encoder_probe(struct platform_device *pdev)
>  	 * but we need a bridge attached to our of_node for our user
>  	 * to look up.
>  	 */
> -	lvds_encoder->bridge.of_node = pdev->dev.of_node;
> +	lvds_encoder->bridge.of_node = dev->of_node;
>  	lvds_encoder->bridge.funcs = &funcs;
>  	drm_bridge_add(&lvds_encoder->bridge);
>  
> -- 
> 2.11.0
> 

-- 
Regards,

Laurent Pinchart
