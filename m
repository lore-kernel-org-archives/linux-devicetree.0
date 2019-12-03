Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91A9C432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 13:50:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0FEA2073F
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 13:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfLCNui (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 08:50:38 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46191 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfLCNuh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 08:50:37 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1ic8ZE-0005mC-G9; Tue, 03 Dec 2019 14:50:16 +0100
Message-ID: <e0cbed9efbafc4114af20d32bfdd80bb9d92ab32.camel@pengutronix.de>
Subject: Re: [PATCH v3 15/21] drm/imx: pd: Use bus format/flags provided by
 the bridge when available
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        dri-devel@lists.freedesktop.org
Cc:     Lucas Stach <l.stach@pengutronix.de>,
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
        Rob Clark <robdclark@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Date:   Tue, 03 Dec 2019 14:50:13 +0100
In-Reply-To: <20191023154512.9762-16-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
         <20191023154512.9762-16-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

On Wed, 2019-10-23 at 17:45 +0200, Boris Brezillon wrote:
> Now that bridges can expose the bus format/flags they expect, we can
> use those instead of the relying on the display_info provided by the
> connector (which is only valid if the encoder is directly connected
> to bridge element driving the panel/display).
> 
> We also explicitly expose the bus formats supported by our encoder by
> filling encoder->output_bus_caps with proper info.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Hi Philipp,
> 
> I think I addressed all your comments except the addition of
> SYNC_DRIVE_POSEDGE/NEGEDGE flags, which would require changing
> ipu_crtc_mode_set_nofb() to take those flags into account or
> turning those flags into their PIXDATA counterpart. If you don't mind,
> I'd like to leave that for later.

I'm fine with this. I think it was phrased as a suggestion, too.

[...]
> -static int imx_pd_encoder_atomic_check(struct drm_encoder *encoder,
> -				       struct drm_crtc_state *crtc_state,
> -				       struct drm_connector_state *conn_state)
> +static const u32 imx_pd_bus_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_BGR888_1X24,
> +	MEDIA_BUS_FMT_GBR888_1X24,

GBR888 likely isn't useful (it's only used for the internal TV Encoder
on i.MX5 so far), but it doesn't really hurt to include it either.

> +	MEDIA_BUS_FMT_RGB666_1X18,
> +	MEDIA_BUS_FMT_RGB666_1X24_CPADHI,
> +	MEDIA_BUS_FMT_RGB565_1X16,
> +};
> +
> +static u32 *
> +imx_pd_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *bridge_state,
> +					 struct drm_crtc_state *crtc_state,
> +					 struct drm_connector_state *conn_state,
> +					 unsigned int *num_output_fmts)
> +{
> +	struct drm_display_info *di = &conn_state->connector->display_info;
> +	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
> +	u32 *output_fmts;
> +
> +	if (!imxpd->bus_format && !di->num_bus_formats)
> +		*num_output_fmts = ARRAY_SIZE(imx_pd_bus_fmts);

In this case we could just:

		return kmemdup(imx_pd_bus_fmts, sizeof(imx_pd_bus_fmts));

and simplify the remaining function a tiny bit.

> +	else
> +		*num_output_fmts = 1;
> +
> +	output_fmts = kcalloc(*num_output_fmts, sizeof(*output_fmts),
> +			      GFP_KERNEL);
> +	if (!output_fmts)
> +		return NULL;
> +
> +	if (!imxpd->bus_format && di->num_bus_formats)
> +		output_fmts[0] = di->bus_formats[0];
> +	else if (!imxpd->bus_format)
> +		memcpy(output_fmts, imx_pd_bus_fmts,
> +		       ARRAY_SIZE(imx_pd_bus_fmts));
> +	else
> +		output_fmts[0] = imxpd->bus_format;
> +
> +	return output_fmts;
> +}
> +
> +static u32 *
> +imx_pd_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +	if (output_fmt == MEDIA_BUS_FMT_FIXED) {
> +		/*
> +		 * The next bridge does not support bus format negotiation,
> +		 * let's use the default RGB888 value.
> +		 */
> +		*num_input_fmts = 1;
> +		output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
> +	} else if (!imxpd->bus_format) {
> +		unsigned int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(imx_pd_bus_fmts); i++) {
> +			if (imx_pd_bus_fmts[i] == output_fmt) {
> +				*num_input_fmts = 1;
> +				break;
> +			}
> +		}

If this loop was split out into a helper function, it could be reused in
.atomic_check below, for example:

		if (imx_pd_format_supported(output_fmt))
			*num_input_fmts = 1;

> +	} else if (imxpd->bus_format == output_fmt) {
> +		*num_input_fmts = 1;
> +	}
> +
> +	if (!*num_input_fmts)
> +		return NULL;
> +
> +	input_fmts = kcalloc(*num_input_fmts, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = output_fmt;
> +	return input_fmts;
> +}
> +
> +static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
>  {
>  	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
>  	struct drm_display_info *di = &conn_state->connector->display_info;
> -	struct imx_parallel_display *imxpd = enc_to_imxpd(encoder);
> +	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
> +	struct drm_bridge_state *next_bridge_state = NULL;
> +	struct drm_bridge *next_bridge;
> +	u32 bus_flags, bus_fmt;
> +	unsigned int i;
>  
> -	if (!imxpd->bus_format && di->num_bus_formats) {
> -		imx_crtc_state->bus_flags = di->bus_flags;
> -		imx_crtc_state->bus_format = di->bus_formats[0];
> -	} else {
> -		imx_crtc_state->bus_flags = imxpd->bus_flags;
> -		imx_crtc_state->bus_format = imxpd->bus_format;
> +	next_bridge = drm_bridge_chain_get_next_bridge(bridge);
> +	if (next_bridge)
> +		next_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +								    next_bridge);
> +
> +	if (next_bridge_state)
> +		bus_flags = next_bridge_state->input_bus_cfg.flags;
> +	else if (!imxpd->bus_format && di->num_bus_formats)
> +		bus_flags = di->bus_flags;
> +	else
> +		bus_flags = imxpd->bus_flags;
> +
> +	bus_fmt = bridge_state->input_bus_cfg.fmt;
> +	for (i = 0; i < ARRAY_SIZE(imx_pd_bus_fmts); i++) {
> +		if (imx_pd_bus_fmts[i] == bus_fmt)
> +			break;
>  	}
> +
> +	if (i == ARRAY_SIZE(imx_pd_bus_fmts))
> +		return -EINVAL;

See above, this could just reuse:

	if (!imx_pd_format_supported(bus_fmt))
		return -EINVAL;

> +
> +	if (bus_flags &
> +	    ~(DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_DE_HIGH |
> +	      DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> +	      DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE))
> +		return -EINVAL;
> +
> +	bridge_state->output_bus_cfg.flags = bus_flags;
> +	bridge_state->input_bus_cfg.flags = bus_flags;
> +	imx_crtc_state->bus_flags = bus_flags;
> +	imx_crtc_state->bus_format = bridge_state->input_bus_cfg.fmt;
>  	imx_crtc_state->di_hsync_pin = 2;
>  	imx_crtc_state->di_vsync_pin = 3;
[...] 

Otherwise this looks good to me.

regards
Philipp

