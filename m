Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5936FCA9EC4
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 06:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E1902087F
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 06:46:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aF/kblen"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfJ3GqG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 02:46:06 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43851 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfJ3GqG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 02:46:06 -0400
Received: by mail-pf1-f195.google.com with SMTP id 3so861980pfb.10
        for <devicetree@vger.kernel.org>; Tue, 29 Oct 2019 23:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cUna80mgrJuvwZng2S/zg9eJ2aJtl1v9W/4Z7bansiw=;
        b=aF/kblen9t7CI7DHz9bX09InKfJirCrxV3h4upoRTtuntFzgf+ordcplUGhDX3hTlI
         enA6URTjG0DKHNBi7J0mrKJnZ4kpZEXgZiuT0h9iNBlprIQJyJtZIMrytcelto9jQO7H
         MsopDsGzlopi41nNk+mnCl/lntEhDo13NN+XSceDsf0olDyv6lrE4MwZ8tOAOOOVRf37
         hs6uKnu6Ueo6jwa5fJv4IwEn/6bbxawQmu6ZcBnZkngNeMEiroT/u7fHnv6vpuw5IYke
         qnmMpHgGEebHdKWzYqH8bpUg+biG8CfvSfTg7sNHuFlVv8ytyegGt6zi0ypgzbIHLwXW
         LJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cUna80mgrJuvwZng2S/zg9eJ2aJtl1v9W/4Z7bansiw=;
        b=U86m6evS7NMg6mWTRiuQzjZ2ACcCtcCZHYWxiHxX4jMtWlVCaJDpdUTpfHegZX1rhx
         Ara0/mvgOmuyu28celAYPJJr748ff47TkXkPG39DKD0JFBcxUCch3dpxyG4pWCh72pEo
         QHLzN+Ti6bT16HUEn2ScLVjwUxG6O2hxNXwZmQHI8JIpYhYBbBhy3HeYZb45520UD6O/
         2PlRHdtMqTNEa/hKyKMaZ+Xz9UIliNE9SCJLOvtEDLM0kBD3B2N5bv6Q55FsLNUUHFe0
         q52yq2Mtbyg/8EKj8kgF+N7Xe09DzrfuNDD9a1ZJsjo2Q1EaTZypnR7o1Yxi+VIBUj2E
         j5dQ==
X-Gm-Message-State: APjAAAXsewydXqZbc9786lJeejL3GXXcP1b+OuzremWKOmCDvhGkJIxz
        YL/u++PaAKRvMreMLc9P9ebv
X-Google-Smtp-Source: APXvYqw4sy47eUnhMCq6S6rBb149xzsVxBxXpwL1klsrmUeuNOV3Z+gzN5hBEkI38UsF/yJrZuzh7A==
X-Received: by 2002:a63:f441:: with SMTP id p1mr31930177pgk.362.1572417964721;
        Tue, 29 Oct 2019 23:46:04 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:77d9:c9fa:423a:3851:8df4])
        by smtp.gmail.com with ESMTPSA id i63sm1270378pgc.31.2019.10.29.23.45.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2019 23:46:04 -0700 (PDT)
Date:   Wed, 30 Oct 2019 12:15:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191030064555.GB11637@Mani-XPS-13-9360>
References: <20191025175908.14260-1-manivannan.sadhasivam@linaro.org>
 <20191025175908.14260-2-manivannan.sadhasivam@linaro.org>
 <20191028122115.GB4928@valkosipuli.retiisi.org.uk>
 <20191029221213.GB17996@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029221213.GB17996@bogus>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob, Sakari,

On Tue, Oct 29, 2019 at 05:12:13PM -0500, Rob Herring wrote:
> On Mon, Oct 28, 2019 at 02:21:15PM +0200, Sakari Ailus wrote:
> > Hi Manivannan,
> > 
> > Thanks for the update.
> > 
> > On Fri, Oct 25, 2019 at 11:29:07PM +0530, Manivannan Sadhasivam wrote:
> > > Add YAML devicetree binding for IMX296 CMOS image sensor.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  .../devicetree/bindings/media/i2c/imx296.yaml | 98 +++++++++++++++++++
> > >  1 file changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > > new file mode 100644
> > > index 000000000000..4e204fd7cf90
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > > @@ -0,0 +1,98 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> > > +
> > > +maintainers:
> > > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > +
> > > +description: |-
> > > +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> > > +  sensor with square pixel array and 1.58 M effective pixels. This chip
> > > +  features a global shutter with variable charge-integration time. It is
> > > +  programmable through I2C and 4-wire interfaces. The sensor output is
> > > +  available via CSI-2 serial data output (1 Lane).
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sony,imx296
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    description:
> > > +      Input clock for the sensor.
> > > +    items:
> > > +      - const: mclk
> > > +
> > > +  clock-frequency:
> > > +    description:
> > > +      Frequency of the mclk clock in Hertz.
> > > +    default: 37125000
> > 
> > I think you could omit the default.
> 
> Yes, there's no default if it is required.
>

Okay.

> > > +
> > > +  vddo-supply:
> > > +    description:
> > > +      Definition of the regulator used as interface power supply.
> > > +    maxItems: 1
> > > +
> > > +  vdda-supply:
> > > +    description:
> > > +      Definition of the regulator used as analog power supply.
> > > +    maxItems: 1
> > > +
> > > +  vddd-supply:
> > > +    description:
> > > +      Definition of the regulator used as digital power supply.
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    description:
> > > +      The phandle and specifier for the GPIO that controls sensor reset.
> > > +    maxItems: 1
> > > +
> > > +  # See ../video-interfaces.txt for details
> 
> details on what?
>

Standard properties like endpoint, reg, etc...  I can remove it if not
required.

> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - clock-frequency
> > > +  - vddo-supply
> > > +  - vdda-supply
> > > +  - vddd-supply
> > 
> > I think the port and endpoint nodes should documented here as well.
> 
> port yes, but endpoint no. Unless you have endpoint properties other 
> than remote-endpoint or reg.
> 


Okay. Will document port.

Thanks,
Mani

> > 
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    imx296: camera-sensor@1a {
> > > +        compatible = "sony,imx296";
> > > +        reg = <0x1a>;
> > > +        reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> > > +        pinctrl-names = "default";
> > > +        pinctrl-0 = <&camera_rear_default>;
> > > +        clocks = <&gcc 90>;
> > > +        clock-names = "mclk";
> > > +        clock-frequency = <37125000>;
> > > +        vddo-supply = <&camera_vddo_1v8>;
> > > +        vdda-supply = <&camera_vdda_3v3>;
> > > +        vddd-supply = <&camera_vddd_1v2>;
> > > +
> > > +        port {
> > > +            imx296_ep: endpoint {
> > > +                remote-endpoint = <&csiphy0_ep>;
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> > 
> > -- 
> > Regards,
> > 
> > Sakari Ailus
