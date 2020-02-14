Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9801FC3B18F
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 04:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FAD220873
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 04:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n6O7ZelH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgBNE53 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 23:57:29 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:53240 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgBNE52 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 23:57:28 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep11so3353243pjb.2
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 20:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Oqu5dByWhUsTcLbgcHAaKlo5En4mZCmBir5nj2HwpTQ=;
        b=n6O7ZelHX94glmhMjMGvdu56eA+DSlizoPxIXZLUVpsrCpmVn2xEDa13FbDci4mmIo
         O4TunmsnYP8BRWDvd43t/Rlm2N/Em8bUnefMdgm4geuy52pDrI6FGNvj1u5VXLIB8We0
         z4yLTL1SriLEkPDLq7igHvNi0ZZiapI7YYoC5TgxoAYRTA0oRPSYO+RKtrSvHvoxmGde
         j0YyHt32uqWIWm68GGAvKCsK/bsvT8UhZjgM3ZfZE+iJ+qjHid2rJh6SYaXARRS7vmj9
         bExIEZfPoQ1tVT/ADiwz7/VTj2ennHgpqLMXWmqDXT1jkPmxeM1rNNSX7ZrS/bDQZwcc
         Podg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Oqu5dByWhUsTcLbgcHAaKlo5En4mZCmBir5nj2HwpTQ=;
        b=EAe3GJTIuj8MQ40VjTNOQZQE7XswP31EVh2BVt9zN1KO9eoRFAfwqFbT4PPY1GI22/
         ujvLG9mViE58tb5FtMcKdGkK9lUqFyBd7+0cABUkJTPatgU8sgZzIKkWhP/JRUHDI8L2
         wrirD40K8F4GhG75QcF8ykR7E4c/bKtqTBbmSh58goVGg6XWpUJPkTAFa3d3BMdnBZPU
         fvYNXY23bFnukoARdC+fwYqkM9VHvkh8Mcy8Vl6vPaWrh7pKLLB80KPuQaVAz2+Y/F4A
         wsbuLZgWfnQq9NaVa4LWr1sVKANIfeXcNwTt3AkxEvNkGYUI3YZdR+6HXi4aekPgLLli
         8/OQ==
X-Gm-Message-State: APjAAAXECQ5sVzqz/Zvy0LkMLlEnD2yN7Bf2CfP5Stz9nkgXmtr9QK77
        xPc852Hcln62x7SfoqeRwQtPUA==
X-Google-Smtp-Source: APXvYqx6c/Oq/DJ+FfuRU2+zRP3Vq4zxWIgDCs7lRWP4DFiGtsIUPqxp5yIiKXI3eP7QrubZEYnL/A==
X-Received: by 2002:a17:902:a711:: with SMTP id w17mr1520750plq.152.1581656248269;
        Thu, 13 Feb 2020 20:57:28 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g24sm5030467pfk.92.2020.02.13.20.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 20:57:27 -0800 (PST)
Date:   Thu, 13 Feb 2020 20:57:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v3 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200214045725.GT3948@builder>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-3-bjorn.andersson@linaro.org>
 <158164774404.184098.8855626264878132058@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158164774404.184098.8855626264878132058@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 13 Feb 18:35 PST 2020, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2020-02-10 16:50:53)
> > diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
[..]
> > +       mutex_lock(&reloc_mutex);
> > +       _reloc = reloc;
> > +       mutex_unlock(&reloc_mutex);
> 
> Ah ok, I see that mutex is protecting the pointer used for everything.
> Ignore the comment above. But also, why not have every remoteproc device
> point at some imem and then search through the imem for the name? Then
> we don't need this driver or a lock that synchronizes these things.
> Ideally we could dedicate a place in imem for each remoteproc and not
> even have to search it for the string to update. Is that possible? Then
> it becomes even simpler because the DT binding can point directly at the
> address to write. It's not like the various images are changing that
> much to the point where this location in imem is actually changing,
> right?
> 

I will check to see if these entries needs to be packed in the beginning
of the array, otherwise this sounds like a good idea to simplify things.

Regards,
Bjorn
