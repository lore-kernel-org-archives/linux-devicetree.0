Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCD9C3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 18:53:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D59C1217F4
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 18:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SY+Nz1MH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgBMSxI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 13:53:08 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37736 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728215AbgBMSxI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Feb 2020 13:53:08 -0500
Received: by mail-pg1-f196.google.com with SMTP id z12so3597627pgl.4
        for <devicetree@vger.kernel.org>; Thu, 13 Feb 2020 10:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z5vHe2AowREqzAqOW6YaBuKUxPqz6MPlaKgwHeJebmE=;
        b=SY+Nz1MHBZwExWD4owfVmV3PKG8yw31q8mvMuM6QeqDDRkCgPfGDToBxCoXtzv381u
         Sx9OA5EBZVY/H1Uo5+oKZzHTqqH/JIXslPIK3cdn+q7Y+hFEI6WH4T6ux2goMg2iLmsd
         h6xM/VP8wbKEKFo6Pm9jYseBTiXldmQTfj/fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z5vHe2AowREqzAqOW6YaBuKUxPqz6MPlaKgwHeJebmE=;
        b=CK4Fki6da3GroN7T+rYMrm/syoCNRuaqUmiva4ZRZX6j9EdPcmMhG1J3jwKaf5zfoV
         5OOKDWqJUrowtoHTzQ7FeWFmxOULGNUTsNL9QaV60JS+qN7cigPdUtYLadEu5QwD8pI4
         KA1tFCteDcoH1lZaLT5w5DaNy5FP1f0LWxQ+s/yjsXJ+4iAQmYrxaxXcazvs9OZS5gcV
         CO1RguBuV8aJBppwD1YMWwfFEJv9cN+4lmq2EZNW1Bw/rstEUyKqtSRY5eo7rFj3xiNE
         CudJJOcaYGaD2zHgFSXxNOe/SJZPDRE3+xS6BLzkKM0FMBWeE7Bk8m+X5kGKryPS4FCO
         3EUQ==
X-Gm-Message-State: APjAAAWhay046gv8fNHp3yqApdxFL4Ir89Caga4X9Vg3zEWMPR29qV/O
        yflY0oNUlDBXWnWBrCqUE+KMCQ==
X-Google-Smtp-Source: APXvYqxHhXqcb5J9cFkzWat6D++pep33cBNsqaKAX+B6vNPEnsssomZ/y+j9r5yiKu81pnWzZrJ16w==
X-Received: by 2002:a63:c14b:: with SMTP id p11mr15832742pgi.290.1581619987489;
        Thu, 13 Feb 2020 10:53:07 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id s14sm3897124pgv.74.2020.02.13.10.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2020 10:53:06 -0800 (PST)
Date:   Thu, 13 Feb 2020 10:53:05 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V4 0/4] Enable video on sc7180
Message-ID: <20200213185305.GF50449@google.com>
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <20200203180240.GD3948@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200203180240.GD3948@builder>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Bjorn,

On Mon, Feb 03, 2020 at 10:02:40AM -0800, Bjorn Andersson wrote:
> On Tue 14 Jan 04:53 PST 2020, Dikshita Agarwal wrote:
> 
> > Hello,
> > 
> > Changes since v3:
> > 
> >   - addressed DT and DT schema review comments.
> > 
> >   - renamed DT schema file.
> > 
> > v3 can be found at [1].
> > These changes depend on patch series [2] - [6].
> > 
> > Thanks,
> > Dikshita
> > 
> 
> Picked up the dts patches for 5.7, with Stan's acks

I can't seem to find the patches in the QCOM repo, neither in
'arm64-for-5.7' nor 'for-next'. Am I looking at the wrong place or
maybe you forget to push these?

Thanks

Matthias
