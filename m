Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429E6C3815B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 09:27:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F5AD2145D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 09:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587374821;
	bh=C4lXLIrnMdNNtfqCKcmALtUUfKI7HkNhNTd5NVfKsac=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=kXV5ticCTndq6UzZI6gf3XSFm9f1ftWoHnjDjtngEzL5AbL5D90N6+k2ZHv+L0TyD
	 lkAKfTk52MpMcyq3TXL3WJJDrlymiYZln7Dh0X4c5w9MmPrbjL0lY4VV8peWZEj+Ve
	 5m4D1ZAI7gjN+DWBWHLjYpz+eqKGfgT0nrwz6v5A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgDTJ1A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 05:27:00 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:44513 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgDTJ1A (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 05:27:00 -0400
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 03K9QZpI011196
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 18:26:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 03K9QZpI011196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587374796;
        bh=4tWlc61cozeZYTaC04eH337I6FVY/GeeggyyoOKC7gk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bShyymuzoBr9ubt/3/vrcep7Pl3vebqki8KioyAe6VbWLGHZ8ZPQv1hkIoAhunwIW
         OZaL/57KLJyXgve843msBEn72dKvU85IrOCDntscJzak9l6bbAFf0m3CTlRY29Bmtc
         TnhPqx9hlS9Gbm4jRRMdOyrwz0qoBj3PR6ypqwtCyfbh/vLlc16s6z3fHYav1kXM5S
         Yc1pRgkMgAhzpEEBaPRlNlTidY2z5iQ/tof+nm6jpLVGbBbcY+nAsvTdvD7DqBiaCP
         BlGYv4M9r2y/LYCVZuPyx0D0ILdYf0JXirHb9RsQMVxN6NscFep8pUJ2umjsuMiU8g
         mLWB8lOvXNg5A==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id h200so2379187vke.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 02:26:36 -0700 (PDT)
X-Gm-Message-State: AGi0PuaNpP9YviXdtY7/+b9u5OkmcXnN+d1bUkJnxDtRfWwPF6vICxJN
        0yAaDWh4ga+NxPHjV0DgT62k1EN0T3284h+2fEM=
X-Google-Smtp-Source: APiQypIIvPXDPiIfRLRahAEZuhzxWg54GeIS2/Fl/ntq8dvKnIFu3EdUyrowLqZOqaFPz4C6DZrCoGU0W9GNL4jmBCA=
X-Received: by 2002:a1f:1e11:: with SMTP id e17mr10211271vke.73.1587374795338;
 Mon, 20 Apr 2020 02:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <158735030084.17831.6159788305648251972.stgit@localhost> <20200420121403.aff9fb209ee0da7f20ed3ae2@linaro.org>
In-Reply-To: <20200420121403.aff9fb209ee0da7f20ed3ae2@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 20 Apr 2020 18:25:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT9y2A-dX2Z-2pAsbRvKReoypmoP0hdbWiCGR0G8CuK0w@mail.gmail.com>
Message-ID: <CAK7LNAT9y2A-dX2Z-2pAsbRvKReoypmoP0hdbWiCGR0G8CuK0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add Akebi96 board support
To:     Linaro <masami.hiramatsu@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 20, 2020 at 12:14 PM Linaro <masami.hiramatsu@linaro.org> wrote:
>
> Add uniphier-ld20-akebi96 compatible string for
> Akebi96 board support.
>
> Signed-off-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>
> ---
>  .../bindings/arm/socionext/uniphier.yaml           |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
> index 113f93b9ae55..6caf1f9be390 100644
> --- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
> +++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
> @@ -51,6 +51,7 @@ properties:
>        - description: LD20 SoC boards
>          items:
>            - enum:
> +              - socionext,uniphier-ld20-akebi96
>                - socionext,uniphier-ld20-global
>                - socionext,uniphier-ld20-ref
>            - const: socionext,uniphier-ld20
>

Your patch submission is still strange.

https://patchwork.kernel.org/patch/11498025/

This patch is broken.

Please make sure it can apply to the mainline code.


The author files is also odd:
From: Linaro <masami.hiramatsu@linaro.org>



-- 
Best Regards
Masahiro Yamada
