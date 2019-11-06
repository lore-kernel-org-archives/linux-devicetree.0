Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E24AC5DF62
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 04:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 437512075C
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 04:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573014658;
	bh=ZNl/3lEN7jgGamEUauLvEf1SQ4FOMNHkGzQMwQN8hgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=eR/E/WE0zq78fdaOCJ/OfQyU4oMCqveiXuxafJbCQLWcOygh2Ly8qK7yTpIi8zRhr
	 yGZ0NmG1g5gzB91Ox346qJWsmJNc/DxeSWhrqxO60sj/jzcpICrfQwf9Wt39pAR07F
	 evEQLaXUNCuf65JjRAdklmxyQW/N30A8MWO9s2GM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfKFEa6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 23:30:58 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46750 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfKFEa5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 23:30:57 -0500
Received: by mail-ot1-f66.google.com with SMTP id n23so9467545otr.13
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 20:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IZpEXdwdaNXunZmMZg1mJeDzHjybMvKHLguiY5zHphY=;
        b=pOtSERCx1uh9wzjxoP7L1XPTpBGMd63GIYKfok38pZkul2jNhdQW/0Ym6hL6TvIZ/b
         i9Kb19ITx3ilLTqL8csIi5dBF2YVhHTKVdPIpXsdyHq2W64PuLySpi11HnyhJTEEFi3g
         NZ9fBRUJWl91l2gGv/C6eg3xYWJedm/BPqXiD/koKtMi7fefn6ZCK+qIjLq6ms0wn03L
         VBwO2jV9tEBMOAvMZh/0/2JPdiwNCnSaIpIj7JbX3klTbgbR18VAIq1PWOEVRipCxxgc
         ejVnAAMgxSjq5jYpAtIELbkhDCZG00QG7ibOdMF4lgurcY2Ed4ryV/KIswNS0RS/F52K
         IKqA==
X-Gm-Message-State: APjAAAXZuAC4CCsSgq3mtRbVMs0a7DSaORfVAi7KOjwyfcunb6c4IfOw
        rLRQzy27+fjEgSbkMsfxTg==
X-Google-Smtp-Source: APXvYqz0LKbpxceSSWrq1eAtliF3cXGEefZSEtNRleSZ7J9c1XinVM64QqEjgPSlAP7xbkYUyyMo8A==
X-Received: by 2002:a05:6830:103:: with SMTP id i3mr277810otp.57.1573014654815;
        Tue, 05 Nov 2019 20:30:54 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i195sm6091963oib.55.2019.11.05.20.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 20:30:54 -0800 (PST)
