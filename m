Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6930AC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 11:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 498E0206C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 11:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aQl8hp7A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgFKL6r (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 07:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgFKL6p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 07:58:45 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D495DC08C5C1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 04:58:43 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g10so4714058wmh.4
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 04:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0sNtpOa/PhRGjuV1OKVRTYfWbvM8AAbQMK//m/+CB8Y=;
        b=aQl8hp7A/JrN44Foty0jhdQAQ6zaHhp4Ec9iQuIy+6hb35sfhd5Dvo9niTT1K9Fl6p
         a/mZjwflMmDp0dgwfFRSgPDbxYlAZPatZ503QI9Sp7YvqFpsu5rzm0yoePu4yaUrjpeG
         Luy+nejClJAIU6AXcKGO2QAjU9OpjnKXHlzqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0sNtpOa/PhRGjuV1OKVRTYfWbvM8AAbQMK//m/+CB8Y=;
        b=YLeNJ5oglDwVRvJmulV1He9wY95fh+H2R1r5swPD7rELnLB9fnW7rfsWYOqihjqthS
         tGWEhgdtXVbJe5BleL4OBr6EMNiATwJIIWpzHF22n+XMXUm0hpbtsLEiWOBTGk7sQqDW
         U0ij+Jau9ZhN6qimP6HkgfL1ilLH0FDGVrRUIfWOisUnn74zFSmyn849JCmkoUHu38os
         EEhTN1+1yASmBJcX/G4DdyDtea911yyhaiJV77i6gK/M43MzoBbxd2lkSnADkBu2M+WU
         6hoiSyNzje8rfqC2RND3zW2YzbjcPxKDw232uo+g9lsTD80rSO5sRgBtyucx60S8C9hI
         6pLw==
X-Gm-Message-State: AOAM532+zwiJ9+LWJ424dk0OqaMRtfh0sreqY5549JZBs4DnvO8iXoYY
        a6Wb+zFKaxqCIsKMDC/wQkIYMA==
X-Google-Smtp-Source: ABdhPJxxNGG1UkzGbKGGCaHnsiTH3T0JzEHtu2+2GE7i0eEz7ONUOHuoIWjLjOOtSxat5/GTwMPb8A==
X-Received: by 2002:a1c:bc0a:: with SMTP id m10mr7673668wmf.173.1591876722467;
        Thu, 11 Jun 2020 04:58:42 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id b14sm3768382wmj.47.2020.06.11.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 04:58:41 -0700 (PDT)
Date:   Thu, 11 Jun 2020 11:58:40 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH RESEND v9 04/18] media: platform: Change the fixed device
 node number to unfixed value
Message-ID: <20200611115840.GA135826@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-6-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-6-xia.jiang@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:39PM +0800, Xia Jiang wrote:
> The driver can be instantiated multiple times, e.g. for a decoder and
> an encoder. Moreover, other drivers could coexist on the same system.
> This makes the static video node number assignment pointless, so switch
> to automatic assignment instead.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: change the commit message
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
