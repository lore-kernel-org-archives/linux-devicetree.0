Return-Path: <SRS0=YFsx=BV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FE0C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 03:35:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28C792075F
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 03:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="OepbOosG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgHKDf4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Aug 2020 23:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727861AbgHKDf4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Aug 2020 23:35:56 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38212C061756
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2020 20:35:56 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id p13so9447874ilh.4
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2020 20:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OoAFxkYHimwlRMa0O33F9oj8ETqTc94/er1Fur1K2VY=;
        b=OepbOosG6cVp2QSTFhL6XRyoHNakaPaNFOjozWqbYfosEqMX+WEzxxScojKtGMvvBh
         NL92h45L4Q8UT4Mln8VCF+hKD8lbhUEfDsyr5TUgjdw6dzVkbuj4LUEMmjbVpWUmRasS
         UB2ZC9MqSedOctbI9clxo5voblVc20ql18fOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OoAFxkYHimwlRMa0O33F9oj8ETqTc94/er1Fur1K2VY=;
        b=WsmIk4827sunRXHmMxa7bnzjPpD/OzQSPj926XFHspT1ifyCj5LDEJaFgF8ByGji38
         nONtK5qVxrdPhe6sIUD/EA/ArOecwWWReV9vLTzY3FFoEuc26Ce9/j+1k7fe7JAb5HwE
         RFNpYaMbIsrqGoXjLdx+UR7NWmgmjN8SWbT1Cb1MUS4jC8uRw4cmHyme6WuJem04lyJj
         XNaloZz1tYRfosXwByIUh+WBhdec6fpcKMsxjX0Drg0Je2BRGf05ubC4ocy5arILv3j5
         q7S7fPTS5bko8ukz1BffazbmQ77F21ODEPSda06Qv8852aCbsCuEbEmHLmfS0AUp7Qr0
         m6fw==
X-Gm-Message-State: AOAM530Q/SESrTgf8NMM9cZOGlwQ2g1FpRyhfsHkO+Og2YUoYHZykB5I
        Vew6xqJ/pyckPBWKh50qQKPxGbH54anhumPB6tPUTQ==
X-Google-Smtp-Source: ABdhPJzsL8VPLkqDmEWhkcpZ6013wkdMp5Ww0FbcTTMftOWeLIyT7Jiyb+9JEV9ChpDiiWLsCsPueJ9z/FwRsMjgWoA=
X-Received: by 2002:a05:6e02:c71:: with SMTP id f17mr8440565ilj.98.1597116955080;
 Mon, 10 Aug 2020 20:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200809111753.156236-1-jic23@kernel.org> <20200809111753.156236-6-jic23@kernel.org>
In-Reply-To: <20200809111753.156236-6-jic23@kernel.org>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Mon, 10 Aug 2020 20:35:43 -0700
Message-ID: <CAJCx=gkytma0DvFxiJn_phipQQHCwr6NF5EMzk++XPNSzSRP5g@mail.gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: iio: adc: ti,adc161s626 yaml conversion.
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Aug 9, 2020 at 4:20 AM Jonathan Cameron <jic23@kernel.org> wrote:
>
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> Simple conversion for this ADC driver.  Note that I haven't put
> limits on the spi-max-sampling-frequency because the adc161s626
> doesn't state one clearly defined value.
>
> Added the #io-channel-cells property to allow for consumers.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Matt Ranostay <matt.ranostay@konsulko.com>

Acked-by: Matt Ranostay <matt.ranostay@konsulko.com>


> ---
>  .../bindings/iio/adc/ti,adc161s626.yaml       | 51 +++++++++++++++++++
>  .../bindings/iio/adc/ti-adc161s626.txt        | 18 -------
>  2 files changed, 51 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc161s626.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc161s626.yaml
> new file mode 100644
> index 000000000000..3f4f334d6f73
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,adc161s626.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/ti,adc161s626.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments ADC141S626 and ADC161S626 ADCs
> +
> +maintainers:
> +  - Matt Ranostay <matt.ranostay@konsulko.com>
> +
> +description: |
> +  Single channel 14/16bit differential ADCs
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,adc141s626
> +      - ti,adc161s626
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency: true
> +
> +  vdda-supply: true
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@0 {
> +            compatible = "ti,adc161s626";
> +            vdda-supply = <&vdda_fixed>;
> +            reg = <0>;
> +            spi-max-frequency = <4300000>;
> +            #io-channel-cells = <1>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-adc161s626.txt b/Documentation/devicetree/bindings/iio/adc/ti-adc161s626.txt
> deleted file mode 100644
> index 3d25011f0c99..000000000000
> --- a/Documentation/devicetree/bindings/iio/adc/ti-adc161s626.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -* Texas Instruments ADC141S626 and ADC161S626 chips
> -
> -Required properties:
> - - compatible: Should be "ti,adc141s626" or "ti,adc161s626"
> - - reg: spi chip select number for the device
> - - vdda-supply: supply voltage to VDDA pin
> -
> -Recommended properties:
> - - spi-max-frequency: Definition as per
> -               Documentation/devicetree/bindings/spi/spi-bus.txt
> -
> -Example:
> -adc@0 {
> -       compatible = "ti,adc161s626";
> -       vdda-supply = <&vdda_fixed>;
> -       reg = <0>;
> -       spi-max-frequency = <4300000>;
> -};
> --
> 2.28.0
>
