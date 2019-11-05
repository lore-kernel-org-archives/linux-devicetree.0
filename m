Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC61CC17460
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 13:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A89B321D71
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 13:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htgooDky"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388177AbfKENZt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 08:25:49 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36417 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388938AbfKENZt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 08:25:49 -0500
Received: by mail-lj1-f194.google.com with SMTP id k15so9703561lja.3
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 05:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oP2Qg5DulasBMIF938P1Bp5KL5tW1M0zdz+2GVaj+Uk=;
        b=htgooDkyaSv71Ti+556eAKWXlqMjpxkAkSOki+vleaBb6Av+WzlFduwJhyDFzZZxOZ
         0RyJiO0Z7zhxnuLxk6elZgul0SSMAmNWjfH8yz3iCC9YaQFHYrL/y/xQp8RdE+vT9e2E
         PngH+tXC+ktbnz7hEgGDXmhwX43XFwEqyzK+mv2tBGLw38RDkA/zJAVke51imLothgPi
         1GtM7Sxz+UvM5Iw2d9/g4J9unmhAExVIZ9sIALS8Yi0mhIp2PydULQBs7JnM1j0ZTzOi
         uPwTifHGSQadVDNDCxtIoQNt23BlJTEfXTi9ZSDdZmNio9+GMRgThfeecurQ1kgrdiFb
         J06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oP2Qg5DulasBMIF938P1Bp5KL5tW1M0zdz+2GVaj+Uk=;
        b=idIBNvJfyb6RVpmk/VayLvif2BwgljGZMAphKuBqUec57B0WivvsW2p78WjA5mY+dg
         8WhH8sIdDSA5q/n+XxMAFz4det0G8KIdgeKaYtzz8CJ7V5sI2+kTCkahFU+nFSEGEbpD
         vric4OyqTvN9Bhc8yCPmK3CT903EYo6XcrkMP0bsQs8OHghCCSVH2LJOLuFvK7ZP+4XC
         XyrEJIAlnQ8Z6EI9UIfCynhyT66ggWmIIY0chfYub8ziZQgd2Ee04auNMslaz964iZtF
         tc3hFR+FdPr8+KTlYPgAhX6Tzr3Oqqz9NAKyClb6zjLo2TU4MN9U+kKaUJeaaLE81LMq
         TYGA==
X-Gm-Message-State: APjAAAVuL9TfVgBqO5J/GYlJ2ud+Gl3gcLFFRr+sUW7ic+476AlB1Ldv
        05Qm1jT+VExlhPAkZ7sYwdVGAie7K6WB90T7ktITug==
X-Google-Smtp-Source: APXvYqwGVvtw2JLHo5RcIlsIMDfC4bj7A1mhDFHbnNes729TrLIAwbe19y/dMBfnRaFx7NDuYWTABRX2z5TR4cfVNKY=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr23474840ljm.77.1572960346944;
 Tue, 05 Nov 2019 05:25:46 -0800 (PST)
MIME-Version: 1.0
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-9-srinivas.kandagatla@linaro.org> <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
 <4f0e22ab-6aa1-2ed1-a85b-fb66531e0b2a@linaro.org>
In-Reply-To: <4f0e22ab-6aa1-2ed1-a85b-fb66531e0b2a@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 14:25:35 +0100
Message-ID: <CACRpkda2CdbPe7jsomZSxdJ1wE65OmNYDsZNj1OmfzdvG4kWng@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] dt-bindings: pinctrl: qcom-wcd934x: Add bindings
 for gpio
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Nov 4, 2019 at 10:35 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> This controller just has Output enable bits, No pin control properties.
>
> As you suggested I can move this to drivers/gpio in next version.

OK perfect, thanks!

NB: this probably also affects the compatible-string which contains
"pinctrl*" right?

Yours,
Linus Walleij
