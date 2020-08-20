Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEA4C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 16:38:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98B652054F
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 16:38:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gPu5A+78"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbgHTQiS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 12:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbgHTQiF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 12:38:05 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC46C061385
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 09:38:04 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l2so2633873wrc.7
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 09:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=66z3oTQKaSpXr1HTEurDMIey6l+nDsRMIQbXYeoP4QQ=;
        b=gPu5A+78PWk/yFnK6QxFXI2uLGsiHvK+DEtmEZSSVGS83ofZ1t9Bej/R103UXv7aVT
         YVfNHDmX/O28HR+0yDBq8nzJgdubjjQhdriFMBE/TjQbi25UHNDwublG0i3N2odoVIeI
         yNdE0lTW97iP7/6Rt0xUJMSbG7c4DVCpEyZMUvzJiUgWW9d9i9p1ZpgP7WIjM2atza+H
         iRZ/Dw/JtxdMtSk8TNCroGS6rkK9QkFbmkcTeo4x1ynvyg5XR9+cLJJ+Vz55UuH/Vb2/
         ZCB21IUeKRs32kaGJFDtHbzUy8iKKMp5k8NG7Hte0VuSbdmgrPXUsrMNIF9YQ1esSk0I
         UIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=66z3oTQKaSpXr1HTEurDMIey6l+nDsRMIQbXYeoP4QQ=;
        b=PAHgwK9LuLOKoYPGlZ+tsopCAKXGAzrzwNeOLNtvX2Quhre0skSE44mcmEHBK/pZRu
         XY1XGovhZkPQMxrQReK1ACghMD5sRysUZPJtDYxN69ghfUhW++J3M7HFOhiRxKQjFpW+
         5Sq/8Yi6+EXLKUtsWyn4W2cqWMJo1GjjqJKTvlcvu4LtTls54ryCbHTK7GpptuzwdaI4
         hS9+LKz/055b36C9H/P7ebcxMRPhAxP+S/ulnMkyUTm0GluFRMUOUFLHnw9ImCayRTsX
         HB3zd5PjOv/Yaa+LYGAQo60zDAGm5ljkz+PowiVEAOjKfHsWqrYcOEdIkx5rD7CB1NGh
         eudQ==
X-Gm-Message-State: AOAM530J+QhRE7CNVTpVgXfImRkTjHs2kpHc3zq2OcleqYR1yCGtOGEe
        IDcLNOLgMXUPbKkZPwtxgenvHg==
X-Google-Smtp-Source: ABdhPJxYsIkn9Lzp0sRuLRWKX498c8umiAoQVlUm19jZ9lyLi/ILdooh6ou625Oa7NGZIfVIjursaQ==
X-Received: by 2002:adf:df91:: with SMTP id z17mr4365303wrl.149.1597941482392;
        Thu, 20 Aug 2020 09:38:02 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id j4sm5039364wmi.48.2020.08.20.09.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 09:38:01 -0700 (PDT)
Date:   Thu, 20 Aug 2020 17:38:00 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/3 v3] dt-bindings: backlight: Add Kinetic KTD253
 bindings
Message-ID: <20200820163800.3hb3jl5emkxoczw2@holly.lan>
References: <20200819205150.164403-1-linus.walleij@linaro.org>
 <20200819205150.164403-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819205150.164403-2-linus.walleij@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 19, 2020 at 10:51:49PM +0200, Linus Walleij wrote:
> This adds device tree bindings for the Kinetic KTD253
> white LED backlight driver.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> ChangeLog v2->v3:
> - Drop the pointless cargo-culted "default-on" property that
>   we were not using
> - Correct the brightness in the example to something legal (13)
> ChangeLog v1->v2:
> - Create common.yaml for backlight as suggested by Sam and
>   use that.
> - Rename the GPIO line "enable-gpios"
> ---
>  .../leds/backlight/kinetic,ktd253.yaml        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> new file mode 100644
> index 000000000000..7a6ec1f8c0f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/kinetic,ktd253.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/kinetic,ktd253.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kinetic Technologies KTD253 one-wire backlight
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  The Kinetic Technologies KTD253 is a white LED backlight that is
> +  controlled by a single GPIO line. If you just turn on the backlight
> +  it goes to maximum backlight then you can set the level of backlight
> +  using pulses on the enable wire. This is sometimes referred to as
> +  "expresswire".
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: kinetic,ktd253
> +
> +  enable-gpios:
> +    description: GPIO to use to enable/disable and dim the backlight.
> +    maxItems: 1
> +
> +  default-brightness: true
> +  max-brightness: true
> +
> +required:
> +  - compatible
> +  - enable-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    backlight {
> +        compatible = "kinetic,ktd253";
> +        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +        default-brightness = <13>;
> +    };
> -- 
> 2.26.2
> 
