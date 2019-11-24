Return-Path: <SRS0=+Vg9=ZQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87D1C432C3
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 00:46:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F9BD20714
	for <linux-devicetree@archiver.kernel.org>; Sun, 24 Nov 2019 00:46:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfKXAq6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 23 Nov 2019 19:46:58 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59448 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfKXAq6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 23 Nov 2019 19:46:58 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id EA44728D210
Message-ID: <947ed9253bf501636e035698336c80c8af0743e0.camel@collabora.com>
Subject: Re: [PATCH v3 00/21] drm: Add support for bus-format negotiation
From:   Ezequiel Garcia <ezequiel@collabora.com>
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
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Date:   Sun, 24 Nov 2019 09:46:41 +0900
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris, Neil,

On Wed, 2019-10-23 at 17:44 +0200, Boris Brezillon wrote:
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
> Major changes since v2:
> * Get rid of the dummy bridge embedded in drm_encoder and let encoder
>   drivers provide their own bridge element
> * Clarify APIs and improve the doc
> * Propagate bus flags by default
> 
> Major changes since the RFC:
> 
> * Add a dummy bridge to the drm_encoder object so that vc4 and exynos
>   DSI drivers can implement the pre_enable/post_disable hooks instead
>   of manually setting encoder->bridge to NULL to control the
>   enable/disable sequence. This change is also a first step towards
>   drm_bridge/drm_encoder unification. New encoder drivers should
>   stop implementing drm_encoder_helper_funcs and switch to
>   drm_bridge_funcs. Existing drivers can be converted progressively
>   (already have a branch where I started converting some of them [1])
> * rework the bus format negotiation to give more control to bridge
>   drivers in the selection process (driver can select at runtime which
>   input bus format they support for a specific output bus format based
>   on any information available in the connector, crtc and bridge state.
> 
> A more detailed changelog is provided in each patch.
> 
> This patch series is also available here [2].
> 
> Thanks,
> 
> Boris
> 
> [1]https://github.com/bbrezillon/linux-0day/commits/drm-encoder-bridge
> [2]https://github.com/bbrezillon/linux-0day/commits/drm-bridge-busfmt-v3
> 
> *** BLURB HERE ***
> 
> Boris Brezillon (21):
>   drm/vc4: Declare the DSI encoder as a bridge element
>   drm/exynos: Don't reset bridge->next
>   drm/exynos: Declare the DSI encoder as a bridge element
>   drm/bridge: Rename bridge helpers targeting a bridge chain
>   drm/bridge: Introduce drm_bridge_chain_get_next_bridge()
>   drm: Stop accessing encoder->bridge directly

Patches 1 to 6 seem to be reviewed, and appear as a good
step forward.

Perhaps we can consider merging these first? That way,
we can reduce the patches needed to rebase and submit
on each iteration.

Regards,
Ezequiel

