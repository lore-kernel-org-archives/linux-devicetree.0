Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B70CA9EC0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 12:19:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 969062086D
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 12:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpyUtk0g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbfJ1MTy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 08:19:54 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:39043 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbfJ1MTx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Oct 2019 08:19:53 -0400
Received: by mail-il1-f193.google.com with SMTP id i12so7980608ils.6
        for <devicetree@vger.kernel.org>; Mon, 28 Oct 2019 05:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dc1c8u3hukir3oPx/zrCumMpjl7/p9MlfwHDO0Mnpv8=;
        b=EpyUtk0gTOfzOAJFTnHDTpoXdwbIYeh8t7J62/VY2aVevHBQGNuN3c1NSQwtKfz5Cx
         h2zjt5452uhH7qB+ErFvj/LqgzPC9xZC5NsDG5uMgRDWZKWauiAHMWf0gQEjaI4qbk5+
         IKTfo6IZwNUmAsjwgl4/aXXuZeRvedEI95j+MRsU/xVMn3ngANBkRU2fOo9gD4OzXZQ4
         C78jtHqrVhoCI1EioFIAqtkUfeoDDpoNvtkEWm1eE3CPeWxRLWCZ8aEvy/Z+7pAE5/kc
         sggnFuQYBMRUU8UPNgXUMKjww2McSKjxAp1Cka0ZeJtZqcgOM+iRiG2WM8qi8znZYesB
         K4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dc1c8u3hukir3oPx/zrCumMpjl7/p9MlfwHDO0Mnpv8=;
        b=WQ9WUwYjmEtBcaWh0Mi/Fu+mETb3xd3rb+yjv7kZdPAztkw9P+HSyf2OXqGEcP4mdI
         DyhWhSqKawIV02wAc0Tlu25YKhoiEgi8WDOkjyHEMIc/dRtBsbW9ToB4icFCU+iVN6WK
         z7ONHakBMWfCtJqHfr50KYgY5hKX0+HGaHROciTAeXXrjWJVK4ivod5JeQXbrZEBykJr
         Gsr1JHrz0z6LTNc1AfKRLzHKlQZ3MnJaSMuLiJKFjl7Pz3afZgA5UDLTJeNCf5H7DPao
         /FFKmWjC+L/OMDo+YLuT68K2XwVQ6tXGDAsyjN+4B+UJgt6fZXHbbSyWtu4z4+QbWhma
         GppQ==
X-Gm-Message-State: APjAAAXDV6ueLo3jW1ebUk+0uQbl2kiIDz1tefkN4URY2N46NFNVnQxJ
        FbY/HUQp4xGRYBahc8o+QY09Sanav9PAr0CyRvA=
X-Google-Smtp-Source: APXvYqwLLI6KwbQV8tqE2fiuP3DXQup3mYDMcHXvVN0FaWTQwKqpIaCTQP2JKG7nppz5bisbSpgqeqf225/CJoaOOYU=
X-Received: by 2002:a92:ce44:: with SMTP id a4mr6427947ilr.298.1572265192683;
 Mon, 28 Oct 2019 05:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191023154512.9762-1-boris.brezillon@collabora.com> <20191023154512.9762-3-boris.brezillon@collabora.com>
In-Reply-To: <20191023154512.9762-3-boris.brezillon@collabora.com>
From:   Inki Dae <daeinki@gmail.com>
Date:   Mon, 28 Oct 2019 21:19:17 +0900
Message-ID: <CAAQKjZMh3=5=8JzkHYTeEGrOKNfN=eULTuXx1ZTDbsL7u3HQEw@mail.gmail.com>
Subject: Re: [PATCH v3 02/21] drm/exynos: Don't reset bridge->next
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     DRI mailing list <dri-devel@lists.freedesktop.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Rob Herring <robh+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

2019=EB=85=84 10=EC=9B=94 24=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 12:45,=
 Boris Brezillon
<boris.brezillon@collabora.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> bridge->next is only points to the new bridge if drm_bridge_attach()
> succeeds. No need to reset it manually here.
>
> Note that this change is part of the attempt to make the bridge chain
> a double-linked list. In order to do that we must patch all drivers
> manipulating the bridge->next field.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes in v2:
> * Add Laurent's R-b (I'd like to have a R-b from the DRM exynos
>   maintainers before applying that one)

Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 1e6aa24bf45e..4785885c0f4f 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -110,7 +110,6 @@ static int exynos_dp_bridge_attach(struct analogix_dp=
_plat_data *plat_data,
>                 if (ret) {
>                         DRM_DEV_ERROR(dp->dev,
>                                       "Failed to attach bridge to drm\n")=
;
> -                       bridge->next =3D NULL;
>                         return ret;
>                 }
>         }
> --
> 2.21.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
