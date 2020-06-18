Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290DAC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 15:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 013AC206FA
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 15:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592494620;
	bh=jlMdP1cuQV6STiVvBbVS7Mq9pJuMwVMDdrlCY1KLLEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fnq80rakAiGpQhgAOqiBR7eLCZ2LlLjQYfISahpjRBBji09ZegfAQFZu5112tEC/O
	 DNjMza+l85A+EEaZ0qRiq8KYJxarzCj+DpFsWeaZFwtDJlB9GyaWE1PRowFKLICWQk
	 n4aIt6Sx76uSNsIBxsXEZkt5/wEHK2398iiROd+E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgFRPg7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 11:36:59 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36441 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgFRPg7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 11:36:59 -0400
Received: by mail-io1-f66.google.com with SMTP id r77so7541104ior.3;
        Thu, 18 Jun 2020 08:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3aEkhJUrZmS5V0KXN7Cf2MSQUI9Kjw+gs+DgWQ746D8=;
        b=ncHFYYeV2L2UJWjJrzXeEwQagbi4kIJo36xDLbRbYAdBFS03gBZLuBJU1FpA/+30c8
         856EwCI/891JLkrI1hq+1XQU3MKbZhLOT74l0+634dtgZn2lVCALeH/JHMXjgTNXk89X
         bzhDSVhfrDSVRjal64jnnxRMysL5l01fwFqpMaJNMxt0LFgVzrGszPRa3nkDbumEaN1Y
         ID2K/sXo5HogzoLIbV0x3iEDBDszOego/O3esR1dzRrEenLjWFdaA6SCfO3DJqXtBVTl
         uDkyPeCWh73SPW2WaFj64e3pvJJsmiXRq+M9K59Et1LFp4D0BceJFGIM6RBo3Il4B2RR
         WkwA==
X-Gm-Message-State: AOAM532M+G6DaPkSjortotwSEJyOHWjHMnKxuBdoUMEbPoMBkwJLywXR
        FGlJ53IkX6enXzU9ycADlg==
X-Google-Smtp-Source: ABdhPJyn118DZlPJ+hufDbtS9UEk7yc4YAcjLX5q312zt2xocQXal6ECxd0a2b92b/if5lLG1MBx+w==
X-Received: by 2002:a6b:bbc3:: with SMTP id l186mr5623717iof.186.1592494617763;
        Thu, 18 Jun 2020 08:36:57 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j63sm1748029ilg.50.2020.06.18.08.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:36:57 -0700 (PDT)
Received: (nullmailer pid 398703 invoked by uid 1000);
        Thu, 18 Jun 2020 15:36:56 -0000
Date:   Thu, 18 Jun 2020 09:36:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 35/38] dt-bindings: memory: Update Tegra210 EMC bindings
Message-ID: <20200618153656.GA389512@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-36-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-36-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 04:19:00PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Tegra210 EMC is a cooling device because it can throttle the EMC
> frequency if the chip gets too hot. The device tree node therefore needs
> to contain the "#cooling-cells" property. Furthermore, multiple reserved
> memory regions can now be attached to the EMC device tree node, and the
> new memory-region-names property can be used to differentiate between
> them.
> 
> While at it, update the example to make it more fully-featured.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra210-emc.yaml                  | 34 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> index 49ab09252e52..4e8f659f1a7c 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> @@ -34,16 +34,25 @@ properties:
>        - description: EMC general interrupt
>  
>    memory-region:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description:
> -      phandle to a reserved memory region describing the table of EMC
> -      frequencies trained by the firmware
> +    description: List of phandles to reserved memory regions describing the
> +      nominal and derated tables of EMC frequencies trained by the firmware.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +
> +  memory-region-names:
> +    $ref: "/schemas/types.yaml#/definitions/string-array"

*-names has a type, so can be dropped.

> +    items:
> +      - const: nominal
> +      - const: derated
>  
>    nvidia,memory-controller:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Quotes aren't needed here. (We haven't been consistent on this).

>      description:
>        phandle of the memory controller node
>  
> +  "#cooling-cells":
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    const: 2
> +
>  required:
>    - compatible
>    - reg
> @@ -51,7 +60,10 @@ required:
>    - clock-names
>    - nvidia,memory-controller
>  
> -additionalProperties: false
> +dependencies:
> +  memory-region-names: [ memory-region ]

The core schema should handle this (probably needs to be added).

> +
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -63,10 +75,15 @@ examples:
>          #size-cells = <1>;
>          ranges;
>  
> -        emc_table: emc-table@83400000 {
> +        nominal: emc-table@83400000 {
>              compatible = "nvidia,tegra210-emc-table";
>              reg = <0x83400000 0x10000>;
>          };
> +
> +        derated: emc-table@83410000 {
> +            compatible = "nvidia,tegar210-emc-table";
> +            reg = <0x83410000 0x10000>;
> +        };
>      };
>  
>      external-memory-controller@7001b000 {
> @@ -77,6 +94,7 @@ examples:
>          clocks = <&tegra_car TEGRA210_CLK_EMC>;
>          clock-names = "emc";
>          interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> -        memory-region = <&emc_table>;
> +        memory-region-names = "nominal", "derated";
> +        memory-region = <&nominal>, <&derated>;
>          nvidia,memory-controller = <&mc>;
>      };
> -- 
> 2.24.1
> 
