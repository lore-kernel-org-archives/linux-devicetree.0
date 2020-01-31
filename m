Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBD9C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 17:25:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C055D2082E
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 17:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbgAaRZK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 12:25:10 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58522 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgAaRZK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 12:25:10 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0AED626D809;
        Fri, 31 Jan 2020 17:25:08 +0000 (GMT)
Date:   Fri, 31 Jan 2020 18:25:05 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, intel-gfx-trybot@lists.freedesktop.org
Subject: Re: [PATCH v10 10/12] drm/bridge: panel: Propage bus format/flags
Message-ID: <20200131182505.51366470@collabora.com>
In-Reply-To: <20200128135514.108171-11-boris.brezillon@collabora.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
        <20200128135514.108171-11-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

And the typo (Propage -> Propagate) is still there :-(. Fixing it right
now so I don't forget.

On Tue, 28 Jan 2020 14:55:12 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> So that the previous bridge element in the chain knows which input
> format the panel bridge expects.
> 
> v10:
> * Add changelog to the commit message
> 
> v8 -> v9:
> * No changes
> 
> v7:
> * Set atomic state hooks explicitly
> 
> v4 -> v6:
> * Not part of the series
> 
> v3:
> * Adjust things to match the new bus-format negotiation approach
> * Use drm_atomic_helper_bridge_propagate_bus_fmt
> * Don't implement ->atomic_check() (the core now takes care of bus
>   flags propagation)
> 
> v2:
> * Adjust things to match the new bus-format negotiation approach
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/bridge/panel.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index f66777e24968..dcc72bd7df30 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -127,6 +127,10 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
>  	.enable = panel_bridge_enable,
>  	.disable = panel_bridge_disable,
>  	.post_disable = panel_bridge_post_disable,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts = drm_atomic_helper_bridge_propagate_bus_fmt,
>  };
>  
>  /**

