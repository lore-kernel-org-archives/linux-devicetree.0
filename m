Return-Path: <SRS0=Bobf=ZU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8C0C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 12:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C157D217D6
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 Nov 2019 12:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRYu0UXF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfK1MUo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 07:20:44 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43684 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfK1MUn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 07:20:43 -0500
Received: by mail-lj1-f193.google.com with SMTP id a13so5116736ljm.10
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 04:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qmf6jeZshq1jDY76loZcrxtrhAg7lwPCb71uVMENsw0=;
        b=FRYu0UXFOIpf1bWRYoJ1c9xHbXgvePCRjx4PZ5IZ5RV3Yz07xamodlI746hL9a9kcu
         oM/33Jk8YUVjiLAWEcliFiYtvfVwP69h8KPk0v0GARBdSoyaSNFtsfMYbyX7Dqk9AABs
         W2Ftf/w30gEOA5INs/fO0ChaN4+or7M8h5eE61FnIshjUh38nh7BbyelaZmeOAL0hi75
         emwPQn9+FGy139ZtDVsjT91HSxrtPW2QsuEAD/AhE5pO+wCEJ/YlJy2U+74OENsvW3gQ
         wNux0h4Q+8bJN52v8Cdk7gR/N9vmkXJYOwJ1h3c1h26ULVZ+s7IBMeExpJ8BhUSIvipq
         qocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qmf6jeZshq1jDY76loZcrxtrhAg7lwPCb71uVMENsw0=;
        b=XqixpCKiwU1wRnq9l7/3iRmoMnexBwXiNCE40W4JbmsyHT9gcIhfUESfEt3ahMkl+v
         19tppKY4u5t2bhlPKd2meeWaFm2KFqJBt+a6Vk4wbC1oqsxD7+ztLHOXLE53d3HJIY7t
         0ta4y9Q4gLVFrcTV1DvBjt8/7MT7ZOZ7SzZDi1Rx3iTjf7wUQ3QW+CueGNW+ODfE5afo
         YoFB6G9LbYKICUHSNwikEAth3g/SlRpTHOmjqWZWBplgrIQOIyPMFQv3asu/te3oB52Z
         Dhs/+fwOD6rQKh1VEhpN6o6fp8d1qUdU9wnlnO5cC2NdxwJ2DDwtU2fRX7cngtda8GKG
         +Vyg==
X-Gm-Message-State: APjAAAWMkLSCmpyjeV1CNuAt3ODRtAiwDzFETvpT5GJxygDN7o53y3VE
        C345+4C0QS3daMcRzoSyvsWUahx0Xa7rFrWMkhDIdA==
X-Google-Smtp-Source: APXvYqy5FIUKPl7C4nNCrIegY7/L/e3N0NOcZm89h/t+XCUHcKulKwvWZPZSi8sYlGYMiq1wU75t2SUzdLcDQIXtsPc=
X-Received: by 2002:a05:651c:102a:: with SMTP id w10mr5221499ljm.77.1574943641831;
 Thu, 28 Nov 2019 04:20:41 -0800 (PST)
MIME-Version: 1.0
References: <1574661437-28486-1-git-send-email-yash.shah@sifive.com> <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1574661437-28486-6-git-send-email-yash.shah@sifive.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 13:20:29 +0100
Message-ID: <CACRpkdY7fGvTPcwwC0XU+XN2w_QUCj0MmOYhp183P3Lj7Qw8WA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] gpio: sifive: Add GPIO driver for SiFive SoCs
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

> Adds the GPIO driver for SiFive RISC-V SoCs.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose Marc will merge all patches into the irqchip tree
as they are logically dependent? If you want the GPIO bindings
and this driver directly merged (no deps) then I can do that
as well.

Yours,
Linus Walleij
