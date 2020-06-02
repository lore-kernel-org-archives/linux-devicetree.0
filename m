Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2376AC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 00:31:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 048B4206C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 00:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ur8gLiJI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgFBAbI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 20:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgFBAbH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 20:31:07 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061ACC061A0E
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 17:31:07 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id c1so1015401vsc.11
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 17:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ar4idMl8Pg6YhDwrxos+Hnu0lsoDCZ1LAm7LlTZuJVQ=;
        b=Ur8gLiJIlhsUZs6Gpnezf+6+nWzjf6bpkkB0LT0BS2fU4GcjFFe2817t4BZH1iYUFo
         4UvJgO53e22SnE9KUYnvMM9j2/28kH/7npQXvtssdBk7S/QPtvYLam780vUJA4WYMc/1
         FM2codHXl7uwoT6PJO3jvMkOUBIgZ32zkW8L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ar4idMl8Pg6YhDwrxos+Hnu0lsoDCZ1LAm7LlTZuJVQ=;
        b=YVUgeiswLC+JbqBFwgBLkAAMiq5iZwY+0E2XBpyrS70M8ttfo9QKECv3Rttnh0MK7q
         RBqpTHHAGkHXGMu3OfNsgeSaP/ZUCJMR35rNs2hl0FheUFxOb9CmTV/w7eAo29IppRds
         HQvR+SacgEd8MenOaBpbPOuZLDviGBGH0XIS8GtkVBzBHa3zw8iem0bqPagGIWETdnRB
         QsAnqpgty22/+e0M2CpibPMtocbenI2XHM8bLVEXyO2PTzX5r6XV0PpVJ3wKE5dYV+kL
         u6gJCSZR9PClC2HhkY3xyA4GJSitRI0Gi5LpejPlIrdjWKxsK7QCunNqffgAHd4xDLzF
         Ox9A==
X-Gm-Message-State: AOAM532pOt/l5y130MJsvl38CjZOonuOGjva8T/1Ni/v021Av2Yn+/DL
        sP+P9nJQs4SVwyDL3AbQRYR9Dr/3ER0=
X-Google-Smtp-Source: ABdhPJzr3kpHiEPn8sTrr80LQgFPH3ukHT1CtS5fXEEfz+u5yiZ6kAEfx2VXMQtEJL6BHpB7R6yWBA==
X-Received: by 2002:a67:fc17:: with SMTP id o23mr7660339vsq.92.1591057866027;
        Mon, 01 Jun 2020 17:31:06 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id p75sm189236vkf.1.2020.06.01.17.31.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 17:31:05 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id r11so1045292vsj.5
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 17:31:05 -0700 (PDT)
X-Received: by 2002:a67:b14b:: with SMTP id z11mr15793449vsl.109.1591057865161;
 Mon, 01 Jun 2020 17:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200601083309.712606-1-sam@ravnborg.org> <20200601083309.712606-5-sam@ravnborg.org>
In-Reply-To: <20200601083309.712606-5-sam@ravnborg.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Jun 2020 17:30:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyErT-M=g74vyFjYHNQw9xj7ny_czHhjtUQbTDJUAjag@mail.gmail.com>
Message-ID: <CAD=FV=WyErT-M=g74vyFjYHNQw9xj7ny_czHhjtUQbTDJUAjag@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm: panel-simple: add Hitachi 3.5" QVGA panel
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jun 1, 2020 at 1:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> This panel is used on evaluation boards for Atmel at91sam9261 and
> at91sam6263.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 8624bb80108c..25c96639631f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1813,6 +1813,32 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
>         .connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>
> +static const struct drm_display_mode hitachi_tx09d71vm1cca_mode = {
> +       .clock = 4965000,

This is the pixel clock in kHz, right?  So it runs at almost 5 Terahertz?


> +       .hdisplay = 240,
> +       .hsync_start = 240 + 0,
> +       .hsync_end = 240 + 0 + 5,
> +       .htotal = 240 + 0 + 5 + 1,
> +       .vdisplay = 320,
> +       .vsync_start = 320 + 0,
> +       .vsync_end = 320 + 0 + 1,
> +       .vtotal = 320 + 0 + 1 + 1,

Some random datasheet I found has really different numbers.  If the
numbers above are what everyone is using then I suppose it's fine,
just curious why the mismatch.

Also: should you provide "vrefresh"?



-Doug
