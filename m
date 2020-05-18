Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D17DC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:25:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D24C20657
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLfcfSqt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgERHZP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 03:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgERHZO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 03:25:14 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480DCC05BD0B
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:25:14 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b6so8701687ljj.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A4X2qdsWrVq8ys2tL3BwSCqBZMXXWj5rnnEaJc5JZaE=;
        b=eLfcfSqtRDuc6tbg88OApOzoqUcIS4NG8GeiZWnCrgN+ybEldsNH1oGxujMdMe5Bzf
         9bter5swZM+kfB23l91tUOydEeSmenGgjwlIHMzPGWZnZjn80YKa/MhPyZgN4AZ6c+K1
         ZAPmMlZ3l46v6YcSSsLIqCv2e9sMbN6cuproPK+HqWPMNvN+HzOasHiI8ySQ7FbD/vrl
         16n7FLJa3FLZICDzHSVgoGMDLudAgYf7FewpKz/VQ7aM7FPhEiJa0VjIpuszLuqRVn09
         660pC6OZGCB8RP19vKSAvyGq7Nsjb/9WIQru91qiA2NxLdLMYd87kvRI1ka/402H9eHR
         njoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A4X2qdsWrVq8ys2tL3BwSCqBZMXXWj5rnnEaJc5JZaE=;
        b=GJtjqwSUyQK2nBk8hLwx+5NXCw1rUPWDNelOT0J36HIsnb9k97XGu9PlX9+Pe60dW5
         zSWeniVc/99/k7YdMJ62DHaWWrY75aZKGX9B06TCxssiQNRXUErp9WuYU7Aj80+T3RBJ
         iHyenC4aXoGB2LEp6utPxfSNK9fy6kp57mNKH88Kg+83N8apcajSt9HfQgL1D9HL+w2s
         R4p3khXo9VhYv60iirS38oCCV3D0V8KZQcVfjCbLvANighAEbRFbKAKZHgNUZ2+sm4Rc
         pyg/y56J9RPkdlJvLvA57G4oqBlzleJymjlt00kCe1X2aJYoJJ3P7sdLxG+y7lXOHNbf
         Qsnw==
X-Gm-Message-State: AOAM532CivK2cwQaoSOYHwipRqMWzPz3SnmA3rd32MtRE3VNOhVldM17
        ufxV1h9vCE4co1/N7twfGHcolstl4wrurVk0a0EpVg==
X-Google-Smtp-Source: ABdhPJwMZMkCfCW9raRwDJrjtwYd9CAK3CzuX6TpRrPy9cZjubvsZSWmsZiS6MCkoF/MQ2FSXPfidMfY+ruGlhpXcFU=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr9995860ljh.223.1589786712610;
 Mon, 18 May 2020 00:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <1589361736-816-1-git-send-email-jprakash@codeaurora.org> <1589361736-816-2-git-send-email-jprakash@codeaurora.org>
In-Reply-To: <1589361736-816-2-git-send-email-jprakash@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:25:01 +0200
Message-ID: <CACRpkdbcRQT=tK=jTbTvgoZvyzC4kSkkj2PK14nKE3WamVZz7w@mail.gmail.com>
Subject: Re: [PATCH V4 1/5] iio: adc: Convert the QCOM SPMI ADC bindings to
 .yaml format
To:     Jishnu Prakash <jprakash@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        smohanad@codeaurora.org, Kiran Gunda <kgunda@codeaurora.org>,
        aghayal@codeaurora.org, Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 11:22 AM Jishnu Prakash <jprakash@codeaurora.org> wrote:

> Convert the adc bindings from .txt to .yaml format.
>
> Signed-off-by: Jishnu Prakash <jprakash@codeaurora.org>
> Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
