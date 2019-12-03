Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E30C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 18:19:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3FB7220661
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 18:19:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p+CtxNTA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfLCSTf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 13:19:35 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:39498 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfLCSTf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 13:19:35 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4DF9309;
        Tue,  3 Dec 2019 19:19:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575397173;
        bh=cBB4j+7hkCsBm/IXK9DIP4kp1uIXKZ/+DCGVNlsPr1s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p+CtxNTA+gZlqDwPLyEEK72fUFWR6FFq+hD+tZWz+BO1CzlktoMonO5K4T3zidB7M
         A2enTxKE2ptJsvNpZvTRmx6W6cJiRywD4zuM0bUJLS+S29A6q3sjaG536wsYu5EsHC
         bDMhzubkXiE65TD0MfV/NEfC53sAbDC3BjytcPtQ=
Date:   Tue, 3 Dec 2019 20:19:24 +0200
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
Subject: Re: [PATCH v4 00/11] drm: Add support for bus-format negotiation
Message-ID: <20191203181924.GU4730@pendragon.ideasonboard.com>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191203141515.3597631-1-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

On Tue, Dec 03, 2019 at 03:15:04PM +0100, Boris Brezillon wrote:
> This patch series aims at adding support for runtime bus-format
> negotiation between all elements of the
> 'encoder -> bridges -> connector/display' section of the pipeline.
> 
> In order to support that, we need drm bridges to fully take part in the
> atomic state validation process, which requires adding a
> drm_bridge_state and a new drm_bridge_funcs.atomic_check() hook.
> Once those basic building blocks are in place, we can add new hooks to
> allow bus format negotiation (those are called just before
> ->atomic_check()). The bus format selection is done at runtime by
> testing all possible combinations across the whole bridge chain until
> one is reported to work.
> 
> No Major changes in this v4. I think I addressed all comments I got
> from Neil and Laurent (thanks for the detailed reviews BTW). Note that
> this version only contains core changes. Once those changes are merged
> I'll send the imx/panel/lvds-codec specific bits.

I think it would make sense to fast-track patches 01 to 07 (a bit
selfishly as I would have a need for them in omapdrm :-)), but starting
from 08 I wonder if it wouldn't make more sense to merge them with the
imx/panel/lvds-codec bits to have a user.

> A more detailed changelog is provided in each patch.
> 
> This patch series is also available here [1].
> 
> Thanks,
> 
> Boris
> 
> [1]https://github.com/bbrezillon/linux-0day/commits/drm-bridge-busfmt-v4
> 
> Boris Brezillon (11):
>   drm/bridge: Rename bridge helpers targeting a bridge chain
>   drm/bridge: Introduce drm_bridge_get_next_bridge()
>   drm: Stop accessing encoder->bridge directly
>   drm/bridge: Make the bridge chain a double-linked list
>   drm/bridge: Add the drm_for_each_bridge_in_chain() helper
>   drm/bridge: Add the drm_bridge_get_prev_bridge() helper
>   drm/bridge: Clarify the atomic enable/disable hooks semantics
>   drm/bridge: Add a drm_bridge_state object
>   drm/bridge: Patch atomic hooks to take a drm_bridge_state
>   drm/bridge: Add an ->atomic_check() hook
>   drm/bridge: Add the necessary bits to support bus format negotiation
> 
>  .../drm/bridge/analogix/analogix_dp_core.c    |  41 +-
>  drivers/gpu/drm/drm_atomic.c                  |  39 +
>  drivers/gpu/drm/drm_atomic_helper.c           |  53 +-
>  drivers/gpu/drm/drm_bridge.c                  | 756 +++++++++++++++---
>  drivers/gpu/drm/drm_encoder.c                 |  15 +-
>  drivers/gpu/drm/drm_probe_helper.c            |   4 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  13 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |   8 +-
>  drivers/gpu/drm/msm/edp/edp_bridge.c          |  10 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c            |   4 +-
>  drivers/gpu/drm/omapdrm/omap_encoder.c        |   3 +-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  10 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                 |  18 +-
>  include/drm/drm_atomic.h                      |   3 +
>  include/drm/drm_bridge.h                      | 404 +++++++++-
>  include/drm/drm_encoder.h                     |   7 +-
>  16 files changed, 1174 insertions(+), 214 deletions(-)

-- 
Regards,

Laurent Pinchart
