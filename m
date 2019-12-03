Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE65C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 18:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D13A0206DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 18:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eIscy6XJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfLCSCe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 13:02:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39294 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfLCSCe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 13:02:34 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03B3E309;
        Tue,  3 Dec 2019 19:02:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575396151;
        bh=m36J6IT7250D3XBj/8ZSZZRsiNcc0jchQ6du9m7Wnbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eIscy6XJQ+KROvAxHpEQAp6dfxLbPL6Wd0AWK6S+YTU/VG0XvumtLxzstNedE6GwB
         zs6pxR1dT6tSMVWFf4fXRWeseaLgyohDjjIU9CCofa9ynCDmlEp+DwSJMyttho5HBS
         rlX0N3pDlSxggOulzXHuJo3kzWzDGRvsmvDmYlwI=
Date:   Tue, 3 Dec 2019 20:02:23 +0200
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
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 07/11] drm/bridge: Clarify the atomic enable/disable
 hooks semantics
Message-ID: <20191203180223.GS4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203141515.3597631-8-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191203141515.3597631-8-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thanks for the patch.

On Tue, Dec 03, 2019 at 03:15:11PM +0100, Boris Brezillon wrote:
> The [pre_]enable/[post_]disable hooks are passed the old atomic state.
> Update the doc and rename the arguments to make it clear.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Changes in v4:
> * Drop the doc update (Laurent)

I was referring to the doc updates in drm_bridge.h only. Is there a
reason you dropped the changes from drm_bridge.c ? I think those were
good.

> * Add Rbs
> 
> Changes in v3:
> * New patch
> ---
>  include/drm/drm_bridge.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index bfb0385163f1..d7d714023050 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -263,7 +263,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_pre_enable callback is optional.
>  	 */
>  	void (*atomic_pre_enable)(struct drm_bridge *bridge,
> -				  struct drm_atomic_state *state);
> +				  struct drm_atomic_state *old_state);
>  
>  	/**
>  	 * @atomic_enable:
> @@ -288,7 +288,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_enable callback is optional.
>  	 */
>  	void (*atomic_enable)(struct drm_bridge *bridge,
> -			      struct drm_atomic_state *state);
> +			      struct drm_atomic_state *old_state);
>  	/**
>  	 * @atomic_disable:
>  	 *
> @@ -311,7 +311,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_disable callback is optional.
>  	 */
>  	void (*atomic_disable)(struct drm_bridge *bridge,
> -			       struct drm_atomic_state *state);
> +			       struct drm_atomic_state *old_state);
>  
>  	/**
>  	 * @atomic_post_disable:
> @@ -337,7 +337,7 @@ struct drm_bridge_funcs {
>  	 * The @atomic_post_disable callback is optional.
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
> -				    struct drm_atomic_state *state);
> +				    struct drm_atomic_state *old_state);
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
