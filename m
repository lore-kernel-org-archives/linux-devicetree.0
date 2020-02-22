Return-Path: <SRS0=C9Bv=4K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F889C35666
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 14:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB19720702
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 14:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="BDD2LYnN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbgBVO6p (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Feb 2020 09:58:45 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42010 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbgBVO6p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Feb 2020 09:58:45 -0500
Received: by mail-lf1-f65.google.com with SMTP id 83so3628982lfh.9
        for <devicetree@vger.kernel.org>; Sat, 22 Feb 2020 06:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=22sCVmgYfxumFwE6ka2/N0j/kYteb6WIfPOgGgCHluQ=;
        b=BDD2LYnN6Kn7VtWK03Zk1oP11ZNrZvkryw52Sol5noa1IrV3/gh9497+KWHFfukInp
         H9WG1/NNs4ryW9H7PQM6yMOQtMK7hTG9q1owLo5W8w/cnZPfJl1wZAYzosuUWNOo5iGm
         0m5/iRTikpgVP9Wk90nCMaKuCA7ejFQKk7LzzA8aBCKgwjZVn2uAEF4x0zgvjNmVKdui
         a4MXn6Arhd7g6tZnYVk//DXI6nqa4RZ1moUPXlBUtkbyZnagNnpkfVYRhh+IUwH1if0z
         yNKX7/vkZb8il11O1fsoOFuTpezeFhuAO6wE+QDqIowFcIWlp7yxt8bwViu9gPjjA6Hx
         DoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=22sCVmgYfxumFwE6ka2/N0j/kYteb6WIfPOgGgCHluQ=;
        b=UljVslyfrm/uW9P5i/pH5D4rZkWOIo5UPIrCkUYG61HSOE/3jB8BZdJYmkvBJTQ2C2
         7agx4X+5TkbWzposzvsZpD+sOfYllPPdvFdfWm9gLRYclDQko9FIKBuSRxxLOvlEo7sB
         2S97r92b59Eyn6xNX2Hs0qDo+xLxVCaUhsBTF/XI/LcME2SxCdpcE2eEaDpCgggRwfZy
         wgjB5aHfwq2cVcWOUw/Jrj5p2vCFVHBtYfBAtovosa3MPQe6S3o2VvV/YoeLCtsv/Ere
         lKqjvdel6tJGB+IGM/6eSf3MidoWUgI0fsA8cJSQwgjsl2UA6U8XrJhNe1P+nKerIdzD
         t8lA==
X-Gm-Message-State: APjAAAWsoixH9XbyncBgVC3YbCtEy9EpSJNpC1dnJ6PR3mvSM4fQMiq7
        7OEehk1uiS5JjUw5ZLYu27JOpw==
X-Google-Smtp-Source: APXvYqyxUEKoWyaLCyvyvLLdqteGGq57VnEDUZkNRmpZsdyK61bq5cZQ0OoyHPca46c+T5GtRCEcXg==
X-Received: by 2002:a19:f608:: with SMTP id x8mr22591799lfe.115.1582383522603;
        Sat, 22 Feb 2020 06:58:42 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id m83sm3306652lfa.5.2020.02.22.06.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2020 06:58:41 -0800 (PST)
