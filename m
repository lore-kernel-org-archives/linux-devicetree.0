Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88F5C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92AAB21527
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 22:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592434511;
	bh=58j3VSwjZmV1T7eENirqZZ4mWmqPjRN8JitMuK0VxOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wzxpV525+3uFNK9dknZ5pRoqrU5PFghEmJKIxYnkqqVm2VAcwyGpkAQqqQpkiy1QI
	 VTrwPhfTDH60ICkmwUKbpTG93xj721YLSv/E40mr5h8eCL9MmoOY97fwsMU4KDCYhg
	 lv6Pgg6Zjt/mnL+9bh7/xivkDF/D7tnftfX6Akuc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgFQWzL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 18:55:11 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:43905 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgFQWzK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 18:55:10 -0400
Received: by mail-il1-f194.google.com with SMTP id g3so3950593ilq.10;
        Wed, 17 Jun 2020 15:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MN+s3/r/UzFM/9YsuOOX0MibEuBabHitGYwqrG0Ui/k=;
        b=duB19aPtV+n6tYVLKbyfDwA5FhsdZPtY6RrZad/zvhSeeJQCvhhV/kASU/FeLy5a2x
         oEzEhoatJCf8+gYvWeSibxtDMsKQeLge3YpCDhCRsfyWgRkCSaf/ThYBpHeP5BIjaPgM
         WvF7N8Wsayy6NPu2PwTQKH1k8eHkij9LYARBgb4gwVDLhr6DiZuf0bHKyUPfcfq4YpNw
         Gy7N9Asv+7CoMXdr5oR/yqgh7UzeWqOILzs5FdLBZkFze/a3iKT8EKPYFeAiYvXZuhMM
         9Ok2YomszxC+US7jKx4QxSTC9om7mRtVZA/Swu4ZdHqO90OOdPc4l4ZzW1pGpLbGhBS6
         hLqw==
X-Gm-Message-State: AOAM533l5VSokZieezcdEKwLpdVQB8KpHmxSx7LVSqZjlAUkrt4jZJvq
        ttd0AzJ41BK7bqnWFdBpOUzjeKRlEA==
X-Google-Smtp-Source: ABdhPJxDR0shaOjNl/kznRz+h74zkVhcifsn5Xt3Gx5AZyOA4IZTs5jQAOdKVan77xxt8HDoDT6pMg==
X-Received: by 2002:a92:dccd:: with SMTP id b13mr1249866ilr.98.1592434508356;
        Wed, 17 Jun 2020 15:55:08 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id v2sm649893iol.36.2020.06.17.15.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 15:55:07 -0700 (PDT)
Received: (nullmailer pid 2993174 invoked by uid 1000);
        Wed, 17 Jun 2020 22:55:06 -0000
Date:   Wed, 17 Jun 2020 16:55:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 06/38] dt-bindings: display: tegra: Document display-hub
Message-ID: <20200617225506.GC2975260@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-7-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-7-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:31PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra186 and later have an additional component in the display pipeline
> called the display hub. Document the bindings which were missing.

I'd rather this be after the conversion or I'm reviewing it twice.

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> index 47319214b5f6..2cf3cc4893da 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> @@ -297,6 +297,56 @@ of the following host1x client modules:
>    - reset-names: Must include the following entries:
>      - vic
>  
> +- display-hub: display controller hub
> +  Required properties:
> +  - compatible: "nvidia,tegra<chip>-display"
> +  - reg: Physical base address and length of the controller's registers.
> +  - interrupts: The interrupt outputs from the controller.
> +  - clocks: Must contain an entry for each entry in clock-names.
> +    See ../clocks/clock-bindings.txt for details.
> +  - clock-names: Must include the following entries:
> +    - disp
> +    - dsc
> +    - hub
> +  - resets: Must contain an entry for each entry in reset-names.
> +    See ../reset/reset.txt for details.
> +  - reset-names: Must include the following entries:
> +    - misc
> +    - wgrp0
> +    - wgrp1
> +    - wgrp2
> +    - wgrp3
> +    - wgrp4
> +    - wgrp5
> +  - power-domains: A list of phandle and specifiers identifying the power
> +    domains that the display hub is part of.
> +  - ranges: Range of registers used for the display controllers.
> +
> +  Each subnode of the display hub represents one of the display controllers
> +  available:
> +
> +  - display: display controller
> +    - compatible: "nvidia,tegra<chip>-dc"
> +    - reg: Physical base address and length of the controller's registers.
> +    - interrupts: The interrupt outputs from the controller.
> +    - clocks: Must contain an entry for each entry in clock-names.
> +      See ../clocks/clock-bindings.txt for details.
> +    - clock-names: Must include the following entries:
> +      - dc
> +    - resets: Must contain an entry for each entry in reset-names.
> +      See ../reset/reset.txt for details.
> +    - reset-names: Must include the following entries:
> +      - dc
> +    - power-domains: A list of phandle and specifiers that identify the power
> +      domains that this display controller is part of.
> +    - iommus: A phandle and specifier identifying the SMMU master interface of
> +      this display controller.
> +    - nvidia,outputs: A list of phandles of outputs that this display
> +      controller can drive.

Seems like an OF graph should describe this?

> +    - nvidia,head: The number of the display controller head. This is used to
> +      setup the various types of output to receive video data from the given
> +      head.

Not really clear what this is...

> +
>  Example:
>  
>  / {
> -- 
> 2.24.1
> 
