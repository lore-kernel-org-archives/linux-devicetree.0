Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EA4C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 15:06:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87273218AE
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 15:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Plp9ciQg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388065AbfKGPGQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 10:06:16 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46637 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729450AbfKGPGQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 10:06:16 -0500
Received: by mail-lj1-f193.google.com with SMTP id e9so2617571ljp.13
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 07:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNpdMP+c8tlO1TDBVC9k0h0b00Uv4MokMY8phy3uBZY=;
        b=Plp9ciQgOG5hYRICyBiK09OuHTIwfyXsnNUaZufyuHBW2gt8WTNobqXZ59MKjr0gpI
         xnU+WxvFUzWmufwpssofG3QZupAgDMO5ES5kDp7byODeuSCiTJjD3F+4/bsVzFTNl33f
         jjze2//s0VefzxvM5fc0GXN5ZNanoo3kver6yczND4uavQ+Kncxtlw+34TtV3tag+DmT
         ZokOjbpLhJTRyck2ejy92SJ/LXgspCBjL/6k5iYnrSG5VZbk6vuOxGOyr0OL1Pb6FrEe
         mG3MmlnVXeIBc7Og0MUOlwvJs/znEWe581cxxZ/yah3BCmJb2hsIXCHRlOEsEiZZRORr
         0acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNpdMP+c8tlO1TDBVC9k0h0b00Uv4MokMY8phy3uBZY=;
        b=UZyyF5qZ65Pq7aliZnv3qm/zloQzy3rBZb7O0MNRS6YBhwn+/3O0pf1srV8BVHppUg
         PFU95jBamnZ/OkqEkIsRpl5l2dKqdjltVCQ9fKKoJaAB8Unr1L2V3Qcok6tOsHz7H800
         q/hyxRuyrLmiMbhJP/Se0pu089m2uyYHTM8HzQtHZ5EgmobWcJtjlnYYVZHVlibn4xsf
         IHGNMZywlpA49RPFWU8fit0FGrYKPklplD6CH702RxL5bWKuwViC34mbIDpNWC3MvyNG
         9AW7EdlJfWfkLuAQ7ScWm66vzwa3l1mRcibPVrQPa7MA9dI3QqzbDveR50cVPQM+U44c
         u0pA==
X-Gm-Message-State: APjAAAXDXnPdm9D5+NwdYwN7P7aoSCxEvA6UuZ59/LfZo9uq77nD662V
        FdWnL+WyDBwr08JYLlBK4Sa5U4AMF5tCk6LwL18jnw==
X-Google-Smtp-Source: APXvYqy0UMnhHp0V9kHUNVqUdW8dcWit5TUPdqMJ7p+PhSp0lU3WFWMFc8TaB5tFpYY9hkHHmq2SoFIgo1uRcdaSFgk=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr2825884ljd.183.1573139174709;
 Thu, 07 Nov 2019 07:06:14 -0800 (PST)
MIME-Version: 1.0
References: <20191106183536.123070-1-stephan@gerhold.net>
In-Reply-To: <20191106183536.123070-1-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 16:06:02 +0100
Message-ID: <CACRpkdZgUR5Wqr7o7Rf2vGavCmx=rU53L6AaHhOQ3w2R0f2XHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iio: imo: mpu6050: add vdd-supply
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Brian Masney <masneyb@onstation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jean-Baptiste Maneyrol <JManeyrol@invensense.com>,
        linux-iio@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 6, 2019 at 7:37 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> inv_mpu6050 now supports an additional vdd-supply; document it.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
