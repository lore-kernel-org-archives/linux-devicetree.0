Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06A3C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 00:31:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F13E206C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 00:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZXziymZb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgFBAbV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 20:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgFBAbU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 20:31:20 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF2BC061A0E
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 17:31:20 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id c9so632042uao.11
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 17:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nNU+pmC0TYW7Kp7GEPXpDsRZRqCmATpqP5mTGs3ndPU=;
        b=ZXziymZb5S2+F5N+UMMKX4tOz8szaVaLEsU+3voAMWJJg1WUyP3FPYNCmZTb6Iqrrw
         nMLTkqCas2ZLgl9zDq6SubA2CmWOcRKzE2CpkGNQeJ410db6WDxY7XJU91EY1cWAJx7a
         wT6MTRUkw/025lvCIXxtHLgLsjFwDi05q5zBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nNU+pmC0TYW7Kp7GEPXpDsRZRqCmATpqP5mTGs3ndPU=;
        b=kdDkBBRn0M5bAWeeYQkILIdN64d6ew8ipi9PRWSTJBIWjZn8Gt64uYG6PpaiOdVYED
         KQa5TkKJwFZYfVIsfou3x40938u0GStlWsjAZYuJW5B0zpWQxbaVS0s21Bf8OFW1ffSo
         6Tb33wSefae6Br7w+QVQ2+jn1neOsLcJwedOlDJWYKdEuQdVxF1ZBK0K4Cy3Nb9TrrVx
         L5t20x0AsB/0KrOODnZF13KzOIyZl2ex5b4DIBZL5K22DkG4vvXT8NBgFpLIHpDpsHQk
         P79U5zXNRMhlmZwCyzxM+QNfiTYozqHfDB8mqjwQ8WH8ud/i58lwU+rCsXH+dTU7CwlD
         tGpA==
X-Gm-Message-State: AOAM532Cefdp4DbI/woQNuxYfao+W80n6k0El4LIrgCmmiDHqfvPa4t5
        mQg5t3fkblg6yQw/MmhbiT+U9kwZjuM=
X-Google-Smtp-Source: ABdhPJyfgZ/w9xuoERAFEnPSYKRnVxvE+QSbuuPcb6aatlJTQDODrPU6sQcfLK4q8AAi/os7VLhpWA==
X-Received: by 2002:ab0:ea:: with SMTP id 97mr6333400uaj.105.1591057879391;
        Mon, 01 Jun 2020 17:31:19 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id i91sm133894uai.1.2020.06.01.17.31.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 17:31:18 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id y123so1038143vsb.6
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 17:31:18 -0700 (PDT)
X-Received: by 2002:a05:6102:116e:: with SMTP id k14mr629133vsg.198.1591057878240;
 Mon, 01 Jun 2020 17:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200601083309.712606-1-sam@ravnborg.org> <20200601083309.712606-3-sam@ravnborg.org>
In-Reply-To: <20200601083309.712606-3-sam@ravnborg.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Jun 2020 17:31:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
Message-ID: <CAD=FV=VSyODjtVtEe6H46U6xNraD2LUUi+xt8cxraaqXom=64g@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] drm: panel-simple: add Seiko 70WVW2T 7" simple panel
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
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jun 1, 2020 at 1:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> The Seiko 70WVW2T is a discontinued product, but may be used somewhere.
> Tested on a proprietary product.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: S=C3=B8ren Andersen <san@skov.dk>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel=
/panel-simple.c
> index b067f66cea0e..8624bb80108c 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3194,6 +3194,31 @@ static const struct panel_desc shelly_sca07010_bfn=
_lnn =3D {
>         .bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
>  };
>
> +static const struct drm_display_mode sii_70wvw2t_mode =3D {
> +       .clock =3D 33000,
> +       .hdisplay =3D 800,
> +       .hsync_start =3D 800 + 256,
> +       .hsync_end =3D 800 + 256 + 0,
> +       .htotal =3D 800 + 256 + 0 + 0,
> +       .vdisplay =3D 480,
> +       .vsync_start =3D 480 + 0,
> +       .vsync_end =3D 480 + 0 + 0,
> +       .vtotal =3D 480 + 0 + 0 + 45,

Important to have a "vrefresh"?


> +       .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc sii_70wvw2t =3D {
> +       .modes =3D &sii_70wvw2t_mode,
> +       .num_modes =3D 1,

Do we want "bpc =3D 6"?


> +       .size =3D {
> +               .width =3D 152,
> +               .height =3D 91,
> +       },
> +       .bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,

Should this be a 666 format?  Random internet-found data sheet says
262K colors...
