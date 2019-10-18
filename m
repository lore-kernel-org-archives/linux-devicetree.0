Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A440CA9EA3
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 10:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4452F20700
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 10:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x+ivwMa1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404497AbfJRK6s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 06:58:48 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:35976 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbfJRK6s (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 06:58:48 -0400
Received: by mail-vs1-f67.google.com with SMTP id v19so3745929vsv.3
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 03:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rio9HHOlkvh+lIpCQASjDvFu34ch6yz1YASODTUfN2A=;
        b=x+ivwMa1fuOo73+TkPEdt11VJpA5s5IaNM4sh0A4umv+Kpq/SIrNSspl+Tx6BxkHYY
         RGSVUmvMZ49HKAPY82E2W2EXufUFG0ArEJgsKO2irYjk/IFl7cZriGK8qRvmlpM5DiI4
         cW4RyJmj6uE0YSjjvo3dcX10dzCulzvu3Wdu8JdDMZA8ZyqvmS1gBcQtAT6sZMSEGUxe
         b3hhe8+ibWVBQRUWstv/Fvg1kRt6EKrLFHH+vqY7nvhAYcBSj/NDyg1zXhKZySE4005U
         /Gbap+Mi81K6+uIXOrxUfYlABOUqEqwZBfS0dsqwISFWanRaHb3jm1VdybIarZTQFU0m
         4jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rio9HHOlkvh+lIpCQASjDvFu34ch6yz1YASODTUfN2A=;
        b=TubuzUvMVbWejK1mIeOsjpmkGy2afu0RsfgqrEqCJz5GBpmeCbhVzRfX9DhVTmdyg4
         gJDbCN78FME/BoomxwpbF3SGHdG37JMk5s1dGOvkp+2eERK4Cu58xZjX4qTNQzRl7fow
         VzU/J2UK/lgKIGLwtI2jblBZyFdMXxe+TJdjVk8Q8Ji23DxrSnMQsfvOnXfezmywLSyL
         xIdwtAA+KCDmoL+1k8yrk6UtaPReH6JxSxVJbhsy717OBr21d5e0wyWI7jKGUPxVi4on
         N+Kk4NjGGp8vvzIx7GdBhuhMfXuvP9zMcDCbtV9nYMoE1A/3k4i6i7XUdeNTwEWGJTE1
         /Z5w==
X-Gm-Message-State: APjAAAVJhkI/2/8PDSuFoKaiSKZz2H+iWPjQ2GaPD4BnVLo7jWhsgkPo
        5TrlJvgPEr2BGGQm/nxpdW7pZtUaoZia3in0fb+r9g==
X-Google-Smtp-Source: APXvYqwRBr47REEzkA0e8ZYJ3EAkV4RqwFlssr91UqI3z8UAFs6Fwd6iaf/97SDUNB8MbcQd5ZnSNa99yYm/Z5IUQR4=
X-Received: by 2002:a67:cf05:: with SMTP id y5mr5230380vsl.34.1571396327014;
 Fri, 18 Oct 2019 03:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <4d269f30b1122487a2b5c8b48e24f78f2b75a509.1570537903.git.nicolas.ferre@microchip.com>
In-Reply-To: <4d269f30b1122487a2b5c8b48e24f78f2b75a509.1570537903.git.nicolas.ferre@microchip.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 18 Oct 2019 12:58:10 +0200
Message-ID: <CAPDyKFqcOKhqza=Gbjbwim1no2_NBLEzrq6JRoK_7U9hGXL5Xg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sdhci-of-at91: add the
 microchip,sdcal-inverted property
To:     Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 8 Oct 2019 at 14:34, Nicolas Ferre <nicolas.ferre@microchip.com> wrote:
>
> Add the specific microchip,sdcal-inverted property to at91 sdhci
> device binding.
> This optional property describes how the SoC SDCAL pin is connected.
> It could be handled at SiP, SoM or board level.
>
> This property read by at91 sdhci driver will allow to put in place a
> software workaround that would reduce power consumption.
>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-atmel.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt b/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
> index 1b662d7171a0..503c6dbac1b2 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
> @@ -9,6 +9,11 @@ Required properties:
>  - clocks:              Phandlers to the clocks.
>  - clock-names:         Must be "hclock", "multclk", "baseclk";
>
> +Optional properties:
> +- microchip,sdcal-inverted: when present, polarity on the SDCAL SoC pin is
> +  inverted. The default polarity for this signal is described in the datasheet.
> +  For instance on SAMA5D2, the pin is usually tied to the GND with a resistor
> +  and a capacitor (see "SDMMC I/O Calibration" chapter).
>
>  Example:
>
> --
> 2.17.1
>
