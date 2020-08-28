Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F869C433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 10:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EA8C208CA
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 10:47:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRswwJZF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgH1KrL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 06:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728709AbgH1KrC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 06:47:02 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416EDC061264
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 03:47:01 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id t14so477506wmi.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XFv2zJtQ6cpr9KnjOo127uI+KnnsWZkOUj7ODN+RnUg=;
        b=tRswwJZFvnK6kR8NS1TeDYMHLxlrQVxK8CFHRz0wAIdRQtBjJwBd27tcETuYekq0j4
         JzIqHCIYEOcQ9YmVRAXyVDhqqO41MpaMVwrKJk4Z6bc8vLSylyxOmdE4iaHcgrzurXW2
         A3xflxPkWU8LS2dkkX/PH9YfICArRFTobiX2fs9Ox34nLv1Coi7GTYuRSpcyLnrwGmOk
         a/Cd0EAYDQ7sXE25xmcPHJ09OfwfUriwmWNfRK7JtrEx69oP034uQtAHssrcFlKaPEJ1
         qCFaEAbJUvs+V1uD5s9gsrIYFS7IzZlBCtVVJh8/Bk57D5YqziPUtUDW3ijPxNZtuuPi
         ZgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XFv2zJtQ6cpr9KnjOo127uI+KnnsWZkOUj7ODN+RnUg=;
        b=XA3yJui2Un1pWsjQGf4RosFz3COKRlOu9znLdvjG3OVTT5fv2MSPdvDO3DaXVqB0Jw
         8rjiaZLHOB8iu1zuJteEb7z3DHQEirLUElEYoDP4kX+tuVqq6GhsheiQKQp8Ll1Rn8BU
         u8pGh4nmPagO0aKecs5+wcGRSp1QnyGIiBbvCsM3nwW5Je20nwBa9c5O9jG/R8jE6QdW
         qPG4BqpLQjOUMpqQ8riaX62ot2TPmewAoTX28iffJffo3CDpU9IufV9a+b/TKOcjnqLD
         5kwVYIO3iLOs1ugomB3QgCmsIjYuWeNjfKRG6QgrBcHE03XusT7cK2nGt6F9nLAnABLz
         Ohng==
X-Gm-Message-State: AOAM533acTu5DY3mK0GEdBT4YB8KiudXuxNr2dxFkBztC5HIo0P9G47O
        l1yU6vEk5H4fcaSBRsmCveTEvA==
X-Google-Smtp-Source: ABdhPJyGYIZPQow3V9t5Rn9M66KvHmQXz60hxgZUGEWHyfJSX/z+MXP+DLNHm8Ytx6wFCXKbensuYA==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr1063532wmh.31.1598611619922;
        Fri, 28 Aug 2020 03:46:59 -0700 (PDT)
Received: from dell ([91.110.221.141])
        by smtp.gmail.com with ESMTPSA id q8sm1319986wrx.79.2020.08.28.03.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 03:46:59 -0700 (PDT)
Date:   Fri, 28 Aug 2020 11:46:57 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/3 v3] dt-bindings: backlight: Add Kinetic KTD253
 bindings
Message-ID: <20200828104657.GP1826686@dell>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
 <20200819205150.164403-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200819205150.164403-2-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 19 Aug 2020, Linus Walleij wrote:

> This adds device tree bindings for the Kinetic KTD253
> white LED backlight driver.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop the pointless cargo-culted "default-on" property that
>   we were not using
> - Correct the brightness in the example to something legal (13)
> ChangeLog v1->v2:
> - Create common.yaml for backlight as suggested by Sam and
>   use that.
> - Rename the GPIO line "enable-gpios"
> ---
>  .../leds/backlight/kinetic,ktd253.yaml        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
