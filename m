Return-Path: <SRS0=cCmK=2Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C43CC2D0C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Dec 2019 19:01:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D77462080D
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Dec 2019 19:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hs/GWrax"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfLZTBC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Dec 2019 14:01:02 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44866 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbfLZTBC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Dec 2019 14:01:02 -0500
Received: by mail-pl1-f195.google.com with SMTP id az3so10745402plb.11
        for <devicetree@vger.kernel.org>; Thu, 26 Dec 2019 11:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sKQGR3Y9ZuT+GSwwu9eznDqy2WWfte9UQ+0KNkkzAxk=;
        b=hs/GWraxJbhlVWLQfZcPf2AkuAt27ITg23eVhx5slTXjZDmmGDT18wTrueDpo8m0eD
         8d8nydd5QR4XNM4RlO0OI/H2a1NFTgxHehliFMY9dUOV0FnX722XY/AzHNyMTNOKskze
         /E/RT0Ktig+uyz3qru8cFDQRsT9VwFN3cw+wI6TpLLSnHoeonM+S6NRQvi+2fypakTkM
         PrUUoJgiek7czSCleZJgOzdjGXzkBRJH3QnkJ5ngcvkj6u6XoS9+f1jkj2Iqo7lQ5Irk
         zI9gQ2FQsUULdbacEegcJC2mNQge8fWvBNmK8wds1h3AOBjTI0R7QlvccbBfnSIHahdX
         0pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sKQGR3Y9ZuT+GSwwu9eznDqy2WWfte9UQ+0KNkkzAxk=;
        b=IVFFi8RdsuauMk9piZ09dThR109EepUgMvl/pMt0XE1j9S/6D+NPyA17kZEy0kJ3YY
         EK3N0gcvmYM7p3AXWE2eqIhBlkNEmKImrKjX813vVQ4w3uku9oQIhXH+Vx3/xEbLjazW
         8httleusHbOaBpPzWn41C1+K67EdRhfwFsuB4Fafgj7a7YeGSXHFN1MGjx1et+g1t1nO
         4Vuhjp5Kto8kPRNKA2o6w0NoewJl7/lPCsuy6l4U8kbQqvKZYYCccF3ecvGUQypRQWaw
         It9CRLoLEV8mk6/Kbu+HKmG5YH6n1T4LzLsivF/EZtktYBvYAMmTcsBBnPWNSJWJGXN1
         JBjQ==
X-Gm-Message-State: APjAAAWQyHcpy2t2bdy0EKnFGbGgph57iW+iBEG02UTqlq9utNhLCkeE
        C8hmim9TitNv4L2yKv8DbKh0ww==
X-Google-Smtp-Source: APXvYqzatM2elI5CdG4rtWQkuXM2/c5RjjfQZe6wfRlfMUYQEpcvtNgqLOYkooMoSJhAoTdOsq80fw==
X-Received: by 2002:a17:90a:3742:: with SMTP id u60mr21741452pjb.29.1577386861619;
        Thu, 26 Dec 2019 11:01:01 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q64sm12081353pjb.1.2019.12.26.11.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 11:01:00 -0800 (PST)
Date:   Thu, 26 Dec 2019 11:00:58 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     David Dai <daidavid1@codeaurora.org>, georgi.djakov@linaro.org,
        evgreen@google.com, sboyd@kernel.org, ilina@codeaurora.org,
        seansw@qti.qualcomm.com, elder@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 3/4] interconnect: qcom: sdm845: Split qnodes into
 their respective NoCs
Message-ID: <20191226190058.GL549437@yoga>
References: <1576475925-20601-1-git-send-email-daidavid1@codeaurora.org>
 <1576475925-20601-4-git-send-email-daidavid1@codeaurora.org>
 <20191226184803.GA26712@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191226184803.GA26712@bogus>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 26 Dec 10:48 PST 2019, Rob Herring wrote:

> On Sun, Dec 15, 2019 at 09:58:44PM -0800, David Dai wrote:
> > In order to better represent the hardware and its different Network-On-Chip
> > devices, split the sdm845 provider driver into NoC specific providers.
> > Remove duplicate functionality already provided by the icc rpmh and
> > bcm voter drivers to calculate and commit bandwidth requests to hardware.
>  
> This breaks backwards compatibility. Is that okay for all 845 users?
> 

Yes, based on our discussions surrounding adding support for the
pre-rpmh platforms, we concluded a while ago that we would like to
attempt to move to this structure instead of the originally agreed upon.

So we haven't merged any consumers using the current 845 binding in the
upstream Linux repository.


I'm not aware of any other public repositories that relies on the
existing binding.

Thanks,
Bjorn

> > Signed-off-by: David Dai <daidavid1@codeaurora.org>
> > ---
> >  drivers/interconnect/qcom/sdm845.c             | 1122 ++++++++++--------------
> >  include/dt-bindings/interconnect/qcom,sdm845.h |  263 +++---
> >  2 files changed, 606 insertions(+), 779 deletions(-)
