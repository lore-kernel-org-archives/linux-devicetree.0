Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E69C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:05:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34C2020848
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ugqFrXZt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbfLBRFv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:05:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37572 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727810AbfLBRFv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 12:05:51 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBCE5309;
        Mon,  2 Dec 2019 18:05:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575306350;
        bh=aA+iKqe3Q9MVSZpTaAGoQxIb4KBP+2rQFU94GPK0fdk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ugqFrXZtGfggFHHPjHyDa9zVrmwi+8ZluUTZ3McNAGT756LiUHOiPz1khn6akZMb1
         YQw87SJuquipznrjMdgHkG/b0uE6IEeZktcid/+sTaRTLb7bsr3JN+P+YPQDEtx9ne
         VM2FQ+e8eXOfg89mOIhkJmxjQ3XkKtIjp0aclcvg=
Date:   Mon, 2 Dec 2019 19:05:43 +0200
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
Subject: Re: [PATCH v3 13/21] drm/bridge: Add the
 drm_bridge_chain_get_prev_bridge() helper
Message-ID: <20191202170543.GQ4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-14-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-14-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.

On Wed, Oct 23, 2019 at 05:45:04PM +0200, Boris Brezillon wrote:
> Will be useful for bridge drivers that want to do bus format
> negotiation with their neighbours.

A general comment, I think the body of the commit message should be
readable on its own, without the subject line. It may be a matter of
personal taste.

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v3:
> * Inline drm_bridge_chain_get_prev_bridge()
> * Fix the doc
> 
> Changes in v2:
> * Fix the kerneldoc
> * Drop the !bridge || !bridge->encoder check
> ---
>  include/drm/drm_bridge.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2beb1ef9a733..3fb518494640 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -526,6 +526,22 @@ drm_bridge_chain_get_next_bridge(struct drm_bridge *bridge)
>  	return list_next_entry(bridge, chain_node);
>  }
>  
> +/**
> + * drm_bridge_chain_get_prev_bridge() - Get the previous bridge in the chain
> + * @bridge: bridge object
> + *
> + * RETURNS:
> + * the previous bridge in the chain, or NULL if @bridge is the first.
> + */
> +static inline struct drm_bridge *
> +drm_bridge_chain_get_prev_bridge(struct drm_bridge *bridge)
> +{
> +	if (list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain))
> +		return NULL;
> +
> +	return list_prev_entry(bridge, chain_node);
> +}
> +
>  /**
>   * drm_bridge_chain_get_first_bridge() - Get the first bridge in the chain
>   * @encoder: encoder object

-- 
Regards,

Laurent Pinchart
