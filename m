Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44861C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 13:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 08A3F206DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 13:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lu351Apw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbfLDNnT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 08:43:19 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46162 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727714AbfLDNnT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 08:43:19 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so8588925wrl.13
        for <devicetree@vger.kernel.org>; Wed, 04 Dec 2019 05:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=74zNoCaAQCxHXOf7CAtKTB5Zwm0/tUBfr0ORS7hM9jE=;
        b=Lu351ApwRPCQYuhkdOdlhP55xcEq8OlpaCrGCd9UPysw8j/s4w46UhpXODsHd9eCPl
         Gx+wCqdh4HXvTWEVhTSEpZIJY7ui5Yv9NoAvulYwmaO86Q9dAHKwMy05ICmqqYAuozra
         brcnpuDi/RDS+vrEvY8o8pZh8Nv1ZyStIiXG0zcyN3fWKdq/5oBXlcjfRn8BbAqpVJ8p
         OMMUhSuVKVhe4hB1cVmqHPIrFkhgKdRlMvgVpz3XiFj+wwK/h+XfubziYc1533b6ajwC
         LwrvoAPuBgXd0nXZSJQRnBfZZwikXM10NatAR6ZB+BNL7iD/QyJwASs/K8YaJWZFAmd3
         BLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=74zNoCaAQCxHXOf7CAtKTB5Zwm0/tUBfr0ORS7hM9jE=;
        b=rqcV5BguVoBOQCDvM1NsK0TnqzVR/IMEkYBEUI+HWn9OPpc2DkfKTE/PsJ+/jgElZ4
         KrjrcTOV23dgTmB9Nx+vHqLzBw8Tpq0agNGso2BBJM5YehMZUoHhSNXeObb43fIV6yjG
         YF8UJf/vC26PR3VrJ3ArWb/OO7ZIQ8PAV90xt6IWiesSeS8p+JEFHfZ3isqRsKhxs7rR
         D3wpsPcN0oHsmTpxcq+2nUwcQ28XgYjbuG45cTG6S3J1rG3Wrk/00BBqRQcMDFaPMhaJ
         6Y5T8MeAR4GYdv8AYt2B/VIKMLMRNHQ8NyEES+Y2ICCE2m0Rdb97/Bl9cNxIkL+4xF1W
         Wn2A==
X-Gm-Message-State: APjAAAVKeqsTdt9cZOPIQln8YcFwoHqCt086PtfvlFdAvG+N8b+KJ9x9
        c4xbFST8keEpBfV0cL8ym5qAYg==
X-Google-Smtp-Source: APXvYqytqWgxoS9Q0vqCcOG/OkgyLWONRiRQuTl0E31BXLHRQAxD8HnMIa1jPKeXz3HgCjFUHANx7A==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr4397660wrt.100.1575466995896;
        Wed, 04 Dec 2019 05:43:15 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q3sm8313855wrn.33.2019.12.04.05.43.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Dec 2019 05:43:15 -0800 (PST)
Subject: Re: [PATCH v4 00/11] drm: Add support for bus-format negotiation
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
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
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Eric Anholt <eric@anholt.net>
References: <20191203141515.3597631-1-boris.brezillon@collabora.com>
 <20191203181924.GU4730@pendragon.ideasonboard.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7bda38ef-2810-5263-1380-a6580adcb996@baylibre.com>
Date:   Wed, 4 Dec 2019 14:43:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203181924.GU4730@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 03/12/2019 19:19, Laurent Pinchart wrote:
> Hi Boris,
> 
> On Tue, Dec 03, 2019 at 03:15:04PM +0100, Boris Brezillon wrote:
>> This patch series aims at adding support for runtime bus-format
>> negotiation between all elements of the
>> 'encoder -> bridges -> connector/display' section of the pipeline.
>>
>> In order to support that, we need drm bridges to fully take part in the
>> atomic state validation process, which requires adding a
>> drm_bridge_state and a new drm_bridge_funcs.atomic_check() hook.
>> Once those basic building blocks are in place, we can add new hooks to
>> allow bus format negotiation (those are called just before
>> ->atomic_check()). The bus format selection is done at runtime by
>> testing all possible combinations across the whole bridge chain until
>> one is reported to work.
>>
>> No Major changes in this v4. I think I addressed all comments I got
>> from Neil and Laurent (thanks for the detailed reviews BTW). Note that
>> this version only contains core changes. Once those changes are merged
>> I'll send the imx/panel/lvds-codec specific bits.
> 
> I think it would make sense to fast-track patches 01 to 07 (a bit
> selfishly as I would have a need for them in omapdrm :-)), but starting
> from 08 I wonder if it wouldn't make more sense to merge them with the
> imx/panel/lvds-codec bits to have a user.

@Boris you can push when Laurent's PR has been merged and backmerged to drm-misc-next

I have a patchset being an user of patches 8-11, so the lvds-codec stuff won't be the
only user of this !
I'll post a version ASAP to validate the v4 serie on the dw-hdmi usercase.

Thanks !

Neil

> 
>> A more detailed changelog is provided in each patch.
>>
>> This patch series is also available here [1].
>>
>> Thanks,
>>
>> Boris
>>
>> [1]https://github.com/bbrezillon/linux-0day/commits/drm-bridge-busfmt-v4
>>
>> Boris Brezillon (11):
>>   drm/bridge: Rename bridge helpers targeting a bridge chain
>>   drm/bridge: Introduce drm_bridge_get_next_bridge()
>>   drm: Stop accessing encoder->bridge directly
>>   drm/bridge: Make the bridge chain a double-linked list
>>   drm/bridge: Add the drm_for_each_bridge_in_chain() helper
>>   drm/bridge: Add the drm_bridge_get_prev_bridge() helper
>>   drm/bridge: Clarify the atomic enable/disable hooks semantics
>>   drm/bridge: Add a drm_bridge_state object
>>   drm/bridge: Patch atomic hooks to take a drm_bridge_state
>>   drm/bridge: Add an ->atomic_check() hook
>>   drm/bridge: Add the necessary bits to support bus format negotiation
>>
>>  .../drm/bridge/analogix/analogix_dp_core.c    |  41 +-
>>  drivers/gpu/drm/drm_atomic.c                  |  39 +
>>  drivers/gpu/drm/drm_atomic_helper.c           |  53 +-
>>  drivers/gpu/drm/drm_bridge.c                  | 756 +++++++++++++++---
>>  drivers/gpu/drm/drm_encoder.c                 |  15 +-
>>  drivers/gpu/drm/drm_probe_helper.c            |   4 +-
>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  13 +-
>>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |   8 +-
>>  drivers/gpu/drm/msm/edp/edp_bridge.c          |  10 +-
>>  drivers/gpu/drm/omapdrm/omap_drv.c            |   4 +-
>>  drivers/gpu/drm/omapdrm/omap_encoder.c        |   3 +-
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  10 +-
>>  drivers/gpu/drm/vc4/vc4_dsi.c                 |  18 +-
>>  include/drm/drm_atomic.h                      |   3 +
>>  include/drm/drm_bridge.h                      | 404 +++++++++-
>>  include/drm/drm_encoder.h                     |   7 +-
>>  16 files changed, 1174 insertions(+), 214 deletions(-)
> 

