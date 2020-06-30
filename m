Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162B2C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 16:57:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE0AE20768
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 16:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFqYuhFL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387979AbgF3Q5E (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 12:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387966AbgF3Q5D (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 12:57:03 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D914C061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 09:57:03 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q15so19489885wmj.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 09:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F1OVcMRdH7pfFMyxoqH7cO8CnvCQwxHqOdJ8t5mlJ+4=;
        b=RFqYuhFLqVjsyWdGQ9GHbHyRyDnPG/M/cqmGqFMCIwjdRLdiVpGrYhpUoBD0qH0TjP
         m0BPgZ4VdFm+LloP3pVQQba7mNsNLGh/bBWMKgAmKZp841rSctvs0EjosoBY2a9TyAuq
         TcD8nZt4GVrbsrp7huNpZCQHENgKUZXHC55w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F1OVcMRdH7pfFMyxoqH7cO8CnvCQwxHqOdJ8t5mlJ+4=;
        b=F6+g2NyvcRFh4sSPB1GA6cDnyjf9kPDiuMc/H1mIFWg7LpQt8QGHZp8aGyy7SvjYad
         4kJ8n3u5zOs26mAoZaaO63icJswZmObaEERS6M83LrtBAfOUxJ8vdq4oZ2gBJjiI8fhW
         0c8xiB2TThXqdbWJO0Bg/zgpWPpXryUWqfX9w9cRqk+KG5BsDHj5EzmJDP7T54IdmYXf
         PK59DrHhlA/MHcvJnVJ3yQ/dtZYeKRlPsopVrkcth3Nb3pupvO4BmTQBBPB95yimpCMX
         1q1xN/uBMOUjEfNNQQiodR5F9KNR9z7bBkWbeTU57p62GJzC7RAY2a1nQxlth9SbI1rf
         OB2g==
X-Gm-Message-State: AOAM53242QAIyDRLb+z9dxZJR14hnnDKpSo9iSyHFIjEt6p+noPBlgVT
        b+SXX8rPju2QYyFC+Flei9A5XQ==
X-Google-Smtp-Source: ABdhPJze1CyJQ1QCR4KBTWFIsYVngiTV+R7vUWN3M7L2nNrUKSGogwkdt41fB1NfGMtkkwTqs4kipw==
X-Received: by 2002:a1c:2183:: with SMTP id h125mr23738626wmh.83.1593536222373;
        Tue, 30 Jun 2020 09:57:02 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id g144sm37289406wme.2.2020.06.30.09.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 09:57:01 -0700 (PDT)
Date:   Tue, 30 Jun 2020 16:57:00 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V9 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200630165700.GB1212092@chromium.org>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200630062211.22988-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630062211.22988-3-dongchun.zhu@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 30, 2020 at 02:22:11PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for DW9768 voice coil motor,
> providing control to set the desired focus via IIC serial interface.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  12 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9768.c | 554 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 568 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9768.c
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
