Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FE4C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 06:38:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D1022072F
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 06:38:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUVruPoi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgFKGiN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 02:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgFKGiN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 02:38:13 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2A9C08C5C2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 23:38:12 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so4881123wrp.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2020 23:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=h9/g3OLlPWijyvP1KuO9aQZyD9zG3rXcaVB4w89VOTo=;
        b=PUVruPoiB0A/W4svTxm7GVSR4dG1YN+TPa+bNlh3UZacTzsJSuuqUwUX4bwsp3Lely
         ASxTDl6wuhSgZOarrxAxx8FICf7hAf7X52rBFKQIVkWW8q0n2yFwsDeF01VUfJGKtNcF
         utJBOp6IoDI69SKUEnBKV9+Q/HOyTyoIjU16kbXlrwTYEcykMxlelfLaNcGuySh9xt2T
         1ZTKkdOr3czNBDINz7PYzvHrmf2itfCGWMg/ZLDftyjqYiEZE5Ym9sHoeR9H2Ixk8Nhn
         rJTf1QcGGvC3lUEsbTj1SoSC3yJ+XeftVmBUrbdIFniiPlQau3zwDT+JHZxo61yfA/BT
         /PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=h9/g3OLlPWijyvP1KuO9aQZyD9zG3rXcaVB4w89VOTo=;
        b=f+DP/9+J/E9J21SPCI2/Zh9YlzjjAOY8J0jn6HJ1fkB9N5KOxLYRb1A5dbmsce5Xjz
         Er+c3/DeHslUjpPlTRg25dGcOnjcjokMwS5ubIrAo1IeyHBSp5IFE0mfMRYBP7s5F8Xe
         O+hbIeUzGa/wTzcNrMp3vzNubIIJJDPJaxH871fW9KMZdgrKm+0g7/CI2xmEJPdQreWE
         THHI9r4n+0tBmcRhukeub8h9T/TC9jiSr0GyYgcMOXal6cz9z5YNKEISVsiezK4Gs23h
         VloHvmPUQOKZ6S2b/EEDe2y6PTjHJ6RzaUnQIeGwc6h1UGEc4xD4vu0L654HSObQLIeg
         fSEg==
X-Gm-Message-State: AOAM532Y9ZjuWzsIRHmMcJ7CZe981opw0fYsLIHp/gUEhP3OgmAF9WW8
        pMz+duEOPvq2NrOBW3hMBTfznlXPSbY=
X-Google-Smtp-Source: ABdhPJwJ6GGdUSF95PWK6acVorvArCdb/C7RGrbCcYZz+gm/V3GugbZmXgsyKMl74ZLpxctA64b1qQ==
X-Received: by 2002:a5d:5489:: with SMTP id h9mr7521008wrv.125.1591857491567;
        Wed, 10 Jun 2020 23:38:11 -0700 (PDT)
Received: from dell ([2.27.167.101])
        by smtp.gmail.com with ESMTPSA id x186sm2657865wmg.8.2020.06.10.23.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 23:38:10 -0700 (PDT)
Date:   Thu, 11 Jun 2020 07:38:09 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>, arnd@arndb.de
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] dt-bindings: mfd: Ensure 'syscon' has a more specific
 compatible
Message-ID: <20200611063809.GW4106@dell>
References: <20200610194625.3597460-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610194625.3597460-1-robh@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Arnd,

On Wed, 10 Jun 2020, Rob Herring wrote:

> Using 'syscon' alone should be avoided as compatible strings should be
> specific enough to identify the exact set of registers contained. Update
> the schema to ensure at least 2 compatible strings are present.

I'm assuming you're okay with this?

> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> FYI, there's 43 cases of this on arm32 in my testing.
> 
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 19bdaf781853..af7a68051392 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -43,7 +43,8 @@ properties:
>  
>        - contains:
>            const: syscon
> -        additionalItems: true
> +        minItems: 2
> +        maxItems: 4  # Should be enough
>  
>    reg:
>      maxItems: 1

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
