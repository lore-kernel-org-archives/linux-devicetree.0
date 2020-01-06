Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE80C32771
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 07:35:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 537CA20848
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 07:35:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRxC4wdT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgAFHfR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 02:35:17 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:50470 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbgAFHfQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 02:35:16 -0500
Received: by mail-pj1-f65.google.com with SMTP id r67so7229914pjb.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jan 2020 23:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oVNk6bhyLjt8r84RksFdfisLfEAXMaIvQk56gnsbeYM=;
        b=oRxC4wdTKGpvF22k3rrG7CtB+fTVW4M7e7LQv0Gz4powEO8VJJEG2Hi57iQ+ngSTq2
         F4DQ8qa0+yXomK2s5y4/PvtmmVG2xYM16fFVZ+PTn2kZxu1BFrL7w43PmbMrzSJ/j3GK
         7/nr6gIVq9WN5x0MYiELyJwioVCadEkM3rb0Gj48UzRBkjDO7uMjxZMkSZitDBUAPx7V
         fWAoDxY2meiz1L1TiBJQ3nsvlFkC9YBvhfT/xO1Hc1wmzgAEvLPiFJQGTdFLaLstcJlR
         65TLWnaWfx3fVuHWLZmy3qFTawpurhUtj7z8aOIW7x/zCZQ1Ks6HaBnJ1IW8FSG8iYIr
         7vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oVNk6bhyLjt8r84RksFdfisLfEAXMaIvQk56gnsbeYM=;
        b=QWjoyRMxQmiYXz9PlsY9gx7vuTtu2LUgNsWKEwFVDTPWgYDFsIJ1c3vDXCPNkWeTU7
         XYRFcm2Lj+fa1zpI7CH6Xynlcg4ERfZ+yIxIKf7tzOG10lRkVHFXA9sbIcBe++84AiXE
         Jp5sbaH/r1t4iNeBRHSmb9Bc2idDeqeoL+5W8Bdlsu+LPoPshazefRIWIUR2T9/mcYaN
         ZmX0OjdbxfQdFkrw2Ox53lTvATGPtNcmKmoLmECQCXNesohJr415WcIxvK/bWhd2UjYJ
         NI+Q+LKRM3SrFbwltczcLDJntMMjuQsTEFHFtlNow+lXQ5Ye6nWKLd0fN5mVEDL2opaZ
         dY2Q==
X-Gm-Message-State: APjAAAXhSIFScvcPFQRPmuPZ0sEGkVnzysKH/R63gNuaDTmQVO7uCQMg
        O1QW1Uy25NYJmyYZGRWAXQDp9Q==
X-Google-Smtp-Source: APXvYqy+OyNfwdMuDxkpln91vEZljy6Q/k5GoGhEatSC0Z8NBvgn3DcdncHFQbIusclWFMlscvWPGg==
X-Received: by 2002:a17:902:6a8c:: with SMTP id n12mr104671873plk.152.1578296116059;
        Sun, 05 Jan 2020 23:35:16 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a195sm77510496pfa.120.2020.01.05.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2020 23:35:15 -0800 (PST)
Date:   Sun, 5 Jan 2020 23:35:13 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Can Guo <cang@codeaurora.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: UFS updates
Message-ID: <20200106073513.GS3755841@builder>
References: <20200106070826.147064-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106070826.147064-1-vkoul@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 05 Jan 23:08 PST 2020, Vinod Koul wrote:

> We recently saw regression on UFS on SM8150 and few other boards and that
> was resolved by adding timeout and fixing the UFS phy reset sequence. That
> patches are in linux-next now.
> 
> During this we found sm8150 lacks gpio reset for ufs, so add that and fix
> the ufs phy register size.
> Also add the sdm845 ufs reset.
> 

Thanks Vinod, boot tested and merged.

> Vinod Koul (3):
>   arm64: dts: qcom: sm8150-mtp: Add UFS gpio reset
>   arm64: dts: qcom: sm8150: Fix UFS phy register size
>   arm64: dts: qcom: sdm845: add the ufs reset
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 2 ++
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 3 +++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> -- 
> 2.24.1
> 
