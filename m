Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170F1C32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 19:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE6D42187F
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579114841;
	bh=MlG4s8gIf9QIp7cmwxv8Ub3MJBcjIUIPloJI7is/YIM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=TfcuJtYvPIDocVdhBWEjDzifnuXFVKQoNsRkJVaXzJpdgEaQ2XolHiOlSNKCVulxt
	 xx6W9V4ZWFhdr8hHhamgyI+z5y4RnzAJ1H6a1Zvi/w7GeGeHIgIQlVz6HR+hOaxsGd
	 DNmMv1UYWpMdFqGj2VIGYHiPNx3MafJHydz+MSqA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgAOTAl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 14:00:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:45268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728992AbgAOTAl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Jan 2020 14:00:41 -0500
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 492D42187F
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579114840;
        bh=MlG4s8gIf9QIp7cmwxv8Ub3MJBcjIUIPloJI7is/YIM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bGAWEXGuvwR5V8/IBccmj+E3ISleKHwW/4Bu8O4vIMtC9e6TXQJS3Du4rHFBTCbYI
         oZsiYeuWgl6Vb/9gLW5a0rslAAncSApseT1j89zkRCVZ8aFXK2aq3eXEk4uoFoIDGU
         kYsuKnL7Kh2/RcLp9aajLIEWSQ0V91KwaX2oUBC8=
Received: by mail-qk1-f180.google.com with SMTP id r14so16660205qke.13
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 11:00:40 -0800 (PST)
X-Gm-Message-State: APjAAAWnihyxbEODgBLeNecSt4/p5ajArD9SCj0P+ray1UCBsiKcdQF1
        YNSMtJNdqzGtS9nqFR7bA+wSt4DI4yfUvvSPCA==
X-Google-Smtp-Source: APXvYqxnDh1IEhLyZP31/QgZF61ylKseQtKsfhE9nWDF1jxrTcOeHZYesnoZvVtxadzwM8P/TeMg5/NndDzuP3fXuos=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr23911932qke.393.1579114839424;
 Wed, 15 Jan 2020 11:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-2-benjamin.gaignard@st.com> <20200115143521.GA15099@bogus>
 <CA+M3ks7FGZ9TMO0=yXrhZph1Cn1GQ+2-tM7SnDrRDXVoCjrTjA@mail.gmail.com>
In-Reply-To: <CA+M3ks7FGZ9TMO0=yXrhZph1Cn1GQ+2-tM7SnDrRDXVoCjrTjA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 15 Jan 2020 13:00:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLki6D4soncDo0ZEh4xeC9+U_Kf2dnOVjrMTY1QrXTjfg@mail.gmail.com>
Message-ID: <CAL_JsqLki6D4soncDo0ZEh4xeC9+U_Kf2dnOVjrMTY1QrXTjfg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: timer: Add STM32 Low Power Timer bindings
To:     Benjamin Gaignard <benjamin.gaignard@linaro.org>
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

On Wed, Jan 15, 2020 at 8:46 AM Benjamin Gaignard
<benjamin.gaignard@linaro.org> wrote:
>
> Le mer. 15 janv. 2020 =C3=A0 15:35, Rob Herring <robh@kernel.org> a =C3=
=A9crit :
> >
> > On Thu, Jan 09, 2020 at 03:53:31PM +0100, Benjamin Gaignard wrote:
> > > Document STM32 Low Power bindings.
> > >
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > > ---
> > >  .../bindings/timer/st,stm32-lp-timer.yaml          | 44 ++++++++++++=
++++++++++
> > >  1 file changed, 44 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-=
lp-timer.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/timer/st,stm32-lp-time=
r.yaml b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml
> > > new file mode 100644
> > > index 000000000000..ca040b96dc47
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/timer/st,stm32-lp-timer.yaml
> >
> > Use the compatible for the filename.
>
> it will be in v2
>
> >
> > > @@ -0,0 +1,44 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/timer/st,stm32-lp-timer.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: STMicroelectronics STM32 Low Power 16 bits timers bindings
> > > +
> > > +maintainers:
> > > +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: st,stm32-lptimer-clkevent
> >
> > 'clkevent' is a h/w name? Seems redundant and abusing compatible to
> > bind to a specific Linux driver.
>
> No but st,stm32-lptimer compatible is already used for another driver
> The hardware block can implement multiple features but not all at the sam=
e time
> so I try to distinguish them with the compatible.
> In this particular case I would like tag it as a clock event driver.

That's a Linux specific thing which we've said no to for 10 years.

Is "Not at the same time" a chip design time configuration or run-time
config. If the latter, why do you want to use a particular instance
over another one for clock event? There has to be some h/w difference.
Describe the difference and then use that to grab the device to use
for a clockevent. I'm fine if you omit the pwm node and then use that
to decide which instance to use.

Rob
