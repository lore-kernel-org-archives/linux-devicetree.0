Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD76C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 02:43:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28467208FE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 02:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594694590;
	bh=1+M10Jin3eQBE5PZKLsX668YHN2e/FUp1Sbk0u+78Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=k6cv/N485VWEbo9PQBRwGlF+VGDZpiYqEzNqVp7ecx0vOC7NrtL9eNekeqA3FpWjF
	 j4FZ35wQ/X4m9jsx5yQ+/tkghEfiWewmICiTRxPrCg+sBGNMQCF/oKDDM2GuQVAaFd
	 ntS+NUc5an+XsDo37kDNL0JvNRu+HWEQ1f6tFfhY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgGNCnJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 22:43:09 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:40805 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNCnJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 22:43:09 -0400
Received: by mail-il1-f196.google.com with SMTP id e18so12993608ilr.7
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 19:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xqtDm2mhhrQr4POykVjXpWXd6bdcMg+HFqdOsT5mp4s=;
        b=W/VxUlaDM0q4DfXMz5tO5GezJo7OQNP+LmBhwiFr0tBdUhkPRThpzpB6hy+J8j9HIh
         WbTIWasTa6zSY038+weAlfHdQ5SplFgbwfZ5cKsumNjju6j1mxVrZLUYX0IkXOU436lF
         qFSHsDDbZluraevfcaz1UiipeWyghnJXHmI2oVXOIq0roy8zMk1sldeHh26SdO9OKmXb
         x2lO6pPFmYDbm2Joks0g+DyWDqy4JA7DrU6JDsuL5m/KkAfshAaOA1EdKiuRFMay7Gmo
         8HrtTqZv2iE4f0I0YyD39SlpusU8P/hcoV5in6cR4Z2YatXUAVdmPUORAwHksKebS7G9
         rBAw==
X-Gm-Message-State: AOAM531Z6XJ08drLbrr5koQfGZ1JKjAs+6r793P/78/Wjl1agQgXkK8c
        LhtOLWNpzPwhtsROyeuItVHWMrH1Psgx
X-Google-Smtp-Source: ABdhPJwP7oyW5vo0EP1nShAgwRfmyppCEeoygTDpvF7Z3GyAh6grDk8GD7NYUcoOANS6Zg6ngUJgQg==
X-Received: by 2002:a92:4856:: with SMTP id v83mr2661419ila.125.1594694588463;
        Mon, 13 Jul 2020 19:43:08 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id e1sm9272037ilr.23.2020.07.13.19.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:43:07 -0700 (PDT)
Received: (nullmailer pid 1178708 invoked by uid 1000);
        Tue, 14 Jul 2020 02:43:07 -0000
Date:   Mon, 13 Jul 2020 20:43:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc:     devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: sound: convert rk3328 codec binding to
 yaml
Message-ID: <20200714024307.GA1175068@bogus>
References: <20200630135412.718447-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630135412.718447-1-katsuhiro@katsuster.net>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 30, 2020 at 10:54:12PM +0900, Katsuhiro Suzuki wrote:
> This patch converts Rockchip rk3328 audio codec binding to DT schema.
> And adds description about "mclk" clock and fixes some errors in
> original example.
> 
> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
> ---
>  .../bindings/sound/rockchip,rk3328-codec.txt  | 28 --------
>  .../bindings/sound/rockchip,rk3328-codec.yaml | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml

Need to Cc Mark Brown...

> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
> deleted file mode 100644
> index 1ecd75d2032a..000000000000
> --- a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Rockchip Rk3328 internal codec
> -
> -Required properties:
> -
> -- compatible: "rockchip,rk3328-codec"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- rockchip,grf: the phandle of the syscon node for GRF register.
> -- clocks: a list of phandle + clock-specifer pairs, one for each entry in clock-names.
> -- clock-names: should be "pclk".
> -- spk-depop-time-ms: speak depop time msec.
> -
> -Optional properties:
> -
> -- mute-gpios: GPIO specifier for external line driver control (typically the
> -              dedicated GPIO_MUTE pin)
> -
> -Example for rk3328 internal codec:
> -
> -codec: codec@ff410000 {
> -	compatible = "rockchip,rk3328-codec";
> -	reg = <0x0 0xff410000 0x0 0x1000>;
> -	rockchip,grf = <&grf>;
> -	clocks = <&cru PCLK_ACODEC>;
> -	clock-names = "pclk";
> -	mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
> -	spk-depop-time-ms = 100;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
> new file mode 100644
> index 000000000000..525b48c2f5de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/rockchip,rk3328-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip rk3328 internal codec
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3328-codec
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for audio codec
> +      - description: clock for I2S master clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: mclk
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the GRF register.
> +
> +  spk-depop-time-ms:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type with standard unit suffixes.

> +    default: 200

Is there a range of values? Surely 2^32 would be too long.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    description:
> +      Speaker depop time in msec.
> +
> +  mute-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO specifier for external line driver control (typically the
> +      dedicated GPIO_MUTE pin)
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - rockchip,grf
> +  - "#sound-dai-cells"
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/clock/rk3328-cru.h>
> +    codec: codec@ff410000 {
> +      compatible = "rockchip,rk3328-codec";
> +      reg = <0xff410000 0x1000>;
> +      clocks = <&cru PCLK_ACODECPHY>, <&cru SCLK_I2S1>;
> +      clock-names = "pclk", "mclk";
> +      rockchip,grf = <&grf>;
> +      mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
> +      spk-depop-time-ms = <100>;
> +      #sound-dai-cells = <0>;
> +    };
> -- 
> 2.27.0
> 
