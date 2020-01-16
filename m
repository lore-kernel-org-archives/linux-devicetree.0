Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AC4C33CB1
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 09:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8593220748
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 09:06:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MGfwKQoK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgAPJGy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 04:06:54 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40705 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgAPJGx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 04:06:53 -0500
Received: by mail-lj1-f194.google.com with SMTP id u1so21753283ljk.7
        for <devicetree@vger.kernel.org>; Thu, 16 Jan 2020 01:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YX3/Ti4rNNr6UCshG9bZTqGTKsmc/hxmzqtnVPBHDm8=;
        b=MGfwKQoKAqc3fScLEHCq7ywLuKCcvWPmQ9A7lwyExcP8OV3fnyDUQ4mQEIZsH51+oJ
         0kNXekwRVSQafelLavUheZa9llfrrDBxGeJJtIf2c5aYnACbp3ferLP/cK1w4LwfX0F3
         6Y7NAppxwKV8qjOAUP4jQl6u1uUyfEKMd0lLnEwFErxZTg7GvpGuBiAIDoD22b5Qu04x
         FmzKSj5FCFYAwffwgIp3VN72A7V4dI1YvvpN/tGlg9y7nXiewtk9bT33IzGyPGzNU5+w
         7RvD5HjpxlCMTAYkHfR4pIC5wzIa0hnrVGufZMvfS0btIgdaMkCANDqJNtjHbDC/IHe9
         87uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YX3/Ti4rNNr6UCshG9bZTqGTKsmc/hxmzqtnVPBHDm8=;
        b=tR9BEr3Rho6ZHTATIeKZZdgp2Hsg0pqGfPjUP31uxTSubdNl+vEuvJT6zl2m43LlqB
         ZtQLqEd6LZOz8ETjyLJtooHFqeRP/0j46n5cqvAnRdV6BWC6GjyS78A17SImsnVxwx60
         s8aihqzrPnMtFYcZ9xx5nW1isV0CwklUqYh2kWNYIesl+GoydV39J9G/2BfVNM1wSk5l
         3fQMsPQiFMqjrO3bRo/ELzBprrPTUxbY3ywQT5G4/jmMbKVFzafVa5Ou29AcxPFh10wt
         ZqvEyizDat0BXnl1J3l357neW7oNAfqY7w9SqJc7ckf0DEGT+6ooZd1GUoTQSuhMd0AJ
         6x+A==
X-Gm-Message-State: APjAAAVTtd9FGxM9EM0JdSLpoT792PkG8igMACee3n3Y0qvoT2Gz9c9z
        qDlRv+lhL9q5cXt9vn651iJkGdC/cbH1An7PkHi4Sg==
X-Google-Smtp-Source: APXvYqz1bWJIuOjw+BT1TEwOPq4JBdgdI/skG6NXF/N1KsERHNA6I+CpAf4tjtbyYYrx3gjxL2aY1jk3BlxmtyTmf9w=
X-Received: by 2002:a2e:960f:: with SMTP id v15mr1685441ljh.265.1579165611849;
 Thu, 16 Jan 2020 01:06:51 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com> <20200109145333.12260-3-benjamin.gaignard@st.com>
In-Reply-To: <20200109145333.12260-3-benjamin.gaignard@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jan 2020 10:06:40 +0100
Message-ID: <CACRpkdaK+kQZH_Txu-r4DY_m6muh26aCWcGOkxbi8hbCgww28A@mail.gmail.com>
Subject: Re: [PATCH 2/3] clocksource: Add Low Power STM32 timers driver
To:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        Baolin Wang <baolin.wang7@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Russell King <linux@armlinux.org.uk>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 9, 2020 at 3:54 PM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:

> Implement clock event driver using low power STM32 timers.
> Low power timers counter s running even in when CPU is in stop mode.
> It could be used as clock event broadcaster to wake up CPUs but not like
> a clocksource because each it rise an interrupt the counter restart from 0.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Signed-off-by: Pascal Paillet <p.paillet@st.com>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If you have a spare always-on timer (and it looks like you have) which
you can set as free-running, you could register it with
CLOCK_SOURCE_SUSPEND_NONSTOP so it
keeps the system clock ticking also during suspend as
alternative clock source.

Yours,
Linus Walleij
