Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FF9C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 14:12:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2544208C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 14:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Trzgw0WU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgEROMn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 10:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgEROMn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 10:12:43 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA7EC061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 07:12:42 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id e10so8594048edq.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EOqD4aL6wgxE/26j8f+FbycNWDDRoPpe8vcK7EunO4g=;
        b=Trzgw0WUAhFHQ2PwkPVg1lg3ZEy4Auicl4vZkQda/lJq7cE2GAPUdYk7oor8fdGER6
         3vQq9ZLD4v6xhSuJfufMqMbdB4vMSsXwGRnEjD6jrOPmkhIOkG6h9p1mBEYh64EbJHow
         mzm/O7XfIUlxFfMAOPjMW/nVBQUghtBlFwA8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EOqD4aL6wgxE/26j8f+FbycNWDDRoPpe8vcK7EunO4g=;
        b=A6XXYweLbJ+IGGi9PCnzdlHUkltUxHVenDI8PimfcHC+xLmGVKshpHLi7CBEcyqRJ4
         7wADUIY0hEI89Jgh6a2LY1ne6YrnQ0zxG3w6C/46u1C/3rkWyAW+Os0TUPe3pyHnfyq6
         2PrrQU/XDh1ti/bifo9Yq/zGXxYsRU6Q4wBQWBxpmrH+6Qqj2OnidVQMQV7FmcjFHj++
         eD4i4DILzKfg3PnlgwKfO6UOfa4icXB97FPjtxUjJeegkFHHkhZnmBbjae2rPxoVXqbu
         QZf0Xk4o9RoVBDWtn+0ijdshEVcXy7c1B8go0UEeMvDYCinud1Q+5jQ1dr1WPSetpFhX
         Bcpw==
X-Gm-Message-State: AOAM531WZEnG6PSk7gsLW9WNABHfNqOUkzzrcKkoFCqrMmwJ8Cg7KgP/
        wfr7vD8fJGI1+Nn3A0h5b2e3tKJZtjg=
X-Google-Smtp-Source: ABdhPJygDQ/migon2fD4V+uFem0/Bo1gIWNA3Zb2Qdo3a38gnDg9WAqUtJSeipxfug7r8n8k9yZaTw==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr13380006edj.26.1589811161209;
        Mon, 18 May 2020 07:12:41 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id c16sm1065099edv.88.2020.05.18.07.12.39
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 07:12:39 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id f13so9432845wmc.5
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 07:12:39 -0700 (PDT)
X-Received: by 2002:a1c:56c1:: with SMTP id k184mr4680947wmb.183.1589811158595;
 Mon, 18 May 2020 07:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com> <20200518132731.20855-2-dongchun.zhu@mediatek.com>
In-Reply-To: <20200518132731.20855-2-dongchun.zhu@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 18 May 2020 16:12:28 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Byvc8Fb0f3_81xSKsuyvsQJm-8g8y1Kx2aUcC=PwpS7w@mail.gmail.com>
Message-ID: <CAAFQd5Byvc8Fb0f3_81xSKsuyvsQJm-8g8y1Kx2aUcC=PwpS7w@mail.gmail.com>
Subject: Re: [V6, 1/2] media: dt-bindings: media: i2c: Document DW9768 bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Dongchun,

On Mon, May 18, 2020 at 3:29 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Add DeviceTree binding documentation for Dongwoon Anatech DW9768 voice
> coil actuator.

Thanks for the patch. Please see my comments below.

>
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

This version includes significant changes, so the reviewed-by tag
shouldn't have been carried out.

> ---
>  .../bindings/media/i2c/dongwoon,dw9768.yaml        | 105 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> new file mode 100644
> index 0000000..b909e83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9768.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9768 Voice Coil Motor (VCM) Lens Device Tree Bindings
> +
> +maintainers:
> +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> +
> +description: |-
> +  The Dongwoon DW9768 is a single 10-bit digital-to-analog (DAC) converter
> +  with 100 mA output current sink capability. VCM current is controlled with
> +  a linear mode driver. The DAC is controlled via a 2-wire (I2C-compatible)
> +  serial interface that operates at clock rates up to 1MHz. This chip
> +  integrates Advanced Actuator Control (AAC) technology and is intended for
> +  driving voice coil lenses in camera modules.
> +
> +properties:
> +  compatible:
> +    enum:
> +      # for DW9768 VCM
> +      - dongwoon,dw9768
> +      # for GT9769 VCM
> +      - giantec,gt9769
> +
> +  reg:
> +    maxItems: 1
> +
> +  vin-supply:
> +    description:
> +      Definition of the regulator used as I2C I/O interface power supply.
> +
> +  vdd-supply:
> +    description:
> +      Definition of the regulator used as VCM chip power supply.
> +
> +  dongwoon,aac-mode:
> +    description:
> +      Indication of AAC mode select.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum:
> +          - 0    #  Direct (default)
> +          - 1    #  AAC2 (operation time# 0.48 x Tvib)
> +          - 2    #  AAC3 (operation time# 0.70 x Tvib)
> +          - 3    #  AAC4 (operation time# 0.75 x Tvib)
> +          - 4    #  Reserved
> +          - 5    #  AAC8 (operation time# 1.13 x Tvib)
> +          - 6    #  Reserved
> +          - 7    #  Reserved

I'll ultimately leave it to DT maintainers, but is there any reason to
define the reserved values?

> +
> +  dongwoon,aac-timing:
> +    description:
> +      Indication of AAC Timing count, unit of 0.1 milliseconds.
> +      Valid values vary from 0 to 63 (default 32).
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +
> +  dongwoon,clock-dividing-rate:
> +    description:
> +      Indication of VCM internal clock dividing rate select, as one multiple
> +      factor to calculate VCM ring periodic time Tvib.
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> +      - enum:
> +          - 0    #  Dividing Rate -  2
> +          - 1    #  Dividing Rate -  1 (default)
> +          - 2    #  Dividing Rate -  1/2
> +          - 3    #  Dividing Rate -  1/4
> +          - 4    #  Dividing Rate -  8
> +          - 5    #  Dividing Rate -  4
> +          - 6    #  Dividing Rate -  Reserved
> +          - 7    #  Dividing Rate -  Reserved

Ditto.

Best regards,
Tomasz
