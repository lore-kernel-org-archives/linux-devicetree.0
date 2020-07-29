Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D61C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:21:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8684820838
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 08:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSxKa6hW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbgG2IVZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgG2IVZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 04:21:25 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC395C061794;
        Wed, 29 Jul 2020 01:21:24 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id bo3so766372ejb.11;
        Wed, 29 Jul 2020 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KqA1sSRAqoMmHyUXGQDJ9R0gs8rOE6Bt39JWluAbiwQ=;
        b=FSxKa6hWppCQgjLw0HUrH/yC0RwdyNb76TiEXJcyNYQlmMpgXvpdblzyHIqMrHjRBt
         8zMECz77kaLRPFUKlln9aH27jU/y3EmhpKWSZ45rATgpsV1twAHgF/sdKoafFR1G03u+
         QqETqjU91lncV59E99lZaXk5s7WN3XQraISFQeCmYMm+cqSgPxcaPBQO0WexMFTAL+s+
         ROHZXjUr08vgGLEd7xJ4yeSMjarbVcTSNBkzXjrXq0qoJ9jd9SA1Lh0oHQzaKF7wTIWo
         wsRtoyfoJv3wIWzBYGoxe2ERGppZ96kOTnX5YspTwT9Tq4HqXP36nLOTwoq4lxR+dvdM
         JTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KqA1sSRAqoMmHyUXGQDJ9R0gs8rOE6Bt39JWluAbiwQ=;
        b=hjN+4Js9Nu30ap1jUD84iJ8/7pDV7Fxk3HiuPP5CQ6kIxFHan86vYmY0R2lXPSUCYc
         fH2JCBuY0AITNc7E93FRI1pXoIyRwHvURhEZH3Q90mk0uYU3YSoPXfAGgNtZjtXBFBS2
         X474NLrNPkuIpbg4FcF9tU/WqHaN0LvmIlmbrP5VosBQgHSiGVa0JIHmgdvWdlcmevlu
         Mvte2SkXLy3ovu1QzNBTVHFWYcE+zSksb4730wDuTenEvDQXff0/p9sXGhZ+TIwTP6+A
         H6JU00fJJt44FqcuGPRwUPKnQgawmFYExoVFKzsQ/N4X2n/Rhyek0sNgLd42smQvFLld
         KAdQ==
X-Gm-Message-State: AOAM533V3CB6X0wu+r23QukkmNKDnXVUA/YFfA32c7DStZsZnUcvJmO9
        zrRY5+DG7OjJQMJKxnu9N6RyoFgbxxD46eyQl0M=
X-Google-Smtp-Source: ABdhPJw/O7KiCS4DRgu+qkKGXRd/OHgNcuZ5h1KpU5b34LFKdVVbliJID4l6d4Kw1uw5pyHXW4aA3vPh02+YKJmKDZM=
X-Received: by 2002:a17:906:78e:: with SMTP id l14mr4968502ejc.67.1596010883445;
 Wed, 29 Jul 2020 01:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com> <1596009618-25516-3-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1596009618-25516-3-git-send-email-aisheng.dong@nxp.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Wed, 29 Jul 2020 16:06:56 +0800
Message-ID: <CAA+hA=SXe8y4dZ7Bf9ciYAVz8eJ65v2TsF6BeKgpDVyGB_H1mQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob, Stephen, Shawn,

On Wed, Jul 29, 2020 at 4:05 PM Dong Aisheng <aisheng.dong@nxp.com> wrote:
>
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
> in different subsystems across CPUs and also vary a bit on the availability.
>
> Same as SCU clock, we want to move the clock definition into device tree
> which can fully decouple the dependency of Clock ID definition from device
> tree and make us be able to write a fully generic lpcg clock driver.
>
> And we can also use the existence of clock nodes in device tree to address
> the device and clock availability differences across different SoCs.
>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

This patch has been reviewed before, however, i removed your tags due
to the legacy binding
file was removed and switched to json schema.
So i updated this patch to json schema accordingly and need your
kindly re-review.

The former reviewed patch is here:
https://patchwork.kernel.org/patch/11439079/

Regards
Aisheng

