Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B33C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 19:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3E6020814
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 19:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mn2izAUa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgEUTf3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 15:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728692AbgEUTf2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 15:35:28 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A71C061A0E
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 12:35:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so3576409wru.12
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 12:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0PiSvAPliSpHmXCPHW82OGwvgeGu3nV4fisqX0ukMVE=;
        b=Mn2izAUaruoDbLEVtEGYwGj8L0xkVVzhfObauat4/vcNCP+EPMEoexK54nlo2t3NO0
         LTIUQPGxAXNwtxA3U2FY3JUp36JClziXCcHERZ6A90YjM36CtMX2opVFVkMQ4L3e/C1r
         9uUYpJi87nLJ5Do9/kd318Qkzfn2oKXsfkMJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0PiSvAPliSpHmXCPHW82OGwvgeGu3nV4fisqX0ukMVE=;
        b=c0yk+U824zVWIizT0Ebqb3b8r9jzVlNxG7G6l1dugTbVxybZVibXys0jJhrCuH1Pni
         2hcKpBORj0dr8HtsgVeUT4ZNv88jf5on5VqQAa3MTh4r7yrpsS9rlXIxBkRfmjRgbEGm
         TjscCKSrRBIMcSvJnnLu4Nwcx+Y1iokYsz5FV0TolyU2fjHoXPiJW/IO4K65RvgoYEuZ
         gr7XxISuu1X+0SH8SmEPHEVh7+iy88hHSUTcEniVZmgvTbO4UEWuQhs9M3akh4zSB5KK
         Na0Bvh3WE94NZnW0/cYYduaKi3dwqOYkAK8kNHnzDkBhYpv7J5n1TpnpVOqXj4EK/2D9
         AsKQ==
X-Gm-Message-State: AOAM530tTsaW8qQtHOrXCPfliU3pofMRyUuOEnrEbk5OP1P5C38f+xpi
        B/LzSalbozme895xVgu1BqfsIA==
X-Google-Smtp-Source: ABdhPJwRx3aYOU3qs7IEJXRm00NEpqShHLzsIlN+v+IXDKvfgZ02NPQmcQhc20kurysHzVjxZtUHQg==
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr182088wrh.116.1590089727185;
        Thu, 21 May 2020 12:35:27 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id d126sm7967920wmd.32.2020.05.21.12.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:35:26 -0700 (PDT)
Date:   Thu, 21 May 2020 19:35:25 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org,
        andriy.shevchenko@linux.intel.com, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V8, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200521193525.GB14214@chromium.org>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-2-dongchun.zhu@mediatek.com>
 <20200511160207.GA32476@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511160207.GA32476@bogus>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Mon, May 11, 2020 at 11:02:07AM -0500, Rob Herring wrote:
> On Sat, May 09, 2020 at 04:06:26PM +0800, Dongchun Zhu wrote:
> > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 184 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 191 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > new file mode 100644
> > index 0000000..5468d1b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > @@ -0,0 +1,184 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > +
> > +maintainers:
> > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +
> > +description: |-
> > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > +  sensor output is available via CSI-2 serial data output.
> > +
> > +properties:
> > +  compatible:
> > +    const: ovti,ov02a10
> > +
> > +  reg:
> > +    description: I2C device address
> 
> Drop this. Nothing specific to this device.
> 
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: top mux camtg clock
> > +      - description: devider clock
> 
> typo
> 
> > +
> > +  clock-names:
> > +    items:
> > +      - const: eclk
> > +      - const: freq_mux
> > +
> > +  clock-frequency:
> > +    description:
> > +      Frequency of the eclk clock in Hertz.
> > +
> > +  dovdd-supply:
> > +    description:
> > +      Definition of the regulator used as interface power supply.
> > +
> > +  avdd-supply:
> > +    description:
> > +      Definition of the regulator used as analog power supply.
> > +
> > +  dvdd-supply:
> > +    description:
> > +      Definition of the regulator used as digital power supply.
> > +
> > +  powerdown-gpios:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1

I asked a question about defining GPIO polarities some time ago, but I
guess it slipped through.

The chip documentation calls the reset pin as "RST_PAD (low level
reset)". Where should the inversion be handled, in the driver or here,
by having the DT include a necessary flag in the specifier?

Best regards,
Tomasz
