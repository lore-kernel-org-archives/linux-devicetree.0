Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F49C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 22:09:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E30C212CC
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 22:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lVrFJvl5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731681AbgFRWJc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 18:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728683AbgFRWJb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 18:09:31 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5123C0613EE
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 15:09:28 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id k13so4467380vsm.13
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 15:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIJ2X6dOzoq0wY6kg8iKEYYmkTTN8+C1IDuvViUAAlw=;
        b=lVrFJvl5mDjocLA105kchQDYwRR/Mq9nlcXy/owwADieAZYgAuGsjK3xpftm0NXclu
         BDh1QPoJU1TPpXMWq0DmrgoRSIGzBPlrIy8he0In3LWP8m83XqE+r0HZadf/sXAFVj2e
         IayO8IVxHmcZK2mLywOzCBqLmikiRhPA0Z8ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIJ2X6dOzoq0wY6kg8iKEYYmkTTN8+C1IDuvViUAAlw=;
        b=QdMZjUyBuVKllyvsIzd8mwRGoUvKdDZbGNhbiugOFkD40jFVgl9jt8o53eaqhcu3GO
         wZZAAWPsRVjN82G3nXsfH7SsaOS1q2eFNGnEOEmxoZqa0x3zIBdhi6RUVdYnGrx7Wtpv
         8GEXtkFw8mM0dHnh1knI7w/CXFUBmP+hGca/kIS2YnWvkVaovgcVcmSZfb1O2NicZAUt
         b+2K0d3JMbzLqySh1OOM5wYoA8v7J8OgAbarH2EUqM2HiPnM5ZOVuv20Uh+zIVRjx1We
         hsyucb7GLUX2XmnTjOR7vBvXBxfVsdHGGlCMrdD6yw9Rw5qdwPkbOw8Z5NRTjdOQ7DIA
         kDCA==
X-Gm-Message-State: AOAM532EPZUneYyH9UWEms8CJn7Br9CrT/QDk0th0QaX7ChkY9xcDX6G
        OJW+m3NHPmEgUFfsI07JA4nL4oaGJZU=
X-Google-Smtp-Source: ABdhPJxRGiUkGAjOdq3pv0mIDnC8xgJh7SXTJmFox6bvDy/6K0q2/ty7EcMpCndkICAPNdidVrEeRQ==
X-Received: by 2002:a67:e0d7:: with SMTP id m23mr5738771vsl.221.1592518167338;
        Thu, 18 Jun 2020 15:09:27 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id r134sm464354vke.26.2020.06.18.15.09.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 15:09:25 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id r1so2522771uam.6
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 15:09:25 -0700 (PDT)
X-Received: by 2002:a9f:3b1c:: with SMTP id i28mr501831uah.22.1592518164952;
 Thu, 18 Jun 2020 15:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200609120455.20458-1-harigovi@codeaurora.org>
In-Reply-To: <20200609120455.20458-1-harigovi@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 15:09:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
Message-ID: <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
Subject: Re: [v3] drm/bridge: ti-sn65dsi86: ensure bridge suspend happens
 during PM sleep
To:     Harigovindan P <harigovi@codeaurora.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>, nganji@codeaurora.org,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Jun 9, 2020 at 5:05 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> ti-sn65dsi86 bridge is enumerated as a runtime device. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend will not be called
> and it kept the bridge regulators and gpios ON which resulted
> in platform not entering into XO shutdown.
>
> Add changes to force suspend on the runtime device during pm sleep.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v2:
>         - Include bridge name in the commit message and
>         remove dependent patchwork link from the commit
>         text as bridge is independent of OEM(Stephen Boyd)
>
> Changes in v3:
>         - Updating changelog to explain the need for patch
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>  1 file changed, 2 insertions(+)

I think this patch is good to go now (has both Stephen's and my
reviews).  I noticed that Neil landed my other patches to this driver
recently (thanks!) and wondered why he didn't land this one.  Then, I
realized that you didn't send it to him or the other bridge
maintainer.  :(  Have you tried running get_maintainer?

$ ./scripts/get_maintainer.pl -f drivers/gpu/drm/bridge/ti-sn65dsi86.c
Andrzej Hajda <a.hajda@samsung.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Neil Armstrong <narmstrong@baylibre.com> (maintainer:DRM DRIVERS FOR
BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM
DRIVERS FOR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@siol.net> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
linux-kernel@vger.kernel.org (open list)

In any case, unless someone has extra feedback on this patch I think
it's ready to land.

Neil: If you're willing to land this patch too, can you let
Harigovindan know if it needs to be re-sent with you in the "To:" list
or if you can find it on the dri-devel list?

Thanks!

-Doug
