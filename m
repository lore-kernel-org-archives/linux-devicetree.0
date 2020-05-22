Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACD1C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 07:37:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E1F8207FB
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 07:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWQc1utn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgEVHhw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 03:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbgEVHhw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 May 2020 03:37:52 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06729C061A0E
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 00:37:52 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e16so9148949wra.7
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OoldvHVpRxJWz04Wv0lGmaRnV3/coogwvzF6ciZCusk=;
        b=QWQc1utngkxkmgE3Q2u4PTwJqopYWiCbwEsGAWquR85cj0X8RjK1xI8yGXqbI7jcyZ
         A7I2kbn65YVRKjJSF/AFeyA4vxnoWX09E1TmCoJFPJnDI1loZx5j4NMh70Df8bXEz0ue
         vTJx15lf1ZYaGAvc4aMYciz4SovxxdQAWHTuEm2oHIXADiPVf3cSpVfQGhuoA5CDtx/S
         OgsJgjynh6wi3beJ5Oa85dFoie+UnAIF5cMSTj2A3m8d5UTVPLX/Od6NZ47RLKMKD49l
         be+/5eFuDjHwPfJ4doYfPk/M5s6VjxS1iBiYXGnfc85uZIUTLhi+4N/SNM+uWfGAe8rj
         geyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OoldvHVpRxJWz04Wv0lGmaRnV3/coogwvzF6ciZCusk=;
        b=pRf3dVxntSlbT9yj7IUBqdg32SVo5XR0dorn+Q76qRei2xHaud25WroOw5ogZAVOGA
         F/BGTEaPO518cjTmKTJxWmBWNQo7SnVGiwmhClshzZceXAlqxaKlzWeW4ZUNpF4sPkps
         BA+l7Lzv5xMJDlAhOkzM6kNQlXARCenXcI2RNWvLFTpdLKh8tfPevkggZV3cdDzX9IHp
         LDjfRg+L55iuZ3xuDOEUs/rIXX0mINpRDHGoUk1VnOiokyUT22xakUWx4ceYi8s/z3en
         G2eXe1FVfQ/qENBQcwlXwhA/UanHTDC1tj/d95JTSnz6dh8rV/Hubpi/EjhJZ30+Yd7s
         g8dw==
X-Gm-Message-State: AOAM530Nmy70x/lu7Qv2mU8foo9QDZvdPvKNKDF+APfG2ptpkpA9Sstf
        Rtn2NxloUqLWpGZOVJwT4GYAxQ==
X-Google-Smtp-Source: ABdhPJy+uDhQ+H8wIBCHXhrT0yMPXls7Yet6TUSGGzWvvHeOOpFgwvBPP6gqkrxYEzHQ+kF+ppxoFA==
X-Received: by 2002:adf:e441:: with SMTP id t1mr2452196wrm.347.1590133070748;
        Fri, 22 May 2020 00:37:50 -0700 (PDT)
Received: from dell ([95.149.164.102])
        by smtp.gmail.com with ESMTPSA id y8sm82930wmc.37.2020.05.22.00.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 00:37:50 -0700 (PDT)
Date:   Fri, 22 May 2020 08:37:48 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     matthias.bgg@kernel.org
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add MT6397 Pin Controller
Message-ID: <20200522073748.GQ271301@dell>
References: <20200110145952.9720-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200110145952.9720-1-matthias.bgg@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020, matthias.bgg@kernel.org wrote:

> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The MT6397 mfd includes a pin controller. Add binding
> a description for it.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> ---
> 
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
