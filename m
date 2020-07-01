Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB52C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 07:48:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66FED20775
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 07:48:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVyHQuQz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgGAHsP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 03:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbgGAHsP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 03:48:15 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F090CC061755
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 00:48:14 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id t9so13017176lfl.5
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TjiYI/gEP169VVLakifLbvQVy48ggB6CHQLcRMroefU=;
        b=RVyHQuQzZLBw/SQpUEi8z7UybHsmHph+B+xx4GJ8dm4Pxr+SkoiOvWF1jJUp7DQTL+
         Eaviic01wVP9FqwpiZ96kYPmfLyATrWKc+L333nvEG6xVhOMwJOzuCYElHaq1oyNmg1z
         NO8CcPBrA7MLBX+dExcxO6XpNStvjllUuxl9fDkjTmAYAXdTJFR55Lja6XymUvDbl9bN
         Jppn4l+JPRuIboEqwHTt9oGCno7OFkeBawKH5nY+i0MH+LFVRzqv9Dvr2dJLbyiQR/YT
         ceK58913bJiU0qI3nqLSCfm569894PStfpzd4k34HDglx/XrRt7bhvVpx4mR9JLMor+8
         5new==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TjiYI/gEP169VVLakifLbvQVy48ggB6CHQLcRMroefU=;
        b=lPRtwZOJ4vIER9FSU7XO5MwT8VnJIDHFQBlow40YFAnzTl3TNDViwO9X7lo/HUneFU
         CEYDlNleRzgDNUArVvIj9gZazuJolv8AZ25e3cuoGVBbYLlhoNcGm7ZQnT1+PpO+CS21
         +qx035nH4Q3KDriDGOgxGKSf2TwQ9eEGuj4NPfGq3Cz5vnUyqEgcfP1fZ4CHqsej3WX8
         Bqkf6S1yihVTl0nwzV4uM/V0bDtkpVglRFsLl+pf5GUjqLABwm6GbKBHtk8cAmj+idrr
         hhfwE/ga9wtp4pCQOP0RPnLeEChgtBC8IjvHFZPS2S18657J9rKxtOnvHXw0HJu0IhGy
         qKXQ==
X-Gm-Message-State: AOAM531w11Ar2kCEeR6HZHd9CLRWkrNmIQnbdFozDeymAjgCSarDjjjM
        pivZxwd0r5HcnEwTfJiSiKtxQYIsCMjmjmNxGfry+Q==
X-Google-Smtp-Source: ABdhPJwV5xZYRat45bbOJ4xsC/Efdt4tNxEMd6akXvKgpkzyErWL1uwmbKlZUIZd3iRZnd8NQDpvg2racqna36gSElA=
X-Received: by 2002:a19:ccd0:: with SMTP id c199mr14342828lfg.194.1593589693523;
 Wed, 01 Jul 2020 00:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com> <20200626005601.241022-6-megous@megous.com>
In-Reply-To: <20200626005601.241022-6-megous@megous.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 1 Jul 2020 09:48:02 +0200
Message-ID: <CACRpkdYJbojy5JzSQ-gvQC6QqGOGCNDLz4UVmCFyw7cZ20ekBQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/13] drm/panel: st7703: Rename functions from jh057n
 prefix to st7703
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi <linux-sunxi@googlegroups.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Samuel Holland <samuel@sholland.org>,
        Martijn Braam <martijn@brixit.nl>, Luca Weiss <luca@z3ntu.xyz>,
        Bhushan Shah <bshah@kde.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> This is done so that code that's not specific to a particular
> jh057n panel is named after the controller. Functions specific
> to the panel are kept named after the panel.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
