Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F6CC33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 14:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFF562075A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 14:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgAFOhe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 09:37:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34144 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgAFOhe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 09:37:34 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5A62828EC45;
        Mon,  6 Jan 2020 14:37:32 +0000 (GMT)
Date:   Mon, 6 Jan 2020 15:37:29 +0100
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
Subject: Re: [PATCH v6 0/4] drm: Add support for bus-format negotiation
Message-ID: <20200106153729.7293f7e0@collabora.com>
In-Reply-To: <20200106143409.32321-1-narmstrong@baylibre.com>
References: <20200106143409.32321-1-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Jan 2020 15:34:05 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

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
> No Major changes in this v6, I addressed the slight changed requested
> by Boris from Laurent on the patch 1, and rebased on drm-misc-next. 
> Note that this version only contains core changes.
> Once those changes are merged I'll send the imx/panel/lvds-codec specific bits.
> 
> A more detailed changelog is provided in each patch.
> 
> This patch series is also available here [1].
> 
> Thanks,
> 
> ~Boris~ Neil
> 
> [1] https://github.com/superna9999/linux/commits/drm-bridge-busfmt-v6
> 
> Boris Brezillon (4):
>   drm/bridge: Add a drm_bridge_state object
>   drm/bridge: Patch atomic hooks to take a drm_bridge_state
>   drm/bridge: Add an ->atomic_check() hook
>   drm/bridge: Add the necessary bits to support bus format negotiation

This version looks good to me.

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
>  .../drm/bridge/analogix/analogix_dp_core.c    |  41 +-
>  drivers/gpu/drm/drm_atomic.c                  |  39 ++
>  drivers/gpu/drm/drm_atomic_helper.c           |  32 +-
>  drivers/gpu/drm/drm_bridge.c                  | 527 +++++++++++++++++-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |   5 +-
>  include/drm/drm_atomic.h                      |   3 +
>  include/drm/drm_bridge.h                      | 275 ++++++++-
>  7 files changed, 874 insertions(+), 48 deletions(-)
> 

