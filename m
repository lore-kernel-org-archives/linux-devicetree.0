Return-Path: <SRS0=t1WB=AW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DECC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jul 2020 15:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 470FF207FB
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jul 2020 15:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="amCtWJf8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgGKPVk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Jul 2020 11:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbgGKPVk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 11 Jul 2020 11:21:40 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC12C08C5DD
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2020 08:21:39 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id j11so9769258ljo.7
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2020 08:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WTeenhelWj6XLk+u35uQz3AkixY1OcVSHZgAH3KuSvA=;
        b=amCtWJf8ZOkE89pOQ+ktfUpDLhJRYMNE/IWxTv4EVM5M1Ibcu8AnagtAUGpgFZR/W2
         yhmDX+8Bjz+UNOXLHjoYVZ+Qj8gS3dKvdVjMHW7E1uqWSoCXDvoOIrnhYYfPpd+2UkPB
         pnGvipg3/ig0y9SUh05Pk+qEoVbcNhJARwMdZk4UQod+A3ItwnGY3r1ysrk4XTBlk94/
         5w1F+6z/gZFMvJGR4kkXb1x4eEcs7SFAw4wrMnAoHPezvsaMBzf84kjMEQRowTdF4GgU
         P4dfxQqnE5GbiXjzDoRFh3lUr+66c4TR5QLzMsTNQVxPWrBVn8qLI6C/7hdQoV+RYma9
         eDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WTeenhelWj6XLk+u35uQz3AkixY1OcVSHZgAH3KuSvA=;
        b=YVbAqoJE+FRhiw7g4jQ7nHzLN6B5MV5T+AQBAbTHtF0Un5iYXOxo9wJ6hXKUYXxXLv
         JrGT2n+iY7CXLYb2j3YBJbOr5L/96rw4ijSaPtY8iNAaK8IOIa5H6D9HT3w6SlBuArnX
         NAJQs9IbB1cj+3sicngdbacQneE3Ln7+3b7pB84co+QRcOHk8dtm9Fxr5+Hp904Xy4W7
         fIKRcFlTpQvipUB5hgZ2/TKbsj5GljMcSAAOSEZG9KxopE4KS96WC56mrh9/xH/0Eu7Q
         PK22A019HEcVGyGyjT/c2iJclNOkDUh1MElNYjW1pgdBmreg+Gk6Y9J+8DUx5iA8Ekv9
         FVFQ==
X-Gm-Message-State: AOAM5323+UmzJ2/npa0l7Zr46dXV/iTYtCzC8yDqetI/4b/e/a8S3XlJ
        aLcGMwXFmgL/6iXbPdT/kE8cLxI3JfNznDNVDMRvpA==
X-Google-Smtp-Source: ABdhPJzZVthLKYHLcMFgWQZ1vSvzPBOAuAqy6Xm9Fe0Hkc37vSnfs5OlqnUf6QyFRkBb1HDWFTIqXYne5qV4u79Q1B0=
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr26990628ljc.104.1594480897988;
 Sat, 11 Jul 2020 08:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com> <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
In-Reply-To: <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Jul 2020 17:21:26 +0200
Message-ID: <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
Subject: Re: [RFC] GPIO lines [was: GPIO User I/O]
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 9, 2020 at 4:11 PM Rodolfo Giometti <giometti@enneenne.com> wrote:

>         gpio_lines {
>                 compatible = "gpio-line";
>
>                 bypass0 {
>                         gpios = <&gpionb 10 GPIO_ACTIVE_HIGH>;
>                         mode = "out-low";
>                 };
>
>                 bypass1 {
>                         gpios = <&gpiosb 11 GPIO_ACTIVE_HIGH>;
>                         mode = "out-low";
>                 };
>
>                 key {
>                         gpios = <&gpionb 4 GPIO_ACTIVE_HIGH>;
>                         mode = "input";
>                 };
>
>                 motor {
>                         gpios = <&gpionb 8 GPIO_ACTIVE_HIGH>;
>                         mode = "out-high-open-drain";
>                 };

These mode = ... strings are really just a big confusion for me since
they reinvent several of the flags you can already give to the gpios,
see include/dt-bindings/gpio/gpio.h:

/* Bit 0 express polarity */
#define GPIO_ACTIVE_HIGH 0
#define GPIO_ACTIVE_LOW 1

/* Bit 1 express single-endedness */
#define GPIO_PUSH_PULL 0
#define GPIO_SINGLE_ENDED 2

/* Bit 2 express Open drain or open source */
#define GPIO_LINE_OPEN_SOURCE 0
#define GPIO_LINE_OPEN_DRAIN 4

/*
 * Open Drain/Collector is the combination of single-ended open drain interface.
 * Open Source/Emitter is the combination of single-ended open source interface.
 */
#define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
#define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_SOURCE)

Yours,
Linus Walleij
