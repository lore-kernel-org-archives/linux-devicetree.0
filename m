Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B43C33CB1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 15:44:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3952E206D9
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 15:44:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuZrRDRr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgAPPoi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 10:44:38 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:41805 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgAPPoi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 10:44:38 -0500
Received: by mail-qt1-f196.google.com with SMTP id k40so19189124qtk.8
        for <devicetree@vger.kernel.org>; Thu, 16 Jan 2020 07:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gS/fHlu1Oq+hOaHui9eyrfBYKZOt+Ph3ppYSp+KEj84=;
        b=TuZrRDRrFT+WCptl4jtudlerse96sZuVq1zCdH/vK0dfPQ5xrQ8yUIzMfOapTXR9y4
         2ibPZdeO3cq4uS1KiYsYbV9RRHau1FtdADF2iknc6ur7M5Hbe02w+NYCZSev5tkOuh9y
         ePPUYQ5Bh8gV7wWIJjAdFBo2Fr7l9sacP/LpMALL0xuGORiaeTm3/ovoKyoLmwkFKklD
         6sSWGaW4m6iXLGFz46GxeiCxLNa8KvJnVQcgvCjOULKu8FKZMzC5iRUJ3iQ4JETxnPHt
         2cnmYanX1iTd7BIvnEBMBduu9aAm6DnKlJHyGdk6ZlhC2lQ9nUkBPOSsLwHSjr/FwcCE
         zFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gS/fHlu1Oq+hOaHui9eyrfBYKZOt+Ph3ppYSp+KEj84=;
        b=X6+6B7Hjex0dDy64ggRAGSAqEMkS+ZZNs93rQKELSFwnIxwt7eBA+lMWvfgB3Xk41K
         xSYCNxq6qfgaOO2zwMUBTZONIP4pwprlpIfRp7GYCfAbsIbuAvvmXkgJzAr5InwjoAxT
         P5E7zvSxgrOf8lK5t0frhyCaRvPtXrycXm2RiJLVNreOUNo7+PzJ+6JvN/NLU7mxfkH4
         DQfy+XjFdxGOpqMcZJaXknEquxxHA/nSPkosIimDj/7vlEgRzq7YSCBVDBVqIRwx3b+N
         Zsy21QjDA+SC8tf9ARj1KH0e+WWzJaHon/Awvp1zpGgCC/ozvLBwR3Hog175sk8iI8RI
         KVOw==
X-Gm-Message-State: APjAAAWhgxs9iRBMChb5KwGrWKBvJ2SitPEca4oP1qgFw/VdGojUUs4r
        q63+T+cRXO92MRjgeucxJ7VaBIRRmlG7WWJRVO0TFPhy
X-Google-Smtp-Source: APXvYqxNeltlsFc5Dxrse9Z755UY41N7ksUFlORuO7LHPKeYC0Mo2wcnrf5mqiMyXQzUM4vECUHukncA86I8+8DwzWQ=
X-Received: by 2002:aed:2d01:: with SMTP id h1mr2976756qtd.239.1579189477572;
 Thu, 16 Jan 2020 07:44:37 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-3-benjamin.gaignard@st.com> <CACRpkdaK+kQZH_Txu-r4DY_m6muh26aCWcGOkxbi8hbCgww28A@mail.gmail.com>
In-Reply-To: <CACRpkdaK+kQZH_Txu-r4DY_m6muh26aCWcGOkxbi8hbCgww28A@mail.gmail.com>
From:   Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date:   Thu, 16 Jan 2020 16:44:26 +0100
Message-ID: <CA+M3ks7s_KOhXciJPZc3N4z9GNkiKa=fWdQ3hC_HTtrWMWYHtQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clocksource: Add Low Power STM32 timers driver
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        Rob Herring <robh+dt@kernel.org>,
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

Le jeu. 16 janv. 2020 =C3=A0 10:07, Linus Walleij
<linus.walleij@linaro.org> a =C3=A9crit :
>
> On Thu, Jan 9, 2020 at 3:54 PM Benjamin Gaignard
> <benjamin.gaignard@st.com> wrote:
>
> > Implement clock event driver using low power STM32 timers.
> > Low power timers counter s running even in when CPU is in stop mode.
> > It could be used as clock event broadcaster to wake up CPUs but not lik=
e
> > a clocksource because each it rise an interrupt the counter restart fro=
m 0.
> >
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > Signed-off-by: Pascal Paillet <p.paillet@st.com>
>
> Looks good to me:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Hi Linus,

Thanks for your review. I had to rework a bit the driver to solve the
bindings issues
so I haven't put your RB on version 2.

>
> If you have a spare always-on timer (and it looks like you have) which
> you can set as free-running, you could register it with
> CLOCK_SOURCE_SUSPEND_NONSTOP so it

The driver only implement clock event feature so I don't think that is
flag is applicable.

Regards,
Benjamin
> keeps the system clock ticking also during suspend as
> alternative clock source.
>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
