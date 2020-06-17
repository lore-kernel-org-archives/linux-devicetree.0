Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00602C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:50:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFD872080D
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592434254;
	bh=KzkM+lsl4BujlFsLQiy5SFgqhLV60bXNCylbVVoucn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=TC+LT6Zn3FIwkDA7EQKWR3QSlO7mbGh2nzbPokb0MdPTIQM0ZXkIWU4CQEQ69q45N
	 yYxaaZ+SeJqeSLSwrCSfnLKY2EO1RPZww2RT4lniq+zDigdy19KYhg4TGuETqNdQvv
	 /jLBXG7gIz2OmGFw39Q49pr704ySMxg2ooWScexU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgFQWuy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 18:50:54 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39540 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgFQWuy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 18:50:54 -0400
Received: by mail-io1-f68.google.com with SMTP id c8so4896886iob.6;
        Wed, 17 Jun 2020 15:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eGLWIOtrLKrlrpJ+78FkPmk2iugqeErAfDKhAjWxeQs=;
        b=H2e1pMOF3WkZ/Lmbm9WfqDE0ALzab+DZgh68l3DsfC6x4yU+m0Pf1OgdASycR9dzXk
         8Uj2FgkeIhbbSwn56/NMW0Di5rR0BZlbM6u7f7yYthV0bGxrrIKUQqBTIexwcP2pSztr
         dNCrfFOx0Vvqnacoslg1TXZ1xbbU4zZ3s0jWpjaaDh3/kVAOx8ZH7tsEWNlj01To7Ab2
         WfcxJQdhhe4rKzbVmsbIXRP1av9yw41APn7tpkgIFp0g/pMBJ+EoY+rI33HUcteO4m9/
         uG0V6BpcYljBviHRVL6mZMq44+T0qOC/wUHrvP9T3960qtUXleFTiYPSqzatU1kLD21C
         rBag==
X-Gm-Message-State: AOAM532v6omqXq+w87DIyVylr95mcHauhZq/vRJWtkgRZp3kFVPzPEbE
        0a2BiVEhH+CIxzyNHKFXdQ==
X-Google-Smtp-Source: ABdhPJyadh0hzHENRCOe2JcUAn8a+KITJjKBsLsCFaGT3L0t6JhCQFkSBrWTumNxsUsXu+t1si9KIA==
X-Received: by 2002:a6b:680f:: with SMTP id d15mr1895951ioc.148.1592434253245;
        Wed, 17 Jun 2020 15:50:53 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id g15sm528167ilq.39.2020.06.17.15.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 15:50:52 -0700 (PDT)
Received: (nullmailer pid 2986573 invoked by uid 1000);
        Wed, 17 Jun 2020 22:50:51 -0000
Date:   Wed, 17 Jun 2020 16:50:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 05/38] dt-bindings: firmware: tegra186-bpmp: Document
 interconnect paths
Message-ID: <20200617225051.GB2975260@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-6-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:30PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the interconnects property that is used to describe the paths
> from and to system memory from and to the BPMP.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../firmware/nvidia,tegra186-bpmp.yaml        | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> index 0e4d51ba7aa1..fd642eeb8dde 100644
> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> @@ -43,6 +43,21 @@ properties:
>        - enum:
>            - nvidia,tegra186-bpmp
>  
> +  interconnects:
> +    description: A list of phandle and specifier pairs that describe the
> +      interconnect paths to and from the BPMP.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"

Again, don't re-define standard properties.

> +
> +  interconnect-names:
> +    description: One string for each pair of phandle and specifier in the
> +      "interconnects" property.
> +    $ref: "/schemas/types.yaml#/definitions/string-array"
> +    items:
> +      - const: read
> +      - const: write
> +      - const: dma-mem # dma-read
> +      - const: dma-write
> +
>    iommus:
>      description: |
>        The phandle of the IOMMU and the IOMMU specifier. See ../iommu/iommu.txt
> @@ -158,6 +173,12 @@ examples:
>  
>      bpmp {
>          compatible = "nvidia,tegra186-bpmp";
> +        interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &emc>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &emc>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
> +        interconnect-names = "read", "write", "dma-mem", "dma-write";
> +
>          iommus = <&smmu TEGRA186_SID_BPMP>;
>          mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
>          shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
> -- 
> 2.24.1
> 
