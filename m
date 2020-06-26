Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0937C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 13:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC0C620663
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 13:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMODgyNp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729020AbgFZNy0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 09:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbgFZNyZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 09:54:25 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C4CC03E97B
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 06:54:24 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id cm23so4977438pjb.5
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2020 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oMbNe3bvovs/HF4L4pFZ6HHy0t3ZDNuS6KDaRE+CO9g=;
        b=zMODgyNpvqgSvfmhpS5ocDb2fyOJlPjvlHYiUmnneT/02SoUlBtXH/fRmO71OtRiBM
         pqy6AgmVbJ6SQpw34Jj4lYyRt2iwQZt2pHUDOheXET5vzl+t2fr7mnj+tFOQb1lhVecU
         19w+vR+D01H/tGFID+w9M+9czHAm9gqoYq2TwCbe1KHwGl38tKc4SCj/NvYXFj5EyqFg
         WjgR+/oV6yf8v5PWwZ+9Fi1kGu4Xm7eMjCS2rp9FI+oU/tc+a3sdTPr6f0ONHa1Tpyz7
         Q4e+1mSimc1+mTtGW9UXto5VF4rnRH1eLCUFHIelT7kEFwa06F0fHV5u8tg+uMuVa1H/
         /lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oMbNe3bvovs/HF4L4pFZ6HHy0t3ZDNuS6KDaRE+CO9g=;
        b=nnXLK4+UJpSaFPj9zhZcCE3CLrdIjaM5KHq72IimacLP+2vnyHkgQ26VuzQWIyPb/t
         DiNEzMI5U56hyb5hBXubDaZBWSWtiB3/w0GrsSPXYTE/7rKJ7E35srAATsU8BIHrXbVM
         KV/aoOFHqW+6AMYyTaknjVZBqetDssH3NsayyDezc3YGzjyVFxb+vDy2dgBhZaE0/KDj
         dkqpp/z20KNxYI4zq13/Tos6hdU8Bv1JZ8gb6hip2Ls97dVJTYf4bKnj9h7p+wOPk02M
         NgwhOCWE3uXfquecHnMyW9G5jMtMoPcs7eDYpMQbQcsX8xjYrspBknwQf7Lcpvlgt94U
         PmaA==
X-Gm-Message-State: AOAM530xVkwcfzqGiWjVRBujQ6bmuKDEIGTjKT2nLp3FmjR/+ndbvyZh
        CpB99zTq/YA1P3b63MH+Toan
X-Google-Smtp-Source: ABdhPJzZ/XQHczKnQ1Sm/1IPTxvXLNgqgj4T9DiHLdtbLRBslZWLgu28jWeNZQ/+aJHxhoCVuljndQ==
X-Received: by 2002:a17:90a:df8f:: with SMTP id p15mr3866933pjv.164.1593179663995;
        Fri, 26 Jun 2020 06:54:23 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e11:8623:980f:4d73:2b9:f602])
        by smtp.gmail.com with ESMTPSA id y27sm3335138pgc.56.2020.06.26.06.54.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 06:54:23 -0700 (PDT)
Date:   Fri, 26 Jun 2020 19:24:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-actions@lists.infradead.org
Subject: Re: [PATCH v2 6/6] MAINTAINERS: Add reset binding entry for Actions
 Semi Owl SoCs
Message-ID: <20200626135415.GD8333@Mani-XPS-13-9360>
References: <cover.1592941257.git.cristian.ciocaltea@gmail.com>
 <c7db5abf78656af8d5a4ff8d677a08e03713c1f3.1592941257.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7db5abf78656af8d5a4ff8d677a08e03713c1f3.1592941257.git.cristian.ciocaltea@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 24, 2020 at 08:47:57PM +0300, Cristian Ciocaltea wrote:
> Add a reset binding entry to match all members of Actions Semi Owl SoCs.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7b5ffd646c6b..e6285c13bab0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1533,6 +1533,7 @@ F:	drivers/mmc/host/owl-mmc.c
>  F:	drivers/pinctrl/actions/*
>  F:	drivers/soc/actions/
>  F:	include/dt-bindings/power/owl-*
> +F:	include/dt-bindings/reset/actions,*-reset.h

You can just use, reset/actions,*

Thanks,
Mani

>  F:	include/linux/soc/actions/
>  N:	owl
>  
> -- 
> 2.27.0
> 
