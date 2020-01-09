Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2553C3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 22:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8BCF2073A
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 22:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vs4XiohJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgAIW6f (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 17:58:35 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:46553 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728525AbgAIW6f (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 17:58:35 -0500
Received: by mail-vk1-f196.google.com with SMTP id u6so56773vkn.13
        for <devicetree@vger.kernel.org>; Thu, 09 Jan 2020 14:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d3Ic+/+tOQj2Lu5zb82dqbL3LnFvo8VU2lGIIpV77vw=;
        b=Vs4XiohJHiCv9DpKDaL8PP0Cv5qmD17Ku6z6gwXdTevogicvgzz0V56LTDKUUfNPhW
         Iwx3uHBuDesHk/r2q0/LgARjOLEqx4IOpy0IKZ97asjGTuxOtDPF+Jub17jyVKigXjQ0
         hlfVpIYGC1LZrXImn2ixRg2dQuyHeSCEDqyhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d3Ic+/+tOQj2Lu5zb82dqbL3LnFvo8VU2lGIIpV77vw=;
        b=Ikt/G3gPZ1haKTGCulGg2EiuO1n2Owbdj6a3ZRfxj25LUerLUQnxFyqAcURVjhp11S
         R46vtpA+vG/g7CIub/lUWwmch3/PtPTe0AYMZd5/3Lhpo2mdNWSV38b6X0JbbH4dxS84
         8+hHGpvbHvn4J1nkmpHzSVDmo8ecGLD7dgtc6RxBw22oTSwNAGKYjEVGZvWRCmaZhbu+
         H+RTKUH5iKox8Fcos5syXVpL0aPBGSBU62tQvWKBlmeFcq0uIg5znciP63K6NTx99p0e
         +qU9RC2aK79JWgXq1UuKTD+kwqyEJF5eOi4jFLQIano7id1So18BNJQzeYJa8hm/cmre
         +sog==
X-Gm-Message-State: APjAAAXas/MT/idtpygP6Acg5FCi8+Q5ACq7v3w2QTGznSnNhwG7+i/k
        Aw4RG9Tq+TpLbpHwI0IX/U3PTiY915s=
X-Google-Smtp-Source: APXvYqxYaJS0cvrlyp8TvSf3tTo4eYbRbCmej6S7v3PkVmCLQHTFwEQ509VUsq77naol0tcMPk+W7Q==
X-Received: by 2002:a1f:6005:: with SMTP id u5mr8789698vkb.35.1578610713714;
        Thu, 09 Jan 2020 14:58:33 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id q14sm20879vke.3.2020.01.09.14.58.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 14:58:32 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id y125so103017vsb.6
        for <devicetree@vger.kernel.org>; Thu, 09 Jan 2020 14:58:32 -0800 (PST)
X-Received: by 2002:a67:e342:: with SMTP id s2mr50831vsm.198.1578610712346;
 Thu, 09 Jan 2020 14:58:32 -0800 (PST)
MIME-Version: 1.0
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org> <1578396597-18324-3-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1578396597-18324-3-git-send-email-harigovi@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Jan 2020 14:58:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XwkvGgJUeNs=aKoirSw_f47QoDTuvQF25VE7ychwdJTQ@mail.gmail.com>
Message-ID: <CAD=FV=XwkvGgJUeNs=aKoirSw_f47QoDTuvQF25VE7ychwdJTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: add support for rm69299 visionox panel driver
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Jan 7, 2020 at 3:30 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> +       drm_panel_init(&ctx->panel);
> +       ctx->panel.dev = device;
> +       ctx->panel.funcs = &visionox_rm69299_drm_funcs;

I haven't reviewed your whole panel driver, but I did just try to
compile it and found that it won't compile against mainline.  Namely
this needs to be changed to:

drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
       DRM_MODE_CONNECTOR_DSI);

...because of commit 6dbe0c4b0fc0 ("drm/panel: Initialise panel dev
and funcs through drm_panel_init()") and commit 9a2654c0f62a
("drm/panel: Add and fill drm_panel type field")

-Doug
