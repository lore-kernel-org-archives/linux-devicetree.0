Return-Path: <SRS0=fiEU=A5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD55C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jul 2020 08:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16D1A2073E
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jul 2020 08:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZzHLgOEL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgGRI31 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Jul 2020 04:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgGRI31 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Jul 2020 04:29:27 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5D2C0619D2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2020 01:29:26 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id m22so7761590pgv.9
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2020 01:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dPX5I2zvoaIfMrTJOaEVmZ8AJ80iRBsKVksO1GxJCNo=;
        b=ZzHLgOEL6rfH/FrYghVSfVEQktV2G0Ir7o5GkPsQTPiSTXfAartacdCWERPApI4F4h
         z/xNML4mDKErL7wVRlTVtBRcspOz9kDbKiYzv/yyiLNLwgvPEJoSN37amJBWnAxRy9V2
         9hVGDkdUX8hOdVMJjPWlhR6l8UlkjZKc+fziFbkc/yru2iiCKqBHpaSOUK5RnZW2S/yn
         Pn8cacEL/2XGSr+kepi8HbhO+UN1PagUSVAQCnGrKN9SjBqwzxGDJoQQDa/+JnKN6Shy
         o1suzUkzCeetU7bWUPKA6K7RuhGSovE+CT7GHBU6X1HJ4Oh0B0JzqvprdhMf8kXfmmJ2
         BA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dPX5I2zvoaIfMrTJOaEVmZ8AJ80iRBsKVksO1GxJCNo=;
        b=C7NVjj1WcVVv/nUHeMSmLS547klNsSYs7uDE1BfW1wOw0VUQlUsVSHfVP28L+ak1hj
         4VKNWZga3/mfIRE/4Goic8TxpKUABRyC06sI+HX2eN99ombUCyoLX7dA896nszxmG81C
         c7ONk13iKMQiRFxweYcGhv08Za7CRl5yGHWPdeiH107KCqZnDcfnMBJO0PpIfacj9rMN
         GWa1AaD9nJHIwnnxUZ+38rlJmk0VBJTZgNX3JSdqjPeGVz3hgKtNLMRSrAmS711PNiBU
         VnYSZSnU6kSp0bJaV0q6dEng7yMpoiRuxyuc1LkwXxbRiNKCDGhlDj/Ka1fSjSg2eIB6
         iC9A==
X-Gm-Message-State: AOAM531fH8tuafHiqDNuJLwGBWOhHynSQi0xvp1jDKq8NnE2MmLAssE9
        Dr36JWImNex3eVPncLk0y0ebVQ==
X-Google-Smtp-Source: ABdhPJxpkjlVoi1K6zt3TxppMxnpJwdAYknEnoLeYjpkZ5qIgAHhN1uKddV4rWohLA2QlS4I+GW9GA==
X-Received: by 2002:a65:620e:: with SMTP id d14mr11477128pgv.360.1595060966415;
        Sat, 18 Jul 2020 01:29:26 -0700 (PDT)
Received: from localhost ([223.190.30.182])
        by smtp.gmail.com with ESMTPSA id k100sm4874773pjb.57.2020.07.18.01.29.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jul 2020 01:29:25 -0700 (PDT)
Date:   Sat, 18 Jul 2020 13:59:14 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sumit Gupta <sumitg@nvidia.com>, rjw@rjwysocki.net,
        catalin.marinas@arm.com, will@kernel.org, robh+dt@kernel.org,
        mirq-linux@rere.qmqm.pl, devicetree@vger.kernel.org,
        jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, bbasu@nvidia.com,
        mperttunen@nvidia.com
Subject: Re: [TEGRA194_CPUFREQ PATCH v6 2/3] arm64: tegra: Add t194 ccplex
 compatible and bpmp property
Message-ID: <20200718082914.ecyngrsoir7j5q6y@vireshk-mac-ubuntu>
References: <1594819885-31016-1-git-send-email-sumitg@nvidia.com>
 <1594819885-31016-3-git-send-email-sumitg@nvidia.com>
 <20200716123715.GA535268@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716123715.GA535268@ulmo>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 16-07-20, 14:37, Thierry Reding wrote:
> On Wed, Jul 15, 2020 at 07:01:24PM +0530, Sumit Gupta wrote:
> > On Tegra194, data on valid operating points for the CPUs needs to be
> > queried from BPMP. In T194, there is no node representing CPU complex.
> > So, add compatible string to the 'cpus' node instead of using dummy
> > node to bind cpufreq driver. Also, add reference to the BPMP instance
> > for the CPU complex.
> > 
> > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Looks like the DT bindings are now done so I've applied this for v5.9.
> 
> Viresh, are you going to pick up the other patches, or do you want me
> to pick them up and send you a pull request?

Applied the other two patches, Thanks.

-- 
viresh
