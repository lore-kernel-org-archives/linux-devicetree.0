Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D12C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 16:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6A6220737
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 16:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="UxlslCOp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgFIQjV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 12:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgFIQjU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 12:39:20 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27E4C05BD1E
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 09:39:19 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id g5so17122862otg.6
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v7mrV9A8x5gROdoWHb4mBMuLQK66GuFHbbDU9aAaIY4=;
        b=UxlslCOp5lHCML8zHfSxii0/aaaTdlNzCPYYCv2xzb4wWEZtWsF+k5/n8Osgdx0hJy
         BfJRocyU0Eo8PTSI7zAl6DbWAZBVkW4kXvOXpX/QENIqRqsf2TPNP9lYxPtdLLVWVtAE
         ZrBxyXn9wMMr4aKFJuJRt1jw1DUCO9QEpG8AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v7mrV9A8x5gROdoWHb4mBMuLQK66GuFHbbDU9aAaIY4=;
        b=HfKpNFz4W2co8p4bXmu2hvHXlj00lTApLCmcTrkofNrySdf2vhghj7uZnwOOvi7+j1
         +aB7HxooSnSHiPQSTGqKP84P3247ZUcIshg0ZBhQGCktgL3XWHquQnhR0CKuFMXtgYhP
         rbHE54FCwgceL25V5IcyJOQTho4Pwi7pihXyyEfSfnujpq073TQOgZFggCBJQjBhiKvA
         KqqwH+CU45a9YmZKkLa86lCuhnzQr0H4g8UUXdJuCN+3+o0FFe5PVfcrBWwyI+GPspyk
         xv99PV20TsZ7e/sisMtZShOe/Re6/w1M03psdx00wSxWLD++Pr4Exm5MYdsQDvt7b9xV
         1EQA==
X-Gm-Message-State: AOAM533vA3SbIpkHM/0ls6SwOjYfSHmQVRruVO17EM3WFuzKnoLnI+DC
        GpoQ6uClXiIWER2PEBKJkPxp/Gs4Swn46FfcNjHQ7A==
X-Google-Smtp-Source: ABdhPJyzEiiGK0RgxvAB9nvhNz9jMbudR88GwxzWaWaK//yF7MA0SnaEkI/Owvhift8/7RXSbhpKtNM5VXKxf/ldzwA=
X-Received: by 2002:a9d:768a:: with SMTP id j10mr23941760otl.188.1591720759321;
 Tue, 09 Jun 2020 09:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200609162700.953260-1-adrian.ratiu@collabora.com> <20200609162700.953260-12-adrian.ratiu@collabora.com>
In-Reply-To: <20200609162700.953260-12-adrian.ratiu@collabora.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 9 Jun 2020 18:39:08 +0200
Message-ID: <CAKMK7uGLQCj_oJcbXynt_1bmwBQy6ncUgc49DPejyfCtb68e_g@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] Documentation: gpu: todo: Add dw-mipi-dsi
 consolidation plan
To:     Adrian Ratiu <adrian.ratiu@collabora.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Philippe CORNU <philippe.cornu@st.com>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        dl-linux-imx <linux-imx@nxp.com>, kernel@collabora.com,
        linux-stm32@st-md-mailman.stormreply.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 9, 2020 at 6:25 PM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> This documents the longer-term plan to cleanup the dw-mipi-dsi bridge
> based drivers after the regmap refactor and i.MX6 driver have landed.
>
> The goal is to get the entire bridge logic in one place and continue
> the refactorings under the drm/bridge tree.
>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>

This cc's the world, but not dri-devel. Can you pls resubmit with that added?

Thanks, Daniel

> ---
>  Documentation/gpu/todo.rst | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 658b52f7ffc6c..2b142980a4b16 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -548,6 +548,31 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
>
>  Contact: Harry Wentland, Alex Deucher
>
> +Reorganize dw-mipi-dsi bridge-based host-controller drivers
> +-----------------------------------------------------------
> +
> +The Synopsys DW MIPI DSI bridge is used by a number of SoC platform drivers
> +(STM, Rockchip, i.MX) which don't cleanly encapsulate their bridge logic which
> +gets split between the Synopsys bridge (drm/bridge/synopsys/dw-mipi-dsi.c) and
> +platform drivers like drm/imx/dw_mipi_dsi-imx6.c by passing around the bridge
> +configuration regmap, creating new bridges / daisy chaining in platform drivers,
> +duplicating encoder creation, having too much encoder logic instead of using the
> +simple encoder interface and so on.
> +
> +The goal of this rework is to make the dw-mipi-dsi driver a better encapsulated
> +bridge by moving all bridge-related logic under drm/bridge, including the SoC
> +bindings which chain to the core Synopsys code under drm/bridge/dw-mipi-dsi/
> +from which they can be further consolidated and cleaned up.
> +
> +If this goal proves to be impossible then drm_bridge might not be the correct
> +abstraction for these host controllers and unifying their logic into a helper
> +library encapsulating a drm_encoder might be more desirable, in other words to
> +move away from drm_bridge entirely.
> +
> +Contact: Adrian Ratiu, Daniel Vetter, Laurent Pinchart
> +
> +Level: Intermediate
> +
>  Bootsplash
>  ==========
>
> --
> 2.27.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
