Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470F8C43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 10:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A71D206D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 10:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y49FSHZn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLPKoD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 05:44:03 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37623 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfLPKoD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 05:44:03 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so6642543wru.4
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 02:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=TYn4KXFCmnMue9oYWo/j3mg7jGM7rzuxGct/WdOvzz8=;
        b=y49FSHZncFMOSmnFI4STiDIoR9ZBizHKIK1wozs34TnPKQasUeHhsz//CBl+myFReF
         8BGzgzvc79cYEQAH8qhBqhBP5y25cjXxnggkZ3aAkfr3ZNpIcBgGWR1Qxsqp+AZ2I2/c
         aMXvjPl2hqWhMtlMoxDu1x8AjX+DKoiWAZb1CofggnsrOEOzs4VIYWaFYMBqYQwqFiHj
         RrntcuxTUtVnxhIv6TrDwlrav6M9fH3+cLwYQ6gpNCVb/Un3BBimVP7W9qGziis98gdy
         Fyxr6NHhkiFVxTHVc3ALBEa8mE5wfS8ArzFP20jre1v8C2olr1a5fbjBgzJTAH5+g3KB
         W5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=TYn4KXFCmnMue9oYWo/j3mg7jGM7rzuxGct/WdOvzz8=;
        b=XfeEZ6uMJlbXBMaF+UnLgSQIX4OT63PXWqtaNvT+2ZhTDH5VgMjjUPgJh9hWqBKKB/
         BPR1X025pCBSLbP+fMzmQDLEhhqITf61pdX2/20D3yRS4va4jh2YDxaQHbdZFF8mD1M/
         gmjcMwFk3Z0umUc/kmUEPLIfwHej3vqNbWMQjIfeG0/jGpRjQopd2de66iIfqyUMBbYa
         egyTITjytP7SeXxefdCyxSSIhOw+x+zeS86CBYjk3x2tUlgurVPsQ77tyRstY8nfD8K1
         KALinvhxDmdyRAFtbp8822/UAihAqSehozoWCXzypaSBQ1WDty8vXrMMM5yxGbfU+L5R
         BMqg==
X-Gm-Message-State: APjAAAWEZce6KL1s0AzILNqRSo0ZMUe+9Cm1Qnj8YTdNLbOhlwxHJF+y
        GDk2zR0wtuoV0jB4eML3sYDxxg==
X-Google-Smtp-Source: APXvYqy+xHiEnHqxwZv7QXY40UpjEmUZChrkX33sH3sKrTGGgaaX2f6qwwlc+D8e0z2Z3R6tNR26Kg==
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr31104859wrm.80.1576493041373;
        Mon, 16 Dec 2019 02:44:01 -0800 (PST)
Received: from dell ([2.27.35.132])
        by smtp.gmail.com with ESMTPSA id z3sm21030535wrs.94.2019.12.16.02.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 02:44:00 -0800 (PST)
Date:   Mon, 16 Dec 2019 10:43:59 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] mfd: ab8500-core: Add device tree support for AB8505
Message-ID: <20191216104359.GF3601@dell>
References: <20191117221053.278415-1-stephan@gerhold.net>
 <20191117221053.278415-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191117221053.278415-2-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 17 Nov 2019, Stephan Gerhold wrote:

> AB8505 support was never fully converted to the device tree.
> Most of the MFD cells for AB8505 lack an "of_compatible",
> which prevents them from being configured through the device tree.
> 
> Align the definition of the AB8505 MFD cells with the ones for AB8500,
> and add device tree compatibles. Except for GPIO and regulators the
> compatibles are equal to those used for AB8500 because the hardware
> does not differ much.
> 
> Finally, change db8500_prcmu_register_ab8500() to check for the AB8505
> device tree node additionally, and probe it if it is found.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/mfd/ab8500-core.c  | 14 ++++++++++++--
>  drivers/mfd/db8500-prcmu.c | 26 ++++++++++++++++++++------
>  2 files changed, 32 insertions(+), 8 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
