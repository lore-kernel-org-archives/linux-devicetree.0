Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F920CA9EBC
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F412A21E6F
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 11:27:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Wz05UlAZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438971AbfJXL1X (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 07:27:23 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34179 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436501AbfJXL1X (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 07:27:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id v3so1780898wmh.1
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 04:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BmBAox3kKpyTb1syqBN5iTOQbo9VVELC34GDKavoTuU=;
        b=Wz05UlAZ2H31LO4kd6dEGihiF+QPwx1QkAVsQ9EwQ33ib4hWN5a1KcBxuXeKNrYAn2
         oZLBMjDOPu2e07rfmDMe+lGe38u4vTs2Ei3WuxIFDZoG/RxghvjxEBS19twlai2mq7SF
         WVuLBAsTE4HqS5ngt2IGIK8F2kI/jaDuAqoXEuz9VVrdeGCkxUJa+66RIUvO5s/SMgSD
         p1GUz0Vcj+0g+3IuNp1A/M7i+4CfwZSQFu6AfTtSt5zRpO8tEV2Ukfbx8ybVrL3CEFwW
         wfTyrak6e8kcBbZYQf/Xw8euAFBDdg0uRzUDxlylGc7egHXAccF3vgOfgcGgAgBurQEi
         ED2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BmBAox3kKpyTb1syqBN5iTOQbo9VVELC34GDKavoTuU=;
        b=Q99okbOEYBlWe7xWD3ZtdKyrC4PsEYyYv4CVwRpTikB3Uoh/fW3qwo0fIl3WJzPuEl
         UQtFCB3h6zGFI8yb+hYPZ1mvLra4xIqJBKV+V6DcNEvCPx3LMvUdtGJBOnX7YFtZ63b5
         4BGAWNQ4aoYzQ02qHHI+szSHIFoQtreY6ygNqHcd/3u4JHleYatGdCqulWM6oY4gO4Wl
         n59fG/5XrL4rMdJHv/KugBmH6Q9T2TkrqNoxbkRjsx4NFRzXQxskYHm7fneenwpYezEq
         vF37NlMEPWsw9zNjkZY5nr3rFlIitnfgvYMkRdymZNwnX2wOj/1zxJeCgkh5y297BhGG
         g3qg==
X-Gm-Message-State: APjAAAXoHQang8N6PNx+hSdbcOhUGXHT0YFTLRkRajsNZ3ezCQWrOKTU
        z3b9zdMr5Fe2JHIW0az3fwraKmnBzXD/NQ==
X-Google-Smtp-Source: APXvYqyUmbb1pxzW7gJ9M4afv258DZ2SfWmqvDmdZxrPIkHhgPK/7kCzO3qHn4ex4eoImLe8EXpaTg==
X-Received: by 2002:a1c:9dd3:: with SMTP id g202mr4624478wme.43.1571916438692;
        Thu, 24 Oct 2019 04:27:18 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l8sm9055964wru.22.2019.10.24.04.27.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 04:27:18 -0700 (PDT)
Subject: Re: [PATCH v3 00/21] drm: Add support for bus-format negotiation
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
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <b98ebd1b-8d95-38ba-ff26-51a70a7c3a1c@baylibre.com>
Date:   Thu, 24 Oct 2019 13:27:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

hi Boris,

On 23/10/2019 17:44, Boris Brezillon wrote:
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

Seems you forgot my reviewed-bys on patches 5, 8, 11 & 13

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

Will test ASAP.

> 
> Thanks,
> 
> Boris
> 
> [1]https://github.com/bbrezillon/linux-0day/commits/drm-encoder-bridge
> [2]https://github.com/bbrezillon/linux-0day/commits/drm-bridge-busfmt-v3
> 
> *** BLURB HERE ***

Blurp

Neil

> 
> Boris Brezillon (21):
>   drm/vc4: Declare the DSI encoder as a bridge element
>   drm/exynos: Don't reset bridge->next
>   drm/exynos: Declare the DSI encoder as a bridge element
>   drm/bridge: Rename bridge helpers targeting a bridge chain
>   drm/bridge: Introduce drm_bridge_chain_get_next_bridge()
>   drm: Stop accessing encoder->bridge directly
>   drm/bridge: Make the bridge chain a double-linked list
>   drm/bridge: Add the drm_for_each_bridge_in_chain() helper
>   drm/bridge: Add a drm_bridge_state object
>   drm/bridge: Clarify the atomic enable/disable hooks semantics
>   drm/bridge: Patch atomic hooks to take a drm_bridge_state
>   drm/bridge: Add an ->atomic_check() hook
>   drm/bridge: Add the drm_bridge_chain_get_prev_bridge() helper
>   drm/bridge: Add the necessary bits to support bus format negotiation
>   drm/imx: pd: Use bus format/flags provided by the bridge when
>     available
>   drm/bridge: lvds-encoder: Implement basic bus format negotiation
>   dt-bindings: display: bridge: lvds-transmitter: Add new props
>   drm/bridge: panel: Propage bus format/flags
>   drm/panel: simple: Add support for Toshiba LTA089AC29000 panel
>   dt-bindings: display: panel: Add the LTA089AC29000 variant
>   ARM: dts: imx: imx51-zii-rdu1: Fix the display pipeline definition
> 
>  .../display/bridge/lvds-transmitter.txt       |  13 +
>  .../display/panel/toshiba,lt089ac29000.txt    |   5 +-
>  arch/arm/boot/dts/imx51-zii-rdu1.dts          |  24 +-
>  .../drm/bridge/analogix/analogix_dp_core.c    |  12 +-
>  drivers/gpu/drm/bridge/lvds-encoder.c         |  72 ++
>  drivers/gpu/drm/bridge/panel.c                |   1 +
>  drivers/gpu/drm/drm_atomic.c                  |  39 +
>  drivers/gpu/drm/drm_atomic_helper.c           |  54 +-
>  drivers/gpu/drm/drm_bridge.c                  | 800 +++++++++++++++---
>  drivers/gpu/drm/drm_encoder.c                 |  15 +-
>  drivers/gpu/drm/drm_probe_helper.c            |   4 +-
>  drivers/gpu/drm/exynos/exynos_dp.c            |   1 -
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  90 +-
>  drivers/gpu/drm/imx/parallel-display.c        | 174 +++-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |   8 +-
>  drivers/gpu/drm/msm/edp/edp_bridge.c          |  10 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c            |   4 +-
>  drivers/gpu/drm/omapdrm/omap_encoder.c        |   3 +-
>  drivers/gpu/drm/panel/panel-simple.c          |  36 +
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  11 +-
>  drivers/gpu/drm/vc4/vc4_dsi.c                 |  90 +-
>  include/drm/drm_atomic.h                      |   3 +
>  include/drm/drm_bridge.h                      | 396 ++++++++-
>  include/drm/drm_encoder.h                     |   9 +-
>  24 files changed, 1588 insertions(+), 286 deletions(-)
> 

