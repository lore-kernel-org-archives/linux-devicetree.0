Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D785DC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 19:13:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B82C9208C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 19:13:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NOqFUseg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgFRTNh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 15:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbgFRTNg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 15:13:36 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352F2C06174E
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 12:13:35 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x6so7225275wrm.13
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w7ZzXm/x+S62UOvstcWj82fQZcaPM3JUhZPhHBThmZ4=;
        b=NOqFUseguuK/Se1yoTOh2UdWZ9pNBrt038Sywj2oS41eFLmh/U6q43aGTEoQP5jOql
         sC+rNNPymdYDagtcgW8Y/+zDQGn6GPvI4pz7is5d9yhUOPzoyTqL6h6Jd2iwePLK07fO
         vORkEN6nVqoAZC94xtTGOWGd4shaO6h7XUJ/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w7ZzXm/x+S62UOvstcWj82fQZcaPM3JUhZPhHBThmZ4=;
        b=IsHdYLTcyNlHF3su99pWLB4u/Rtd7Cmielk0YPqysjSkaVmF1aFfMIz1CwOiD8YMGy
         kx6wf9PPNPKqbIMHBoQl5cbtoQXjMfj+rK03CNANdJB7NsXho08L/J/YqSVSvixrkEmW
         jdgDD3Yx+1kR4ajg8Iu78iiG0NqVi3v2Vykk5zJE7d102mgAq1EsOXAdgPI2dYZYW+6O
         C7NnZcg7gQx65AySLzYE0G72mGbttP3FNxOqVZSohYkKQ6oq2KSbEnMz/Vk3wWdKC23F
         htOx34qbDi9PS7pavjwOU8y3M05QefrJdUkjGr8Lb85r5uHGZ6fRGAFmr/LMRHxmf/pZ
         nUQQ==
X-Gm-Message-State: AOAM532cJVmzHE/F8NBWIVuv04it030SOSiTUBURjRUpKWsBVABzhd/n
        3R6R1LnvamBUaDhZScRJZekRBQ==
X-Google-Smtp-Source: ABdhPJxtePe8jNlcaDRZzkkWVLDnXp0YbUZHYQvnIoze3BeG8wHZ2ELCeZY2CEokFez7hj9uD7wdOA==
X-Received: by 2002:a5d:4dc2:: with SMTP id f2mr2615574wru.399.1592507613955;
        Thu, 18 Jun 2020 12:13:33 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id s2sm4333182wmh.15.2020.06.18.12.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 12:13:33 -0700 (PDT)
Date:   Thu, 18 Jun 2020 19:13:32 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH V10 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200618191332.GB73379@chromium.org>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615122937.18965-2-dongchun.zhu@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Dongchun,

On Mon, Jun 15, 2020 at 08:29:36PM +0800, Dongchun Zhu wrote:
> Add DT bindings documentation for Omnivision OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 171 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> new file mode 100644
> index 0000000..f84be1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> @@ -0,0 +1,171 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> +
> +maintainers:
> +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> +
> +description: |-
> +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> +  image sensor, which is the latest production derived from Omnivision's CMOS
> +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> +  sensor output is available via CSI-2 serial data output.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov02a10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: top mux camtg clock
> +      - description: divider clock
> +
> +  clock-names:
> +    items:
> +      - const: eclk
> +      - const: freq_mux
> +
> +  clock-frequency:
> +    description:
> +      Frequency of the eclk clock in Hertz.
> +
> +  dovdd-supply:
> +    description:
> +      Definition of the regulator used as Digital I/O voltage supply.
> +
> +  avdd-supply:
> +    description:
> +      Definition of the regulator used as Analog voltage supply.
> +
> +  dvdd-supply:
> +    description:
> +      Definition of the regulator used as Digital core voltage supply.
> +
> +  powerdown-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      PD_PAD pin. This pin is used to place the OV02A10 into Standby mode
> +      or Shutdown mode. As the line is active low, it should be
> +      marked GPIO_ACTIVE_LOW.

This line is not active low. It needs to be high for the powerdown mode
to be active.

> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Must be the device tree identifier of the GPIO connected to the
> +      RST_PD pin. If specified, it will be asserted during driver probe.
> +      As the line is active high, it should be marked GPIO_ACTIVE_HIGH.

This line is not active high. It needs to be low for the reset to be
active.

Best regards,
Tomasz
