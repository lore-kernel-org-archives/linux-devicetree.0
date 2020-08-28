Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0B4C433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 10:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E18082086A
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 10:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4hN1Tm0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgH1Kqd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 06:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbgH1Kqc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 06:46:32 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFF6C061264
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 03:46:31 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t2so511645wma.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fr2XPTbb6uJ/hq9c7/mXVKuaGQwKQ0+oiK3MtSt/kQg=;
        b=U4hN1Tm0REgz4NOpbgcuzzNicvwei0MAJlj3ihuEPnml6BSbPLb7j6UffbH5apk+qq
         uDKTGYfmyzULsSDUBVQT99Ch8csgcpdiWGOteVvQflVny3nXPvvyAWx2LADPfPRP0tgZ
         drGoBKKJGFRAHm9giPsUrl2z92l6LdI9pm6buuHTaSZe0pFwvksf59m1Y6TUsPXTlBuX
         QY9qSda0RTvKuwIWBWtUn6H891LsaJWa9f9GxsCsNMSY4FdxP6fTfDfwlLe9EEWaSCCF
         kK5nYPmltaBmDF0ivHn9oUG5fzSYnbFQ3+RFhe1wspIRrTD6wnbVqlShM+ku8rOlsEM2
         jvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fr2XPTbb6uJ/hq9c7/mXVKuaGQwKQ0+oiK3MtSt/kQg=;
        b=ie/GRtUr2CMsS9lrU+QjYxtSM4Rno+Cc5/0SGuV4k2Hnvs0HW8ZRjNmaoXtcQOIRQB
         ZcF9M/lvku8rtdyQWiW/iqzyBxT3UvOsvMwrjRY6XRT0yqloZ9yFt0iMbbthCSvtZ4jq
         2QxdIv3JIEAocbu39MSaeo9ZGgXXQbj6gzIu96W0iG5r9j8nV7lLcawLBCOXnixHElLq
         qPZZkUkuf7ATKi1uL4cH+Y6FwBefBwMMZqy5r4zDJlvudxj0yQsSTn+WmBAZdZL+OG6G
         jjDJrc+H9f2DQAq7RJlNWx9ETVoxNxJAIT0deUDiQ5aBV5552eChBERfhoMMthpkXf5U
         Um1A==
X-Gm-Message-State: AOAM533lnHBUnVUeF0ZCEVzHWAOkKMPDGp78IynzCZGS8By9/FM2QM13
        xLYUi0TwzelKSb6rw4mqu4hZ1w==
X-Google-Smtp-Source: ABdhPJxK88OJlEN6LPQP5gymo5j3WJuk2tMF7ZZVRzBV4kodM8e/AuX/xxskd9ZnjYJGaNYn3WnVGQ==
X-Received: by 2002:a1c:e288:: with SMTP id z130mr1086967wmg.32.1598611590410;
        Fri, 28 Aug 2020 03:46:30 -0700 (PDT)
Received: from dell ([91.110.221.141])
        by smtp.gmail.com with ESMTPSA id d11sm1426226wrw.77.2020.08.28.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 03:46:29 -0700 (PDT)
Date:   Fri, 28 Aug 2020 11:46:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/3 v3] dt-bindings: backlight: Add some common backlight
 properties
Message-ID: <20200828104628.GO1826686@dell>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200819205150.164403-1-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 19 Aug 2020, Linus Walleij wrote:

> Let's use a common.yaml include for the backlight like we do with
> the LEDs. The LEDs are inherently incompatible so their bindings
> cannot be reused for backlight.
> 
> Cc: devicetree@vger.kernel.org
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop the | for the description
> - Drop the "default-on" property, we're not using it.
> - Drop the minimum 0 for unsigned u32:s
> ChangeLog v1->v2:
> - New patch as suggested by Sam.
> ---
>  .../bindings/leds/backlight/common.yaml       | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
