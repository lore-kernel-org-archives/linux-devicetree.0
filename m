Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798FAC2D0BF
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 13:10:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AFA42077B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 13:10:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gyKQnxjm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfLJNKb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 08:10:31 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43713 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727453AbfLJNKb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 08:10:31 -0500
Received: by mail-vs1-f68.google.com with SMTP id x4so12939380vsx.10
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 05:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6uEUd2HXOojJgWmuBpQEOZYd6ZSlw7vyQqx8uMK5CyQ=;
        b=gyKQnxjmTQ04AgU2NQlCSrNzLE44dxS5qjp+MKoCEB6xT6a/YlOLggCaHAWQsCCp66
         2SJqiPfh2mIvWtKx+U8crb/mo8MlryiH70ScmHG/5uAW5J1U86C/X5M9RVIBlXqaunBW
         K/hTJHIu2+KI2HlJ094T1b4201bMIQdapw2z9S83FCFzap+uV6vO4m7nA/zuR4airCji
         v1y/KFOE8HuPq+zOnx2IIhyp9iBpqnpyBVQkq4mD9F2/VfoQs5qELAns8DdZpnWXeG75
         pcn/kvuWuAnax/9XhNJHUCv7krvFQfZgVyqmJXyP3b2AFOoLQXGea4odD3c5SeooCiMW
         61Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6uEUd2HXOojJgWmuBpQEOZYd6ZSlw7vyQqx8uMK5CyQ=;
        b=KuXIe4mgU/iDB+x3tC1wQZDsToSBTdTpqSRoFlOH+wM3vtLBre/o0OpYqp4eE4sfZs
         ErC6fnnCxRC8L1AzmYRj18rIilHYWpAN1vGsNYYROM2+2/xWU6UP0Z8Kc0QvQK948wET
         wdq3VVpFLg+m67Uudoqc6ASq00qwYyjZF2wq89tsMPsQhY6pF0NgqThzoRfsqj2MOj8h
         As/Qjk9nR+mcyyUQiaQzEfegx2O4f+bmuwAObeDcorUIqj9xRJ2omYVo/OxYMQ/qQe6Q
         8Q+DSDv3CWLUAQyPM4O2dfcKbIJZBSxHTq/FGRMlvBCj6DV34DQMg6lYw/nJJKoAOXKO
         Wc9g==
X-Gm-Message-State: APjAAAUcV6hk0OMkvHGsinOiYq9tBNjuJja9hA1m4/WViOwyysazzN/i
        DcQ+xlgdeqVrnwCFEk1Q3rxfL/eDRWD1BJkpW+acCg==
X-Google-Smtp-Source: APXvYqz//4trR+DvxV6YvWrExsSe+c59aBaLyI/H0ldesHElrZaVNW+Wmr3FqjKsbV578wgN1oxKPpM11jDVNbzD9/Q=
X-Received: by 2002:a67:2087:: with SMTP id g129mr24691209vsg.191.1575983430455;
 Tue, 10 Dec 2019 05:10:30 -0800 (PST)
MIME-Version: 1.0
References: <20191205134349.6410-1-geert+renesas@glider.be> <20191205134349.6410-2-geert+renesas@glider.be>
In-Reply-To: <20191205134349.6410-2-geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 10 Dec 2019 14:09:54 +0100
Message-ID: <CAPDyKFrccGjrVJhL3Hwu0Adg7e-rRs2hdkMe1mS6G2RbHF6WJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: renesas_sdhi: Document r8a77961 support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 5 Dec 2019 at 14:43, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> Document support for the SDHI controller in the Renesas R-Car M3-W+
> (R8A77961) SoC.
>
> Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
> avoid confusion between R-Car M3-W (R8A77960) and M3-W+.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
> No driver update is needed if "[PATCH] mmc: renesas_sdhi: remove
> whitelist for internal DMAC"[1] makes it in first.
>
> [1] https://lore.kernel.org/linux-mmc/20191203194859.917-1-wsa@the-dreams.de/
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> index bc08fc43a9be466b..e6cc47844207049b 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.txt
> @@ -23,7 +23,8 @@ Required properties:
>                 "renesas,sdhi-r8a7793" - SDHI IP on R8A7793 SoC
>                 "renesas,sdhi-r8a7794" - SDHI IP on R8A7794 SoC
>                 "renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
> -               "renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
> +               "renesas,sdhi-r8a7796" - SDHI IP on R8A77960 SoC
> +               "renesas,sdhi-r8a77961" - SDHI IP on R8A77961 SoC
>                 "renesas,sdhi-r8a77965" - SDHI IP on R8A77965 SoC
>                 "renesas,sdhi-r8a77970" - SDHI IP on R8A77970 SoC
>                 "renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
> --
> 2.17.1
>
