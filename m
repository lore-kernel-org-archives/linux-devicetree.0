Return-Path: <SRS0=y4GH=YY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6392ECA9ECE
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 08:58:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A25720873
	for <linux-devicetree@archiver.kernel.org>; Thu, 31 Oct 2019 08:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sjxcXNY1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfJaI6t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 31 Oct 2019 04:58:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36702 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfJaI6t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Oct 2019 04:58:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id w18so5313134wrt.3
        for <devicetree@vger.kernel.org>; Thu, 31 Oct 2019 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=mM5JWFj5/j1kMfO0LYYDWqFAXV7BHBUBoAurAtsh+vs=;
        b=sjxcXNY1tNdgNLsdckLy5C5ghG1YOXnEJggZIwKLSbYHASKZ0ONzEsR8o2/z4bNoP3
         9Teai83oT5ZDna4z6Nt0jrz+QGFloBaBOr4xleRjnZCXPGaTaASxPAEgS3gkaR4UOUim
         HgufBrfwRfalglmkFZFdGS+v8blf8XzFfWvbg9zbnzix7ZdBQFQZj8/iK8td64QFmIqn
         YUWxnRz3USDGpylVcwrFMAUKt2ahxOCdzQnhRrLOxA2Bslx3GIlT//nu0z++uJRYxUWL
         Lb79ddtanLSnRnJjuVuxNA8I6VQTpjKBrL1O9ccy+PzpYaOgjKdplScT4ZxBNKagFyia
         PUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=mM5JWFj5/j1kMfO0LYYDWqFAXV7BHBUBoAurAtsh+vs=;
        b=O0t9HA7axik3/Ix989bMHplVRHc6Uz5EKOqn6ZouVzjMCME15Rk8m/IrWvtaPQXaGe
         ixTWsWMnt0ee/svmcH0zqABsGjgN4gbSXcVx5ygvmQaKaWyGciOGzKRl4+82aro/C13n
         w1kziLPlZtvkEe0Pyvx8FWZFtJxjDhWFvFLn2X9B1b2VJdbh9h/nkF91gm8eG/G2S95n
         l/kEZl1wGLgtUqfFbN3SQit7/WS9d4UJhvh6GmrByv3wYtxUnF7/w7IBvxZUXk1urARf
         bi/giMEkqF362y4s85ycxvqphdnCKyC/zOxTfM/7o1yaYal+bRlhrfMiIxdxwvba0aqm
         bzZQ==
X-Gm-Message-State: APjAAAXCBW+YzQ1suvDxae9FJT/TlLlG4QyQiRc3hYUVIuGIc3RyJyCp
        yL8/7Mt0xdLzL3SPtP8o3L0xfw==
X-Google-Smtp-Source: APXvYqxdn+1tmOLx8ifp3F1PxxrO/zj4IhisAc9DnkIGdD19EJUgI1oKHtPcrdKzBLR3SbDRmKd/OA==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr4389080wrj.284.1572512327362;
        Thu, 31 Oct 2019 01:58:47 -0700 (PDT)
Received: from dell ([2.31.163.64])
        by smtp.gmail.com with ESMTPSA id a206sm3494167wmf.15.2019.10.31.01.58.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 01:58:46 -0700 (PDT)
Date:   Thu, 31 Oct 2019 08:58:45 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V9 1/6] backlight: qcom-wled: Add new properties for
 PMI8998.
Message-ID: <20191031085845.GA5700@dell>
References: <1571814423-6535-1-git-send-email-kgunda@codeaurora.org>
 <1571814423-6535-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1571814423-6535-2-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 23 Oct 2019, Kiran Gunda wrote:

> Update the bindings with the new properties used for
> PMI8998.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 74 ++++++++++++++++++----
>  1 file changed, 63 insertions(+), 11 deletions(-)

This patch no longer applies.

It looks like you dropped the rename patch.

Please rebase all of the patches in this set on top of a released
commit and resend.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
