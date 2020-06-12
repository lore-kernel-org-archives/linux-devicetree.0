Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5F6C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 06:22:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A303207ED
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 06:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHazt5Fw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgFLGWs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 02:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgFLGWq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 02:22:46 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E15FC03E96F
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 23:22:45 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r9so6989016wmh.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 23:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=r35/raZrWclZAQmDzK4QKGB4/ZtwPhHpA9L2VMxUYi0=;
        b=sHazt5Fwsvd+Og9/lqG/YprtOJYONjtaj7z08uneab2SJkRHMzqRUKn1v8POaYQOA2
         zHz0/+OMQvZIb8YYNsYmjNXYUPUgVEQT26KXtNg8vm/T9C8pQuO9BtKyHsEy+A0nfCFf
         wcB+W0Qpecva9B3Iw2Q3MHF53Vo3pji+WvOfnoyK5bsRzoQ/74XU/u706hSAF+KHHN4+
         2vvw63H0YZgUE0sNPAYF30qLixeRfwKACybBvfwfqwsCE1D2H1NN0c9+Ki/Uf/qcJ8oF
         9KvaznHC8ARcXKlWngB5c+c6s0RxHKD9RZQp5zggoTFa6q0yiNODbR3fdxPaP2CtgGDT
         yiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=r35/raZrWclZAQmDzK4QKGB4/ZtwPhHpA9L2VMxUYi0=;
        b=g6Mh6Sy5phh9Ls7BGtXVup6A8cAY7ziKzHTLczteBOlxd91QtOKSjhYvaKeugdannS
         CwgRtt/QFqPzTIaRsIDDKMzeMU0nQVrQi0PWq++1mDdqS+euqpFj/vI1ci9R0zY2zf+R
         zeZx9il9ycBXOQVcF3+l5NjimVHSBCpss5KxeEJpvjourewbMTXZ99cZG82h5vcUR6EB
         akWsNXXmPquG9q2dI18Ke3cax5+Z75JTkMFW+cY7Xf4oqhq+Vb/EdE7T13meyBB+HWTC
         Up15U8ZBfagtpP0ZCd/qYsjGN/XZ7Tky205nq01tRfHvhL08ojq8KdvfjdTgQSVp5T9U
         7AtA==
X-Gm-Message-State: AOAM531yma49o+ldilTNhXPee+7txHHOaib4qCQjRopt4Oz30cJm7wbz
        dLirSeBZY9e/dcTios1ovE7oTw==
X-Google-Smtp-Source: ABdhPJyMZ7jdqnrLlGWZOxx1xPXmlGZ65EoGe9atgpeXrfY05P+k4z1xx3SC4VvX1avfKNeZJIy8Ow==
X-Received: by 2002:a1c:c2c5:: with SMTP id s188mr11700526wmf.18.1591942963832;
        Thu, 11 Jun 2020 23:22:43 -0700 (PDT)
Received: from dell ([2.27.167.101])
        by smtp.gmail.com with ESMTPSA id o18sm7463231wme.19.2020.06.11.23.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 23:22:43 -0700 (PDT)
Date:   Fri, 12 Jun 2020 07:22:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Robin Murphy <robin.murphy@arm.com>,
        GregKroah-Hartmangregkh@linuxfoundation.org
Subject: Re: [RFC] MFD's relationship with Device Tree (OF)
Message-ID: <20200612062240.GC4106@dell>
References: <20200609110136.GJ4106@dell>
 <7cf94809-7346-31bc-877c-679ecc4d9710@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cf94809-7346-31bc-877c-679ecc4d9710@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 11 Jun 2020, Frank Rowand wrote:

> Please add me to the distribution list for future versions of this.

The solution patch is already on v2.

https://lore.kernel.org/lkml/20200611191002.2256570-1-lee.jones@linaro.org/

I'll bounce it to you.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
