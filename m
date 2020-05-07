Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C1EC38A24
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA2A220870
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oKrgg6+o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgEGOjm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 10:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbgEGOjl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 10:39:41 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846F2C05BD43
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 07:39:40 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id l25so3507767vso.6
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z7IFA9stGr7AQIAUx30OK+wSMM9GgogchHTSn33YI0U=;
        b=oKrgg6+ohJKVAOjUfdVbli6fopWWBK9ouxsK7MkYl2D0qBOvCFhQahNLKGcyctP0/3
         GuQCx6TcEKb7uN2XV751z4mfwU5kpykWAbuevm+p41uR8/egw097FPbwgDTfIlAaV1bB
         mk+N35TAXodLwzAsbM5yVi87spgJIxwJ/nNIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z7IFA9stGr7AQIAUx30OK+wSMM9GgogchHTSn33YI0U=;
        b=UiSZC62KBMllVy9aoCmgQIE1nB6Wbi5/QayDkw2+pgFUOGLzTZKPghybI/XjQBz/Hu
         /1uTaS6xK0EE9i/xFibaUUaxQIh48gQYOt6s258StRxdpRe1x4P7dAT2J/xniXelQdBU
         L+hoQto7aWOpxKC9nss3T7n5YYXlZg+Kd6AZwQ7HPl482+Ije/5sKlDGYfaLlAzd8qbn
         OCugZCkod45TxUNczTWI50nzp0WkvcVfpm86aH1V5O0d01X+EioMoyoEsLuPn1uWHD9y
         fcsN6ScgV/n6ZlTnxSBW5OnEjFm/4XNK5qJ0Fn7RH1JdXkx+KVMEqpYFJi1cxNANtnnb
         T+3w==
X-Gm-Message-State: AGi0PuZcL/JCHyMrS3Tzs533W0CvPnuC+SWN9ehKB+1QD+GsrqbT1Pk7
        jWj0FEJ50dD6ycW+u4m54fWnTWRxrDE=
X-Google-Smtp-Source: APiQypIY2dlQPRH9tuxfAtBGkaqweG01T69tFfrvnI3II0DtgN5wO8+6XpuBt9yyY0pLuz5G5GqtoA==
X-Received: by 2002:a05:6102:446:: with SMTP id e6mr13454520vsq.68.1588862379503;
        Thu, 07 May 2020 07:39:39 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id i7sm2049603vkn.44.2020.05.07.07.39.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 07:39:38 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id x6so3594712vso.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 07:39:37 -0700 (PDT)
X-Received: by 2002:a67:f5d6:: with SMTP id t22mr12876499vso.73.1588862377337;
 Thu, 07 May 2020 07:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200430194617.197510-1-dianders@chromium.org> <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
In-Reply-To: <20200430124442.v4.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 May 2020 07:39:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
Message-ID: <CAD=FV=WHoxdr++f7Y_NO=VnrnEPkP=+WS5u3j_5ifEjekhBWcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
To:     LinusW <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sandeep Panda <spanda@codeaurora.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Apr 30, 2020 at 12:46 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> be used as GPIOs in a system.  Each pin can be configured as input,
> output, or a special function for the bridge chip.  These are:
> - GPIO1: SUSPEND Input
> - GPIO2: DSIA VSYNC
> - GPIO3: DSIA HSYNC or VSYNC
> - GPIO4: PWM

One suggestion that came off-list is to change the code to make the
numbering match up better with the datasheet.  Right now if you want
GPIO 2 you have to refer to it like:

hpd-gpios = <&sn65dsi86_bridge 1 GPIO_ACTIVE_HIGH>;

That's because the code right now numbers things starting at 0 even if
the datasheet numbers things starting at 1.

I'm planning to spin the series later today for this.  While at it,
I'll squash my yaml bindings fixup into the bindings patch in this
series.  If someone would rather I wait and not spin yet, please yell.
