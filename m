Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9C7C35242
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 18:02:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 070192075D
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 18:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zlwl7Z+1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390362AbgAXSCD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 13:02:03 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41871 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390378AbgAXSCD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jan 2020 13:02:03 -0500
Received: by mail-pl1-f194.google.com with SMTP id t14so1099506plr.8
        for <devicetree@vger.kernel.org>; Fri, 24 Jan 2020 10:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G5fEZ2U0+CDS0hG812zeGyRQK6DtCt/mFqHvclq9uxI=;
        b=Zlwl7Z+1c2DrxDJdXvTPzh7C0sA9dUNpKWhqDlfwFbHqka9y984PM3S5s3ev0wosoc
         PQ8FlrOzjsxrL8BtP75O/HDz4gBnX4lSw2p3h0IBOxR7SIMbih5TDY0/HuTx3vH2ssJk
         eBcePQIzQNCu358CeCSHEs0rLSHQa5zJc3yOwPTIFN3lpzuZw9BVBalrOrRGjdj7uJtr
         NqbK+wD5RG6DYmdbkmaWnDarITmrhdLgEPPn1x85FLPuzsV6b+MoxvTbEQyvxNa6Q7Vj
         /0CYcxglHG6XJrXuHosf/q1Cghr2kT1EvIar+xrMhuFbfb29sbUnQf8/spqMFtoTyhvF
         p8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G5fEZ2U0+CDS0hG812zeGyRQK6DtCt/mFqHvclq9uxI=;
        b=bescvRSTt+P0wvhNp6MZNCOe8d2ms5fP4Iz9NQMQZAP/ctMZc2r7M37xhdN2++VJaq
         AwJQobVT7e2qRl+SAa0rwke7ew3Zz+4/M0GZQuLm494k1eF3EP7Z13DOvhzyTuXa2sA3
         yCFwiHGdv/YI3R+C++QEBwozoFQKFM36MlIIOxTb4mNLTJI6TqWrmMNg66EO0uOzXNHQ
         FJ0gu4Pa36VEvd6FY3GO4lbk4EyHRVHctVzNNc5Ci00J/p4xwR6pbh7LjjhdG3IiEuft
         nnHPJfmmHDIxw/14oBRvI98NmrpsF7LU4PW4TmjfodIS+D+d004tPi5/17qPKS6AVDjL
         l+1A==
X-Gm-Message-State: APjAAAU6v3NRjLcv95mgM3N7RWymgZvTzR+vE7/9Bkt+c8o01Er2ZvVG
        BA6rV9Kkb+acxRuDOT3+iXRWVg==
X-Google-Smtp-Source: APXvYqwBEJkZ8Vl8tLg9tesk9zn7tQ3YoyossHKjnx3jILJeNULNqlWCDh10GhwkawsZ99tjJSIQMw==
X-Received: by 2002:a17:902:b788:: with SMTP id e8mr4897986pls.1.1579888922548;
        Fri, 24 Jan 2020 10:02:02 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z6sm6617298pfa.155.2020.01.24.10.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:02:01 -0800 (PST)
Date:   Fri, 24 Jan 2020 10:01:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        jshriram@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com,
        psodagud@codeaurora.org, robh+dt@kernel.org, tdas@codeaurora.org,
        tsoni@codeaurora.org, vinod.koul@linaro.org,
        vnkgutta@codeaurora.org
Subject: Re: [PATCH 2/7] clk: qcom: rpmh: Add support for RPMH clocks on
 SM8250
Message-ID: <20200124180127.GO1908628@ripper>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-3-git-send-email-vnkgutta@codeaurora.org>
 <20200123064614.78346217F4@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200123064614.78346217F4@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 22 Jan 22:46 PST 2020, Stephen Boyd wrote:

> Quoting Venkata Narendra Kumar Gutta (2020-01-16 15:39:49)
> > @@ -490,6 +512,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
> >         { .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> >         { .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
> >         { .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
> > +       { .compatible = "qcom,sm8250-rpmh-clk",  .data = &clk_rpmh_sm8250},
> 
> We should sort this on compatible.
> 

Yes we should, in case this was a request I sent out a patch for this:
https://lore.kernel.org/linux-arm-msm/20200124175934.3937473-1-bjorn.andersson@linaro.org/

Regards,
Bjorn

> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(of, clk_rpmh_match_table);
