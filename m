Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76D8C33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D7FA2077B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:46:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVPgqToK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgAOOqD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:46:03 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:40513 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgAOOqC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:46:02 -0500
Received: by mail-qv1-f66.google.com with SMTP id dp13so7439548qvb.7
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 06:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ko4hPD0/HEbdUKAawr5GytPY5+uuzohUC9C8Ie0pz5Y=;
        b=GVPgqToKKsfItZLuncCcSCSiOOOzQELgjl02vuItdydovRi/jjLbd/JOQo1GG4/yi2
         SeI9ZjprOgMKRIqo9huTpzNqF7fL+KVTS3i0LVMRcZWtFXsuoTH1d+mnp4oUwZ91znVL
         2OHiDYrQRvpZehPTyzx8sm/zicwctaDhOyEpjsTmC1ZVASnj1enNLjgJ+9ZwbCs/4D2D
         +7QHAEV4Bk/ilsjfNS3qd7c06P8I3Ddy+qX+z5amLDnZTN3DYFzIIG+dymoK+TGLTqT2
         qLwosPpHMEipV0Z/Za3iUlyG7qll3GFOaCRZUqLUxD0FGhP7hiRZmQjf3rr8U1K2a5cg
         QhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ko4hPD0/HEbdUKAawr5GytPY5+uuzohUC9C8Ie0pz5Y=;
        b=E1L12vBmKHAJRubWEyxEUv0HZ+2J0TxL+BRai9lfF8tcj06CeEUs9ctSGZEYhT4nau
         DJI/1P8/A/Nz+rjyyAGvyT+DabOsfFLq2P7Wv1C37AtzRsNRtf+59NpzrO24vSqMd2bA
         jHyGaybHyIOnreNtoKcwc8ym9mys/F0r6PRM8KzHZY/agY3vzyzQHzazIrv+7hje/3GH
         rkvH7lhVLkitmkUoH1iUMiJ0SS28wG9GYgbt3CfWT2VlvK9ZpjIbEmzEdEa1qFqedQ72
         8eDcx09zfwfIwWkDAFeFL+7MBzfKtIiSJfCxHfVsTXJSTMY4FlJ1E8CY1123vS3C5uS1
         9GZQ==
X-Gm-Message-State: APjAAAUJplT+lf+v/1xb4Ty5nnRZS/2dE4hSKn+9CYYs0ajDZrehs43C
        56v+tF9YCGpODkWqomQaAwELYGSDBULz7nXKdCTUoQ==
X-Google-Smtp-Source: APXvYqxgx6sXyHqoMMdfsNegXLpS1jy2niaBHXeY33uGOlo7Pj2t0SYiM0IhcMd7OZOMaoVhZLN3+9MglvL1EXIOjJc=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr21437572qvp.210.1579099561838;
 Wed, 15 Jan 2020 06:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-2-benjamin.gaignard@st.com> <20200115143521.GA15099@bogus>
In-Reply-To: <20200115143521.GA15099@bogus>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Wed, 15 Jan 2020 15:45:51 +0100
Message-ID: <CA+M3ks7FGZ9TMO0=yXrhZph1Cn1GQ+2-tM7SnDrRDXVoCjrTjA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: timer: Add STM32 Low Power Timer bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        pascal paillet <p.paillet@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Le mer. 15 janv. 2020 =C3=A0 15:35, Rob Herring <robh@kernel.org> a =C3=A9c=
rit :
>
> On Thu, Jan 09, 2020 at 03:53:31PM +0100, Benjamin Gaignard wrote:
> > Document STM32 Low Power bindings.
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > ---
> >  .../bindings/timer/st,stm32-lp-timer.yaml          | 44 ++++++++++++++=
++++++++
> >  1 file changed, 44 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-lp=
-timer.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.=
yaml b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml
> > new file mode 100644
> > index 000000000000..ca040b96dc47
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml
>
> Use the compatible for the filename.

it will be in v2

>
> > @@ -0,0 +1,44 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/timer/st,stm32-lp-timer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STMicroelectronics STM32 Low Power 16 bits timers bindings
> > +
> > +maintainers:
> > +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: st,stm32-lptimer-clkevent
>
> 'clkevent' is a h/w name? Seems redundant and abusing compatible to
> bind to a specific Linux driver.

No but st,stm32-lptimer compatible is already used for another driver
The hardware block can implement multiple features but not all at the same =
time
so I try to distinguish them with the compatible.
In this particular case I would like tag it as a clock event driver.

>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/stm32mp1-clks.h>
> > +    clkevent: clkevent@40009000 {
>
> timer@...

OK

>
> > +      compatible =3D "st,stm32-lptimer-clkevent";
> > +      reg =3D <0x40009000 0x400>;
> > +      clocks =3D <&rcc LPTIM1_K>;
> > +      interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> > +    };
> > +
> > +...
> > --
> > 2.15.0
> >
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
