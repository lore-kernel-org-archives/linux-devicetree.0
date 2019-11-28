Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7B0C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 12:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 223CD217F9
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 12:18:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9He/jdZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfK1MS1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 07:18:27 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45732 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1MS1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 07:18:27 -0500
Received: by mail-lf1-f66.google.com with SMTP id 203so19881075lfa.12
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 04:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+9HaPIwDGWIORg/ZtcvZAIKmu4aZIOqFrtCVzv15Uo8=;
        b=P9He/jdZelhAF63c66JOtESkD9SWLHGoK4fcKXecnAKf5ycE/xInVMP5Id/tMj3hH6
         Eot7YcHkj6OIenHQPCoyPdDUMMGen9pcS+VlrkT4DTKC4AybqCnhpzdjooSoRj7PVtHV
         ECHxDrBKPIoRWVvwdJu+FH9TbmcBCA7YyDG2L2Rcfld6g7X6DH1nXRnyvIXtipPtyGu0
         OIJUACG6vpMSL4VRwwpCnhSEGh97UwtAOzcrV90ler+nsjpdHlOmdo40cQk2SkGDsGG4
         D5C017GmYOZtYttdL71Ygqefe9MCirKwDf1Htcj8o/01X5bZAL7OZv4XkVAUxYzWfgqa
         Z9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+9HaPIwDGWIORg/ZtcvZAIKmu4aZIOqFrtCVzv15Uo8=;
        b=fQHAccXyqgFvZNTCK9xfhwP68Pm2PyK+siX16WPsZMSkn/p0ALBgaPhRYJ1OGGawhD
         trHJTJ3QJbFqlfjR/4wrjHdddP5uT9cYvXRy00M2nESxwSPM1UydJVww9pdqDkNv6mhY
         +ZjL0ngOV/HJLHOIxIOnCAbIPXc7nBcmJkWCjYywgHAor3rf3tHU6iUZ0MS0tGIEC/O9
         d9+kUEUWq8RSvtngSJRYI5+lX/nuFFgT6RyqETsAtK01d+zH5AtW6RjuAa6ot/qljx3c
         2YhU/C7vDubRNFO1NJEiRxyWwVNjv6ODwR8cicN+EjcUEaYkRlf5bI//lPVEFCQ78nb2
         QLzQ==
X-Gm-Message-State: APjAAAU9vLXELkLsUVelwpQwzh86vlZ7z5l06+qVze6TrKa+uNO3GgpQ
        wKUXyQSe8Be70rWqG9olgySQP5hkbydFh1JfoWhETg==
X-Google-Smtp-Source: APXvYqwfcdHhm4gyrSY0PXoqGz1WH61ou574arqZCBcFKymILHOQyJwQZjM0A1Ke/HyiK4TldEM2Asch76SNuXwaHnE=
X-Received: by 2002:a19:645b:: with SMTP id b27mr21863272lfj.117.1574943505250;
 Thu, 28 Nov 2019 04:18:25 -0800 (PST)
MIME-Version: 1.0
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com> <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574661437-28486-5-git-send-email-yash.shah@sifive.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 13:18:13 +0100
Message-ID: <CACRpkdZt53578c3tWFodq6-HwNzc+gp6mc-n-8-GKkGyy61JKQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] gpio: sifive: Add DT documentation for SiFive GPIO
To:     Yash Shah <yash.shah@sifive.com>
Cc:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 25, 2019 at 6:58 AM Yash Shah <yash.shah@sifive.com> wrote:

> DT json-schema for GPIO controller added.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
