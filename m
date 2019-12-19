Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459D2C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10E90222C2
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfLSV4n convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 16:56:43 -0500
Received: from mailoutvs37.siol.net ([185.57.226.228]:59338 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726866AbfLSV4n (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 16:56:43 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id B547B522B4B;
        Thu, 19 Dec 2019 22:56:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id FBVzyIgr4hHV; Thu, 19 Dec 2019 22:56:35 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 72419522D6A;
        Thu, 19 Dec 2019 22:56:35 +0100 (CET)
Received: from jernej-laptop.localnet (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 098C8522B4B;
        Thu, 19 Dec 2019 22:56:35 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     dri-devel@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH v5 4/4] drm/bridge: Add the necessary bits to support bus format negotiation
Date:   Thu, 19 Dec 2019 22:56:34 +0100
Message-ID: <4172148.KvaJEjK4kp@jernej-laptop>
In-Reply-To: <20191219101151.28039-5-narmstrong@baylibre.com>
References: <20191219101151.28039-1-narmstrong@baylibre.com> <20191219101151.28039-5-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi!

Dne četrtek, 19. december 2019 ob 11:11:51 CET je Neil Armstrong napisal(a):
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> drm_bridge_state is extended to describe the input and output bus
> configurations. These bus configurations are exposed through the
> drm_bus_cfg struct which encodes the configuration of a physical
> bus between two components in an output pipeline, usually between
> two bridges, an encoder and a bridge, or a bridge and a connector.
> 
> The bus configuration is stored in drm_bridge_state separately for
> the input and output buses, as seen from the point of view of each
> bridge. The bus configuration of a bridge output is usually identical
> to the configuration of the next bridge's input, but may differ if
> the signals are modified between the two bridges, for instance by an
> inverter on the board. The input and output configurations of a
> bridge may differ if the bridge modifies the signals internally,
> for instance by performing format conversion, or*modifying signals
> polarities.
> 
> Bus format negotiation is automated by the core, drivers just have
> to implement the ->atomic_get_{output,input}_bus_fmts() hooks if they
> want to take part to this negotiation. Negotiation happens in reverse
> order, starting from the last element of the chain (the one directly
> connected to the display) up to the first element of the chain (the one
> connected to the encoder).
> During this negotiation all supported formats are tested until we find
> one that works, meaning that the formats array should be in decreasing
> preference order (assuming the driver has a preference order).
> 
> Note that the bus format negotiation works even if some elements in the
> chain don't implement the ->atomic_get_{output,input}_bus_fmts() hooks.
> In that case, the core advertises only MEDIA_BUS_FMT_FIXED and lets
> the previous bridge element decide what to do (most of the time, bridge
> drivers will pick a default bus format or extract this piece of
> information from somewhere else, like a FW property).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Thanks a lot for this work! Just one small nit bellow. Otherwise:

Reviewed by: Jernej Skrabec <jernej.skrabec@siol.net>

> Changes in v5:
> * None
> 
> Changes in v4:
> * Enhance the doc
> * Fix typos
> * Rename some parameters/fields
> * Reword the commit message
> 
> Changes in v3:
> * Fix the commit message (Reported by Laurent)
> * Document the fact that bus formats should not be directly modified by
>   drivers (Suggested by Laurent)
> * Document the fact that format order matters (Suggested by Laurent)
> * Propagate bus flags by default
> * Document the fact that drivers can tweak bus flags if needed
> * Let ->atomic_get_{output,input}_bus_fmts() allocate the bus format
>   array (Suggested by Laurent)
> * Add a drm_atomic_helper_bridge_propagate_bus_fmt()
> * Mandate that bridge drivers return accurate input_fmts even if they
>   are known to be the first element in the bridge chain
> 
> Changes in v2:
> * Rework things to support more complex use cases
> ---
>  drivers/gpu/drm/drm_bridge.c | 267 ++++++++++++++++++++++++++++++++++-
>  include/drm/drm_bridge.h     | 124 ++++++++++++++++
>  2 files changed, 390 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 442804598f60..9cc4b0181f85 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -635,13 +635,261 @@ static int drm_atomic_bridge_check(struct drm_bridge
> *bridge, return 0;
>  }
> 
> +/**
> + * drm_atomic_helper_bridge_propagate_bus_fmt() - Propagate output format
> to + *						  the 
input end of a bridge
> + * @bridge: bridge control structure
> + * @bridge_state: new bridge state
> + * @crtc_state: new CRTC state
> + * @conn_state: new connector state
> + * @output_fmt: tested output bus format
> + * @num_input_fmts: will contain the size of the returned array
> + *
> + * This helper is a pluggable implementation of the
> + * &drm_bridge_funcs.atomic_get_input_bus_fmts operation for bridges that
> don't + * modify the bus configuration between their input and their
> output. It + * returns an array of input formats with a single element set
> to @output_fmt. + *
> + * RETURNS:
> + * a valid format array of size @num_input_fmts, or NULL if the allocation
> + * failed
> + */
> +u32 *
> +drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
> +					struct drm_bridge_state 
*bridge_state,
> +					struct drm_crtc_state 
*crtc_state,
> +					struct 
drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int 
*num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts) {
> +		*num_input_fmts = 0;
> +		return NULL;
> +	}
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = output_fmt;
> +	return input_fmts;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
> +
> +static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
> +				    struct drm_bridge *cur_bridge,
> +				    struct drm_crtc_state 
*crtc_state,
> +				    struct drm_connector_state 
*conn_state,
> +				    u32 out_bus_fmt)
> +{
> +	struct drm_bridge_state *cur_state;
> +	unsigned int num_in_bus_fmts, i;
> +	struct drm_bridge *prev_bridge;
> +	u32 *in_bus_fmts;
> +	int ret;
> +
> +	prev_bridge = drm_bridge_get_prev_bridge(cur_bridge);
> +	cur_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +						    
cur_bridge);
> +	if (WARN_ON(!cur_state))
> +		return -EINVAL;
> +
> +	/*
> +	 * If bus format negotiation is not supported by this bridge, let's
> +	 * pass MEDIA_BUS_FMT_FIXED to the previous bridge in the chain and
> +	 * hope that it can handle this situation gracefully (by providing
> +	 * appropriate default values).
> +	 */
> +	if (!cur_bridge->funcs->atomic_get_input_bus_fmts) {
> +		if (cur_bridge != first_bridge) {
> +			ret = select_bus_fmt_recursive(first_bridge,
> +						       
prev_bridge, crtc_state,
> +						       
conn_state,
> +						       
MEDIA_BUS_FMT_FIXED);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		cur_state->input_bus_cfg.format = MEDIA_BUS_FMT_FIXED;
> +		cur_state->output_bus_cfg.format = out_bus_fmt;
> +		return 0;
> +	}
> +
> +	in_bus_fmts = cur_bridge->funcs-
>atomic_get_input_bus_fmts(cur_bridge,
> +							
cur_state,
> +							
crtc_state,
> +							
conn_state,
> +							
out_bus_fmt,
> +							
&num_in_bus_fmts);
> +	if (!num_in_bus_fmts)
> +		return -ENOTSUPP;
> +	else if (!in_bus_fmts)
> +		return -ENOMEM;
> +
> +	if (first_bridge == cur_bridge) {
> +		cur_state->input_bus_cfg.format = in_bus_fmts[0];
> +		cur_state->output_bus_cfg.format = out_bus_fmt;
> +		kfree(in_bus_fmts);
> +		return 0;
> +	}
> +
> +	for (i = 0; i < num_in_bus_fmts; i++) {
> +		ret = select_bus_fmt_recursive(first_bridge, prev_bridge,
> +					       crtc_state, 
conn_state,
> +					       in_bus_fmts[i]);
> +		if (ret != -ENOTSUPP)
> +			break;
> +	}
> +
> +	if (!ret) {
> +		cur_state->input_bus_cfg.format = in_bus_fmts[i];
> +		cur_state->output_bus_cfg.format = out_bus_fmt;
> +	}
> +
> +	kfree(in_bus_fmts);
> +	return ret;
> +}
> +
> +/*
> + * This function is called by &drm_atomic_bridge_chain_check() just before
> + * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
> + * It performs bus format negotiation between bridge elements. The
> negotiation + * happens in reverse order, starting from the last element in
> the chain up to + * @bridge.
> + *
> + * Negotiation starts by retrieving supported output bus formats on the
> last + * bridge element and testing them one by one. The test is recursive,
> meaning + * that for each tested output format, the whole chain will be
> walked backward, + * and each element will have to choose an input bus
> format that can be + * transcoded to the requested output format. When a
> bridge element does not + * support transcoding into a specific output
> format -ENOTSUPP is returned and + * the next bridge element will have to
> try a different format. If none of the + * combinations worked, -ENOTSUPP
> is returned and the atomic modeset will fail. + *
> + * This implementation is relying on
> + * &drm_bridge_funcs.atomic_get_output_bus_fmts() and
> + * &drm_bridge_funcs.atomic_get_input_bus_fmts() to gather supported
> + * input/output formats.
> + *
> + * When &drm_bridge_funcs.atomic_get_output_bus_fmts() is not implemented
> by + * the last element of the chain,
> &drm_atomic_bridge_chain_select_bus_fmts() + * tries a single format:
> &drm_connector.display_info.bus_formats[0] if + * available,
> MEDIA_BUS_FMT_FIXED otherwise.
> + *
> + * When &drm_bridge_funcs.atomic_get_input_bus_fmts() is not implemented,
> + * &drm_atomic_bridge_chain_select_bus_fmts() skips the negotiation on the
> + * bridge element that lacks this hook and asks the previous element in the
> + * chain to try MEDIA_BUS_FMT_FIXED. It's up to bridge drivers to decide
> what + * to do in that case (fail if they want to enforce bus format
> negotiation, or + * provide a reasonable default if they need to support
> pipelines where not + * all elements support bus format negotiation).
> + */
> +static int
> +drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_crtc_state 
*crtc_state,
> +					struct 
drm_connector_state *conn_state)
> +{
> +	struct drm_connector *conn = conn_state->connector;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_bridge_state *last_bridge_state;
> +	unsigned int i, num_out_bus_fmts;
> +	struct drm_bridge *last_bridge;
> +	u32 *out_bus_fmts;
> +	int ret = 0;
> +
> +	last_bridge = list_last_entry(&encoder->bridge_chain,
> +				      struct drm_bridge, 
chain_node);
> +	last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state-
>state,
> +							    
last_bridge);
> +	if (WARN_ON(!last_bridge_state))
> +		return -EINVAL;
> +
> +	if (last_bridge->funcs->atomic_get_output_bus_fmts) {
> +		const struct drm_bridge_funcs *funcs = last_bridge-
>funcs;
> +
> +		out_bus_fmts = funcs-
>atomic_get_output_bus_fmts(last_bridge,
> +							
last_bridge_state,
> +							
crtc_state,
> +							
conn_state,
> +							
&num_out_bus_fmts);
> +		if (!num_out_bus_fmts)
> +			return -ENOTSUPP;
> +		else if (!out_bus_fmts)
> +			return -ENOMEM;
> +	} else {
> +		num_out_bus_fmts = 1;
> +		out_bus_fmts = kmalloc(sizeof(*out_bus_fmts), 
GFP_KERNEL);
> +		if (!out_bus_fmts)
> +			return -ENOMEM;
> +
> +		if (conn->display_info.num_bus_formats &&
> +		    conn->display_info.bus_formats)
> +			out_bus_fmts[0] = conn-
>display_info.bus_formats[0];
> +		else
> +			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> +	}
> +
> +	for (i = 0; i < num_out_bus_fmts; i++) {
> +		ret = select_bus_fmt_recursive(bridge, last_bridge, 
crtc_state,
> +					       conn_state, 
out_bus_fmts[i]);
> +		if (ret != -ENOTSUPP)
> +			break;
> +	}
> +
> +	kfree(out_bus_fmts);
> +
> +	return ret;
> +}
> +
> +static void
> +drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
> +				      struct drm_connector *conn,
> +				      struct drm_atomic_state 
*state)
> +{
> +	struct drm_bridge_state *bridge_state, *next_bridge_state;
> +	struct drm_bridge *next_bridge;
> +	u32 output_flags;
> +
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	next_bridge = drm_bridge_get_next_bridge(bridge);
> +
> +	/*
> +	 * Let's try to apply the most common case here, that is, propagate
> +	 * display_info flags for the last bridge, and propagate the input
> +	 * flags of the next bridge element to the output end of the current
> +	 * bridge when the bridge is not the last one.
> +	 * There are exceptions to this rule, like when signal inversion is
> +	 * happening at the board level, but that's something drivers can 
deal
> +	 * with from their &drm_bridge_funcs.atomic_check() implementation 
by
> +	 * simply overriding the flags value we've set here.
> +	 */
> +	if (!next_bridge) {
> +		output_flags = conn->display_info.bus_flags;
> +	} else {
> +		next_bridge_state = 
drm_atomic_get_new_bridge_state(state,
> +								
next_bridge);
> +		output_flags = next_bridge_state->input_bus_cfg.flags;
> +	}
> +
> +	bridge_state->output_bus_cfg.flags = output_flags;
> +
> +	/*
> +	 * Propage the output flags to the input end of the bridge. Again, 
it's
> +	 * not necessarily what all bridges want, but that's what most of 
them
> +	 * do, and by doing that by default we avoid forcing drivers to
> +	 * duplicate the "dummy propagation" logic.
> +	 */
> +	bridge_state->input_bus_cfg.flags = output_flags;
> +}
> +
>  /**
>   * drm_atomic_bridge_chain_check() - Do an atomic check on the bridge chain
> * @bridge: bridge control structure
>   * @crtc_state: new CRTC state
>   * @conn_state: new connector state
>   *
> - * Calls &drm_bridge_funcs.atomic_check() (falls back on
> + * First trigger a bus format negotiation before calling
> + * &drm_bridge_funcs.atomic_check() (falls back on
>   * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder
> chain, * starting from the last bridge to the first. These are called
> before calling * &drm_encoder_helper_funcs.atomic_check()
> @@ -653,12 +901,29 @@ int drm_atomic_bridge_chain_check(struct drm_bridge
> *bridge, struct drm_crtc_state *crtc_state,
>  				  struct drm_connector_state 
*conn_state)
>  {
> +	struct drm_connector *conn = conn_state->connector;
>  	struct drm_encoder *encoder = bridge->encoder;
>  	struct drm_bridge *iter;
> +	int ret;
> +
> +	ret = drm_atomic_bridge_chain_select_bus_fmts(bridge, crtc_state,
> +						      
conn_state);
> +	if (ret)
> +		return ret;
> 
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, 
chain_node) {
>  		int ret;
> 
> +		/*
> +		 * Bus flags are propagated by default. If a bridge needs 
to
> +		 * tweak the input bus flags for any reason, it should 
happen
> +		 * in its &drm_bridge_funcs.atomic_check() 
implementation such
> +		 * that preceding bridges in the chain can propagate the 
new
> +		 * bus flags.
> +		 */
> +		drm_atomic_bridge_propagate_bus_flags(iter, conn,
> +						      
crtc_state->state);
> +
>  		ret = drm_atomic_bridge_check(iter, crtc_state, 
conn_state);
>  		if (ret)
>  			return ret;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 269f0d1da339..192227f03d4b 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -35,6 +35,38 @@ struct drm_bridge;
>  struct drm_bridge_timings;
>  struct drm_panel;
> 
> +/**
> + * struct drm_bus_cfg - bus configuration
> + *
> + * This structure stores the configuration of a physical bus between two
> + * components in an output pipeline, usually between two bridges, an
> encoder + * and a bridge, or a bridge and a connector.
> + *
> + * The bus configuration is stored in &drm_bridge_state separately for the
> + * input and output buses, as seen from the point of view of each bridge.
> The + * bus configuration of a bridge output is usually identical to the +
> * configuration of the next bridge's input, but may differ if the signals
> are + * modified between the two bridges, for instance by an inverter on
> the board. + * The input and output configurations of a bridge may differ
> if the bridge + * modifies the signals internally, for instance by
> performing format + * conversion, or modifying signals polarities.
> + */
> +struct drm_bus_cfg {
> +	/**
> +	 * @fmt: format used on this bus (one of the MEDIA_BUS_FMT_* 
format)
> +	 *
> +	 * This field should not be directly modified by drivers
> +	 * (&drm_atomic_bridge_chain_select_bus_fmts() takes care of the 
bus
> +	 * format negotiation).
> +	 */
> +	u32 format;
> +
> +	/**
> +	 * @flags: DRM_BUS_* flags used on this bus
> +	 */
> +	u32 flags;
> +};
> +
>  /**
>   * struct drm_bridge_state - Atomic bridge state object
>   * @base: inherit from &drm_private_state
> @@ -44,6 +76,16 @@ struct drm_bridge_state {
>  	struct drm_private_state base;
> 
>  	struct drm_bridge *bridge;
> +
> +	/**
> +	 * @input_bus_cfg: input bus configuration
> +	 */
> +	struct drm_bus_cfg input_bus_cfg;
> +
> +	/**
> +	 * @output_bus_cfg: input bus configuration
> +	 */
> +	struct drm_bus_cfg output_bus_cfg;
>  };
> 
>  static inline struct drm_bridge_state *
> @@ -387,6 +429,72 @@ struct drm_bridge_funcs {
>  	void (*atomic_destroy_state)(struct drm_bridge *bridge,
>  				     struct drm_bridge_state 
*state);
> 
> +	/**
> +	 * @atomic_get_output_bus_fmts:
> +	 *
> +	 * Return the supported bus formats on the output end of a bridge.
> +	 * The returned array must be allocated with kmalloc() and will be
> +	 * freed by the caller. If the allocation fails, NULL should be
> +	 * returned. num_output_fmts must be set to the returned array 
size.
> +	 * Formats listed in the returned array should be listed in 
decreasing
> +	 * preference order (the core will try all formats until it finds 
one
> +	 * that works).
> +	 *
> +	 * This method is only called on the last element of the bridge 
chain
> +	 * as part of the bus format negotiation process that happens in
> +	 * &drm_atomic_bridge_chain_select_bus_fmts().
> +	 * This method is optional. When not implemented, the core will
> +	 * fall back to &drm_connector.display_info.bus_formats[0] if
> +	 * &drm_connector.display_info.num_bus_formats > 0,
> +	 * or to MEDIA_BUS_FMT_FIXED otherwise.
> +	 */
> +	u32 *(*atomic_get_output_bus_fmts)(struct drm_bridge *bridge,
> +					   struct 
drm_bridge_state *bridge_state,
> +					   struct 
drm_crtc_state *crtc_state,
> +					   struct 
drm_connector_state *conn_state,
> +					   unsigned int 
*num_output_fmts);
> +
> +	/**
> +	 * @atomic_get_input_bus_fmts:
> +	 *
> +	 * Return the supported bus formats on the input end of a bridge 
for
> +	 * a specific output bus format.
> +	 *
> +	 * The returned array must be allocated with kmalloc() and will be
> +	 * freed by the caller. If the allocation fails, NULL should be
> +	 * returned. num_output_fmts must be set to the returned array 
size.
> +	 * Formats listed in the returned array should be listed in 
decreasing
> +	 * preference order (the core will try all formats until it finds 
one
> +	 * that works). When the format is not supported NULL should be
> +	 * returned and *num_output_fmts should be set to 0.
> +	 *
> +	 * This method is called on all elements of the bridge chain as 
part of
> +	 * the bus format negotiation process that happens in
> +	 * &drm_atomic_bridge_chain_select_bus_fmts().
> +	 * This method is optional. When not implemented, the core will 
bypass
> +	 * bus format negotiation on this element of the bridge without
> +	 * failing, and the previous element in the chain will be passed
> +	 * MEDIA_BUS_FMT_FIXED as its output bus format.
> +	 *
> +	 * Bridge drivers that need to support being linked to bridges that 
are
> +	 * not supporting bus format negotiation should handle the
> +	 * output_fmt == MEDIA_BUS_FMT_FIXED case appropriately, by 
selecting a
> +	 * sensible default value or extracting this information from 
somewhere
> +	 * else (FW property, &drm_display_mode, &drm_display_info, ...)
> +	 *
> +	 * Note: Even if input format selection on the first bridge has no
> +	 * impact on the negotiation process (bus format negotiation stops 
once
> +	 * we reach the first element of the chain), drivers are expected to
> +	 * return accurate input formats as the input format may be used to
> +	 * configure the CRTC output appropriately.
> +	 */
> +	u32 *(*atomic_get_input_bus_fmts)(struct drm_bridge *bridge,
> +					  struct 
drm_bridge_state *bridge_state,
> +					  struct drm_crtc_state 
*crtc_state,
> +					  struct 
drm_connector_state *conn_state,
> +					  u32 output_fmt,
> +					  unsigned int 
*num_input_fmts);
> +
>  	/**
>  	 * @atomic_check:
>  	 *
> @@ -401,6 +509,14 @@ struct drm_bridge_funcs {
>  	 * called when &drm_bridge_funcs.atomic_check() is implemented, so 
only
>  	 * one of them should be provided.
>  	 *
> +	 * If drivers need to tweak &drm_bridge_state.input_bus_cfg.flags or
> +	 * &drm_bridge_state.output_bus_cfg.flags it should should happen in

"should" is duplicated ^

Best regards,
Jernej

> +	 * this function. By default the 
&drm_bridge_state.output_bus_cfg.flags
> +	 * field is set to the next bridge
> +	 * &drm_bridge_state.input_bus_cfg.flags value or
> +	 * &drm_connector.display_info.bus_flags if the bridge is the last
> +	 * element in the chain.
> +	 *
>  	 * RETURNS:
>  	 * zero if the check passed, a negative error code otherwise.
>  	 */
> @@ -588,6 +704,14 @@ void drm_atomic_bridge_chain_pre_enable(struct
> drm_bridge *bridge, void drm_atomic_bridge_chain_enable(struct drm_bridge
> *bridge,
>  				    struct drm_atomic_state 
*state);
> 
> +u32 *
> +drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
> +					struct drm_bridge_state 
*bridge_state,
> +					struct drm_crtc_state 
*crtc_state,
> +					struct 
drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int 
*num_input_fmts);
> +
>  void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
>  				      struct drm_bridge_state 
*state);
>  void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,




