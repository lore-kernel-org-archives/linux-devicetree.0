Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248B0C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DAB502465E
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:33:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ups+DeAF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfLSIdH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 03:33:07 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42195 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfLSIdH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 03:33:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id y19so3695052lfl.9
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 00:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pKdZfjZH2e9GPk64PhPrvn+Af7qtk63t1BrhD8ePLsU=;
        b=ups+DeAFHChjjhe00lTLkddxXH/4Fj4vJxKQxTZyRQUhNa5WYcT4QLFVaOYgIG9r11
         XZjY6i2KSGElJ85ll3SVN9fSLBUUnDpLdtvHv6ij7Kx3Kat91MkOSlk73ASzPJPqAAWA
         IYhXOv9N59rxPghhC5IaLpRXKdjN0DeiNFlNpWuvXHHWbYuNXsZZUla0UsCKpd+r14z7
         0khEuAjteuDiUihfU6aNrx6+5Dgs+XNpoqFSm90V60ro55cP2ZDIgMW90B4N2AbZ5Wf+
         l7euIyQ6SYTeF8sXuKMX3kooTwhq+MOUafqIzgO3OQgdIh7ek+W9F33brCanGDw0CfL5
         bOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pKdZfjZH2e9GPk64PhPrvn+Af7qtk63t1BrhD8ePLsU=;
        b=AYbUpE6HNFpVCZt4RO4CEb315CFtvtCvJT52lz2BhcDemK3/YTwim4NSVJDC9+XC7a
         dIVxdgPnAOHHCwniyiakSj7kcxR2/sAKFgu63GGJLF3TnQoTa+4X83oViZUlgORySEoZ
         pSyIEOxemRdxLWEljjRW5TAsp9ZfGB/1IFo7RMl4GQatk0tlxogm0HOP8TVqRXnt1KXr
         /dz/fc42lrhEjTaQDqCddMSlAhb8AVZLUdFJzV8RUEf4toEDgqW9D063KLVnYCPdalkL
         bsJqiX1HLQjDg60fzALBGDqIilZxKXJyzbkd1kwkDWYfdlVA7zCAcd9lTXFXEJKVBnRh
         6e4g==
X-Gm-Message-State: APjAAAVQOdbWq74kxhkmzkMxz5lKrn3myi9ILw1ZWLnqifK0ApBxvXw8
        Y3qXcmuRA808IpljVL4vJxi9qie3uB97sW9k5dRzgQ==
X-Google-Smtp-Source: APXvYqzaAgCVHUdj5DNEslSqFxuU1AVBFaR71PPbkZqONekNTb+Jgw52NqXDCfJNyzkThI+t+ljGL6aObMtlDFqv8Ps=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr4543811lfp.133.1576744385217;
 Thu, 19 Dec 2019 00:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20191219041039.23396-1-dan@dlrobertson.com> <20191219041039.23396-2-dan@dlrobertson.com>
In-Reply-To: <20191219041039.23396-2-dan@dlrobertson.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Dec 2019 09:32:53 +0100
Message-ID: <CACRpkdbNZMfUtpYXEJVNyHA+TnoT_vAnR5c++_LDZ3XADZYOkg@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: iio: accel: bma400: add bindings
To:     Dan Robertson <dan@dlrobertson.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 19, 2019 at 5:27 AM Dan Robertson <dan@dlrobertson.com> wrote:

> Add devicetree binding for the Bosch BMA400 3-axes ultra-low power
> accelerometer sensor.
>
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
