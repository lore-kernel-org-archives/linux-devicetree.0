Return-Path: <SRS0=jZdE=7L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E1DC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 16:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 566D5207BC
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 May 2020 16:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgE2QCm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 May 2020 12:02:42 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46578 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727808AbgE2QCm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 May 2020 12:02:42 -0400
Received: by mail-ot1-f66.google.com with SMTP id g25so2264776otp.13
        for <devicetree@vger.kernel.org>; Fri, 29 May 2020 09:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1jDc76jVO0C1iG3Qz3SBP/+j2UU7xnt8F7LjcFNinfk=;
        b=W7ewic85Y9IECRVTFhZQd1uORJ0q/lcQdvBo3eqLDKTE2hbhHLxw1isLyY2xVBiG7r
         71iAL41r8kgC0CXdE+eHErwuGkTV8wi0adbDVVaVX+jlCZQBwiCDb2BG1CRFG4F1UdRk
         Lg9IidOsPCo2PJYSqMlBfCAGx4AKkeor3rHrGMXEWiBYCMubD3u8b3NrxEcjv5bOFTXh
         C01C9ohuCnSQM56QC6fWG/QlLcvTh+uqzbM4C7B4v6FQWiN6mAsNov1y96XxEAx9Pd6c
         PQKWwM4EVURX2br+RKQaXGL8gqWa3cSZRab0QiKgKeuXG6Yq8zyLjtMwVAEPApiio2aC
         cjXQ==
X-Gm-Message-State: AOAM5335nEdYVqeWtkYgFomxnwzPI1qW52AENXOExrhGQ87lovfh9XAf
        csxwP/zafv+zCzUJYYt5UwLsthR4Gf5crqtHhpKp1ifJ
X-Google-Smtp-Source: ABdhPJx4TrMy3NOq3t4i3CngvNN8Zoy1yCp+brtjyBmcsYCaqTep6GCB9zvA/sGPt0USSpq3AAzX/3n54EZPGNMVUTo=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr116142otr.107.1590768160176;
 Fri, 29 May 2020 09:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200528132323.30288-1-geert+renesas@glider.be> <CAL_JsqJOPd2txkz298Rs12N+keJNYg2_qjCc-3vDwtL5iNXZmA@mail.gmail.com>
In-Reply-To: <CAL_JsqJOPd2txkz298Rs12N+keJNYg2_qjCc-3vDwtL5iNXZmA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 May 2020 18:02:29 +0200
Message-ID: <CAMuHMdU-FKoO+8cM2FOZRvENTuCEK02C=Si-bUiNCVrrp10qBA@mail.gmail.com>
Subject: Re: [PATCH dt-schema] Fix interrupt controllers with interrupt-map
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Fri, May 29, 2020 at 5:54 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Thu, May 28, 2020 at 7:23 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > When an interrupt controller has an "interrupt-map" property, an "is
> > valid under each of" error is triggered.
> >
> > Fix this by allowing "interrupt-controller" and "interrupt-map" to
> > coexist, in both the interrrupts meta-schema and the
> > interrupt-controller schema.
>
> But both should not be present. If 'interrupt-controller' is present,

Why not?

> the Linux irq parsing code will ignore 'interrupt-map'. Seems like
> that's backwards, but this parsing code is older than dirt and we'd
> probably break some 1990s machine changing it.

That's fine.  rza1_irqc_parse_map() parses the interrupt-map itself,
to map from downstream to upstream interrupts.

Cfr. the original bindings at
https://lore.kernel.org/linux-devicetree/20190502123220.3016-2-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
