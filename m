Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1D1C3A5A0
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 09:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAD6320A8B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 09:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9YVCeWj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgDTJbh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 05:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725775AbgDTJbh (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 05:31:37 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8F4C061A0C
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 02:31:36 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id n2so5030625ybg.4
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QB5gJS0qiE6PU95ShLISgx4JjOeBA/gJe4w+VjEzZ+o=;
        b=r9YVCeWjT4PHscN7NcgAmiDKTphieHhO7kNM9SFO8rnJ5suS/zV49Vk1q/sxRhCFE2
         QRGEp8OHwzR0hoZVh7QAoZYJ3kI4DJvITfla+OuT3W+sFGEUFxI8HClojzgtzQLGVX5B
         VVkbgOWMcN9RW1LgsKPkqtdDobJNhK2WroghvNZgJUiHS3vfx3nQApTH07jQnW2/8KI/
         hsw7SvJxlIlT+lZNbEG1Akt8Na4WKu/gcIhKX+poqk0bv/GNVuRoeCbcjkYQRC+4w7N3
         qgigmfZSxEnH7J5rj1qGJC8aey7Oalz5CPms33ykgPWfI2kJkqnRaAEaM+SRbK3Lnwaa
         tx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QB5gJS0qiE6PU95ShLISgx4JjOeBA/gJe4w+VjEzZ+o=;
        b=PrV0tX5xXxyte+6BZob0zB8uGNiI92BQSh2+RrBZiMJbEGZg1n9s0VdZnFlrp4utwu
         Wv6krrElwi0pcdYqYVhCB3oVCgDuoXKAxQEoZXxjfebifeaCGHk+kbTAbiMe2VJNMaCN
         hA+RTft0huV30eS2bPXlizozBqHAXuSjTJyeG5169WaKbClqoi1H69DRt/y+Qt9Vhsu+
         NUuXcBrXHSpI06sYFNH8AjstXijfdRuoJvjIFCewFmHLZs+s4JsnCX3sZOmZND+dDEDW
         73PkXw8XfCWzSnWVWYPp4qT83+5DlLlUXU2++9yzaF22WmLJ/0EO2Odu2NClPA5AXyZq
         yrgQ==
X-Gm-Message-State: AGi0PuY5Wb3B7ArZOjkzTKivoVyhWJdniQCYCm2MaBfpMe5n9Act/NAg
        79kifldIvpPLlAoP3Oi1+3hRSLdrYC9yufCsiUnj5w==
X-Google-Smtp-Source: APiQypJ2/hJHIq11rXAe5vfJdZqTOYJHD/wWZba5U9CMmbXXTsuxYhh0EYNQt1f1r3BHUvwyNK8vaNjgtHItTBbO32I=
X-Received: by 2002:a25:9cc3:: with SMTP id z3mr18364664ybo.234.1587375095530;
 Mon, 20 Apr 2020 02:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <158735030084.17831.6159788305648251972.stgit@localhost>
 <20200420121403.aff9fb209ee0da7f20ed3ae2@linaro.org> <CAK7LNAT9y2A-dX2Z-2pAsbRvKReoypmoP0hdbWiCGR0G8CuK0w@mail.gmail.com>
In-Reply-To: <CAK7LNAT9y2A-dX2Z-2pAsbRvKReoypmoP0hdbWiCGR0G8CuK0w@mail.gmail.com>
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date:   Mon, 20 Apr 2020 18:31:24 +0900
Message-ID: <CAA93ih3X46k7F0Mzv=-H0RRAVMemXmHFDc+trAKn2c1tLOQNHA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add Akebi96 board support
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Yamada-san,

2020=E5=B9=B44=E6=9C=8820=E6=97=A5(=E6=9C=88) 18:26 Masahiro Yamada <masahi=
roy@kernel.org>:
>
> On Mon, Apr 20, 2020 at 12:14 PM Linaro <masami.hiramatsu@linaro.org> wro=
te:
> >
> > Add uniphier-ld20-akebi96 compatible string for
> > Akebi96 board support.
> >
> > Signed-off-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>
> > ---
> >  .../bindings/arm/socionext/uniphier.yaml           |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/socionext/uniphier.y=
aml b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
> > index 113f93b9ae55..6caf1f9be390 100644
> > --- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
> > +++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
> > @@ -51,6 +51,7 @@ properties:
> >        - description: LD20 SoC boards
> >          items:
> >            - enum:
> > +              - socionext,uniphier-ld20-akebi96
> >                - socionext,uniphier-ld20-global
> >                - socionext,uniphier-ld20-ref
> >            - const: socionext,uniphier-ld20
> >
>
> Your patch submission is still strange.
>
> https://patchwork.kernel.org/patch/11498025/
>
> This patch is broken.
>
> Please make sure it can apply to the mainline code.

Ah, since it is based on the linux-nex.
OK, I'll update it to the mainline kernel.

>
>
> The author files is also odd:
> From: Linaro <masami.hiramatsu@linaro.org>

Oops, sorry, it was my mis-configure of MUA... OK, fixed it.

Thank you!

--=20
Masami Hiramatsu
