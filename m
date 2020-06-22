Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7812CC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 06:53:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53AC825431
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 06:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RlT4vcr6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731294AbgFVGxy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 02:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgFVGxy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 02:53:54 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FCEC061794
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 23:53:54 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k6so2963857wrn.3
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 23:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3st1Xpy8PMIYJ29+AOCat9fQ6H15z9nbOwUnhMMLhQg=;
        b=RlT4vcr6p8p3WhMwqdvdIiWm8cSpTritK3ynpnHlhdiSq1A63RYtWfur0SYx3CEgf8
         zNEIP66840WXAZWesJhfhc1PHUSLX8nx5+pId5innSe9PWR8tUY9g2MswWSoGDAZAsk9
         01UtfkJ4gJLz9dvM6yVDRaW4jqauOfwvj+HakP6osJRPnrrVHFiOuZy+wmFQXfamCSi/
         BQADIpisPiVuSUmXgMkQ49PohawdreO4lpLyfGwVNBA6SHsHr4vYDJO3iaZkbtOmuD3J
         Rc2jM9gSjz/u7aShV8GTzUFKE7g5yDNG6xB5NeJxf1hSWeOY4gLzMR5StHyk3QEuJUhV
         cE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3st1Xpy8PMIYJ29+AOCat9fQ6H15z9nbOwUnhMMLhQg=;
        b=b7HMHlBKcTsBgJTHfcJbW0uMcemgAqBhEX4e3sony4LTZ7kxs+p5BfZmjR43xVGY9/
         ey9/3/BtzSUVEwdj6A/0F+PXb/79eVcDnkp9e3nVam7nJpgoWPiFsBVVzmxc3/k4xzbo
         A35iP1OXuCaRp7oqR8C8B7WA/EWUzTet4VWJHzwjDv5U911+iqxEGfgBHBmbehAjCAEC
         Hf61663kGpW+Ivx2Qop5ctDcGG+jY9jOHeSb8iVSNd9C635E3T1LGzbimS4fn6No6x4T
         mup7eUbEd3VEuaJ6BX1zcLAAFTH5F4re90ylrAWXp99IUc8bBwXvn1OR0piQCZdwLZ6M
         OoDw==
X-Gm-Message-State: AOAM5314Es9O/oGJIoIu3HKHBjZOeWu3d7kCL+QucZSfANCH4vEfIh4v
        KDewjkLJmeyKXnxzde7n286p8CKoaR4=
X-Google-Smtp-Source: ABdhPJx60bF1uC6l4ykc8vsYhgnhHXh7sN8AhZNQZCxssjwQToadbKxSJ0hyVFLyrrQsT9omwbuxYg==
X-Received: by 2002:a5d:630f:: with SMTP id i15mr17113215wru.309.1592808832730;
        Sun, 21 Jun 2020 23:53:52 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id p9sm14749735wma.48.2020.06.21.23.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2020 23:53:52 -0700 (PDT)
Date:   Mon, 22 Jun 2020 07:53:50 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: mfd: Add ENE KB3930 Embedded
 Controller binding
Message-ID: <20200622065350.GN954398@dell>
References: <20200617110829.1036898-1-lkundrak@v3.sk>
 <20200617110829.1036898-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617110829.1036898-2-lkundrak@v3.sk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 17 Jun 2020, Lubomir Rintel wrote:

> Add binding document for the ENE KB3930 Embedded Controller.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> Changes since v4:
> - Collected Rob's Reviewed-by
> 
> Changes since v1:
> - Addressed binding validation failure
> 
>  .../devicetree/bindings/mfd/ene-kb3930.yaml   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml b/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
> new file mode 100644
> index 0000000000000..005f5cb59ab12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ene-kb3930.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ENE KB3930 Embedded Controller bindings

Please expand ENE.

> +description: |
> +  This binding describes the ENE KB3930 Embedded Controller attached to a
> +  I2C bus.

Nit: "an I2C bus"

> +maintainers:
> +  - Lubomir Rintel <lkundrak@v3.sk>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - dell,wyse-ariel-ec  # Dell Wyse Ariel board (3020)
> +      - const: ene,kb3930
> +  reg:
> +    maxItems: 1
> +
> +  off-gpios:
> +    description: GPIO used with the shutdown protocol on Ariel
> +    maxItems: 2
> +
> +  system-power-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      embedded-controller@58 {
> +        compatible = "dell,wyse-ariel-ec", "ene,kb3930";
> +        reg = <0x58>;
> +        system-power-controller;
> +
> +        off-gpios = <&gpio 126 GPIO_ACTIVE_HIGH>,
> +                    <&gpio 127 GPIO_ACTIVE_HIGH>;
> +      };
> +    };
> +
> +...

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
