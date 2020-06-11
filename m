Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FC2C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 12:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 266FD206C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 12:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jwiYu/7L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgFKL77 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 07:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgFKL77 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 07:59:59 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCECC08C5C1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 04:59:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t18so5863789wru.6
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aQJ2/OQ0INtUqdOhCi+aNYRvOxWn9KeZfAUmUQdqgWM=;
        b=jwiYu/7L6j2sAYGVwtKRrycnxxCH9y03CsnXRJ8z3ly0et9m6tC9Gde+Yz+sPiMXXD
         QdTydr/V9aBC/hz/4sWIycY/BZDsNBVmWxLuaaTgoH+Bi7fsDz+VoIekGDOKRW/xZEG2
         GUVQPJN0MVSzz7sivc/AnoR9ZlIepkjQqaSPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aQJ2/OQ0INtUqdOhCi+aNYRvOxWn9KeZfAUmUQdqgWM=;
        b=J6g+6eLDP/rtC3/0kzNSpWK0TTCX7RedTMN1zV2AcnoVTiYSVsiOKpx27pzv054kLb
         sYuQ+XIdklamv3mxtlmnaNUX67hmezAsSDrhmYK5+a72bxoYD22ECJnQpzvoovRBeARm
         J5vbdHSX8WCGv6zVmXP1/FmjJgeboY1tArHH/wStJtV/A2VhG83YXdaU7595OH3qvBX+
         pFf7zMTcRYgdGqI/g9rDE5iDZ7Hm1+xZCqmzdcXflZNZjRYKsL5OnMNhWg6P0IxpeDG/
         6WLtQPn9pOvtuMly6lH3qGRlSltClXZpAS+ARlTR4M6MeE2FznMK+6zQyHVvXkjqJWpf
         ukUw==
X-Gm-Message-State: AOAM533JPoCQUWky1lsI380v0OvvcbFxAj5WkothljjYAlHEA1OAEoKz
        3cWVfu1v4mj+B0dTwkLQ6XLH9w==
X-Google-Smtp-Source: ABdhPJxvbPyTd8RhVR3eBjnPhFunZ9jzxWDwTxaX1ZFBKznlJyB1xYBlLPEro/H0Z6e06/M4GOnLDg==
X-Received: by 2002:adf:ed01:: with SMTP id a1mr9859784wro.271.1591876796211;
        Thu, 11 Jun 2020 04:59:56 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id j16sm5307254wre.21.2020.06.11.04.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 04:59:55 -0700 (PDT)
Date:   Thu, 11 Jun 2020 11:59:54 +0000
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
Subject: Re: [PATCH RESEND v9 06/18] media: platform: Delete the resetting
 hardware flow in the system PM ops
Message-ID: <20200611115954.GB135826@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-8-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-8-xia.jiang@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:41PM +0800, Xia Jiang wrote:
> Delete the resetting hardware flow in suspend and resume function
> because that resetting operation will be done in device_run().
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: new patch
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
