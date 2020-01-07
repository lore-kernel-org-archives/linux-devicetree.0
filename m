Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20329C33C99
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 09:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E53D92077B
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 09:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ESsRaSk7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgAGJvB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 04:51:01 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33494 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727154AbgAGJvB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 04:51:01 -0500
Received: by mail-lj1-f194.google.com with SMTP id y6so46009246lji.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 01:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7lwQwuwfM1iPF6iRTO0yd0IE/lAHtvYOS2zEBwR6gvo=;
        b=ESsRaSk7d2JY56/cgt/nXnrxJgfTupQnEmZZv8fV6TQ7hRK0Q5KWNLW//AWecNq6h9
         Zuk595JfYWxqRW7TXSk1CndHashtdTijfRIWJPHdaW7xPsbvpTL1Y1BZ7Gn4nDMncf8+
         nAedTzlJLdg1/g+osMgihw1mhBQCjIFs9LiyOoAkli5A6O4Qkzril5A2CpjkA3ciGwWl
         AkjWUcUerXOj01PMyJNuFVH5BIRcJY0KA5GIK296ubZhlxOff7rpN1nUxjHNyEc3C6hA
         L+xdcykZQbzzmTl3/zW9ddGJoYMGRGpcG3WeDSQiHSC5+31ioGivnMVPF7/M4v8utBug
         0EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7lwQwuwfM1iPF6iRTO0yd0IE/lAHtvYOS2zEBwR6gvo=;
        b=pWNdcL0FS+u2bzVy2yUsyv3pw8zWhk9FPc60h1BqUB+Y4tZNg9WTcim2f+xoSbcC5t
         AJmiv8qQ6tT0gkf8aj65ZpUKzfCJ4DM1uYLEGj66gKChtLt/cXo9LozPo3TiABq+u6xE
         zMPbxzIo+gSNpl4zvsaFzprEyDvGdUb157rRBHmmcpykoNoSwAvah96Ge3asqDOOHlwp
         QqmbKCNYcZWivI6ux9Mqxi9w8W2QWCTOgcvQpMh16NCRvKMDIgxpj98e848cOxJTcoMI
         Wru1vSTSQhUeDQh28r8Toy40q7/iORmceifV7Wq86WIJiCuuJe31G0wIyD7PYDJC2FgO
         U7qg==
X-Gm-Message-State: APjAAAURnexwOsuOoMmlBrzrWaotdjHzN4JyadhWoFziHaO3tk6fjJmM
        pp/SNAjtG8+EUua1MJyufoxlFQXFPdT3oOLW2Ya3wQ==
X-Google-Smtp-Source: APXvYqylGF4/dGdkzkEMlIlEa1r7p28w7YxwevYK0M9wNzYKRMpP+8bfkSDdksAZIgT2FP8fUZHLxVLt/i4WOnPkXbU=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr60234687ljh.42.1578390659474;
 Tue, 07 Jan 2020 01:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20200107092922.18408-1-ktouil@baylibre.com> <20200107092922.18408-2-ktouil@baylibre.com>
In-Reply-To: <20200107092922.18408-2-ktouil@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:50:48 +0100
Message-ID: <CACRpkdZQUzqzHovO6qb7ExGFraTx8ovYgeAaYKADhZPH86hKBw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: nvmem: new optional property wp-gpios
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baylibre-upstreaming@groups.io,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 7, 2020 at 10:29 AM Khouloud Touil <ktouil@baylibre.com> wrote:

> Several memories have a write-protect pin, that when pulled high, it
> blocks the write operation.
>
> On some boards, this pin is connected to a GPIO and pulled high by
> default, which forces the user to manually change its state before
> writing.
>
> Instead of modifying all the memory drivers to check this pin, make
> the NVMEM subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
>
> Add a new optional property to the device tree binding document, which
> allows to specify the GPIO line to which the write-protect pin is
> connected.
>
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
