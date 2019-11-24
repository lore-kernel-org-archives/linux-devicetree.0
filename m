Return-Path: <SRS0=+Vg9=ZQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BB4C432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 14:07:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6119C2073F
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 14:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QX/Ml0Os"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfKXOHN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 24 Nov 2019 09:07:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42806 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbfKXOHN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 24 Nov 2019 09:07:13 -0500
Received: from pendragon.ideasonboard.com (fs96f9c64d.tkyc509.ap.nuro.jp [150.249.198.77])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30D3BD4B;
        Sun, 24 Nov 2019 15:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574604431;
        bh=QIQymv6qd2ykGSf5dOK4PtXHV5nSJg+KRVTPHFptRMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QX/Ml0OstNI5mXkOT7W7oeP5kHE8RXzV6OyWGI8I2bl47rwkJyuFfiY0z/uX9sHeE
         kM+dPUFZCJpcRim8bsXU37kuM4Nl9uxXsZ1cEYX9IIioQEtU9MDwWGA/A7PLBOAzkq
         l1I/srEOt1a8uih6/t2qxzaZ1Se2Ozd19L9bcScM=
Date:   Sun, 24 Nov 2019 16:07:02 +0200
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
Subject: Re: [PATCH v3 08/21] drm/bridge: Add the
 drm_for_each_bridge_in_chain() helper
Message-ID: <20191124140702.GK4727@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-9-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-9-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.
On Wed, Oct 23, 2019 at 05:44:59PM +0200, Boris Brezillon wrote:
> To iterate over all bridges attached to a specific encoder.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * None
> 
> Changes in v2:
> * New patch
> ---
>  include/drm/drm_bridge.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 3ab16c95e59e..238e84ab63a3 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -441,6 +441,17 @@ drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
>  					struct drm_bridge, chain_node);
>  }
>  
> +/**
> + * for_each_bridge_in_chain() - Iterate over all bridges present in a chain

The name doesn't match the macro below. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * @encoder: the encoder to iterate bridges on
> + * @bridge: a bridge pointer updated to point to the current bridge at each
> + *	    iteration
> + *
> + * Iterate over all bridges present in the bridge chain attached to @encoder.
> + */
> +#define drm_for_each_bridge_in_chain(encoder, bridge)			\
> +	list_for_each_entry(bridge, &(encoder)->bridge_chain, chain_node)
> +
>  bool drm_bridge_chain_mode_fixup(struct drm_bridge *bridge,
>  				 const struct drm_display_mode *mode,
>  				 struct drm_display_mode *adjusted_mode);

-- 
Regards,

Laurent Pinchart
