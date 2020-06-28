Return-Path: <SRS0=6oDv=AJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D96C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 28 Jun 2020 06:37:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92CCE207E8
	for <linux-devicetree@archiver.kernel.org>; Sun, 28 Jun 2020 06:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HtxMeacr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726051AbgF1GhZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 28 Jun 2020 02:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgF1GhZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 28 Jun 2020 02:37:25 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A93C061794
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2020 23:37:24 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id dr13so13156465ejc.3
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2020 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iUXx+7YRSLXxfIms/TP+PNmkL/8TkVtZnmICV5XUjPk=;
        b=HtxMeacr3Z2cWSCALOatgTtptSevkOJMM5HFkKGRFUh0JSl3gz10vkkvB9jPuXdCa0
         wKqmfReSZkSi4+mbgIT/kyeLgPIesb9dJeDT1TTb95VelMkp3wCWxvgIfrGDuMyD+sbk
         de6cNiWy+9H8oS/8KM8dqqyqBqYjJ225M0DNQsnfrUM8gudfw2UX4oVJlw6YiMZHommW
         3wTh0ofaOTARyRiooRGV2gGzRl896arD1vptPFcFN20lvuFplx+leocj6YX29It5Ytw0
         L438Rg0xgwIy2I5kMoIg8e7dYxycX0bJvko6iuYyqRYyMjR7TwZ4HlpUlIKuLvvpePKj
         dZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iUXx+7YRSLXxfIms/TP+PNmkL/8TkVtZnmICV5XUjPk=;
        b=TsYNRJfHjh794wbkkpiRB4cD57mvwyPRJ5aO7Nt2OUFx7lneVqpXn/QSoFyWeWMx7S
         UsD4nptR1usi0iuFDTktostu2w7dWTfqM7euGNAN98jBL3HvBS+iGlrs7BIxm7UgZl9S
         EB3Y34WeCgCJFPbmzgy0CCZtGyz+lSZ0BHyz3iMhrJ2Qhem+Pfo4VL1zX89PxzsymE8/
         odP0gOsDu9Ph5Al/iuhOlw8Z1pmhCcmODo+kQRg1FDVMXO7YHj1U3u3jH7Z629SCVy8S
         9eJHYh3FsjTGdwyHi5QiSPu5kn8sWInzuZXURhNahZSVlxJNodb8S1u+jtCmOUX+et+1
         Ivdw==
X-Gm-Message-State: AOAM533SkPrThJFgTOW/iaqENxyXfuY8y8wPbJauZ66Wyl140wT0Hz+I
        96eGmmkYvhvwn6jsCi67sSsCkDH9fxwqeVjN2Z+aYA==
X-Google-Smtp-Source: ABdhPJwDYE/k7xpZBmf6iEqvJPD8CzhEgKf5MswtJlSFdYxxfg6UVYHu/yZw9Bo+a8hmnigetkjLQVfGwwrSQe9EUIk=
X-Received: by 2002:a17:906:2786:: with SMTP id j6mr8886684ejc.216.1593326243692;
 Sat, 27 Jun 2020 23:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200626080538.3454-1-krzk@kernel.org>
In-Reply-To: <20200626080538.3454-1-krzk@kernel.org>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Sun, 28 Jun 2020 14:37:12 +0800
Message-ID: <CABymUCOZW56OCv4V246-SLE-TRLQ4G36x3pe7P5hdX-z7NM_Sg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: zx: Align L2 cache-controller nodename with dtschema
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2020=E5=B9=B46=E6=9C=8826=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=884:05=E5=86=99=E9=81=93=EF=BC=9A
>
> Fix dtschema validator warnings like:
>     l2-cache-controller@c00000: $nodename:0:
>         'l2-cache-controller@c00000' does not match '^(cache-controller|c=
pu)(@[0-9a-f,]+)*$'
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/zx296702.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Jun Nie <jun.nie@linaro.org>
