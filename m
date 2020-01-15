Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6316DC32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 19:17:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37ACE222C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 19:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CzTRXY50"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgAOTRu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 14:17:50 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:40302 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgAOTRu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 14:17:50 -0500
Received: by mail-qt1-f193.google.com with SMTP id v25so16766156qto.7
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3oehQjENUEt6IwzurE8ivHHaN3UVdBa+Oowf63E60NU=;
        b=CzTRXY50zvP3lB1RvMkiImvNyLNaEPKNI321FbjF9Ug29rjj8gvhUoANJtQAoA6U6d
         9TZAm3G5knfU6VsjsuXeLO/YQH9MQtxKNFDFMtbUzsbcOmt9MGSem8GFkhzvK7WnadI9
         mJhbxLs2m904c8ERBdZ8BNndOhED5HUaVBa+fk/POBoTQNni0GidGoPrkbthcNlis2z7
         +QPzimTmpMig9c5pwKV3GRJnZzts+n4nK0pLjD7jCrW1YULeGfSbEKpvuKHp6lgr4683
         Gpdl3Zpge3xqKTUQ1KM2UAd47hTcCTZ9qZBGXI4yfFGmNPw+PwTK4nysSvuB/FGtGOt8
         VGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3oehQjENUEt6IwzurE8ivHHaN3UVdBa+Oowf63E60NU=;
        b=RgyQ3aObPGb6EI8KYRJmCiCJxB3k4DRaG7ZoOeUMmDw5U/wPGCg0bX2CbDhKiFx/qH
         K4IC8mHbSRPiwFZSu4h3F+AurPVhQ5n2upbNx4qN+BhpIqptv4VApG/vfajP2zRVK53e
         mB3kISS0GEtyKQzg6FCc4uVN2rF12CCPpK6P4BxZaJhcFMKTbxt7PlHr+bLZeHcpIffa
         8Y9O1oL09MNNewggbmVwERzHzUu9+AxRGxONb5KTFUWQKXKJaI2hp/qsOP/Wrk9k+pCu
         GMKfzoCmJXfiz1s5UFjvymprTp5a6QGxFhmmT4xUPc1WwA7FpQ3Obw4BETLoOHnyNuZt
         dAGg==
X-Gm-Message-State: APjAAAWIJhHae+5mYpU9b0h3WXTtCIcREJAsaerFuIWW9iS2GBRpvy4G
        8NSvGksbNViagkD8h720p5OVHrxe/aQf5dsqt55LJg==
X-Google-Smtp-Source: APXvYqyJZqV8RaX3xgtSRb3g1wC2DLSVbZOTeDQGcnisJ8sUJbdpLx1+W5v8eR7hhzyOBQW9ezqQdL9+I+uWlUi5DaE=
X-Received: by 2002:ac8:33ab:: with SMTP id c40mr142755qtb.250.1579115869684;
 Wed, 15 Jan 2020 11:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-2-benjamin.gaignard@st.com> <20200115143521.GA15099@bogus>
 <CA+M3ks7FGZ9TMO0=yXrhZph1Cn1GQ+2-tM7SnDrRDXVoCjrTjA@mail.gmail.com> <CAL_JsqLki6D4soncDo0ZEh4xeC9+U_Kf2dnOVjrMTY1QrXTjfg@mail.gmail.com>
In-Reply-To: <CAL_JsqLki6D4soncDo0ZEh4xeC9+U_Kf2dnOVjrMTY1QrXTjfg@mail.gmail.com>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Wed, 15 Jan 2020 20:17:37 +0100
Message-ID: <CA+M3ks5AQVhacAW_gSXYwj6_O8xnvv0StDmhXn2MeQFS6JMZfg@mail.gmail.com>
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

Le mer. 15 janv. 2020 =C3=A0 20:00, Rob Herring <robh@kernel.org> a =C3=A9c=
rit :
>
> On Wed, Jan 15, 2020 at 8:46 AM Benjamin Gaignard
> <benjamin.gaignard@linaro.org> wrote:
> >
> > Le mer. 15 janv. 2020 =C3=A0 15:35, Rob Herring <robh@kernel.org> a =C3=
=A9crit :
> > >
> > > On Thu, Jan 09, 2020 at 03:53:31PM +0100, Benjamin Gaignard wrote:
> > > > Document STM32 Low Power bindings.
> > > >
> > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > > > ---
> > > >  .../bindings/timer/st,stm32-lp-timer.yaml          | 44 ++++++++++=
++++++++++++
> > > >  1 file changed, 44 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/timer/st,stm3=
2-lp-timer.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/timer/st,stm32-lp-ti=
mer.yaml b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml
> > > > new file mode 100644
> > > > index 000000000000..ca040b96dc47
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yam=
l
> > >
> > > Use the compatible for the filename.
> >
> > it will be in v2
> >
> > >
> > > > @@ -0,0 +1,44 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/timer/st,stm32-lp-timer.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: STMicroelectronics STM32 Low Power 16 bits timers bindings
> > > > +
> > > > +maintainers:
> > > > +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: st,stm32-lptimer-clkevent
> > >
> > > 'clkevent' is a h/w name? Seems redundant and abusing compatible to
> > > bind to a specific Linux driver.
> >
> > No but st,stm32-lptimer compatible is already used for another driver
> > The hardware block can implement multiple features but not all at the s=
ame time
> > so I try to distinguish them with the compatible.
> > In this particular case I would like tag it as a clock event driver.
>
> That's a Linux specific thing which we've said no to for 10 years.
>
> Is "Not at the same time" a chip design time configuration or run-time
> config. If the latter, why do you want to use a particular instance
> over another one for clock event? There has to be some h/w difference.
> Describe the difference and then use that to grab the device to use
> for a clockevent. I'm fine if you omit the pwm node and then use that
> to decide which instance to use.
>

There is no hardware difference between the devices but we can't do
pwm and clockevent
at the same time. We use the same hardware for two exclusives
features. In addition
we want to be able to use clockevent on one device and pwm on one another.
Could "st,stm32-low-power-timer" compatible be a solution ?

Benjamin

> Rob
