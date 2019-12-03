Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3613C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 10:14:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBEBA206E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 10:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aU7PG0X0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfLCKOq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 05:14:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:32854 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfLCKOp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 05:14:45 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D1B2309;
        Tue,  3 Dec 2019 11:14:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575368083;
        bh=k1EcPsevo+ctMUKE+5XmSieUFQIApn944TP8UM8km9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aU7PG0X0oZLSWdGIe92knEpVovVhuRvKQscUJQstg81Cgl7ABjEmYDXPzJTU8GtuC
         eXi65QsXrntxqizuuGZDjnrX1g1hwqjP+cfXfTj7sMrkKRH353UCAm08TgopPGnNnG
         QFz8uTocyNIB9T7a82NmnAzJxpnMuIdggIfAAzGo=
Date:   Tue, 3 Dec 2019 12:14:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 16/21] drm/bridge: lvds-encoder: Implement basic bus
 format negotiation
Message-ID: <20191203101436.GN4730@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-17-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-17-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.

On Wed, Oct 23, 2019 at 05:45:07PM +0200, Boris Brezillon wrote:
> Some LVDS encoder might support several input/output bus formats. Add

s/encoder/encoders/

> a way to describe the one used on a specific design by adding optional

s/the one/the format/

> 'data-mapping' properties to the input/output ports.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * Use bus-width for the rgb24/rgb18 distinction
> * Adjust code to match core changes
> * Get rid of of_get_data_mapping()
> * Don't implement ->atomic_check() (the core now takes care of bus
>   flags propagation)
> 
> Changes in v2:
> * Make the bus-format negotiation logic more generic
> ---
>  drivers/gpu/drm/bridge/lvds-encoder.c | 72 +++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/bridge/lvds-encoder.c
> index e2132a8d5106..a2a8f7f4ac97 100644
> --- a/drivers/gpu/drm/bridge/lvds-encoder.c
> +++ b/drivers/gpu/drm/bridge/lvds-encoder.c
> @@ -6,6 +6,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  
> @@ -16,6 +17,8 @@ struct lvds_encoder {
>  	struct drm_bridge bridge;
>  	struct drm_bridge *panel_bridge;
>  	struct gpio_desc *powerdown_gpio;
> +	u32 output_fmt;
> +	u32 input_fmt;
>  };
>  
>  static int lvds_encoder_attach(struct drm_bridge *bridge)
> @@ -48,10 +51,40 @@ static void lvds_encoder_disable(struct drm_bridge *bridge)
>  		gpiod_set_value_cansleep(lvds_encoder->powerdown_gpio, 1);
>  }
>  
> +static u32 *lvds_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *bridge_state,
> +					   struct drm_crtc_state *crtc_state,
> +					   struct drm_connector_state *conn_state,
> +					   u32 output_fmt,
> +					   unsigned int *num_input_fmts)
> +{
> +	struct lvds_encoder *lvds_encoder = container_of(bridge,
> +							 struct lvds_encoder,
> +							 bridge);
> +	u32 *input_fmts;
> +
> +	if (output_fmt == MEDIA_BUS_FMT_FIXED ||
> +	    output_fmt == lvds_encoder->output_fmt)
> +		*num_input_fmts = 1;
> +	else
> +		*num_input_fmts = 0;
> +
> +	if (!*num_input_fmts)
> +		return NULL;
> +
> +	input_fmts = kcalloc(*num_input_fmts, sizeof(*input_fmts), GFP_KERNEL);

As *num_input_fmts == 1, you can

	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);

> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = lvds_encoder->input_fmt;
> +	return input_fmts;
> +}
> +
>  static struct drm_bridge_funcs funcs = {
>  	.attach = lvds_encoder_attach,
>  	.enable = lvds_encoder_enable,
>  	.disable = lvds_encoder_disable,
> +	.atomic_get_input_bus_fmts = lvds_atomic_get_input_bus_fmts,
>  };
>  
>  static int lvds_encoder_probe(struct platform_device *pdev)
> @@ -62,11 +95,16 @@ static int lvds_encoder_probe(struct platform_device *pdev)
>  	struct device_node *panel_node;
>  	struct drm_panel *panel;
>  	struct lvds_encoder *lvds_encoder;
> +	const char *output_data_mapping = NULL;
> +	u32 input_bus_width = 0;
>  
>  	lvds_encoder = devm_kzalloc(dev, sizeof(*lvds_encoder), GFP_KERNEL);
>  	if (!lvds_encoder)
>  		return -ENOMEM;
>  
> +	lvds_encoder->input_fmt = MEDIA_BUS_FMT_FIXED;
> +	lvds_encoder->output_fmt = MEDIA_BUS_FMT_FIXED;
> +
>  	lvds_encoder->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
>  							       GPIOD_OUT_HIGH);
>  	if (IS_ERR(lvds_encoder->powerdown_gpio)) {
> @@ -77,6 +115,25 @@ static int lvds_encoder_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	port = of_graph_get_port_by_id(dev->of_node, 0);
> +	if (!port) {
> +		dev_dbg(dev, "port 0 not found\n");
> +		return -ENXIO;
> +	}
> +
> +	of_node_put(port);
> +
> +	if (of_property_read_u32(port, "bus-width", &input_bus_width)) {

You're using port after calling of_node_put().

> +		lvds_encoder->input_fmt = MEDIA_BUS_FMT_FIXED;
> +	} else if (input_bus_width == 18) {
> +		lvds_encoder->input_fmt = MEDIA_BUS_FMT_RGB666_1X18;
> +	} else if (input_bus_width == 24) {
> +		lvds_encoder->input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> +	} else {
> +		dev_dbg(dev, "unsupported bus-width)\n");

s/bus-width)/bus-width/

but I think you should make the error message a bit clearer

		dev_dbg(dev, "unsupported bus-width value %u on port 0\n",
			input_bus_width);

> +		return -ENOTSUPP;
> +	}
> +
>  	/* Locate the panel DT node. */
>  	port = of_graph_get_port_by_id(dev->of_node, 1);
>  	if (!port) {
> @@ -84,6 +141,21 @@ static int lvds_encoder_probe(struct platform_device *pdev)
>  		return -ENXIO;
>  	}
>  
> +	of_property_read_string(port, "data-mapping", &output_data_mapping);
> +	if (!output_data_mapping) {
> +		lvds_encoder->output_fmt = MEDIA_BUS_FMT_FIXED;
> +	} else if (!strcmp(output_data_mapping, "jeida-18")) {
> +		lvds_encoder->output_fmt = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
> +	} else if (!strcmp(output_data_mapping, "jeida-24")) {
> +		lvds_encoder->output_fmt = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> +	} else if (!strcmp(output_data_mapping, "vesa-24")) {
> +		lvds_encoder->output_fmt = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
> +	} else {
> +		of_node_put(port);
> +		dev_dbg(dev, "unsupported output data-mapping\n");
> +		return -ENOTSUPP;
> +	}
> +
>  	endpoint = of_get_child_by_name(port, "endpoint");
>  	of_node_put(port);
>  	if (!endpoint) {

-- 
Regards,

Laurent Pinchart
