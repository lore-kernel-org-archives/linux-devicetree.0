Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7F3CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 13:29:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A34821D71
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 13:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nKw1+MbB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436561AbfJYN37 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 09:29:59 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36639 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJYN36 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 09:29:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id w18so2371406wrt.3
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uUrwK5GGVLVnqDGHz4YhBGqYxyF4XBLlTmyM01JN1hs=;
        b=nKw1+MbBpM2p1dhq5n3DG4sIoKE8YxaigHWf4UX59HpgGff0kbGOZHQlm0a4lKsqCN
         WXThYvwgq7P05/J0ckSG/bLkDfcN6zexHtRRiZypZJ9pBdYgTqndw+zvU0NOHTdY9+Ux
         d/m3jaS0h8qoWbKMco6QwajUdkLVyBLI26/Vgwu3TmtpH2AVYSO9PWPhPYBiMr908FBb
         kqxLFXMbaUyNROOEeLBEV8o0mHB0W15NKicupIGezmQhKDGTcigDd8KAxbD76kxEe/2X
         tyIUWGLYkSbL+g7wR5CzbdhN7dKSGjVO/+4L7/vIatTfy+qEGrTJhSZw0VNI01err52B
         1C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uUrwK5GGVLVnqDGHz4YhBGqYxyF4XBLlTmyM01JN1hs=;
        b=LIvpeBwX2pPiVdnUPEgPSLlccsOi4ApcWwjw9w3vQzIdPXzFS5GJLXuejfxzA18WCr
         vr+IhTdi9cokz+ZMolaUrwtKJ6d58tPBeWJsFZH6veQ2eJjt4Js6OKLJc44TtVVVUpiJ
         pdATD3dIUucrUTHI1moR53hPvFZW5TE5bLzDp9z9Fo40wqzqkTKTOtOr4yNZk+lPOnWN
         urz8Wno6a/ImxbP8gliARpGhcZr7iuIL3jFQa+N54GGfGO9ZdoUR3MRrybctGOq73Ce3
         q/VTH+iOELUaIpMCf0AooVd1I5nbrRnxdqXeB1Sr/le9gfOOdIt8sTD71+0Nihg+s7Yv
         +Kcg==
X-Gm-Message-State: APjAAAWy6evG5UgrOgaVt6DbbzoA2R/rvWFFVlp/vHIQl0cyxyXR+ikC
        lzoze1kzwRW54W+b+Esu/VzeV0Sk9Zkz5Q==
X-Google-Smtp-Source: APXvYqyHzFF47/57N58kgmt3cXSjAVzCDkLXonLamTMd0D8MtdPSTiDSs4Ig44c+B4uWJPmguTwysA==
X-Received: by 2002:adf:f342:: with SMTP id e2mr3238087wrp.61.1572010193880;
        Fri, 25 Oct 2019 06:29:53 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id y3sm3664521wro.36.2019.10.25.06.29.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 06:29:53 -0700 (PDT)
