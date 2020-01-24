Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69704C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 16:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4539F20704
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 16:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388207AbgAXQZ4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 11:25:56 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:39976 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388131AbgAXQZ4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jan 2020 11:25:56 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id AE2A480884;
        Fri, 24 Jan 2020 17:25:51 +0100 (CET)
Date:   Fri, 24 Jan 2020 17:25:50 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        intel-gfx-trybot@lists.freedesktop.org, kernel@collabora.com,
        Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH v8 10/12] drm/bridge: panel: Propage bus format/flags
Message-ID: <20200124162550.GA5835@ravnborg.org>
References: <20200123095333.2085810-1-boris.brezillon@collabora.com>
 <20200123095333.2085810-11-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123095333.2085810-11-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
        a=e5mUnYsNAAAA:8 a=V7CZr4U-BNfX0708pu8A:9 a=CjuIK1q_8ugA:10
        a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 23, 2020 at 10:53:31AM +0100, Boris Brezillon wrote:
> So that the previous bridge element in the chain knows which input
> format the panel bridge expects.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Subject: [PATCH v8 10/12] drm/bridge: panel: Propage bus format/flags
s/Propage/Propagate/
?

	Sam

> ---
> Changes in v7:
> * Set atomic state hooks explicitly
> 
> Changes in v3:
> * Adjust things to match the new bus-format negotiation approach
> * Use drm_atomic_helper_bridge_propagate_bus_fmt
> * Don't implement ->atomic_check() (the core now takes care of bus
>   flags propagation)
> 
> Changes in v2:
> * Adjust things to match the new bus-format negotiation approach
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
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
