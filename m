Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE20C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 14:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAD2120731
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 14:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgAFOke (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 09:40:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34170 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgAFOke (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 09:40:34 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0FEDA28EC45;
        Mon,  6 Jan 2020 14:40:30 +0000 (GMT)
Date:   Mon, 6 Jan 2020 15:40:26 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     dri-devel@lists.freedesktop.org,
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
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH v6 2/4] drm/bridge: Patch atomic hooks to take a
 drm_bridge_state
Message-ID: <20200106154026.366f039e@collabora.com>
In-Reply-To: <20200106143409.32321-3-narmstrong@baylibre.com>
References: <20200106143409.32321-1-narmstrong@baylibre.com>
        <20200106143409.32321-3-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Jan 2020 15:34:07 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 8ffa4fbbdeb3..b8b22dc55bdb 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -590,8 +590,9 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>  }
>  
>  static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
> -				    struct drm_atomic_state *state)
> +				    struct drm_bridge_state *old_bridge_state)
>  {
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
>  	struct drm_connector *connector;
>  	struct drm_crtc *crtc;
>  
> @@ -603,7 +604,7 @@ static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>  }
>  
>  static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
> -				     struct drm_atomic_state *state)
> +				     struct drm_bridge_state *state)

Just a nit: maybe you should name that one old_bridge_state for
consistency.

>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  