Date:   Tue, 5 Nov 2019 22:30:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>, lee.jones@linaro.org,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add syscon YAML description
Message-ID: <20191106043053.GA4568@bogus>
References: <20191101141034.259906-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101141034.259906-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 01, 2019 at 03:10:34PM +0100, Maxime Ripard wrote:
> The syscon binding is a pretty loose one, with everyone having a bunch of
> vendor specific compatibles.
> 
> In order to start the effort to describe them using YAML, let's create a
> binding that tolerates additional, not listed, compatibles.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/mfd/syscon.txt        | 32 --------
>  .../bindings/misc/allwinner,syscon.txt        | 20 -----
>  .../devicetree/bindings/misc/syscon.yaml      | 74 +++++++++++++++++++
>  3 files changed, 74 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/syscon.txt
>  delete mode 100644 Documentation/devicetree/bindings/misc/allwinner,syscon.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
> deleted file mode 100644
> index 25d9e9c2fd53..000000000000
> --- a/Documentation/devicetree/bindings/mfd/syscon.txt
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -* System Controller Registers R/W driver
> -
> -System controller node represents a register region containing a set
> -of miscellaneous registers. The registers are not cohesive enough to
> -represent as any specific type of device. The typical use-case is for
> -some other node's driver, or platform-specific code, to acquire a
> -reference to the syscon node (e.g. by phandle, node path, or search
> -using a specific compatible value), interrogate the node (or associated
> -OS driver) to determine the location of the registers, and access the
> -registers directly.
> -
> -Required properties:
> -- compatible: Should contain "syscon".
> -- reg: the register region can be accessed from syscon
> -
> -Optional property:
> -- reg-io-width: the size (in bytes) of the IO accesses that should be
> -  performed on the device.
> -- hwlocks: reference to a phandle of a hardware spinlock provider node.
> -
> -Examples:
> -gpr: iomuxc-gpr@20e0000 {
> -	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
> -	reg = <0x020e0000 0x38>;
> -	hwlocks = <&hwlock1 1>;
> -};
> -
> -hwlock1: hwspinlock@40500000 {
> -	...
> -	reg = <0x40500000 0x1000>;
> -	#hwlock-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/misc/allwinner,syscon.txt b/Documentation/devicetree/bindings/misc/allwinner,syscon.txt
> deleted file mode 100644
> index 31494a24fe69..000000000000
> --- a/Documentation/devicetree/bindings/misc/allwinner,syscon.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -* Allwinner sun8i system controller
> -
> -This file describes the bindings for the system controller present in
> -Allwinner SoC H3, A83T and A64.
> -The principal function of this syscon is to control EMAC PHY choice and
> -config.
> -
> -Required properties for the system controller:
> -- reg: address and length of the register for the device.
> -- compatible: should be "syscon" and one of the following string:
> -		"allwinner,sun8i-h3-system-controller"
> -		"allwinner,sun8i-v3s-system-controller"
> -		"allwinner,sun50i-a64-system-controller"
> -		"allwinner,sun8i-a83t-system-controller"
> -
> -Example:
> -syscon: syscon@1c00000 {
> -	compatible = "allwinner,sun8i-h3-system-controller", "syscon";
> -	reg = <0x01c00000 0x1000>;
> -};
> diff --git a/Documentation/devicetree/bindings/misc/syscon.yaml b/Documentation/devicetree/bindings/misc/syscon.yaml
> new file mode 100644
> index 000000000000..f2d81bed612f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/syscon.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: System Controller Registers R/W Device Tree Bindings
> +
> +description: |
> +  System controller node represents a register region containing a set
> +  of miscellaneous registers. The registers are not cohesive enough to
> +  represent as any specific type of device. The typical use-case is
> +  for some other node's driver, or platform-specific code, to acquire
> +  a reference to the syscon node (e.g. by phandle, node path, or
> +  search using a specific compatible value), interrogate the node (or
> +  associated OS driver) to determine the location of the registers,
> +  and access the registers directly.
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>
> +
> +properties:
> +  compatible:
> +    anyOf:
> +      - items:
> +        - enum:
> +          - allwinner,sun8i-a83t-system-controller
> +          - allwinner,sun8i-h3-system-controller
> +          - allwinner,sun8i-v3s-system-controller
> +          - allwinner,sun50i-a64-system-controller
> +
> +        - const: syscon
> +
> +      - contains:
> +          const: syscon
> +        additionalItems: true

If you want to match on all syscon nodes, you'll need a 'select' because 
'syscon' is now filtered out of the generated select.

> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-io-width:
> +    description: |
> +      The size (in bytes) of the IO accesses that should be performed
> +      on the device.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 1, 2, 4, 8 ]
> +
> +  hwlocks:
> +    maxItems: 1
> +    description:
> +      Reference to a phandle of a hardware spinlock provider node.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    syscon: syscon@1c00000 {
> +        compatible = "allwinner,sun8i-h3-system-controller", "syscon";
> +        reg = <0x01c00000 0x1000>;
> +    };
> +
> +  - |
> +    gpr: iomuxc-gpr@20e0000 {
> +        compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
> +        reg = <0x020e0000 0x38>;
> +        hwlocks = <&hwlock1 1>;
> +    };
> +
> +...
> -- 
> 2.23.0
> 