Date:   Sat, 22 Feb 2020 15:58:41 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: rcar-sysc: Convert to json-schema
Message-ID: <20200222145841.GD1444588@oden.dyn.berto.se>
References: <20200221121022.30970-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200221121022.30970-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-02-21 13:10:22 +0100, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car System Controller Device Tree binding
> documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/power/renesas,rcar-sysc.txt      | 62 ----------------
>  .../bindings/power/renesas,rcar-sysc.yaml     | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
>  create mode 100644 Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
> deleted file mode 100644
> index acb41fade926e2de..0000000000000000
> --- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -DT bindings for the Renesas R-Car (RZ/G) System Controller
> -
> -== System Controller Node ==
> -
> -The R-Car (RZ/G) System Controller provides power management for the CPU cores
> -and various coprocessors.
> -
> -Required properties:
> -  - compatible: Must contain exactly one of the following:
> -      - "renesas,r8a7743-sysc" (RZ/G1M)
> -      - "renesas,r8a7744-sysc" (RZ/G1N)
> -      - "renesas,r8a7745-sysc" (RZ/G1E)
> -      - "renesas,r8a77470-sysc" (RZ/G1C)
> -      - "renesas,r8a774a1-sysc" (RZ/G2M)
> -      - "renesas,r8a774b1-sysc" (RZ/G2N)
> -      - "renesas,r8a774c0-sysc" (RZ/G2E)
> -      - "renesas,r8a7779-sysc" (R-Car H1)
> -      - "renesas,r8a7790-sysc" (R-Car H2)
> -      - "renesas,r8a7791-sysc" (R-Car M2-W)
> -      - "renesas,r8a7792-sysc" (R-Car V2H)
> -      - "renesas,r8a7793-sysc" (R-Car M2-N)
> -      - "renesas,r8a7794-sysc" (R-Car E2)
> -      - "renesas,r8a7795-sysc" (R-Car H3)
> -      - "renesas,r8a7796-sysc" (R-Car M3-W)
> -      - "renesas,r8a77961-sysc" (R-Car M3-W+)
> -      - "renesas,r8a77965-sysc" (R-Car M3-N)
> -      - "renesas,r8a77970-sysc" (R-Car V3M)
> -      - "renesas,r8a77980-sysc" (R-Car V3H)
> -      - "renesas,r8a77990-sysc" (R-Car E3)
> -      - "renesas,r8a77995-sysc" (R-Car D3)
> -  - reg: Address start and address range for the device.
> -  - #power-domain-cells: Must be 1.
> -
> -
> -Example:
> -
> -	sysc: system-controller@e6180000 {
> -		compatible = "renesas,r8a7791-sysc";
> -		reg = <0 0xe6180000 0 0x0200>;
> -		#power-domain-cells = <1>;
> -	};
> -
> -
> -== PM Domain Consumers ==
> -
> -Devices residing in a power area must refer to that power area, as documented
> -by the generic PM domain bindings in
> -Documentation/devicetree/bindings/power/power_domain.txt.
> -
> -Required properties:
> -  - power-domains: A phandle and symbolic PM domain specifier, as defined in
> -		   <dt-bindings/power/r8a77*-sysc.h>.
> -
> -
> -Example:
> -
> -	L2_CA15: cache-controller@0 {
> -		compatible = "cache";
> -		power-domains = <&sysc R8A7791_PD_CA15_SCU>;
> -		cache-unified;
> -		cache-level = <2>;
> -	};
> diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
> new file mode 100644
> index 0000000000000000..8daa23e1c49a3f81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/renesas,rcar-sysc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: DT bindings for the Renesas R-Car and RZ/G System Controller
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Magnus Damm <magnus.damm@gmail.com>
> +
> +description:
> +  The R-Car (RZ/G) System Controller provides power management for the CPU
> +  cores and various coprocessors.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a7743-sysc  # RZ/G1M
> +      - renesas,r8a7744-sysc  # RZ/G1N
> +      - renesas,r8a7745-sysc  # RZ/G1E
> +      - renesas,r8a77470-sysc # RZ/G1C
> +      - renesas,r8a774a1-sysc # RZ/G2M
> +      - renesas,r8a774b1-sysc # RZ/G2N
> +      - renesas,r8a774c0-sysc # RZ/G2E
> +      - renesas,r8a7779-sysc  # R-Car H1
> +      - renesas,r8a7790-sysc  # R-Car H2
> +      - renesas,r8a7791-sysc  # R-Car M2-W
> +      - renesas,r8a7792-sysc  # R-Car V2H
> +      - renesas,r8a7793-sysc  # R-Car M2-N
> +      - renesas,r8a7794-sysc  # R-Car E2
> +      - renesas,r8a7795-sysc  # R-Car H3
> +      - renesas,r8a77961-sysc # R-Car M3-W+
> +      - renesas,r8a77965-sysc # R-Car M3-N
> +      - renesas,r8a7796-sysc  # R-Car M3-W
> +      - renesas,r8a77970-sysc # R-Car V3M
> +      - renesas,r8a77980-sysc # R-Car V3H
> +      - renesas,r8a77990-sysc # R-Car E3
> +      - renesas,r8a77995-sysc # R-Car D3
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // System Controller node
> +    sysc: system-controller@e6180000 {
> +            compatible = "renesas,r8a7791-sysc";
> +            reg = <0xe6180000 0x0200>;
> +            #power-domain-cells = <1>;
> +    };
> +
> +  - |
> +    // Power Domain consumers
> +    #include <dt-bindings/power/r8a7791-sysc.h>
> +
> +    cache-controller-0 {
> +            compatible = "cache";
> +            power-domains = <&sysc R8A7791_PD_CA15_SCU>;
> +            cache-unified;
> +            cache-level = <2>;
> +    };
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
