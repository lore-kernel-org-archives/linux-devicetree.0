Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D910CA9EBD
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 14:33:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D164221D71
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 14:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YwgGiW6G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438994AbfJYOdq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 10:33:46 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35391 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438752AbfJYOdp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 10:33:45 -0400
Received: by mail-wm1-f68.google.com with SMTP id v6so2251809wmj.0
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 07:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1l8uYPJaFizeK4iLDRVUxcJjpD7EAyP2tVHW1Dy+y1I=;
        b=YwgGiW6GENkFcZcDlzwGUKDPeDN8BgXM61CXs1v3u17KjvM4e/iLOPLHhY6mbKQxD8
         sPAvUeDbo9A+Pmba8WBJ3rwAVxzedLWoPzaCi6d1dWk3FFPtYnxFkEL6rVHNU9dem2e8
         sKA6KRH4WZBvNstTQzfGAeLRn5+AOfKJTOtI4GWn+11IbUj3LA0IXf0P9AiZJiu41G2d
         JSqEGMfc5HBoOBLiZ/mnLu7K+ztu3xn7H3gsJOmTwJ2I7PHDewYgTj3+4BYN4IYJcnw2
         nk+LyZKWBX6Qj78FVtpLgquZt7sb4p+YRVMIxkjFjAW4ArW4OA4KDb/IuPBsTE0Fko3I
         QSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1l8uYPJaFizeK4iLDRVUxcJjpD7EAyP2tVHW1Dy+y1I=;
        b=lfe64/KP6ldm4w24BtIFr9bh/Pc1tZBC9RI13ooqOOliJshETagBJ0+QvORfUuYFAP
         WOUVPkyjGTX+RPEMSbEvnOjan1vzOkIvENNmMD0wb0vDlh6CIKdo7l1uCrAK6aJpp+0a
         SeuRy62HdfAIFc6BvUDUPresthuGEjtsOelqPBISRm3Tcdioj4CYBzrO1D0lI3KIyom1
         aZgwpegupZVLOIXOQf07MWFGHC3ct2RJN3o0YDBLKUmFuQlC184a85P9TqUcfFZdunv6
         9YVT5N8xaK1qMuUzOLGmvRoceTshefqKTjnBovF7eLqxKxrmxOdTXkr9DY3/FDCRjjiz
         hZMw==
X-Gm-Message-State: APjAAAU8oaexEa6vOT+fjSSAMhJAiaDgHSYxh8xXBLaa9wSvLgTa6+X5
        QlIzauBf/2je6MVk/WQ4Hp6L3jQabykWKQ==
X-Google-Smtp-Source: APXvYqxZXjjPETHZLTmzGYG4+Q/Vg589iW86m3gMpuXR74hx0uHMy7TLcf7EtXqgtgdFv4bEFomjeA==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr3755946wma.57.1572014021716;
        Fri, 25 Oct 2019 07:33:41 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id a17sm2164659wmb.8.2019.10.25.07.33.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 07:33:41 -0700 (PDT)
Subject: Re: [PATCH v3 10/21] drm/bridge: Clarify the atomic enable/disable
 hooks semantics
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
 <20191023154512.9762-11-boris.brezillon@collabora.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d5d30330-3809-3f10-9b30-a7b68b60adaf@baylibre.com>
Date:   Fri, 25 Oct 2019 16:33:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-11-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 23/10/2019 17:45, Boris Brezillon wrote:
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
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
