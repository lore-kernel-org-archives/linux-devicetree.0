Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F9CC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 15:52:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E771207F7
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 15:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDNVxxVF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgFLPws (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 11:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgFLPws (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 11:52:48 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D79C03E96F;
        Fri, 12 Jun 2020 08:52:48 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a9so11644774ljn.6;
        Fri, 12 Jun 2020 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ngxP9d882wSIC52BGC505gmbvcSvv4FQSvCLZiICdxU=;
        b=hDNVxxVFBJc3Rnd9OIBGgKRv2GcIWT9vDYa8bEXhECdxB+G162xkIXg2o2UlQQ4o4K
         rn+oPJkBK358YYcLC7TkxDSMLuvj/FaKeXZbIl8q84XJZvR8EUiVXYhwDPAk4Xo//RrS
         Isf+LWw+/aND75K26sOSwLljTdenqG96lFth8/awlz/VFTjQarvVKpsdtlm85URCk40g
         P0KLbTyhYmltSqntsYLNsRHM8xTEYj9jtc2ChoXF8lDzGL0KuqVKyX01hSZRCIzU3Qo+
         5eXrrt0WCrtMuT49gW/mqIOmhL+LGFPEsaD63Cqg/JLoiSDdthHRLjvj4ZUN4g+Kwsxn
         eXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ngxP9d882wSIC52BGC505gmbvcSvv4FQSvCLZiICdxU=;
        b=WZnYalarsb7TC0qtRzURqTqDynXp6oBWcl7LN5eg7X42rsTwcUzwWanJkswt+zEwZz
         r/9Wa8+ItXdu+EffAbIcjtPjEzmgiLv0YkpyCTtzSeJcyEUHcgnMdvWk0fPh93xvk6ww
         iGyeKSiAIZyDleIAJ6Ya1wj75WCBfCFLVijWAS4J0AOijRpm5Q11t7MfUlxusFi+RMVF
         SJdLKVfzLpcipgs5QbqJfldKOpcjoN5Wr12ZliU32X+aMRktwjp1i1jDKiDIQBkdtPoE
         o/haKDKY8Wj5X0HqYm4pGurWXvLEpd6M+/O8cCbk3Jbn/VjuSgXFOAAK9G+i8ozkxyMb
         5q3A==
X-Gm-Message-State: AOAM531RK0CYhBUoGhaXgiBNkwNXoC+Sa/t79ELjQIZ/XBnWv+0diGUl
        btldMB1N+cpiU1Q1XKJzsr4Gh9rt
X-Google-Smtp-Source: ABdhPJwn5wXqEGDojWxU8BnGJM5ieDziHYQYjX2+TwYrRp7ijJzdhmTdig0fvvTiG7LWybtiZH6xMQ==
X-Received: by 2002:a2e:8601:: with SMTP id a1mr6640105lji.255.1591977166104;
        Fri, 12 Jun 2020 08:52:46 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id 66sm2547867lfk.54.2020.06.12.08.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 08:52:45 -0700 (PDT)
Subject: Re: [PATCH 08/38] dt-bindings: display: tegra: Document interconnect
 paths
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-9-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <82888e53-c539-7d61-666d-bd6dbc494bfe@gmail.com>
Date:   Fri, 12 Jun 2020 18:52:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200612141903.2391044-9-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Thierry,

12.06.2020 17:18, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
Commit description is missing, checkpatch should warn about it.

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.yaml  | 52 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> index 3347e1b3c8f0..684fe25641f1 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> @@ -97,8 +97,17 @@ properties:
>    iommus:
>      $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
>  
> -  memory-controllers:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array

Why memory-controllers property is removed?

> +  interconnects:
> +    description: Description of the interconnect paths for the host1x
> +      controller; see ../interconnect/interconnect.txt for details.
> +    items:
> +      - description: memory read client for host1x
> +
> +  interconnect-names:
> +    description: A list of names identifying each entry listed in the
> +      "interconnects" property.
> +    items:
> +      - const: dma-mem # read

Please notice that Host1x has two memory clients: one for DMA engine and
second I don't know what's for, maybe for indirect memory accesses. Why
you skipped the second path?

>  required:
>    - compatible
> @@ -489,6 +498,26 @@ allOf:
>              iommus:
>                $ref: "/schemas/types.yaml#/definitions/phandle-array"
>  
> +            #interconnects:
> +            #  items:
> +            #    - description: memory read client for window A
> +            #    - description: memory read client for window B
> +            #    - description: memory read client for window C
> +            #    - description: memory read client for cursor
> +            #    # disp only
> +            #    - description: memory read client for window T
> +            #    - description: memory read client for window D
> +
> +            #interconnect-names:
> +            #  items:
> +            #    - const: wina
> +            #    - const: winb
> +            #    - const: winc
> +            #    - const: cursor
> +            #    # disp only
> +            #    - const: wint
> +            #    - const: wind

Is this really intended to be commented out? Looks like this is an
unfinished patch.

In the patch [1] I used memory client names for the interconnect paths.
I like yours variant of the naming, it is more intuitive.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200609131404.17523-23-digetx@gmail.com/

I'll rebase my series on top of yours patches once you'll get them into
linux-next. Looking forward to v2!
