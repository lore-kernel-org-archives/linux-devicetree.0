Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4B9CA9EC9
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 12:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 884BF2087E
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 12:01:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwwFFn4m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfJ3MBR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 08:01:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36512 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfJ3MBR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 08:01:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id j22so1358374pgh.3
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Pn2SBbNltYyaVGymDbdAPJdCwQZFHAgjh2Z52q+dj1A=;
        b=dwwFFn4mrIwtWIN6ANiIwElOwApzWsI7v1i7rx0h2QZ+LjebgtOSslaOAb91tjz2W8
         pW0K/CNndOdBdaBssesEraMc8rUJYFv03ToPABpl5WVro25hduRcjipHBqXNGX4dVFB5
         6OJD1IirtOdZ0wTeDIZdYrJE3V/tVC3xhJuGbMKwuBNtj22daYgkS/mUxtS8CXIHlTaL
         hR2QEzC4MJ4Ri0K/5yWJwe8j0kGK7ly9qbdAkY1GOyykhTuwLu002sLFVWSCDusWuJzi
         109l6LAYkFoxd5FDekLBmo5RpGpFLfPUxlMfkT0Dje7ryXziyzpZa08Y4nrRqquV8S99
         Duhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Pn2SBbNltYyaVGymDbdAPJdCwQZFHAgjh2Z52q+dj1A=;
        b=jkpO1hirVZBDhLJEI10seMHlQvcVU+krLGCpQFTZG5NILSpjCtG0hKgI/T2VgXGgJK
         7p7DTkhttkwScamSEjIY3woLZEdy/1mnSvlv57v+oX9QkunSB2DAjHYwCffCXclT4VpP
         b1x4iilAk2IlWJ+r6sK0MBZbQcpPfwExAgttNbjwKmihHwspHm5aQuwgiTJxwjIrcQxz
         uQrdfHKy2UvXjfsJxfx69ecvVa9cuSdjpOpjqqylRu/ScGOT5sc1jb/gXuHJW9AWKDqW
         Kf120A4q/m1iitOByoQj8CgsKXGZbM3DbkYnNyhN5muptXclPijRhbwD/u1ynZnvjcWb
         jm7g==
X-Gm-Message-State: APjAAAU9BazlOfnQw9vWtHoYPVKEsXnvmW9REJe7e/4/r8v1CVXN+ji4
        S2cAwng3CN5hGDsUkg45YPJS
X-Google-Smtp-Source: APXvYqzZ4kqchrmVDuSmUbMpCOHr9OhgeLDhCral1RgOulvxlW5oUWV1FdBYh1NOIHktZhDyzxsfNw==
X-Received: by 2002:a17:90b:282:: with SMTP id az2mr13396510pjb.23.1572436874465;
        Wed, 30 Oct 2019 05:01:14 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:77d9:c9fa:423a:3851:8df4])
        by smtp.gmail.com with ESMTPSA id q185sm4328613pfc.153.2019.10.30.05.01.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Oct 2019 05:01:13 -0700 (PDT)
Date:   Wed, 30 Oct 2019 17:31:05 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add IMX296 CMOS sensor
 binding
Message-ID: <20191030120105.GA11432@Mani-XPS-13-9360>
References: <20191030094902.32582-1-manivannan.sadhasivam@linaro.org>
 <20191030094902.32582-2-manivannan.sadhasivam@linaro.org>
 <20191030115328.GA6253@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030115328.GA6253@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sakari,

On Wed, Oct 30, 2019 at 01:53:28PM +0200, Sakari Ailus wrote:
> Hi Nabuvannan,
> 
> On Wed, Oct 30, 2019 at 03:19:01PM +0530, Manivannan Sadhasivam wrote:
> > Add YAML devicetree binding for IMX296 CMOS image sensor. Let's also
> > add MAINTAINERS entry for the binding and driver.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/media/i2c/imx296.yaml | 94 +++++++++++++++++++
> >  MAINTAINERS                                   |  8 ++
> >  2 files changed, 102 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx296.yaml b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > new file mode 100644
> > index 000000000000..c04ec2203268
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx296.yaml
> > @@ -0,0 +1,94 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/imx296.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX296 1/2.8-Inch CMOS Image Sensor
> > +
> > +maintainers:
> > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +
> > +description: |-
> > +  The Sony IMX296 is a 1/2.9-Inch active pixel type CMOS Solid-state image
> > +  sensor with square pixel array and 1.58 M effective pixels. This chip
> > +  features a global shutter with variable charge-integration time. It is
> > +  programmable through I2C and 4-wire interfaces. The sensor output is
> > +  available via CSI-2 serial data output (1 Lane).
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx296
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description:
> > +      Input clock for the sensor.
> > +    items:
> > +      - const: mclk
> > +
> > +  clock-frequency:
> > +    description:
> > +      Frequency of the mclk clock in Hertz.
> > +
> > +  vddo-supply:
> > +    description:
> > +      Definition of the regulator used as interface power supply.
> > +
> > +  vdda-supply:
> > +    description:
> > +      Definition of the regulator used as analog power supply.
> > +
> > +  vddd-supply:
> > +    description:
> > +      Definition of the regulator used as digital power supply.
> > +
> > +  reset-gpios:
> > +    description:
> > +      The phandle and specifier for the GPIO that controls sensor reset.
> > +    maxItems: 1
> > +
> > +  port: true
> 
> You're missing "type: object" under port.
> 

I did that intentionally, since there are other places where I can see the
"type" field not specified. So, I was not sure about that. Most of the
display bindings don't specify "type" and they are most available ones.
I don't think the "port" property differs between cameras and displays.
So I went with that.

Thanks,
Mani

> -- 
> Regards,
> 
> Sakari Ailus
