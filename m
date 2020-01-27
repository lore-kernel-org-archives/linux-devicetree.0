Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091A7C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBD07214D8
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:57:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbgA0M5b convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 07:57:31 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33223 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729021AbgA0M5b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 07:57:31 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iw3x5-0003wI-Lq; Mon, 27 Jan 2020 13:57:15 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iw3x1-0001Y5-7H; Mon, 27 Jan 2020 13:57:11 +0100
Message-ID: <ea2957045774ff714a0cb5cd4fb91660d761ec1e.camel@pengutronix.de>
Subject: Re: [PATCH v9 07/12] drm/imx: pd: Use bus format/flags provided by
 the bridge when available
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        dri-devel@lists.freedesktop.org
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, intel-gfx-trybot@lists.freedesktop.org
Date:   Mon, 27 Jan 2020 13:57:11 +0100
In-Reply-To: <20200127110043.2731697-8-boris.brezillon@collabora.com>
References: <20200127110043.2731697-1-boris.brezillon@collabora.com>
         <20200127110043.2731697-8-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

On Mon, 2020-01-27 at 12:00 +0100, Boris Brezillon wrote:
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
> Changes in v7:
> * Add an imx_pd_format_supported() helper (suggested by Philipp)
> * Simplify imx_pd_bridge_atomic_get_output_bus_fmts() (suggested by Philipp)
> * Simplify imx_pd_bridge_atomic_get_input_bus_fmts()
> * Explicitly set the duplicate/destro_state() and reset() hooks
> 
> Changes in v3 (all suggested by Philipp):
> * Adjust to match core changes
> * Propagate output format to input format
> * Pick a default value when output_fmt = _FIXED
> * Add missing BGR888 and GBR888 fmts to imx_pd_bus_fmts[]
> 
> Changes in v2:
> * Adjust things to match the new bus-format negotiation infra
> ---
>  drivers/gpu/drm/imx/parallel-display.c | 176 +++++++++++++++++++++----
>  1 file changed, 151 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> index 3dca424059f7..031579aa7fc2 100644
> --- a/drivers/gpu/drm/imx/parallel-display.c
> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -24,6 +24,7 @@
[...]
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
> +	/*
> +	 * If the next bridge does not support bus format negotiation, let's
> +	 * use the static bus format definition (imxpd->bus_format) if it's
> +	 * specified, RGB888 when it's not.
> +	 */
> +	if (output_fmt == MEDIA_BUS_FMT_FIXED)
> +		output_fmt = imxpd->bus_format ? : MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	/* Now make sure the requested output format is supported. */
> +	if ((imxpd->bus_format && imxpd->bus_format != output_fmt) ||
> +	    !imx_pd_format_supported(output_fmt)) {
> +		*num_input_fmts = 0;
> +		return NULL;
> +	}
> +
> +	*num_input_fmts = 1;
> +	input_fmts = kcalloc(*num_input_fmts, sizeof(*input_fmts),
> +			     GFP_KERNEL);

You could just use kzalloc() here.

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
> +{
> +	struct imx_crtc_state *imx_crtc_state = to_imx_crtc_state(crtc_state);
> +	struct drm_display_info *di = &conn_state->connector->display_info;
> +	struct imx_parallel_display *imxpd = bridge_to_imxpd(bridge);
> +	struct drm_bridge_state *next_bridge_state = NULL;
> +	struct drm_bridge *next_bridge;
> +	u32 bus_flags, bus_fmt;
> +
> +	next_bridge = drm_bridge_get_next_bridge(bridge);
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
> +	bus_fmt = bridge_state->input_bus_cfg.format;
> +	if (!imx_pd_format_supported(bus_fmt))
> +		return -EINVAL;
> +
> +	if (bus_flags &
> +	    ~(DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_DE_HIGH |
> +	      DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> +	      DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE))

Maybe add a warning so the first person to hook up a bridge / panel with
unsupported flags knows where to look.

Otherwise this looks fine to me.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
