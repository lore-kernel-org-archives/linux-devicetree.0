Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D142FC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 07:22:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC55425455
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 07:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ls2onvJ4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731378AbgFVHWu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 03:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731355AbgFVHWu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 03:22:50 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2A7C061794
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 00:22:50 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 35so7223645ple.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s6AtoZ2N3qnBaqcBnXYlsgS78ytdv7QMgwZrT52IUbs=;
        b=Ls2onvJ4PrwRbkHYIS3ZoYzddLbLpZ9cTW+5I2MDmsxTT58+bsaGaA9d7a/fp/UixK
         3N23jX9SfTWDJiKGV59vw/AeVKpJFoehbEv/nUuqi63RalUNqFZWhDAUCSm+bKXjEgWV
         iB1ILi3yGtzwkXAdEDRxfCiXgdFTGBVFHS1kbOXCH2apTpPAPDShaj5UfiOVX78ePdp+
         tS8s6bqENSpgFA0gJqVLWDaU/yKgWlYoofIyOHI1cBv/DkXJUX9e3H3csCXheXxAn5vF
         nPKwLqouf0CmgOf4+6bpDNZtOBd0cLoWjxOdAwUdCZcrwWK5LZ9aBMKPsEW8wxDCXiha
         ++lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s6AtoZ2N3qnBaqcBnXYlsgS78ytdv7QMgwZrT52IUbs=;
        b=K2O287dG0YGTGKnvQNWJQcIA+xD/Ygta8nIYpVgUFDRWkt22GmT56uutevlaH57Hy5
         8C0OA4sqoXb6uRNg4iDy1+PEe+KWfEJTY5Cl8kcJVIW2G0GGsB+SrpkrpagCF+wvs+lC
         GnvIBXWS6iPlWKO7+SbgKV3XyOWcs7MkKfJsCJziZs8kEPmSZC5WtmI76dJ8XbURHZXJ
         XIkHFmKVVfS3V2UrshFhQssxLWFHdsZHNsJ1WTH9ksonurcmnD9YfOIqY8rPCqMe7wJ1
         3d2LURe1Hcbjo8v0cepJyuZ+MiOb1T4U5cev+eb8+DsAHDj95+GMfVi347Llox545Grw
         8Oug==
X-Gm-Message-State: AOAM532YN1VgoRsEIu9TS9NVTLNNP8KcEysfgyNOgNM1AVS/DnW2jkJu
        c2AQ3yelwI511ee0qZj9+NKgSA==
X-Google-Smtp-Source: ABdhPJx4Q4lWtmnNUv6boj5NY4zFqsipmmb2rPBmbMWdUlL6KNoQZXYHmpSMqsNrKKkxl3o+0+tGow==
X-Received: by 2002:a17:90b:915:: with SMTP id bo21mr17033324pjb.52.1592810569677;
        Mon, 22 Jun 2020 00:22:49 -0700 (PDT)
Received: from localhost ([122.172.111.76])
        by smtp.gmail.com with ESMTPSA id w5sm12579883pfn.22.2020.06.22.00.22.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 00:22:48 -0700 (PDT)
Date:   Mon, 22 Jun 2020 12:52:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org,
        thierry.reding@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bbasu@nvidia.com, mperttunen@nvidia.com
Subject: Re: [TEGRA194_CPUFREQ Patch v3 1/4] dt-bindings: arm: Add t194
 ccplex compatible and bpmp property
Message-ID: <20200622072247.agrvmw6sl3jwgjkz@vireshk-i7>
References: <1592775274-27513-1-git-send-email-sumitg@nvidia.com>
 <1592775274-27513-2-git-send-email-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592775274-27513-2-git-send-email-sumitg@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 22-06-20, 03:04, Sumit Gupta wrote:
> To do frequency scaling on all CPUs within T194 CPU Complex, we need
> to query BPMP for data on valid operating points. Document a compatible
> string under 'cpus' node to represent the CPU Complex for binding drivers
> like cpufreq which don't have their node or CPU Complex node to bind to.
> Also, document a property to point to the BPMP device that can be queried
> for all CPUs.

You shouldn't be putting how linux is going to use this information and entries
shouldn't be made just so cpufreq can bind to a driver.

Though I see that this is a real hardware register which you can use to interact
with the firmware ? And so it makes sense to have it, maybe in different form
though.

I will let Rob explain what would be the right way of doing this though.

> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index a018147..737b55e 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -162,6 +162,7 @@ properties:
>        - nvidia,tegra132-denver
>        - nvidia,tegra186-denver
>        - nvidia,tegra194-carmel
> +      - nvidia,tegra194-ccplex
>        - qcom,krait
>        - qcom,kryo
>        - qcom,kryo260
> @@ -255,6 +256,14 @@ properties:
>  
>        where voltage is in V, frequency is in MHz.
>  
> +  nvidia,bpmp:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    descrption: |
> +      Specifies the bpmp node that needs to be queried to get
> +      operating point data for all CPUs.
> +
> +      Optional for NVIDIA Tegra194 Carmel CPUs
> +
>    power-domains:
>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
>      description:
> -- 
> 2.7.4

-- 
viresh
