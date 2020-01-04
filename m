Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D71C32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:44:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C71924649
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578098643;
	bh=idQUNlbmoxDsTYMKuX4PhLGQ3+A5EzdFV2CMmcoRj9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0bl3itAtgdEuxhT216yxLCwm/USuj4bGs051LbKiYRGFMq5jriFbqztayoqs+/4qE
	 RM6ChiX18AyS0jCj9qlH9jX1/72gPR+hY1h75mP4TaJooFD53SpfH18brH9z1hJOSV
	 +5LHE+CuduYo2iybHWoYo+NBOcr4cj7pfoKjzs5c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgADAoA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:44:00 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:39309 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgADAoA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:44:00 -0500
Received: by mail-io1-f67.google.com with SMTP id c16so13283992ioh.6
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KVOAVEbJI4by8dHylpbGdlYjAc7ICQ7+bWPH7m8U5UI=;
        b=HrG50xdW/zKAAQFfb8wTPbEFlz/dW6+vyO+WPjUGaCD03lntOP3g1XXw7xEc/n61N0
         stsgsXsUz9MFGjGdX42VoRgEGo7EAzpWKDHA3rMtRiUFuy0A2ri4wagGgt6eNADjB82K
         9isPAlk26zmhkrdrqpanPaJnPJLPmfl/qAXYp/XJRsQGTu1B435WnpF39CEMDDEJTdyZ
         ZWsbbU6x6pI0iEtO9Q35Vp6JBHGfEktTGsZ2jvYwe4IMJ6QM0VJ+86JeOBoL0Hh9GDOW
         Jcb2f4p3l0E/BzG3QxegAH53uVX1FmfmYYCtBTzLljAdfaK3wFk5xwKxnYG22LqrYJV0
         KvoA==
X-Gm-Message-State: APjAAAUX5Qbu4LlZk5HkSw7twj4Pl6z4PuwOgfAVrxU2bgJwEDrwoOCb
        Eg8226lFnlhzKR2dgWRb7+VeX6Y=
X-Google-Smtp-Source: APXvYqzgDOS5xreKu5ex83lShAN4DYVy23XOKRAbN9DTNXciTmMINL2kkjy+ThE18rpWTLE7MNMxUQ==
X-Received: by 2002:a5d:884c:: with SMTP id t12mr61956076ios.171.1578098638967;
        Fri, 03 Jan 2020 16:43:58 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id i13sm15255051ioi.67.2020.01.03.16.43.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:43:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:43:57 -0700
Date:   Fri, 3 Jan 2020 17:43:57 -0700
From:   Rob Herring <robh@kernel.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH V3 2/4] dt-bindings: media: venus: Add sc7180 DT schema
Message-ID: <20200104004357.GA16614@bogus>
References: <1577971501-3732-1-git-send-email-dikshita@codeaurora.org>
 <1577971501-3732-3-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577971501-3732-3-git-send-email-dikshita@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 02, 2020 at 06:54:59PM +0530, Dikshita Agarwal wrote:
> Add new qcom,sc7180-venus DT binding schema.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  .../bindings/media/qcom,venus-sc7180.yaml          | 136 +++++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
> new file mode 100644
> index 0000000..b78952c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/qcom,venus-sc7180.yaml#"
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
> +    const: "qcom,sc7180-venus"

No need for quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    maxItems: 2

You can drop maxItems. Implied by size of 'items'.

> +    items:
> +      - const: venus
> +      - const: vcodec0
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +      - const: bus
> +      - const: vcodec0_core
> +      - const: vcodec0_bus
> +
> +  iommus:
> +    minItems: 1
> +    maxItems: 20

As I said on the other Venus schemas, can you really have 20 IOMMUs 
attached? This is a single SoC, you should know how many are attached.

Rob

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  video-core0:
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
> +  video-core1:
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
> +  - power-domain-names
> +  - clocks
> +  - clock-names
> +  - iommus
> +  - memory-region
> +  - video-core0
> +  - video-core1
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        #include <dt-bindings/clock/qcom,videocc-sc7180.h>
> +
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,sc7180-venus";
> +			reg = <0 0x0aa00000 0 0xff000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&videocc VENUS_GDSC>,
> +					<&videocc VCODEC0_GDSC>;
> +			power-domain-names = "venus", "vcodec0";
> +			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> +			clock-names = "core", "iface", "bus",
> +				"vcodec0_core", "vcodec0_bus";
> +			iommus = <&apps_smmu 0x0c00 0x60>;
> +			memory-region = <&venus_mem>;
> +

> +			interconnects = <&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI1>,
> +					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_VENUS_CFG>;
> +			interconnect-names = "video-mem", "cpu-cfg";

Not documented.

> +
> +			video-core0 {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-core1 {
> +				compatible = "venus-encoder";
> +			};
> +
> +		};
> -- 
> 1.9.1
> 
