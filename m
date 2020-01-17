Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1913DC33CB1
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 15:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF6D72073A
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 15:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZpX3ENoo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgAQPXt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 10:23:49 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33435 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbgAQPXt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 10:23:49 -0500
Received: by mail-wm1-f65.google.com with SMTP id d139so9736426wmd.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 07:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dkNe4kET/zf9ui2pcK6IROMhAzPfyxCLje9tPX3krI0=;
        b=ZpX3ENooDUJWHNzXDf/sonItv8VeDn4au5KdQUeCkVgeGh042+z8QkMkG8RlcvIvwo
         ZT+JyuCF0RXxb1FrwESpUz6dEZJIy08zsOkc4KtWcsR502ELUgx56/zMEis5F4jiN1/h
         4D8RFabC/okM9UbWRzn+k9ZxJ45PYXsI0ZwY3F+d2Xp5WvfnfFxUl264wc8r1YvSEsRV
         uBmRfAwFEzraFvW4IuSUqLJAAOx1vECliMxAI1N436u4l9Sct4vyZBVAaQPnm29EdavK
         SRFK2wBlmHAlCbu0jYmtN681yuwGgnjxFTMpYrSQ/1RG3eXwGZdpsair3/TJPE7cqQga
         wWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dkNe4kET/zf9ui2pcK6IROMhAzPfyxCLje9tPX3krI0=;
        b=b2JguC8pfvL2Z/vz9HCjl67EODzq1ITfUWm0nzWL+/F+gWOmGyFnf/RLyhAoVo2IEN
         Y2lDnVnNViPGpfXJ3cD46/vdrv6lVHEns/uAuwRtsFFpU5vmFIKy+yW3DH2/zsoA5rfj
         aCpS5Lz/5axK+2eVN5ztH519HoKRlCPk+K2noiUMrHSZjARX/KDSf7enX9bhgnmYjCxm
         xOIKJJOUTHn9jh/rIb69HipHD1IzWLlz/JQMcxrs+UbBocXgQZe7znw02Z1y4wlcrtWU
         v5mLTr+edQmaqzIqNjjfrZecbff23XOta6b6AHp4koNkHv7oKzVV/uGlzStoOsIW/yps
         HOqA==
X-Gm-Message-State: APjAAAVVIu038iP8inRWp6rOA01n8GbDcOKw1RUIT9Dx06KP56nAyJcM
        y33AjwYTmRYBgvy90YVhti070Cy1FRQ=
X-Google-Smtp-Source: APXvYqwtuAYC5TrNKSJ7Q7fcxNQBR7D8Htv59qArzUeRFU7CI2r0YFfoIXNSbLHutUJ+67WX9lLkNw==
X-Received: by 2002:a05:600c:305:: with SMTP id q5mr4938892wmd.167.1579274625642;
        Fri, 17 Jan 2020 07:23:45 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id q19sm9245219wmc.12.2020.01.17.07.23.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jan 2020 07:23:45 -0800 (PST)
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
Date:   Fri, 17 Jan 2020 17:23:43 +0200
MIME-Version: 1.0
In-Reply-To: <20200114181519.3402385-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Thierry,

Thanks for the patch!

On 1/14/20 20:15, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the interconnects property that is used to describe the paths
> from and to system memory from and to the BPMP.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Rob, Georgi,
> 
> after the initial RFC that I did for adding interconnect properties on
> Tegra, I realized that the description wasn't complete. This is an
> attempt at a more accurate description, but unfortunately I'm not sure
> if it's even correct in terms of the interconnect bindings.
> 
> The problem here is that on Tegra, each device has multiple paths to
> system memory, and I have no good idea on what to pick as the default.
> They are all basically the same path, but each provides extra controls
> to configure the "interconnect".

Are these multiple paths between a device and system memory used simultaneously
for load-balancing, or who makes the decision about which path would be used? Is
this based on the client/stream ID that you mentioned previously? Looking at the
the binding below, it seems to me like there are different master/slave pairs
between MC and EMC and each link is used for unidirectional traffic only. In
terms of the interconnect API, both read and write paths have the same
direction. Is the EMC really an interconnect provider or is it just a slave
port? Can we scale both EMC and MC independently?

Thanks,
Georgi

> 
> Any ideas on how to resolve this? Let me know if the DT bindings and
> example don't make things clear enough.
> 
> Thierry
> 
>  .../firmware/nvidia,tegra186-bpmp.yaml        | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> index dabf1c1aec2f..d40fcd836e90 100644
> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> @@ -43,6 +43,24 @@ properties:
>        - enum:
>            - nvidia,tegra186-bpmp
>  
> +  interconnects:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: A list of phandle and specifier pairs that describe the
> +      interconnect paths to and from the BPMP.
> +
> +  interconnect-names:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: One string for each pair of phandle and specifier in the
> +      "interconnects" property.
> +    # XXX We need at least one of these to be named dma-mem so that the core
> +    # will set the DMA mask based on the DMA parent, but all of these go to
> +    # system memory eventually.
> +    items:
> +      - const: dma-mem
> +      - const: dma-mem
> +      - const: dma-mem
> +      - const: dma-mem
> +
>    iommus:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: |
> @@ -152,8 +170,43 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/clock/tegra186-clock.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/mailbox/tegra186-hsp.h>
> +    #include <dt-bindings/memory/tegra186-mc.h>
> +
> +    mc: memory-controller@2c00000 {
> +        compatible = "nvidia,tegra186-mc";
> +        reg = <0x02c00000 0xb0000>;
> +        interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +        status = "disabled";
> +
> +        #interconnect-cells = <1>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        ranges = <0x02c00000 0x0 0x02c00000 0x0 0xb0000>;
> +
> +        /*
> +         * Memory clients have access to all 40 bits that the memory
> +         * controller can address.
> +         */
> +        dma-ranges = <0x0 0x0 0x0 0x100 0x0>;
> +
> +        #memory-controller-cells = <0>;
> +
> +        emc: external-memory-controller@2c60000 {
> +            compatible = "nvidia,tegra186-emc";
> +            reg = <0x0 0x02c60000 0x0 0x50000>;
> +            interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&bpmp TEGRA186_CLK_EMC>;
> +            clock-names = "emc";
> +
> +            #interconnect-cells = <0>;
> +
> +            nvidia,bpmp = <&bpmp>;
> +        };
> +    };
>  
>      hsp_top0: hsp@3c00000 {
>          compatible = "nvidia,tegra186-hsp";
> @@ -187,6 +240,12 @@ examples:
>  
>      bpmp {
>          compatible = "nvidia,tegra186-bpmp";
> +        interconnects = <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPR>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
> +                        <&emc &mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
> +        interconnect-names = "dma-mem", "dma-mem", "dma-mem", "dma-mem";
> +
>          iommus = <&smmu TEGRA186_SID_BPMP>;
>          mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
>          shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
> 
