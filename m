Return-Path: <SRS0=/Yzg=6L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A18C54FD0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 06:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6FFA206B9
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 06:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AHVfPSJU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgD0GwF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Apr 2020 02:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgD0GwE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Apr 2020 02:52:04 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B309C061A0F
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2020 23:52:04 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k13so19131330wrw.7
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2020 23:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=EIB3VdkI8fVX3l95tkKy+nppgtYiZaKNgkS8LAOlw4A=;
        b=AHVfPSJUZf+QJsjVvjCwdBF7m2L4ptglPzQhC+23gfeQct0+PhYjvev2C7iAWxwykI
         15bnmTuY+B2wOFJG0AZZY/8pwmCqj3a9HXZkoF3DAPI7/j4e7IxjWiUkceQ4WycjRjS6
         Lt3JAs2IZwo6uyaz52Tcur7HwXOb+BOY12BKtxcrblw0RFrTakWIlGehPCRKtFeX8lSp
         in8yH/ZccVfeG+5cJ8+SoVox45AJRmUFRFCqaXNJMkYtIgfETb2oB4/YUcsxiaYoRZ7v
         QgEhhiiR0yqnmbVbKxdD1tyVcrRstHT34xyqtm+wwPLUDia0OINT9rjhPTGgUsce/nsc
         jx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=EIB3VdkI8fVX3l95tkKy+nppgtYiZaKNgkS8LAOlw4A=;
        b=dzJ7Xftu/elac95bF1cu+IKFtCQ3GtjQGXqgHbj6fz/hFJSzAQlJYO0sg35uDHlGQQ
         6mMWkO06tcm08WCi2o67SfyxYyUsQ+2eNRDvIBmdj126CPnZIFfy+EVb1xXO6FSCeyRP
         aKNkxuJl8Oh/HLqdI0e+3EQu25Vg7W2+afcgycuiIgM4Iv9NR7SzIkZhDitVUV9vVC4t
         5PVg0fWSFSHAPslT9KmE7+Wcj5ij0g9td3uuNHGy5RerKc01eHL1svPNHJW5ntabDXMS
         9zxBqGB4k4nSQ8ZXCRzVBScB9ge+wrkt2l7yX5Fz8+gcX9dhPi8Zanr7HN4wGqf2AnRb
         sQ2A==
X-Gm-Message-State: AGi0PuZdWf+VX9Ezr2f1P6kYiYjnzR1dooqu1pE/jjOeg5y3CfuIntDm
        uABrY1GOnGpdNVG+pB8T+0UNUw==
X-Google-Smtp-Source: APiQypLlaPI25q7cshGnBNY9UcYOX5Uf2VJNg8/zQNjOmVTQ4N1QzqCii2+9phU2ZsvgfSVkPJUpIQ==
X-Received: by 2002:adf:82b1:: with SMTP id 46mr23819046wrc.44.1587970323029;
        Sun, 26 Apr 2020 23:52:03 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id n2sm20270483wrq.74.2020.04.26.23.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 23:52:02 -0700 (PDT)
Date:   Mon, 27 Apr 2020 07:52:01 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix erroneous 'additionalProperties'
Message-ID: <20200427065201.GD3559@dell>
References: <20200424161708.2906-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200424161708.2906-1-robh@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 24 Apr 2020, Rob Herring wrote:

> There's several cases of json-schema 'additionalProperties' at the wrong
> indentation level which has the effect of making them DT properties. This
> is harmless, but let's fix them so a meta-schema check for this can be
> added.
> 
> In all the cases, either the 'additionalProperties' was extra or doesn't
> work because there's a $ref to more properties. In the latter case, we
> can use 'unevaluatedProperties' instead.
> 
> Reported-by: Iskren Chernev <iskren.chernev@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Saravanan Sekar <sravanhome@gmail.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/st,stpmic1.yaml       | 2 --

Acked-by: Lee Jones <lee.jones@linaro.org>

>  Documentation/devicetree/bindings/regulator/mps,mp5416.yaml | 1 -
>  .../devicetree/bindings/regulator/mps,mpq7920.yaml          | 3 ++-
>  .../bindings/regulator/rohm,bd71828-regulator.yaml          | 6 +++++-
>  .../bindings/regulator/rohm,bd71837-regulator.yaml          | 6 +++++-
>  .../bindings/regulator/rohm,bd71847-regulator.yaml          | 6 +++++-
>  6 files changed, 17 insertions(+), 7 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
