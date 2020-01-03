Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78F9C00523
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 23:59:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF88D2073C
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 23:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578095950;
	bh=WSINDlYZOXc0c43h2uDaVzqFajUYWMCcqAmGeej/xUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DafSk1iIN8NVr7MpZH6xUO+FHbU3W+Bm24N5rAeG46BpzcQcXuExLUk7A+pQqY+LX
	 6KBRKHM02ra9bDwL/m+o6IzI7w+RCTPeBSfxqO3S2zex+kMgDjO68qizYtsdvzSzhl
	 dqw/k+bB2PnLXSP7X4aZT4eSsvUjspzCkQUqyd8c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgACX7K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 18:59:10 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:35041 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgACX7G (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 18:59:06 -0500
Received: by mail-io1-f66.google.com with SMTP id v18so43096027iol.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 15:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LACUrtg785uiAnshI5y6g26nVt7CN5SDOx6ApB3lhZY=;
        b=iefkML6d8Gy1O3azNktYtmQHBC09SbHuFvnhfen/srr1lgrJCkppFAGA4VPmlhyKM9
         FTGzxgzrvp32ctOjMb2l9unUbplKXJjJLL9rPVW3Me+ZzxJLHboh6P7XO1W3ihjnh6kR
         ET/fuWM8VdvUhPoFL1kfFOY6Gyz59wcMoF8edrSO0An++3PZVlmHiDRe1hYvUybFILIk
         hzLV5giqE+d8CiRL7TMcVnVM7ieHn7aFBJBZKDR8d5CNbl2W68jdTEQVRHo/Fehmsg+D
         CovXEFUnHxCkM6F9iLzMjwiO7BEJ287LKi2/k1cEEdwh+D1tNCgzocP61HUm0uxk19Jy
         Glbg==
X-Gm-Message-State: APjAAAUBFOb2gJFJ1D+IUlcUdUGnFswdUVtUTqpB0beWH4nW8cPDpi0L
        ZKenTzz34Yo8fa2dZ++4/B42mxw=
X-Google-Smtp-Source: APXvYqxEMPbRrF/zBC9/rsPrhoapW42pAxnMzqSiAxG0puNTerI2rt1lBWJupPiyZP3YtR8QZ/tbQA==
X-Received: by 2002:a05:6602:2345:: with SMTP id r5mr56169302iot.156.1578095945477;
        Fri, 03 Jan 2020 15:59:05 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y11sm21385745ilp.46.2020.01.03.15.59.04
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 15:59:04 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 16:59:02 -0700
Date:   Fri, 3 Jan 2020 16:59:02 -0700
From:   Rob Herring <robh@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        dikshita@codeaurora.org
Subject: Re: [PATCH v3 06/12] dt-bindings: media: venus: Convert msm8916 to
 DT schema
Message-ID: <20200103235902.GA7619@bogus>
References: <20191223113311.20602-1-stanimir.varbanov@linaro.org>
 <20191223113311.20602-7-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191223113311.20602-7-stanimir.varbanov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 23, 2019 at 01:33:05PM +0200, Stanimir Varbanov wrote:
> Convert qcom,msm8916-venus Venus binding to DT schema
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,msm8916-venus.yaml    | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> new file mode 100644
> index 000000000000..14331c16135c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Venus video encode and decode accelerators
> +
> +maintainers:
> +  - Stanimir Varbanov <stanimir.varbanov@linaro.org>
> +
> +description: |
> +  The Venus IP is a video encode and decode accelerator present
> +  on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: "qcom,msm8916-venus"

No need for quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 20

You can have 20 IOMMUs attached to the Venus IP? The binding is for 1 
SoC, you should know how many IOMMUs there are.

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  video-decoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: "venus-decoder"
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  video-encoder:
> +    type: object
> +
> +    properties:
> +      compatible:
> +        const: "venus-encoder"
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
> +  video-firmware:
> +    type: object
> +
> +    description: |
> +      Firmware subnode is needed when the platform does not
> +      have TrustZone.
> +
> +    properties:
> +      iommus:
> +        minItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - memory-region
> +  - video-decoder
> +  - video-encoder
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> +
> +        video-codec@1d00000 {
> +                compatible = "qcom,msm8916-venus";
> +                reg = <0x01d00000 0xff000>;
> +                interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +                clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
> +                        <&gcc GCC_VENUS0_AHB_CLK>,
> +                        <&gcc GCC_VENUS0_AXI_CLK>;
> +                clock-names = "core", "iface", "bus";
> +                power-domains = <&gcc VENUS_GDSC>;
> +                iommus = <&apps_iommu 5>;
> +                memory-region = <&venus_mem>;
> +
> +                video-decoder {
> +                        compatible = "venus-decoder";
> +                };
> +
> +                video-encoder {
> +                        compatible = "venus-encoder";
> +                };
> +        };
> -- 
> 2.17.1
> 
