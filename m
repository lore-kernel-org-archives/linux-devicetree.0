Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5790C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 22:37:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9892D207F9
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 22:37:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAVHFKWU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgERWhB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 18:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgERWhA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 18:37:00 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDBDC061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 15:37:00 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r10so5492957pgv.8
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 15:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X67f6N/TB7/lmzTe8rOyg+PekxRmdn/lrnG7IaiK4Ik=;
        b=nAVHFKWUbfBnlT6fSExrrp8Vwi0yApBLMl38HX8egS5c7xDNaQkhsaHsv8k/yLhoNK
         onEufHENr57Vb2Uv85JpMb+nJYWovbjbOn0s3z+klub5Etn641hjl1/0hUqm0325p9Sc
         pfxfQ0dohgF8+3FM03a4I1ZA0X9JzNvf7n8y//ExsRPJfQZ7lrOCEEtH4jmOnK3rq6oJ
         y82T0aXWdXmYL6FmBkV1xP0fWZfKc6QTP9CY9pL0eyTSHdyQ5vVH80/3mj2xmh/v4om8
         3+4uuztUrJRSnYX9hs3BIw6/GkH1fUJAAYrM40cGgIGPAe0BePeZPPNb6w4GUvVAE8fw
         Gj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X67f6N/TB7/lmzTe8rOyg+PekxRmdn/lrnG7IaiK4Ik=;
        b=pZbrPfgr1Hz3LFHKFJOL4zi5YpCStmJWIIQQmdIZjLM+N9ncIbDvmxk+tvjpHmG+38
         ESwdvcppWXECK0+E92AQw5pM4kV2+XTxxGsCWyeh60RShgQ1Isp8Y9slX5lew+1du+XD
         HPTM3Fmu2CGc7dBlNQ4xnBnWLM8ZsvvpNwK9axsWj+yYt/PrpyaJV31TPP6xuJWDAZHS
         7otpEEVc5nZThlGzqT7v3xRgyPe5wYcjfuyyX/5JSXLCswr5cpf1yZbLHH6zdnlcO/g5
         8SDwcgE9fqRwtQUgTvWJ+HXvGZxztvSKdjyuTc6446uv1ptK4k2p7yitP0yMFpO87Pei
         se+Q==
X-Gm-Message-State: AOAM53106PHyNkqDUEIBLTHA1JZQ0wl7RjX/A7n9dQzOZLnYRY+J2zTy
        /DXz1JMFNZcAikShwLREnzZKcQ==
X-Google-Smtp-Source: ABdhPJxxmRJRzjqlDQUZoLrEMr+A2g4VH7fKXkn6ymAdxYa5w9ZqWt3+q0XntcXhA1ZpW3IBQp3MLQ==
X-Received: by 2002:a63:77c6:: with SMTP id s189mr16717156pgc.267.1589841419904;
        Mon, 18 May 2020 15:36:59 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o190sm9600752pfb.178.2020.05.18.15.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 15:36:59 -0700 (PDT)
Date:   Mon, 18 May 2020 15:35:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Support ETMv4 power
 management
Message-ID: <20200518223536.GJ2165@builder.lan>
References: <cover.1589539293.git.saiprakash.ranjan@codeaurora.org>
 <b0a2ac4ffefe7d3e216a83ab56867620f120ff08.1589539293.git.saiprakash.ranjan@codeaurora.org>
 <56a5563205da61c47eb4f8bbf6120e28@codeaurora.org>
 <20200518185124.GG2165@builder.lan>
 <badc88ecd5932033235ed9bcd173ea16@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <badc88ecd5932033235ed9bcd173ea16@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 18 May 12:08 PDT 2020, Sai Prakash Ranjan wrote:

> Hi Bjorn,
> 
> On 2020-05-19 00:21, Bjorn Andersson wrote:
> > On Fri 15 May 03:55 PDT 2020, Sai Prakash Ranjan wrote:
> 
> [...]
> 
> > > 
> > > 
> > > The previous version of this patch in QCOM tree seems to have added
> > > the
> > > property to replicator node instead of etm7 node, can you please drop
> > > that from the tree and apply this one?
> > > 
> > 
> > I'm not able to replace the old commit without rewriting the history of
> > the branch. So I've applied a patch ontop of the branch to fix this up
> > instead.
> > 
> > Please review the branch and let me know if there's any issues.
> > 
> 
> Thanks for the patch, I checked the branch and its good.
> Sorry, I should have sent a patch on top of the old one
> instead of repost.
> 

No worries, now you know for next time. Thanks confirming my fix.

Thanks,
Bjorn
