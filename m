Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83D4C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E33E2073A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 14:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KyTJVpYd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbgEGOa4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 10:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728911AbgEGOaz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 10:30:55 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61930C05BD43
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 07:30:55 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id rh22so4728116ejb.12
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ll5ZHgxCTQbof/AtoyqjsYrTVcOxespcFhggcUBqe5A=;
        b=KyTJVpYdiQiZ2naOvISh2nYJbcEYd3SezUeXrYuqg5BTwnm4t7zhD+bpkDRKoDMoOL
         eHTQoUgmutyG4x+6LT3PWq4d9FV149l+vE3UikCwmbzEIgnSe5QM0IStXI0e9nL4wVTX
         xHYn8duybiNu2TOu/3yuPcStCHcv2ea1p3J0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ll5ZHgxCTQbof/AtoyqjsYrTVcOxespcFhggcUBqe5A=;
        b=qhnZ8J4XiFXUcGQluuiSxZ2/McKRoDunPUZ+WXyQeRF2uci07BGk7WQndtDac/VgL7
         Q54+2chXAKNItx63Ic7ntMj1Ib3ul6x/OoQJw46G+SF7za5+gzwS0W53zaQL0TZ8eTN3
         w8DxwUZsp1UkaN4keiY4URkAls1v9k34ESnyXc8jUlEgF7AzJsOTU2izNkKeqFEpKofI
         qPtQWzvQELl075juKvoiVOU7C5npJPhGQQUGYB81cAFyK8L9xEhais9V7Es4vRHDnWtH
         W4t88enUHjSXerilfRXSecvI7KwG0j4nnH9JxsjKNdO+0LKvpSneg/Vv7MLJDaTf3Lte
         L6OA==
X-Gm-Message-State: AGi0Pub+9ZKtPeC9Q/u7Y7dHkLtVv1/b/9V3P7UgkUmRFz2kG6Ff3ceZ
        YNosl9ScLzv1/wDtCV3bBD5n+fMbUH2ssg==
X-Google-Smtp-Source: APiQypJltkhpEKsLst16v+shR+bot0nizEfCcsZBLAWYh+A071LwL+5IiaAIz5vsAW9E3g0uHUYiJQ==
X-Received: by 2002:a17:906:c7c5:: with SMTP id dc5mr12521592ejb.50.1588861853654;
        Thu, 07 May 2020 07:30:53 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id s12sm628976ejx.5.2020.05.07.07.30.53
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 07:30:53 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id m12so1876978wmc.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2020 07:30:53 -0700 (PDT)
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr10723255wmj.55.1588861512281;
 Thu, 07 May 2020 07:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200430080924.1140-1-dongchun.zhu@mediatek.com>
 <20200430080924.1140-2-dongchun.zhu@mediatek.com> <20200505070451.GS9190@paasikivi.fi.intel.com>
 <1588688238.8804.150.camel@mhfsdcap03> <20200506112136.GV9190@paasikivi.fi.intel.com>
 <1588856325.8804.179.camel@mhfsdcap03> <CAAFQd5CXRD_j7Xkxb4=9kkd+pDy4W5pirAPSG8RsMVH6L-MU2w@mail.gmail.com>
 <20200507141147.GF9190@paasikivi.fi.intel.com>
In-Reply-To: <20200507141147.GF9190@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 7 May 2020 16:25:01 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DgDk57MCc4vE9VmifZYjtO_SUFss+vc8W-28SFHbKDrA@mail.gmail.com>
Message-ID: <CAAFQd5DgDk57MCc4vE9VmifZYjtO_SUFss+vc8W-28SFHbKDrA@mail.gmail.com>
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>, matrix.zhu@aliyun.com,
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

