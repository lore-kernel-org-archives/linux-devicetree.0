Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B4DC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85F882070A
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 20:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="QjSNvkOc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgESU3p (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 16:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgESU3p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 16:29:45 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC2BC08C5C1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:29:43 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id y85so922624oie.11
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zpnctebz5JsG00b9dnvqrxDWPeUQwd+C1voSzStELVM=;
        b=QjSNvkOcDiUgtet0E/jVsZ4aMISulwLy3pXGNI7E4mn8PlM7rGR5Qcp5BR12gQJ7ES
         q9bz/acZ76nw3/sSl9O9epFdnx5bRtLu0JeyFqhyk7EkJ9vf7RPvOImYidQHe+N4Sxkj
         Bu35E45+R4+4Nw2LuGg6ZSI1ei7t1w/iNSJYEN6Hc0izoxlxIGGLeObcH35Vl+RNWkK4
         VcBRhswbw+d7/MGgP4qpyBx8HMaM4TEyhfLbpICIbrLCl6jc++rGZv/ms4xFJ8iIVujQ
         17p1QbzdwjtMhbMQhSwZ49HdKkx+l4/1qgf1ccyHqYFAvoSbmZze6hEKL149XRtTGNiZ
         RKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zpnctebz5JsG00b9dnvqrxDWPeUQwd+C1voSzStELVM=;
        b=dez/nWYxuHvSz9ly9FBMRWoAHp4FG+w6NemzNk4A4CMpmvikQl2ohpKi4YOmFtcyXN
         Cnc7EPaEJYaMriqGb8mT9PO1mmcg8sEhy7Y+QQ2oGKFcB/hHrKhcxNyCIBvB0vw87DmG
         SkXAZlbqLr0Wg/RX32KqXJVRKvZ+FIjjrtJjgb9m/YYF3LskP1qXudNVr7DMFKE453YW
         PzAjwRiCqw6UEe1WXlXWaoC0sm1QiqRxuc43cstI9SjwncgFSqjKb+qVNqmCyWA0wrlF
         UaWuyLcugdBOmDkb5xW2g/4BCGER3294CcEchvqNXZioguJSAGkf3WDXsoUcAqGIWNmH
         LRNA==
X-Gm-Message-State: AOAM530RBloXRHzDrJGSIrTZQrXYvUnSeAVHq5CoOKTHtDHNiYVTOlVt
        ANu3zhF1SRitDyjovW0/Lzw9c6+wh5D/bT1N7dyC/w==
X-Google-Smtp-Source: ABdhPJys/3NSSmNVLRHHDHO1hXSA01gPwmY5NQh31qgjEE/ATbY/o+QKo0+2jfsv7i1f9sCKmDr9KuiEsl8eMl2QXA0=
X-Received: by 2002:aca:e1d6:: with SMTP id y205mr950674oig.142.1589920182286;
 Tue, 19 May 2020 13:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191016103513.13088-1-shengjiu.wang@nxp.com>
In-Reply-To: <20191016103513.13088-1-shengjiu.wang@nxp.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 19 May 2020 13:29:31 -0700
Message-ID: <CAJ+vNU0GVCnX14fGsxoasBLoEcVsEUvB5rUeAiHDBQfuys4WSg@mail.gmail.com>
Subject: Re: [PATCH] ARM64: dts: imx8mm-evk: Assigned clocks for audio plls
To:     "S.j. Wang" <shengjiu.wang@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Jun Li <jun.li@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 16, 2019 at 3:36 AM S.j. Wang <shengjiu.wang@nxp.com> wrote:
>
> Assign clocks and clock-rates for audio plls, that audio
> drivers can utilize them.
>
> Add dai-tdm-slot-num and dai-tdm-slot-width for sound-wm8524,
> that sai driver can generate correct bit clock.
>
> Fixes: 13f3b9fdef6c ("arm64: dts: imx8mm-evk: Enable audio codec wm8524")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 2 ++
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi    | 8 ++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> index f7a15f3904c2..13137451b438 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> @@ -62,6 +62,8 @@
>
>                 cpudai: simple-audio-card,cpu {
>                         sound-dai = <&sai3>;
> +                       dai-tdm-slot-num = <2>;
> +                       dai-tdm-slot-width = <32>;
>                 };
>

Shengjiu,

Can you explain the why dai-tdm-slot-width here is 32? I noticed when
I assigned that for an imx8mm board I'm working on (that uses a
tlv320aic3x codec) I ended up with the clock being off by a factor of
2 (audio playback was 2x too slow).

Best Regards,

Tim