> ---
> ChangeLog:
> v6->v7:
>  * No other changes except converting to json schema based on the former reviewed
>    patches due to the lagecy binding file was removed in latests kernel.
>    Because the format is different now, i removed the former R-b
>    and A-b tags and request a new review.
>    See original patch here:
>    https://patchwork.kernel.org/patch/11439079/
> v4->v6:
>  * no changes
> v3->v4:
>  * change bit-offset property to clock-indices
>  * use constant macro to define clock indinces
>  * drop hw-autogate property which is still not used by drivers
> v2->v3:
>  * no changes
> v1->v2:
>  * Update example
>  * Add power domain property
> ---
>  .../bindings/clock/imx8qxp-lpcg.yaml          | 79 ++++++++++++++-----
>  include/dt-bindings/clock/imx8-lpcg.h         | 14 ++++
>  2 files changed, 74 insertions(+), 19 deletions(-)
>  create mode 100644 include/dt-bindings/clock/imx8-lpcg.h
>
> diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
> index 33f3010f48c3..e709e530e17a 100644
> --- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.yaml
> @@ -21,27 +21,58 @@ description: |
>
>    The clock consumer should specify the desired clock by having the clock
>    ID in its "clocks" phandle cell. See the full list of clock IDs from:
> -  include/dt-bindings/clock/imx8-clock.h
> +  include/dt-bindings/clock/imx8-lpcg.h
>
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8qxp-lpcg-adma
> -      - fsl,imx8qxp-lpcg-conn
> -      - fsl,imx8qxp-lpcg-dc
> -      - fsl,imx8qxp-lpcg-dsp
> -      - fsl,imx8qxp-lpcg-gpu
> -      - fsl,imx8qxp-lpcg-hsio
> -      - fsl,imx8qxp-lpcg-img
> -      - fsl,imx8qxp-lpcg-lsio
> -      - fsl,imx8qxp-lpcg-vpu
> -
> +    oneOf:
> +      - const: fsl,imx8qxp-lpcg
> +      - items:
> +          - enum:
> +            - fsl,imx8qm-lpcg
> +          - const: fsl,imx8qxp-lpcg
> +      - enum:
> +        - fsl,imx8qxp-lpcg-adma
> +        - fsl,imx8qxp-lpcg-conn
> +        - fsl,imx8qxp-lpcg-dc
> +        - fsl,imx8qxp-lpcg-dsp
> +        - fsl,imx8qxp-lpcg-gpu
> +        - fsl,imx8qxp-lpcg-hsio
> +        - fsl,imx8qxp-lpcg-img
> +        - fsl,imx8qxp-lpcg-lsio
> +        - fsl,imx8qxp-lpcg-vpu
> +        deprecated: true
>    reg:
>      maxItems: 1
>
>    '#clock-cells':
>      const: 1
>
> +  clocks:
> +    description: |
> +      Input parent clocks phandle array for each clock
> +    minItems: 1
> +    maxItems: 8
> +
> +  clock-indices:
> +    description: |
> +      An integer array indicating the bit offset for each clock.
> +      Refer to <include/dt-bindings/clock/imx8-lpcg.h> for the
> +      supported LPCG clock indices.
> +    minItems: 1
> +    maxItems: 8
> +
> +  clock-output-names:
> +    description: |
> +      Shall be the corresponding names of the outputs.
> +      NOTE this property must be specified in the same order
> +      as the clock-indices property.
> +    minItems: 1
> +    maxItems: 8
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -51,23 +82,33 @@ additionalProperties: false
>
>  examples:
>    - |
> -    #include <dt-bindings/clock/imx8-clock.h>
> +    #include <dt-bindings/clock/imx8-lpcg.h>
>      #include <dt-bindings/firmware/imx/rsrc.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>
> -    clock-controller@5b200000 {
> -        compatible = "fsl,imx8qxp-lpcg-conn";
> -        reg = <0x5b200000 0xb0000>;
> +    sdhc0_lpcg: clock-controller@5b200000 {
> +        compatible = "fsl,imx8qxp-lpcg";
> +        reg = <0x5b200000 0x10000>;
>          #clock-cells = <1>;
> +        clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
> +                 <&conn_ipg_clk>,
> +                 <&conn_axi_clk>;
> +        clock-indices = <IMX_LPCG_CLK_0>,
> +                        <IMX_LPCG_CLK_4>,
> +                        <IMX_LPCG_CLK_5>;
> +        clock-output-names = "sdhc0_lpcg_per_clk",
> +                             "sdhc0_lpcg_ipg_clk",
> +                             "sdhc0_lpcg_ahb_clk";
> +        power-domains = <&pd IMX_SC_R_SDHC_0>;
>      };
>
>      mmc@5b010000 {
>          compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
>          interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
>          reg = <0x5b010000 0x10000>;
> -        clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC0_IPG_CLK>,
> -                 <&conn_lpcg IMX_CONN_LPCG_SDHC0_PER_CLK>,
> -                 <&conn_lpcg IMX_CONN_LPCG_SDHC0_HCLK>;
> +        clocks = <&sdhc0_lpcg IMX_LPCG_CLK_4>,
> +                 <&sdhc0_lpcg IMX_LPCG_CLK_0>,
> +                 <&sdhc0_lpcg IMX_LPCG_CLK_5>;
>          clock-names = "ipg", "per", "ahb";
>          power-domains = <&pd IMX_SC_R_SDHC_0>;
>      };
> diff --git a/include/dt-bindings/clock/imx8-lpcg.h b/include/dt-bindings/clock/imx8-lpcg.h
> new file mode 100644
> index 000000000000..d202715652c3
> --- /dev/null
> +++ b/include/dt-bindings/clock/imx8-lpcg.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2019-2020 NXP
> + *   Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#define IMX_LPCG_CLK_0 0
> +#define IMX_LPCG_CLK_1 4
> +#define IMX_LPCG_CLK_2 8
> +#define IMX_LPCG_CLK_3 12
> +#define IMX_LPCG_CLK_4 16
> +#define IMX_LPCG_CLK_5 20
> +#define IMX_LPCG_CLK_6 24
> +#define IMX_LPCG_CLK_7 28
> --
> 2.23.0
>
