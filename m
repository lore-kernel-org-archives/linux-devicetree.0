Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8635CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 10:56:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B9E520700
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 10:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HWwssPuP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408500AbfJRK4x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 06:56:53 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34115 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390222AbfJRK4w (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 06:56:52 -0400
Received: by mail-ua1-f67.google.com with SMTP id q11so1596715uao.1
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QY7lFyrHaU8+oA6DvMJgP3Iv+qTUAFJEzk1GXAvtrx4=;
        b=HWwssPuPT5PifwSCD5NhcePRn2f+ZzbP6zPPhLLPIw3Ba+ZwsY64t93AV6ZDoVRf+P
         GtEcP6AxKbDhZb4aeAXhFJ7LKwzQy18X9mLZzFjg3l69TZM656yqgPbVJe1ph0apblOH
         zpiHBA9MxyOptlT/ckRWBqs5RnQS0ZwMk32fBgNNHtl1egCvgygXRKzP6q9FYY7GgH4j
         IX3HP7sAZxr/FF+mPkYQ0A12D/gQTFKYnOU0ckK1PLfd2gCx2OBeFOMah5fjPMGgeYQX
         s0CdcKW3PYDu6Y1SJvqyv1FCph7SFawKTy3IaAPV+spKaEG5gmDGe/DWTffb4AK+u2zd
         4lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QY7lFyrHaU8+oA6DvMJgP3Iv+qTUAFJEzk1GXAvtrx4=;
        b=W73eJD+v3G/k8Mlpps27gyqu7aAu8em0gxwxpjyIHXzAqGsUBV4puMGyBGbeudbj1L
         XuNppNf+MB5VHnfOPethgdlSb2tOMLaWBXR/l4ReF9md4IYjMlcnpm1064LRawQPleR+
         P6WlGNrWSfk7dJXaqJArXo5HclJDBC3o9yvlD8rf1FWHcem3ihkIIH5D4vgGjx+T/OhJ
         i+AgIerOzWy6V0Ap+FB1BskrJgpTE4xOb22zdxf74MNWEAN+EDFhsu6P5UW5XZaQAA95
         /o4jLGQCF3iyd58+/07rWWicWRxkWBE1DQn9yAUxKJ2SYNLfGXakNt/AlAxzBuVCjLJe
         kOsg==
X-Gm-Message-State: APjAAAWbdHfPQTx3wDHnuTBwq/BBV7BAZxw4pZv5QnsHhHREJ8Pp9HDg
        NK2NU/f+eNvEg/W04YEwispFuqZTbUQrkURqvoieOQ==
X-Google-Smtp-Source: APXvYqz/SShoa3XTS8voTIAQNQnZDjh0ea7364t7jbf47xMWfss+qljtsOER3sxNNKKBAIJ9tpVLe1gvmh+l/LbdV7A=
X-Received: by 2002:ab0:310f:: with SMTP id e15mr5136065ual.19.1571396211823;
 Fri, 18 Oct 2019 03:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191011103340.26749-1-ludovic.desroches@microchip.com>
In-Reply-To: <20191011103340.26749-1-ludovic.desroches@microchip.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 18 Oct 2019 12:56:14 +0200
Message-ID: <CAPDyKFqxfBG-CDd_O9d8X89GZmNFXh=CoFE2QqptgtLtOU5=_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: sdhci-of-at91: new compatible string
 and update properties
To:     Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        claudiu.beznea@microchip.com, Eugen.Hristev@microchip.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 11 Oct 2019 at 12:33, Ludovic Desroches
<ludovic.desroches@microchip.com> wrote:
>
> There is a new compatible string for the SAM9X60 sdhci device. It involves
> an update of the properties about the clocks stuff.
>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>

This doesn't apply any more, can you please re-spin it?

Kind regards
Uffe


> ---
>
> Changes:
> - v2: remove the extra example and fix node label
>
> This patch conflicts with Nicolas' one: "dt-bindings: sdhci-of-at91: add
> the microchip,sdcal-inverted property". Let me know which one has to be
> rebased or you can handle it.
>
> Ludovic
>
>
>  .../devicetree/bindings/mmc/sdhci-atmel.txt       | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt b/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
> index 1b662d7171a0..5d541ad4d4eb 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
> @@ -5,17 +5,26 @@ Documentation/devicetree/bindings/mmc/mmc.txt and the properties used by the
>  sdhci-of-at91 driver.
>
>  Required properties:
> -- compatible:          Must be "atmel,sama5d2-sdhci".
> +- compatible:          Must be "atmel,sama5d2-sdhci" or "microchip,sam9x60-sdhci".
>  - clocks:              Phandlers to the clocks.
> -- clock-names:         Must be "hclock", "multclk", "baseclk";
> +- clock-names:         Must be "hclock", "multclk", "baseclk" for
> +                       "atmel,sama5d2-sdhci".
> +                       Must be "hclock", "multclk" for "microchip,sam9x60-sdhci".
> +
> +Optional properties:
> +- assigned-clocks:     The same with "multclk".
> +- assigned-clock-rates The rate of "multclk" in order to not rely on the
> +                       gck configuration set by previous components.
>
>
>  Example:
>
> -sdmmc0: sdio-host@a0000000 {
> +mmc0: sdio-host@a0000000 {
>         compatible = "atmel,sama5d2-sdhci";
>         reg = <0xa0000000 0x300>;
>         interrupts = <31 IRQ_TYPE_LEVEL_HIGH 0>;
>         clocks = <&sdmmc0_hclk>, <&sdmmc0_gclk>, <&main>;
>         clock-names = "hclock", "multclk", "baseclk";
> +       assigned-clocks = <&sdmmc0_gclk>;
> +       assigned-clock-rates = <480000000>;
>  };
> --
> 2.23.0
>
