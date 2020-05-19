Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E69C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 07:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06EFF207C4
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 07:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgESHje (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 03:39:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46860 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbgESHje (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 03:39:34 -0400
Received: by mail-ot1-f68.google.com with SMTP id g25so4646743otp.13
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 00:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8p3vf6GZ5DZVKI79akuHpEhdMoiTp10fGCkVAx0njug=;
        b=QF6YvJd7GH/jKS3Gu1ERmwERjyouJoBrHWOzWKDvqLupvEasJC5eIm+Mqg5OOvtE90
         EL0ABRLdh4xZi2rasSqkDZbJ/UpT7CkqvBi7lvS1BtQayBXozOjM9d2BDq+5cLDLPyFO
         UDQgdtB8WeTSsabthPSiQbt2kcdd+O6Q3MusxdY6vGpaOc8HTf3T6vGL1nKSoifhxZj5
         eBuO9WN3zJwXfhPU7trkgV3EpXpUgqoANjUHq9nkTegWe+NL0Nr5Dg3vSFUSI2Y2u8Ck
         NXFP0d3icljHdRTQImpmtv7BJi6n1ucaJqpklpnySiPiQMoFpivkd8SdOOIokGSMKB9e
         mnVg==
X-Gm-Message-State: AOAM531QMHALY9DuBGvnk21RBT20badq5qAR9OYlBMy69mUVd2xY3xkW
        kM302Mv7zKODJhe/M+86lnaBjLaWiBMrCTvGSNY=
X-Google-Smtp-Source: ABdhPJyydYXnaBwtgAyVxZtuGSVz6LdgrW7NdPHLamuraQe0SZlGGsVVSGgOga93Yo0YXJJOUwR1CgUSzHkYwOnP6lY=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr14815041otp.145.1589873971857;
 Tue, 19 May 2020 00:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200513103016.130417-1-andre.przywara@arm.com> <20200513103016.130417-2-andre.przywara@arm.com>
In-Reply-To: <20200513103016.130417-2-andre.przywara@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 May 2020 09:39:20 +0200
Message-ID: <CAMuHMdXkHF3ioOVzDZQARiO2i1z8rVjdN_Q0VggaVD4Ln7J+Dw@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] dt-bindings: arm: gic: Allow combining
 arm,gic-400 compatible strings
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Andre,

On Wed, May 13, 2020 at 12:31 PM Andre Przywara <andre.przywara@arm.com> wrote:
> The arm,gic-400 compatible is probably the best matching string for the
> GIC in most modern SoCs, but was only introduced later into the kernel.
> For historic reasons and to keep compatibility, some SoC DTs were thus
> using a combination of this name and one of the older strings, which
> currently the binding denies.
>
> Add a stanza to the DT binding to allow "arm,gic-400", followed by
> either "arm,cortex-a15-gic" or "arm,cortex-a7-gic". This fixes binding
> compliance for quite some SoC .dtsi files in the kernel tree.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Thanks for your patch, I was just looking into this issue ;-)

> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
> @@ -39,6 +39,12 @@ properties:
>                - qcom,msm-8660-qgic
>                - qcom,msm-qgic2
>
> +      - items:
> +          - const: arm,gic-400
> +          - enum:
> +             - arm,cortex-a15-gic
> +             - arm,cortex-a7-gic
> +
>        - items:
>            - const: arm,arm1176jzf-devchip-gic
>            - const: arm,arm11mp-gic

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/r9a06g032.dtsi#n177
has them in the other order.

What do you think is the preferred solution: reverting the order, or dropping
one or the other?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
