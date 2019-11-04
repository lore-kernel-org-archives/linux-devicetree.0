Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5DBCA9ED4
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 04:55:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9579021D7D
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 04:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oe027GXI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfKDEzN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 3 Nov 2019 23:55:13 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33440 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbfKDEzN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 3 Nov 2019 23:55:13 -0500
Received: by mail-pg1-f196.google.com with SMTP id u23so10479727pgo.0
        for <devicetree@vger.kernel.org>; Sun, 03 Nov 2019 20:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5E1F/8ZpGkp0JFWHPBZzhYupEtvMBHGaGPCEq4HCJd8=;
        b=oe027GXIIXbVYu+L6R++Ex0ivkxkIGJmbtLj87bIkCastqwv2GdYj2aluSVznMtBKH
         cnN6LYXh2rCuHhCo92VZDGPy7iGchD4cza9qvLPXOU7+lD233p3f2M+SuJFm2hl70kpj
         wLxO02Mdg1L4bSC2kPDyTndpSHMDSk+/o13Z7ic37Lnib4qK6suKaOnKlvIBfF6vLvSC
         dI20i7Qy02sgCpt4wH7XFMzEGkCfxpF0LVE5IO0zZ+HldzkBgoj16x9WCfgb0IUqLfwN
         pa1+RlebJ2AF+Jrb4nacKHWHjaO1ZFxgLMhsRK8Tmk4FBp5bvPXNR1hgBxgVArnNggTb
         X3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5E1F/8ZpGkp0JFWHPBZzhYupEtvMBHGaGPCEq4HCJd8=;
        b=q4gRDtIIxaUdDNYxpXbUKqC07Q5NFlMwzA2y3kdL3mX3IaYFbVMLRg0luPBG2PHvFb
         nfi8TrG6E32XeajSIPjeXxGrp16oyFlsp8cXS6PhB4m+Yobr9LGmzEmlyGAWtA6vK6Z+
         KJvLTA5q1Dmoe60GAd+pRJzvGZT/b9UvcJgocEB85VFcXZdSQpaIn0XWZouVtdpA9bOF
         St9UbFPvbZyUbhfWE8VfDTdxaPeTmotUsi38tLvsapyW3170FB/8OEQLvWVmYW+SEGhI
         AD6eEpgoO7gylNaKOnaab7ynaVk2XCQzdRBOBMvbEFpbogbd7cefAGkpBORbqInfnFU3
         qAHA==
X-Gm-Message-State: APjAAAXTFCx9/Nef1qMIh+qxlvWjv6yUdLAl/3ZtArB1DgUZk6n58zNR
        v9RJQYzPJMMahpctsw9SoUWcAw==
X-Google-Smtp-Source: APXvYqxS77pEs+QxOH7S2eE8c8E78rzeBq9iwCG53FN9NDCO7r/Y6hxTjoGCJ5yqLH9E8bXRZlFQfQ==
X-Received: by 2002:a17:90a:2623:: with SMTP id l32mr33443825pje.70.1572843311000;
        Sun, 03 Nov 2019 20:55:11 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x2sm2276885pfn.167.2019.11.03.20.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 20:55:10 -0800 (PST)
Date:   Sun, 3 Nov 2019 20:55:07 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] arm64: dts: qcom: msm8996: Introduce IFC6640
Message-ID: <20191104045507.GA28034@tuxbook-pro>
References: <20191021051322.297560-1-bjorn.andersson@linaro.org>
 <20191103081311.GM2695@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103081311.GM2695@vkoul-mobl.Dlink>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 03 Nov 01:13 PDT 2019, Vinod Koul wrote:

> On 20-10-19, 22:13, Bjorn Andersson wrote:
> > Refactor msm8996 and db820c in order to make it follow the structure of newer
> > platforms, move db820c specific things to db820c.dtsi and then introduce the
> > Informace 6640 Single Board Computer.
> 
> This has patch 9/11 missing. But rest look good to me.
> 

That's really odd, I copy pasted the recipients into all the patches.
But I'm unable to find it under linux-arm-msm on lore as well.

It's under LKML though, can you please have a look and let me know if I
can extend your ack to patch 9/11 as well?

https://lore.kernel.org/lkml/20191021051322.297560-10-bjorn.andersson@linaro.org/

> Acked-by: Vinod Koul <vkoul@kernel.org>

Thank you for the review Vinod!

Regards,
Bjorn

> 
> -- 
> ~Vinod
