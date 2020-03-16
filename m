Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5766CC0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 12:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AC82205ED
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584361915;
	bh=CAzOnJeuD+ABheWsmWDmHviz5NbfolgR/TYRaTZU2dM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=X+I5p4kn/kvF55pL59ciX98OVfeWcMzqSPsp4iLf2EX+/C4vlNRvvMzXiD/7OVtY+
	 qmlqXLQ5+OrCaUvs5z/KH+DPi20ZLWzy+WW7rRTn0aap9I9TzSBu0G7x2r8CMDb/wg
	 hESfF72sk1Fk7wcSNyJqWu9gCtUNoS6u/MlyUWzM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730969AbgCPMby (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 08:31:54 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38564 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730878AbgCPMby (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 08:31:54 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 02GCVdu9008887
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 21:31:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02GCVdu9008887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584361900;
        bh=zpCoHUBeDJGjHqdX9oB4j+mSj5BJoyxsC8tu6I0gEvE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Z8Uv17kehP6AU8luHPv8o4S/QQDTPgs+Qm7U7hJRTLRktKhFnQ7fWaCskGMsVp+N/
         1RTdU5b343bYf6MeoLim1BgBiDycA1a5ztRoEDVaAfbBHGUAI6sodfVRVe2reuhAeU
         kWrkgCTfBwC7Um1H58K+E+VBmTpQwqd1/jjELMSxD8DxCKmzuAymiFCNhbtG8UeKdc
         b/5z4tlv4ff/3qGw/U84qQf+ktBqF5/imHWrUTFOJUjXKU4B7KTvsKcOWQ68q1kmZk
         GGnqsjyzeqPPCGIlh1f/jcyY9qEYVtqu/BmbMq2aaqCSlmMi6R5dOsPgMxBNkmBVtD
         wWxA8y+shvGHQ==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id m9so11129571vso.2
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 05:31:39 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0b6vDIqWf6TfdeeP9ZHIxXYvL+61x2yi6U0jTKsWwFDffVDvs8
        ye6aFCo6p+vSLMsgEOXxFGUX+X5srDSHCyOsWf4=
X-Google-Smtp-Source: ADFU+vslQ2MQUt3HOh4jbtvGO2wNFlnU2SIK9Hi7L8whmrTgbjpovnuWApmSmKtPusuvmqo3ZjAjKdr5EnwxaWLKqCg=
X-Received: by 2002:a67:2d55:: with SMTP id t82mr8503531vst.215.1584361898827;
 Mon, 16 Mar 2020 05:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com> <1584061096-23686-7-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1584061096-23686-7-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 16 Mar 2020 21:31:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+73FGUC7NAaPM_5uyjccuxDXokmKaY2KJpxqskdyuVg@mail.gmail.com>
Message-ID: <CAK7LNAR+73FGUC7NAaPM_5uyjccuxDXokmKaY2KJpxqskdyuVg@mail.gmail.com>
Subject: Re: [PATCH 06/10] ARM: dts: uniphier: Add ethernet aliases
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 13, 2020 at 9:58 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Add an aliases property for ethernet to determine device name assignments.


There is no call-site of of_alias_get_*() for this device.

Why don't you describe the reason correctly?





>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  arch/arm/boot/dts/uniphier-ld6b-ref.dts    | 1 +
>  arch/arm/boot/dts/uniphier-pro4-ace.dts    | 1 +
>  arch/arm/boot/dts/uniphier-pro4-ref.dts    | 1 +
>  arch/arm/boot/dts/uniphier-pro4-sanji.dts  | 1 +
>  arch/arm/boot/dts/uniphier-pxs2-gentil.dts | 1 +
>  arch/arm/boot/dts/uniphier-pxs2-vodka.dts  | 1 +
>  6 files changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/uniphier-ld6b-ref.dts b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
> index 60994b6..079cadc 100644
> --- a/arch/arm/boot/dts/uniphier-ld6b-ref.dts
> +++ b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
> @@ -29,6 +29,7 @@
>                 i2c4 = &i2c4;
>                 i2c5 = &i2c5;
>                 i2c6 = &i2c6;
> +               ethernet0 = &eth;
>         };
>
>         memory@80000000 {
> diff --git a/arch/arm/boot/dts/uniphier-pro4-ace.dts b/arch/arm/boot/dts/uniphier-pro4-ace.dts
> index 92cc48d..64246fa 100644
> --- a/arch/arm/boot/dts/uniphier-pro4-ace.dts
> +++ b/arch/arm/boot/dts/uniphier-pro4-ace.dts
> @@ -26,6 +26,7 @@
>                 i2c3 = &i2c3;
>                 i2c5 = &i2c5;
>                 i2c6 = &i2c6;
> +               ethernet0 = &eth;
>         };
>
>         memory@80000000 {
> diff --git a/arch/arm/boot/dts/uniphier-pro4-ref.dts b/arch/arm/boot/dts/uniphier-pro4-ref.dts
> index 854f2eb..181442c 100644
> --- a/arch/arm/boot/dts/uniphier-pro4-ref.dts
> +++ b/arch/arm/boot/dts/uniphier-pro4-ref.dts
> @@ -29,6 +29,7 @@
>                 i2c3 = &i2c3;
>                 i2c5 = &i2c5;
>                 i2c6 = &i2c6;
> +               ethernet0 = &eth;
>         };
>
>         memory@80000000 {
> diff --git a/arch/arm/boot/dts/uniphier-pro4-sanji.dts b/arch/arm/boot/dts/uniphier-pro4-sanji.dts
> index dda1a2f..5396556 100644
> --- a/arch/arm/boot/dts/uniphier-pro4-sanji.dts
> +++ b/arch/arm/boot/dts/uniphier-pro4-sanji.dts
> @@ -25,6 +25,7 @@
>                 i2c3 = &i2c3;
>                 i2c5 = &i2c5;
>                 i2c6 = &i2c6;
> +               ethernet0 = &eth;
>         };
>
>         memory@80000000 {
> diff --git a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
> index e27fd4f..8e9ac57 100644
> --- a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
> +++ b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
> @@ -26,6 +26,7 @@
>                 i2c4 = &i2c4;
>                 i2c5 = &i2c5;
>                 i2c6 = &i2c6;
> +               ethernet0 = &eth;
>         };
>
>         memory@80000000 {
> diff --git a/arch/arm/boot/dts/uniphier-pxs2-vodka.dts b/arch/arm/boot/dts/uniphier-pxs2-vodka.dts
> index 23fe42b..8eacc7b 100644
> --- a/arch/arm/boot/dts/uniphier-pxs2-vodka.dts
> +++ b/arch/arm/boot/dts/uniphier-pxs2-vodka.dts
> @@ -24,6 +24,7 @@
>                 i2c4 = &i2c4;
>                 i2c5 = &i2c5;
>                 i2c6 = &i2c6;
> +               ethernet0 = &eth;
>         };
>
>         memory@80000000 {
> --
> 2.7.4
>


--
Best Regards
Masahiro Yamada
