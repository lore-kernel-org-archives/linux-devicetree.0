Return-Path: <SRS0=/QBj=55=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86678C2BB86
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 22:24:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 589F720678
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Apr 2020 22:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GSxlT1fz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389543AbgDMWX7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Apr 2020 18:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389528AbgDMWX7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Apr 2020 18:23:59 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B8FC0A3BDC
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 15:23:57 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m8so10431565lji.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2020 15:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hOJzEh+GtDvN9Quiqz6IX5/33GKsh67OKgylNu6oVIU=;
        b=GSxlT1fz6RQ87Z8QMQPuW8bYXM2ScxY1cFoe5ov8QJ/yYlctp19DIFLKilFAdXYtDS
         pSX1D7ps3VEk6L6AwFWhJvnVNolNXaMdi2I5mKj7/mNmTzOFEFjn1EjBZk5oC60NC7mn
         xqSLEvoIgAlVQkcYLIgdca7bfDdO6fXHmRJvd+gqjHNeOY6GBtqm4hKxIMFfWIXFQb1I
         j2nG+SOVaLE+mIv75JJyQ6ohOHa+pmlNddcSFx7IVjYqDZfz5YB3k7nnIhfwFyVLMsem
         mgxOb1NCjUbT4T6u9dt5R/9MlTJyReBtvmp2+gbc1JD0tcVfLsEu9eyEQNbSfcx4PnZ5
         9o/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hOJzEh+GtDvN9Quiqz6IX5/33GKsh67OKgylNu6oVIU=;
        b=NcvRzatY7F45DcsjtH/0WhNpFzutxSYqpPpLjdR95ZkiGwAsGpi47sYQ4ioUE+v4NP
         tzEfdv8WaRfwlnzTpBriB5srcY02PCSYawdm0+3vQ8i05X3HuYJCnx3/VG+4mGVKZlKi
         AzKi41mevZCcltxnjtsFqVS3NSU8yq+Rl195StBLB+/Q2OHYMMnVhadlq3RTJvxCpNrD
         sCv6260rowEyRpy8mOE1VNF/FguZQkXmIuzu3NmlMECodMpVT4bUC1rC4Ot+5nQKIZPQ
         3ODUIi9+GUHerhDs/PWPAOBifnEZIPQfAhFbkPeDBg1wKBvF+DZcZEih0eWUwhwPujdw
         O0Qg==
X-Gm-Message-State: AGi0PubC7hnfAhzov7sRHo3z6oJ7ek6xyzD3zGULXU18+YHauxP/NV3k
        BeXsAF9DqXLvc4tVcOdVWFevBeRqiOB6mXFnv8brcA==
X-Google-Smtp-Source: APiQypJz+NAbVKX1pvYlsMZklUbdsi8OVkfeMAfqQRqrJPtqUMiMm6LXTq82c7V5JR2PrcGD/+niR792VziZLvdmn24=
X-Received: by 2002:a2e:5048:: with SMTP id v8mr10655018ljd.99.1586816636200;
 Mon, 13 Apr 2020 15:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200406141350.162036-1-nick.reitemeyer@web.de> <20200406141350.162036-2-nick.reitemeyer@web.de>
In-Reply-To: <20200406141350.162036-2-nick.reitemeyer@web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Apr 2020 00:23:45 +0200
Message-ID: <CACRpkdZDmYGcz11nqt++18NCD6G7S99S=qL9fXK0JLuqDWAuVA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: magnetometer: ak8974: Add Alps hscdtd008a
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio <linux-iio@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 6, 2020 at 4:23 PM Nick Reitemeyer <nick.reitemeyer@web.de> wrote:

> Add binding documentation for the Alps HSCDTD008A, which is similar
> to the ak8974.
>
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