On Thu, May 7, 2020 at 4:12 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz, Dongchun,
>
> On Thu, May 07, 2020 at 03:50:40PM +0200, Tomasz Figa wrote:
> > Hi Sakari and Dongchun,
> >
> > On Thu, May 7, 2020 at 3:00 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Sakari,
> > >
> > > Thanks for the review.
> > >
> > > On Wed, 2020-05-06 at 14:21 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Tue, May 05, 2020 at 10:17:18PM +0800, Dongchun Zhu wrote:
> > > > > Hi Sakari,
> > > > >
> > > > > Thanks for the review.
> > > > >
> > > > > On Tue, 2020-05-05 at 10:04 +0300, Sakari Ailus wrote:
> > > > > > Hi Dongchun,
> > > > > >
> > > > > > On Thu, Apr 30, 2020 at 04:09:23PM +0800, Dongchun Zhu wrote:
> > > > > > > Add DT bindings documentation for Omnivision OV02A10 image sensor.
> > > > > > >
> > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > ---
> > > > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 148 +++++++++++++++++++++
> > > > > > >  MAINTAINERS                                        |   7 +
> > > > > > >  2 files changed, 155 insertions(+)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > new file mode 100644
> > > > > > > index 0000000..2be4bd2
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > > > @@ -0,0 +1,148 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > +# Copyright (c) 2020 MediaTek Inc.
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Omnivision OV02A10 CMOS Sensor Device Tree Bindings
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > +
> > > > > > > +description: |-
> > > > > > > +  The Omnivision OV02A10 is a low-cost, high performance, 1/5-inch, 2 megapixel
> > > > > > > +  image sensor, which is the latest production derived from Omnivision's CMOS
> > > > > > > +  image sensor technology. Ihis chip supports high frame rate speeds up to 30fps
> > > > > > > +  @ 1600x1200 (UXGA) resolution transferred over a 1-lane MIPI interface. The
> > > > > > > +  sensor output is available via CSI-2 serial data output.
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    const: ovti,ov02a10
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    items:
> > > > > > > +      - description: top mux camtg clock
> > > > > > > +      - description: devider clock
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    items:
> > > > > > > +      - const: eclk
> > > > > > > +      - const: freq_mux
> > > > > > > +
> > > > > > > +  clock-frequency:
> > > > > > > +    description:
> > > > > > > +      Frequency of the eclk clock in Hertz.
> > > > > > > +
> > > > > > > +  dovdd-supply:
> > > > > > > +    description:
> > > > > > > +      Definition of the regulator used as interface power supply.
> > > > > > > +
> > > > > > > +  avdd-supply:
> > > > > > > +    description:
> > > > > > > +      Definition of the regulator used as analog power supply.
> > > > > > > +
> > > > > > > +  dvdd-supply:
> > > > > > > +    description:
> > > > > > > +      Definition of the regulator used as digital power supply.
> > > > > > > +
> > > > > > > +  powerdown-gpios:
> > > > > > > +    description:
> > > > > > > +      The phandle and specifier for the GPIO that controls sensor powerdown.
> > > > > > > +
> > > > > > > +  reset-gpios:
> > > > > > > +    description:
> > > > > > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > > > > > +
> > > > > > > +  rotation:
> > > > > > > +    description:
> > > > > > > +      Definition of the sensor's placement, valid values are 0 and 180.
> > > > > > > +    allOf:
> > > > > > > +      - $ref: "/schemas/types.yaml#/definitions/uint32"
> > > > > > > +      - enum:
> > > > > > > +          - 0    # Sensor Mounted Upright
> > > > > > > +          - 180  # Sensor Mounted Upside Down
> > > > > > > +
> > > > > > > +  ovti,mipi-tx-speed:
> > > > > > > +    description:
> > > > > > > +      Indication of MIPI transmission speed select.
> > > > > >
> > > > > > What exactly does this signify? And how do you come up with the number?
> > > > > >
> > > > >
> > > > > Apologies for not addressing this number clear.
> > > > >
> > > > > From the datasheet, P1:0xA1 register represents TX_SPEED_AREA_SEL with
> > > > > the default val: 0x03.
> > > > > The description of this RW register is as below:
> > > > > Bit[2:0]: MIPI transmission speed select.
> > > > >
> > > > > Thus the enum should be definited as [ 0, 1, 2, 3, 4, 5, 6, 7 ].
> > > > > This would be fixed in next release.
> > > > >
> > > > > In the meantime, as the default val of P1:0xA1 is 0x03, we hope to keep
> > > > > that value if there is no setting for this private property in DT.
> > > > > The caller in driver would be updated like this in next release.
> > > > > if (ov02a10->mipi_clock_tx_speed)
> > > > >     ret = i2c_smbus_write_byte_data(...,...);
> > > >
> > > > How did you pick the value in the example? And why do you believe it is
> > > > specific to a platform, and not e.g. a sensor mode?
> > > >
> > >
> > > We look into P1:0XA1, one register that defines MIPI transmission speed
> > > select.
> > > From the datasheet, we can get the possible values that could be set to
> > > P1:0xA1.
> > >
> > > Actually this register is an independent of sensor mode, it is just
> > > included in sensor mode's register setting table.
> > >
> > > In addition, this private DT Property is created to fix the MIPI test
> > > failure. The register values are adjusted and verified from vendor to
> > > make sensor signal meet MIPI specification.
> > >
> >
> > In theory the value could depend on the mode, because different link
> > rate could impose different requirements for the physical interface.
> > In practice, we haven't seen any hardware that would require different
> > values for different modes.
>
> The mode (possibly in conjunction with other information available to the
> driver via V4L2 fwnode interface) precisely defines the parameters of the
> CSI-2 bus --- apart from the possible exception of the bus timing related
> parameters but this is not supported by the name of the parameter.
>
> Therefore I don't see how this parameter, which supposedly is used to
> determine the CSI-2 transmissions speed, could be board specific and thus
> belong to DT.

According to the very imprecise information I have access to, it is
not about the CSI-2 bus itself, but rather some internal parameter of
the sensor's CSI interface. Unfortunately there isn't much information
on what this value exactly controls...

Best regards,
Tomasz
