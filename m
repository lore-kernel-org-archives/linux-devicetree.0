Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60348C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 15:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CEDF214D8
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 15:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbgAaPmu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 10:42:50 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57720 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729004AbgAaPmu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 10:42:50 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0FD1029567B;
        Fri, 31 Jan 2020 15:42:48 +0000 (GMT)
Date:   Fri, 31 Jan 2020 16:42:44 +0100
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
Subject: Re: [PATCH v10 00/12] drm: Add support for bus-format negotiation
Message-ID: <20200131164244.6955ec45@collabora.com>
In-Reply-To: <20200128135514.108171-1-boris.brezillon@collabora.com>
References: <20200128135514.108171-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 28 Jan 2020 14:55:02 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
> 
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
> No fundamental changes in this v10, just collected R-bs, addressed
> Philipp's comments and moved the changelog back to the visible part
> of the commit message.
> 
> I plan to apply patches 1 to 7 soon, so if there's anything you don't
> like in there, please say it now. Still waiting for review on the LVDS
> bridge and panel stuff.
> 
> This patch series is also available here [1].
> 
> Thanks,
> 
> Boris
> 
> [1]https://github.com/bbrezillon/linux-0day/commits/drm-bridge-busfmt-v10
> 
> Boris Brezillon (12):
>   drm/bridge: Add a drm_bridge_state object
>   drm/rcar-du: Plug atomic state hooks to the default implementation
>   drm/bridge: analogix: Plug atomic state hooks to the default
>     implementation
>   drm/bridge: Patch atomic hooks to take a drm_bridge_state
>   drm/bridge: Add an ->atomic_check() hook
>   drm/bridge: Add the necessary bits to support bus format negotiation
>   drm/imx: pd: Use bus format/flags provided by the bridge when
>     available

Patches 1 to 7 applied.

>   drm/bridge: lvds-codec: Implement basic bus format negotiation
>   dt-bindings: display: bridge: lvds-codec: Add new bus-width prop
>   drm/bridge: panel: Propage bus format/flags

Laurent, when you find some time, could you have a look at patches 8-10?

>   drm/panel: simple: Fix the lt089ac29000 bus_format

Sam, I'll let you apply that one since dim complained that it was
missing a R-b (you only gave your A-b).

>   ARM: dts: imx: imx51-zii-rdu1: Fix the display pipeline definition
> 
>  .../bindings/display/bridge/lvds-codec.yaml   |   8 +
>  arch/arm/boot/dts/imx51-zii-rdu1.dts          |  24 +-
>  .../drm/bridge/analogix/analogix_dp_core.c    |  44 +-
>  drivers/gpu/drm/bridge/lvds-codec.c           |  64 ++-
>  drivers/gpu/drm/bridge/panel.c                |   4 +
>  drivers/gpu/drm/drm_atomic.c                  | 116 +++++
>  drivers/gpu/drm/drm_atomic_helper.c           |  73 ++-
>  drivers/gpu/drm/drm_atomic_state_helper.c     | 103 +++++
>  drivers/gpu/drm/drm_bridge.c                  | 437 +++++++++++++++++-
>  drivers/gpu/drm/imx/parallel-display.c        | 177 ++++++-
>  drivers/gpu/drm/panel/panel-simple.c          |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  11 +-
>  include/drm/drm_atomic.h                      |  76 +++
>  include/drm/drm_atomic_helper.h               |   8 +
>  include/drm/drm_atomic_state_helper.h         |  13 +
>  include/drm/drm_bridge.h                      | 179 ++++++-
>  16 files changed, 1258 insertions(+), 81 deletions(-)
> 

