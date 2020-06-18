Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82669C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:41:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A9FA21974
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 02:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592448102;
	bh=W9YR0FBLBPyxu2YSRiZmfYYwLxoic+L9MR3J88jkM50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jP1HVYm+hSY2CGnEQq2h/pFEWhv7mkTs32zTgeLeHAaiNmfwq3ZsgxSv0/C6InG1O
	 +R+PRuc7Ju4k78ji4AFWRfwVAUcIdd1z5WsL0cR/tjqATDLSZS4Y/Ey7FQx2+2Lq3q
	 bAr3ypjMu107cFxCrtElAEl6v5ernrAEYDEXrePQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgFRCll (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 22:41:41 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44997 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729164AbgFRCli (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 22:41:38 -0400
Received: by mail-io1-f65.google.com with SMTP id i4so2292657iov.11;
        Wed, 17 Jun 2020 19:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kPR11waPtO8cERb5gkBl1FLsPnLlDXA9NPMuekrm220=;
        b=kjhV08nFBWYysaiszxGr7kT0STUD3bA8/m+Jvme5twpwSNGIgYT3evZPDSHbUypesr
         kiCbvFPImxKKVXFgF7UzAohYlrsbWuAMf/lGs/N+tY/E/TuBTFwK8U7vGlrzC+ZKe+cI
         7XS/7o6oTWx/6TucQGJiG3CywfhcLJedPrRn7JnjV2O4GE7yJ9DapwWpGQ4s5MpsoOwx
         aWSyjxhDkrUURYZtun9LJfk5fK7k2TSxVjL9qRBH2Wv6YrZWeh4MNm1a0PoHKT68cHQa
         +KHRsfmkDQgpxR87dof3eFnGhFWE2pDxH7C/Wn3fD4mPD30+NOCSHdnEywqcbJ+A9QY8
         ZlPw==
X-Gm-Message-State: AOAM532apFhSjLYMQtx84fW8aj0hUCI1PSvoKBLuUakGb8trYA8qV8JP
        8YlvlNmV3czS7GtTLRFNiiEVntzemA==
X-Google-Smtp-Source: ABdhPJxx7rbcZOOM9HLdbUB/qEDdijEIjkt5KzJR4R96N4RHijmb66sU9h5xlzwFRmZwVoHhT8b5Dg==
X-Received: by 2002:a02:a392:: with SMTP id y18mr2378988jak.112.1592448097293;
        Wed, 17 Jun 2020 19:41:37 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id i10sm776150ilp.28.2020.06.17.19.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 19:41:36 -0700 (PDT)
Received: (nullmailer pid 3370212 invoked by uid 1000);
        Thu, 18 Jun 2020 02:41:35 -0000
Date:   Wed, 17 Jun 2020 20:41:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 21/38] dt-bindings: sound: sgtl5000: Convert to
 json-schema
Message-ID: <20200618024135.GA3363480@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-22-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-22-thierry.reding@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:46PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Freescale SGTL5000 device tree bindings from free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/sound/sgtl5000.txt    |  60 ----------
>  .../devicetree/bindings/sound/sgtl5000.yaml   | 103 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   2 -
>  3 files changed, 103 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/sgtl5000.yaml


> diff --git a/Documentation/devicetree/bindings/sound/sgtl5000.yaml b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
> new file mode 100644
> index 000000000000..4f29b63c54d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/sgtl5000.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale SGTL5000 Stereo Codec
> +
> +maintainers:
> +  - Fabio Estevam <festevam@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: fsl,sgtl5000
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: the clock provider of SYS_MCLK
> +
> +  VDDA-supply:
> +    description: the regulator provider of VDDA
> +
> +  VDDIO-supply:
> +    description: the regulator provider of VDDIO
> +
> +  VDDD-supply:
> +    description: the regulator provider of VDDD
> +
> +  micbias-resistor-k-ohms:
> +    description: The bias resistor to be used in kOhms. The resistor can take
> +      values of 2k, 4k or 8k. If set to 0 it will be off. If this node is not
> +      mentioned or if the value is unknown, then micbias resistor is set to
> +      4k.
> +    $ref: "/schemas/types.yaml#/definitions/uint32"

Anything with standard unit suffix already has a type.

> +    enum: [ 0, 2, 4, 8 ]
> +
> +  micbias-voltage-m-volts:
> +    description: The bias voltage to be used in mVolts. The voltage can take
> +      values from 1.25V to 3V by 250mV steps. If this node is not mentioned
> +      or the value is unknown, then the value is set to 1.25V.
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    enum: [ 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000 ]
> +
> +  lrclk-strength:
> +    description: |
> +      The LRCLK pad strength. Possible values are: 0, 1, 2 and 3 as per the
> +      table below:
> +
> +        VDDIO		1.8V		2.5V		3.3V
> +        0 =		Disable
> +        1 =		1.66 mA		2.87 mA		4.02  mA
> +        2 =		3.33 mA		5.74 mA		8.03  mA
> +        3 =		4.99 mA		8.61 mA		12.05 mA
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    enum: [ 0, 1, 2, 3 ]
> +
> +  sclk-strength:
> +    description: |
> +      The SCLK pad strength. Possible values are: 0, 1, 2 and 3 as per the
> +      table below:
> +
> +        VDDIO		1.8V		2.5V		3.3V
> +        0 =		Disable
> +        1 =		1.66 mA		2.87 mA		4.02  mA
> +        2 =		3.33 mA		5.74 mA		8.03  mA
> +        3 =		4.99 mA		8.61 mA		12.05 mA
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    enum: [ 0, 1, 2, 3 ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +  - clocks
> +  - VDDA-supply
> +  - VDDIO-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        codec@a {
> +            compatible = "fsl,sgtl5000";
> +            reg = <0x0a>;
> +            #sound-dai-cells = <0>;
> +            clocks = <&clks 150>;
> +            micbias-resistor-k-ohms = <2>;
> +            micbias-voltage-m-volts = <2250>;
> +            VDDA-supply = <&reg_3p3v>;
> +            VDDIO-supply = <&reg_3p3v>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 4165352a590a..b7e94fe8643f 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -80,8 +80,6 @@ properties:
>            - fsl,mpl3115
>              # MPR121: Proximity Capacitive Touch Sensor Controller
>            - fsl,mpr121
> -            # SGTL5000: Ultra Low-Power Audio Codec
> -          - fsl,sgtl5000
>              # G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
>            - gmt,g751
>              # Infineon IR38064 Voltage Regulator
> -- 
> 2.24.1
> 