Subject: Re: [PATCH v3 07/21] drm/bridge: Make the bridge chain a
 double-linked list
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
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-8-boris.brezillon@collabora.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d0da3b19-62c9-bf1d-8a41-3a6a06b82fb0@baylibre.com>
Date:   Fri, 25 Oct 2019 15:29:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-8-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 23/10/2019 17:44, Boris Brezillon wrote:
> So that each element in the chain can easily access its predecessor.
> This will be needed to support bus format negotiation between elements
> of the bridge chain.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * None
> 
> Changes in v2:
> * Adjust things to the "dummy encoder bridge" change (patch 2 in this
>   series)
> ---
>  drivers/gpu/drm/drm_bridge.c  | 171 ++++++++++++++++++++++------------
>  drivers/gpu/drm/drm_encoder.c |  16 +---
>  include/drm/drm_bridge.h      |  12 ++-
>  include/drm/drm_encoder.h     |   9 +-
>  4 files changed, 135 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 54c874493c57..c5cf8a9c4237 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -55,7 +55,7 @@
>   * just provide additional hooks to get the desired output at the end of the
>   * encoder chain.
>   *
> - * Bridges can also be chained up using the &drm_bridge.next pointer.
> + * Bridges can also be chained up using the &drm_bridge.chain_node field.
>   *
>   * Both legacy CRTC helpers and the new atomic modeset helpers support bridges.
>   */
> @@ -114,6 +114,7 @@ EXPORT_SYMBOL(drm_bridge_remove);
>  int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  		      struct drm_bridge *previous)
>  {
> +	LIST_HEAD(tmp_list);
>  	int ret;
>  
>  	if (!encoder || !bridge)
> @@ -127,6 +128,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  
>  	bridge->dev = encoder->dev;
>  	bridge->encoder = encoder;
> +	list_add_tail(&bridge->chain_node, &tmp_list);
>  
>  	if (bridge->funcs->attach) {
>  		ret = bridge->funcs->attach(bridge);
> @@ -138,9 +140,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	}
>  
>  	if (previous)
> -		previous->next = bridge;
> +		list_splice(&tmp_list, &previous->chain_node);
>  	else
> -		encoder->bridge = bridge;
> +		list_splice(&tmp_list, &encoder->bridge_chain);
>  
>  	return 0;
>  }
> @@ -157,6 +159,7 @@ void drm_bridge_detach(struct drm_bridge *bridge)
>  	if (bridge->funcs->detach)
>  		bridge->funcs->detach(bridge);
>  
> +	list_del(&bridge->chain_node);
>  	bridge->dev = NULL;
>  }
>  
> @@ -190,18 +193,22 @@ bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
>  				 const struct drm_display_mode *mode,
>  				 struct drm_display_mode *adjusted_mode)
>  {
> -	bool ret = true;
> +	struct drm_encoder *encoder;
>  
>  	if (!bridge)
>  		return true;
>  
> -	if (bridge->funcs->mode_fixup)
> -		ret = bridge->funcs->mode_fixup(bridge, mode, adjusted_mode);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain,
> +				 chain_node) {
> +		if (!bridge->funcs->mode_fixup)
> +			continue;
>  
> -	ret = ret && drm_bridge_chain_mode_fixup(bridge->next, mode,
> -						 adjusted_mode);
> +		if (!bridge->funcs->mode_fixup(bridge, mode, adjusted_mode))
> +			return false;
> +	}
>  
> -	return ret;
> +	return true;
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_mode_fixup);
>  
> @@ -224,18 +231,24 @@ enum drm_mode_status
>  drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
>  			    const struct drm_display_mode *mode)
>  {
> -	enum drm_mode_status ret = MODE_OK;
> +	struct drm_encoder *encoder;
>  
>  	if (!bridge)
> -		return ret;
> +		return MODE_OK;
> +
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		enum drm_mode_status ret;
> +
> +		if (!bridge->funcs->mode_valid)
> +			continue;
>  
> -	if (bridge->funcs->mode_valid)
>  		ret = bridge->funcs->mode_valid(bridge, mode);
> +		if (ret != MODE_OK)
> +			return ret;
> +	}
>  
> -	if (ret != MODE_OK)
> -		return ret;
> -
> -	return drm_bridge_chain_mode_valid(bridge->next, mode);
> +	return MODE_OK;
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
>  
> @@ -251,13 +264,20 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_valid);
>   */
>  void drm_bridge_chain_disable(struct drm_bridge *bridge)
>  {
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *iter;
> +
>  	if (!bridge)
>  		return;
>  
> -	drm_bridge_chain_disable(bridge->next);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +		if (iter->funcs->disable)
> +			iter->funcs->disable(iter);
>  
> -	if (bridge->funcs->disable)
> -		bridge->funcs->disable(bridge);
> +		if (iter == bridge)
> +			break;
> +	}
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_disable);
>  
> @@ -274,13 +294,16 @@ EXPORT_SYMBOL(drm_bridge_chain_disable);
>   */
>  void drm_bridge_chain_post_disable(struct drm_bridge *bridge)
>  {
> +	struct drm_encoder *encoder;
> +
>  	if (!bridge)
>  		return;
>  
> -	if (bridge->funcs->post_disable)
> -		bridge->funcs->post_disable(bridge);
> -
> -	drm_bridge_chain_post_disable(bridge->next);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (bridge->funcs->post_disable)
> +			bridge->funcs->post_disable(bridge);
> +	}
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_post_disable);
>  
> @@ -300,13 +323,16 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
>  			       const struct drm_display_mode *mode,
>  			       const struct drm_display_mode *adjusted_mode)
>  {
> +	struct drm_encoder *encoder;
> +
>  	if (!bridge)
>  		return;
>  
> -	if (bridge->funcs->mode_set)
> -		bridge->funcs->mode_set(bridge, mode, adjusted_mode);
> -
> -	drm_bridge_chain_mode_set(bridge->next, mode, adjusted_mode);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (bridge->funcs->mode_set)
> +			bridge->funcs->mode_set(bridge, mode, adjusted_mode);
> +	}
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>  
> @@ -323,13 +349,17 @@ EXPORT_SYMBOL(drm_bridge_chain_mode_set);
>   */
>  void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>  {
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *iter;
> +
>  	if (!bridge)
>  		return;
>  
> -	drm_bridge_chain_pre_enable(bridge->next);
> -
> -	if (bridge->funcs->pre_enable)
> -		bridge->funcs->pre_enable(bridge);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
> +		if (iter->funcs->pre_enable)
> +			iter->funcs->pre_enable(iter);
> +	}
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
>  
> @@ -345,13 +375,16 @@ EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
>   */
>  void drm_bridge_chain_enable(struct drm_bridge *bridge)
>  {
> +	struct drm_encoder *encoder;
> +
>  	if (!bridge)
>  		return;
>  
> -	if (bridge->funcs->enable)
> -		bridge->funcs->enable(bridge);
> -
> -	drm_bridge_chain_enable(bridge->next);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
> +		if (bridge->funcs->enable)
> +			bridge->funcs->enable(bridge);
> +	}
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_enable);
>  
> @@ -370,15 +403,23 @@ EXPORT_SYMBOL(drm_bridge_chain_enable);
>  void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
>  				     struct drm_atomic_state *state)
>  {
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *iter;
> +
>  	if (!bridge)
>  		return;
>  
> -	drm_atomic_bridge_chain_disable(bridge->next, state);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_reverse(iter, &encoder->bridge_chain,
> +				    chain_node) {
> +		if (iter->funcs->atomic_disable)
> +			iter->funcs->atomic_disable(iter, state);
> +		else if (iter->funcs->disable)
> +			iter->funcs->disable(iter);
>  
> -	if (bridge->funcs->atomic_disable)
> -		bridge->funcs->atomic_disable(bridge, state);
> -	else if (bridge->funcs->disable)
> -		bridge->funcs->disable(bridge);
> +		if (iter == bridge)
> +			break;
> +	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>  
> @@ -398,15 +439,19 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
>  void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
>  					  struct drm_atomic_state *state)
>  {
> +	struct drm_encoder *encoder;
> +
>  	if (!bridge)
>  		return;
>  
> -	if (bridge->funcs->atomic_post_disable)
> -		bridge->funcs->atomic_post_disable(bridge, state);
> -	else if (bridge->funcs->post_disable)
> -		bridge->funcs->post_disable(bridge);
> -
> -	drm_atomic_bridge_chain_post_disable(bridge->next, state);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &encoder->bridge_chain,
> +				 chain_node) {
> +		if (bridge->funcs->atomic_post_disable)
> +			bridge->funcs->atomic_post_disable(bridge, state);
> +		else if (bridge->funcs->post_disable)
> +			bridge->funcs->post_disable(bridge);
> +	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>  
> @@ -426,15 +471,23 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
>  void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
>  					struct drm_atomic_state *state)
>  {
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *iter;
> +
>  	if (!bridge)
>  		return;
>  
> -	drm_atomic_bridge_chain_pre_enable(bridge->next, state);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_reverse(iter, &bridge->encoder->bridge_chain,
> +				    chain_node) {
> +		if (iter->funcs->atomic_pre_enable)
> +			iter->funcs->atomic_pre_enable(iter, state);
> +		else if (iter->funcs->pre_enable)
> +			iter->funcs->pre_enable(iter);
>  
> -	if (bridge->funcs->atomic_pre_enable)
> -		bridge->funcs->atomic_pre_enable(bridge, state);
> -	else if (bridge->funcs->pre_enable)
> -		bridge->funcs->pre_enable(bridge);
> +		if (iter == bridge)
> +			break;
> +	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
>  
> @@ -453,15 +506,19 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_pre_enable);
>  void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *state)
>  {
> +	struct drm_encoder *encoder;
> +
>  	if (!bridge)
>  		return;
>  
> -	if (bridge->funcs->atomic_enable)
> -		bridge->funcs->atomic_enable(bridge, state);
> -	else if (bridge->funcs->enable)
> -		bridge->funcs->enable(bridge);
> -
> -	drm_atomic_bridge_chain_enable(bridge->next, state);
> +	encoder = bridge->encoder;
> +	list_for_each_entry_from(bridge, &bridge->encoder->bridge_chain,
> +				 chain_node) {
> +		if (bridge->funcs->atomic_enable)
> +			bridge->funcs->atomic_enable(bridge, state);
> +		else if (bridge->funcs->enable)
> +			bridge->funcs->enable(bridge);
> +	}
>  }
>  EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>  
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 4fe9e723e227..e555281f43d4 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -140,6 +140,7 @@ int drm_encoder_init(struct drm_device *dev,
>  		goto out_put;
>  	}
>  
> +	INIT_LIST_HEAD(&encoder->bridge_chain);
>  	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
>  	encoder->index = dev->mode_config.num_encoder++;
>  
> @@ -160,23 +161,16 @@ EXPORT_SYMBOL(drm_encoder_init);
>  void drm_encoder_cleanup(struct drm_encoder *encoder)
>  {
>  	struct drm_device *dev = encoder->dev;
> +	struct drm_bridge *bridge, *next;
>  
>  	/* Note that the encoder_list is considered to be static; should we
>  	 * remove the drm_encoder at runtime we would have to decrement all
>  	 * the indices on the drm_encoder after us in the encoder_list.
>  	 */
>  
> -	if (encoder->bridge) {
> -		struct drm_bridge *bridge;
> -		struct drm_bridge *next;
> -
> -		bridge = drm_bridge_chain_get_first_bridge(encoder);
> -		while (bridge) {
> -			next = bridge->next;
> -			drm_bridge_detach(bridge);
> -			bridge = next;
> -		}
> -	}
> +	list_for_each_entry_safe(bridge, next, &encoder->bridge_chain,
> +				 chain_node)
> +		drm_bridge_detach(bridge);
>  
>  	drm_mode_object_unregister(dev, &encoder->base);
>  	kfree(encoder->name);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 27eef63ce0ff..3ab16c95e59e 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -384,8 +384,8 @@ struct drm_bridge {
>  	struct drm_device *dev;
>  	/** @encoder: encoder to which this bridge is connected */
>  	struct drm_encoder *encoder;
> -	/** @next: the next bridge in the encoder chain */
> -	struct drm_bridge *next;
> +	/** @chain_node: used to form a bridge chain */
> +	struct list_head chain_node;
>  #ifdef CONFIG_OF
>  	/** @of_node: device node pointer to the bridge */
>  	struct device_node *of_node;
> @@ -420,7 +420,10 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  static inline struct drm_bridge *
>  drm_bridge_chain_get_next_bridge(struct drm_bridge *bridge)
>  {
> -	return bridge->next;
> +	if (list_is_last(&bridge->chain_node, &bridge->encoder->bridge_chain))
> +		return NULL;
> +
> +	return list_next_entry(bridge, chain_node);
>  }
>  
>  /**
> @@ -434,7 +437,8 @@ drm_bridge_chain_get_next_bridge(struct drm_bridge *bridge)
>  static inline struct drm_bridge *
>  drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
>  {
> -	return encoder->bridge;
> +	return list_first_entry_or_null(&encoder->bridge_chain,
> +					struct drm_bridge, chain_node);
>  }
>  
>  bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index f06164f44efe..9b3dde177c81 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -172,7 +172,14 @@ struct drm_encoder {
>  	 * &drm_connector_state.crtc.
>  	 */
>  	struct drm_crtc *crtc;
> -	struct drm_bridge *bridge;
> +
> +	/**
> +	 * @bridge_chain: Bridges attached to this encoder. The first entry of
> +	 * this list is always &drm_encoder.bridge. It may be followed by other
> +	 * bridge entities.
> +	 */
> +	struct list_head bridge_chain;
> +
>  	const struct drm_encoder_funcs *funcs;
>  	const struct drm_encoder_helper_funcs *helper_private;
>  };
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
