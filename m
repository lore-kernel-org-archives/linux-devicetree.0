Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E976BC3F2CD
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 23:22:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF50A2469C
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 23:22:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fa//2cfD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgB1XW6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Feb 2020 18:22:58 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33908 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgB1XWz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Feb 2020 18:22:55 -0500
Received: by mail-lj1-f193.google.com with SMTP id x7so5197892ljc.1
        for <devicetree@vger.kernel.org>; Fri, 28 Feb 2020 15:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2eqxeoYIrVLOIQ7hh1SkaHG4jTSn1JrLp5pMhF228gg=;
        b=fa//2cfD9xxk9b6pZ6Yw33KdAqjyxP/fqbFuCPrtvpvcXafVEnloRfDXvaBe0dN0Qa
         fINSDiTXoEkKpAHbZR0/CdQGXzw4BkWxKqFbvTTlF2t30WImNasawyhoby7EbJk0v4sP
         eFf8Y1wTo/G2c4D/JkpUKxEmXnYI5Cv+VsODpIJdCdKwfbE8trfou+O6r4JHKG9284Qv
         VKRG+jTEXuy0aWblF9Jkk49FRn1B4uyIvX52L5y2JhQ/ZLISwAnuVEoiuN976mSXrGfs
         khNSj9gFNkG3O9Qxt+VkpLOxS+pBmxH+KEZlYmCfeNRuyviRcA4DHcXPIw388fNvkykP
         RL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2eqxeoYIrVLOIQ7hh1SkaHG4jTSn1JrLp5pMhF228gg=;
        b=XuR/sPudAgswGTPx39vIlI1PECZt0NPaULRN8EUmrjUAuE7hHPO9ydLtN0bU9GSI1l
         E25ikxiTsGrawH4km4zMB6ROVCziRcA8Tdp6Qj40RYH2FiXxNmAGoBeg5JYYZ/crgHc+
         Ioyeo82ZpwK/ai6ZQteFSeLjxIK1bW0JdHMqpxI8fUbSQdUOF2fYnwjchlJ5Erx6wE8J
         ICnD+1r9BCmDsizVDs5wDR+JuNCLbGcwLffMNIymUbkJF0P98+NkOcT0MaAuEBQ+Bxf9
         InOGN6DTssOzzuPrLO12+QxSg5rtFtLIEm8FPOgfl51wtJiQWrPAo/dSxv8/opaC0Hv8
         MNeQ==
X-Gm-Message-State: ANhLgQ2aBSSfXA0d1+KNcACXvkHRNjSAcXJ2kSThOnvwYNLreqRX/u2m
        xlgKhpy1nM2oiRNBg6TM+gyh+iR/Wmfi0lF7wEGCUg==
X-Google-Smtp-Source: ADFU+vv4jorIIrhlu3IkFg1e8VzFI1djLIzV0XhA4c7hYwnb2v6uJwaQ90o8fQbNN3FP42H3eq2tJ/643zwjgaSocV8=
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr4238077ljo.125.1582932172096;
 Fri, 28 Feb 2020 15:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20200222060435.971-1-yamada.masahiro@socionext.com> <20200222060435.971-3-yamada.masahiro@socionext.com>
In-Reply-To: <20200222060435.971-3-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 29 Feb 2020 00:22:41 +0100
Message-ID: <CACRpkdaj8jiABWU8Nj1p8=8HbDoi3zh4yMedVQ9C9BppqMT65w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bingings: pinctrl: Convert UniPhier pin
 controller to json-schema
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Feb 22, 2020 at 7:05 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Convert the UniPhier pin controller binding to DT schema format.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I see this was applied, I had some comments on the previous
version but they can be addressed with follow-up patches.

Yours,
Linus Walleij
