Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6CEC432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 16:50:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E664C20833
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 16:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M7JusAcS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfLBQuv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 11:50:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37338 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbfLBQuv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 11:50:51 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA343309;
        Mon,  2 Dec 2019 17:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575305447;
        bh=IHPj61AFyixPNoLhvAfsxKbsjzi8gilNj94Zna1lv6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M7JusAcS5WbbMf9w/c2Btr8aqK20ISUBn14kL5uszYr8lYGOgOiyXgaTDCTM3ys0v
         rPa/WeOmw3+3t9hv29G19BnYCxOaHWSmrnR9CGMQwym2wHU2IaiaBSOvcK4EwfD1r7
         XBachotr9S6WgR4GEa7BHuQIozOOVCic8XAhP4Hc=
Date:   Mon, 2 Dec 2019 18:50:39 +0200
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
Subject: Re: [PATCH v3 10/21] drm/bridge: Clarify the atomic enable/disable
 hooks semantics
Message-ID: <20191202165039.GN4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-11-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-11-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.

On Wed, Oct 23, 2019 at 05:45:01PM +0200, Boris Brezillon wrote:
> The [pre_]enable/[post_]disable hooks are passed the old atomic state.
> Update the doc and rename the arguments to make it clear.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * New patch
> ---
>  drivers/gpu/drm/drm_bridge.c | 24 ++++++++++++------------
>  include/drm/drm_bridge.h     | 16 ++++++++++++----
>  2 files changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c53966767782..ca74bfe028c9 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -447,7 +447,7 @@ EXPORT_SYMBOL(drm_bridge_chain_enable);
>  /**
>   * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
>   * @bridge: bridge control structure
> - * @state: atomic state being committed
> + * @old_state: old atomic state
>   *
>   * Calls &drm_bridge_funcs.atomic_disable (falls back on
>   * &drm_bridge_funcs.disable) op for all the bridges in the encoder chain,
> @@ -457,7 +457,7 @@ EXPORT_SYMBOL(drm_bridge_chain_enable);
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
> -				     struct drm_atomic_state *state)
> +				     struct drm_atomic_state *old_state)
>  {
>  	struct drm_encoder *encoder;
>  	struct drm_bridge *iter;
> @@ -469,7 +469,7 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain,
>  				    chain_node) {
>  		if (iter->funcs->atomic_disable)
> -			iter->funcs->atomic_disable(iter, state);
> +			iter->funcs->atomic_disable(iter, old_state);
>  		else if (iter->funcs->disable)
>  			iter->funcs->disable(iter);
>  
> @@ -483,7 +483,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>   * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
>   *					  in the encoder chain
>   * @bridge: bridge control structure
> - * @state: atomic state being committed
> + * @old_state: old atomic state
>   *
>   * Calls &drm_bridge_funcs.atomic_post_disable (falls back on
>   * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
> @@ -493,7 +493,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
> -					  struct drm_atomic_state *state)
> +					  struct drm_atomic_state *old_state)
>  {
>  	struct drm_encoder *encoder;
>  
> @@ -504,7 +504,7 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>  	list_for_each_entry_from(bridge, &encoder->bridge_chain,
>  				 chain_node) {
>  		if (bridge->funcs->atomic_post_disable)
> -			bridge->funcs->atomic_post_disable(bridge, state);
> +			bridge->funcs->atomic_post_disable(bridge, old_state);
>  		else if (bridge->funcs->post_disable)
>  			bridge->funcs->post_disable(bridge);
>  	}
> @@ -515,7 +515,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>   * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
>   *					the encoder chain
>   * @bridge: bridge control structure
> - * @state: atomic state being committed
> + * @old_state: old atomic state
>   *
>   * Calls &drm_bridge_funcs.atomic_pre_enable (falls back on
>   * &drm_bridge_funcs.pre_enable) op for all the bridges in the encoder chain,
> @@ -525,7 +525,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
> -					struct drm_atomic_state *state)
> +					struct drm_atomic_state *old_state)
>  {
>  	struct drm_encoder *encoder;
>  	struct drm_bridge *iter;
> @@ -537,7 +537,7 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>  	list_for_each_entry_reverse(iter, &bridge->encoder->bridge_chain,
>  				    chain_node) {
>  		if (iter->funcs->atomic_pre_enable)
> -			iter->funcs->atomic_pre_enable(iter, state);
> +			iter->funcs->atomic_pre_enable(iter, old_state);
>  		else if (iter->funcs->pre_enable)
>  			iter->funcs->pre_enable(iter);
>  
> @@ -550,7 +550,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
>  /**
>   * drm_atomic_bridge_chain_enable - enables all bridges in the encoder chain
>   * @bridge: bridge control structure
> - * @state: atomic state being committed
> + * @old_state: old atomic state
>   *
>   * Calls &drm_bridge_funcs.atomic_enable (falls back on
>   * &drm_bridge_funcs.enable) op for all the bridges in the encoder chain,
> @@ -560,7 +560,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
>   * Note: the bridge passed should be the one closest to the encoder
>   */
>  void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
> -				    struct drm_atomic_state *state)
> +				    struct drm_atomic_state *old_state)
>  {
>  	struct drm_encoder *encoder;
>  
> @@ -571,7 +571,7 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>  	list_for_each_entry_from(bridge, &bridge->encoder->bridge_chain,
>  				 chain_node) {
>  		if (bridge->funcs->atomic_enable)
> -			bridge->funcs->atomic_enable(bridge, state);
> +			bridge->funcs->atomic_enable(bridge, old_state);
>  		else if (bridge->funcs->enable)
>  			bridge->funcs->enable(bridge);
>  	}
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index a608c47d1de5..e814e6d6e7c2 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -266,6 +266,8 @@ struct drm_bridge_funcs {
>  	 * bridge's @atomic_pre_enable or @pre_enable function. If the preceding
>  	 * element is a &drm_encoder it's called right before the encoder's
>  	 * &drm_encoder_helper_funcs.atomic_enable hook.
> +	 * This hook is passed the old atomic state (atomic state after new/old
> +	 * states have been swapped).

I think the name change is enough to explain this. If you want to make
it explicit in the documentation, I find the part between parentheses a
bit confusing.

With this comment addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	 *
>  	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
>  	 * will not yet be running when this callback is called. The bridge must
> @@ -281,7 +283,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_pre_enable callback is optional.
>  	 */
>  	void (*atomic_pre_enable)(struct drm_bridge *bridge,
> -				  struct drm_atomic_state *state);
> +				  struct drm_atomic_state *old_state);
>  
>  	/**
>  	 * @atomic_enable:
> @@ -292,6 +294,8 @@ struct drm_bridge_funcs {
>  	 * bridge's @atomic_enable or @enable function. If the preceding element
>  	 * is a &drm_encoder it's called right after the encoder's
>  	 * &drm_encoder_helper_funcs.atomic_enable hook.
> +	 * This hook is passed the old atomic state (atomic state after new/old
> +	 * states have been swapped).
>  	 *
>  	 * The bridge can assume that the display pipe (i.e. clocks and timing
>  	 * signals) feeding it is running when this callback is called. This
> @@ -306,7 +310,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_enable callback is optional.
>  	 */
>  	void (*atomic_enable)(struct drm_bridge *bridge,
> -			      struct drm_atomic_state *state);
> +			      struct drm_atomic_state *old_state);
>  	/**
>  	 * @atomic_disable:
>  	 *
> @@ -316,6 +320,8 @@ struct drm_bridge_funcs {
>  	 * bridge's @atomic_disable or @disable vfunc. If the preceding element
>  	 * is a &drm_encoder it's called right before the
>  	 * &drm_encoder_helper_funcs.atomic_disable hook.
> +	 * This hook is passed the old atomic state (atomic state after new/old
> +	 * states have been swapped).
>  	 *
>  	 * The bridge can assume that the display pipe (i.e. clocks and timing
>  	 * signals) feeding it is still running when this callback is called.
> @@ -329,7 +335,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_disable callback is optional.
>  	 */
>  	void (*atomic_disable)(struct drm_bridge *bridge,
> -			       struct drm_atomic_state *state);
> +			       struct drm_atomic_state *old_state);
>  
>  	/**
>  	 * @atomic_post_disable:
> @@ -340,6 +346,8 @@ struct drm_bridge_funcs {
>  	 * @atomic_post_disable or @post_disable function. If the preceding
>  	 * element is a &drm_encoder it's called right after the encoder's
>  	 * &drm_encoder_helper_funcs.atomic_disable hook.
> +	 * This hook is passed the old atomic state (atomic state after new/old
> +	 * states have been swapped).
>  	 *
>  	 * The bridge must assume that the display pipe (i.e. clocks and timing
>  	 * signals) feeding it is no longer running when this callback is
> @@ -355,7 +363,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_post_disable callback is optional.
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
> -				    struct drm_atomic_state *state);
> +				    struct drm_atomic_state *old_state);
>  
>  	/**
>  	 * @atomic_duplicate_state:

-- 
Regards,

Laurent Pinchart
