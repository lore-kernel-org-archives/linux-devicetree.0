Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0265C4332D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 14:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4E132070A
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584627577;
	bh=BtG5qNKX0/T+Gf/a3/iCJDVWIvZXlh/fQKmL5yAkjqU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=w1Rr+Mke0AKqAPNem47t6CMtJt1Z3/3zgDSm74a9Frfp6fiy/MzOmnBPuE0OpsdGC
	 UEsgtONYeA3iS8si8jfHieDPmcXSU8GmUC1+bbP3WRKb0iNqp4IZkYcGodZ9OX0HFD
	 K/yK8Jn5wyKqhVAl5VzybE10eBRYk7SZILTybMS4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgCSOTh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 10:19:37 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17797 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgCSOTh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 10:19:37 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 02JEJ65O013731
        for <devicetree@vger.kernel.org>; Thu, 19 Mar 2020 23:19:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 02JEJ65O013731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584627547;
        bh=w1lbHoDNgA6TwOiiJZhZx8M7iyfr3Ed70vDIRSfWaiA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JmygXgMYln+Hv9uz66IB4Y/m6/YDaGHqDhaJQohiqqhgDR187g8zADDL3Q8wm42Ua
         Kb/foXnTs9Jyy/gC+oKSua6jBI9fGfvOfIIPLfmkS7bM7OOfILPey3zBMISqXAy3K5
         d/dsOGvPnxoRcSVBO1cjM72DRW+qk3QqdjEqqaq3jiEUSUVwlzJwkDUy6AAZadLwey
         GOFTsJvjYUChUzEl8EI1vq/Nl/XNKTpsh1EjKCjdSJ1WcVrBel685Aupr8jIoZfG9N
         J3QshXrP4NJLaPlY+DkFzd4BSAuoYbRHsIJQgM4IQb6I5do49Qw82OZFLXmg08e0bp
         z/Nl8VJgAqm6w==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id m9so1718671vso.2
        for <devicetree@vger.kernel.org>; Thu, 19 Mar 2020 07:19:07 -0700 (PDT)
X-Gm-Message-State: ANhLgQ30eJauQFdBOfhnjz9iNBHmmOy8ASd8F3PKSvp58ZGsnpeNCGOn
        omUJJO+7Sj4F6Z1hGR5RfJz/FB8Jq42IcKFfBCQ=
X-Google-Smtp-Source: ADFU+vuilX6NSpIv5I8KSxSguokUibNXJs2yofeG2OKKLHVzmKA1clQOz5tEg/6qziFICi7KIwK4EHdU/Rnj219Bb0k=
X-Received: by 2002:a67:33cb:: with SMTP id z194mr2384802vsz.155.1584627545771;
 Thu, 19 Mar 2020 07:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <1584604252-13172-1-git-send-email-hayashi.kunihiko@socionext.com> <1584604252-13172-2-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1584604252-13172-2-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Mar 2020 23:18:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNASmZRszPB-o4pzeu0aQM4_cQBkRxwFM2T4_onHA4-1r8w@mail.gmail.com>
Message-ID: <CAK7LNASmZRszPB-o4pzeu0aQM4_cQBkRxwFM2T4_onHA4-1r8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: dma: uniphier-xdmac: Remove extension
 register region description
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

On Thu, Mar 19, 2020 at 4:51 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> The address of the extension register region in example is incorrect,
> however, this extension register region is optional


On which SoC is it optional?

In your previous DT submission, every reg was,
like this:

reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;



and you meant

reg = <0x5fc10000 0x1000>, <0x5fc12000 0x800>;

?

> and isn't currently
> referred from the driver, so the description of the region should be
> suppressed until referred by the driver.

This sounds like you plan to get it back
as you extend the driver.

I checked the datasheet. This controller has more registers,
so you split the reg into small chunks, the final form will look scary:

reg = <0x5fc10000 0x1000>, <0x5fc12000 0x800>,
      <0x5fc14000 0x100>,  <0x5fc15000 0x100>;


My question is why you did not use a single reg tuple
that covers the whole registers.

Is any other hardware reg interleaved in between?






>
> Fixes: b9fb56b6ba8a ("dt-bindings: dmaengine: Add UniPhier external DMA controller bindings")
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml b/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
> index 86cfb59..f4c3f49 100644
> --- a/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/socionext,uniphier-xdmac.yaml
> @@ -24,7 +24,6 @@ properties:
>    reg:
>      items:
>        - description: XDMAC base register region (offset and length)
> -      - description: XDMAC extension register region (offset and length)
>
>    interrupts:
>      maxItems: 1
> @@ -54,7 +53,7 @@ examples:
>    - |
>      xdmac: dma-controller@5fc10000 {
>          compatible = "socionext,uniphier-xdmac";
> -        reg = <0x5fc10000 0x1000>, <0x5fc20000 0x800>;
> +        reg = <0x5fc10000 0x1000>;
>          interrupts = <0 188 4>;
>          #dma-cells = <2>;
>          dma-channels = <16>;
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
