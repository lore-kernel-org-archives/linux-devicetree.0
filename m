Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4075BC43461
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 09:37:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FAE62075B
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 09:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGZldq27"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbgH1Jhw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 05:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgH1Jht (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Aug 2020 05:37:49 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F89C061232
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 02:37:48 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w14so585748ljj.4
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2020 02:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H61KW0cO/8vC8auZZfnwBx0eRjehicYI06KTiTAxhPE=;
        b=sGZldq27qtqQkS06o4Etfh2b3RBgWQ83/hREu2x5IPz+gxqzrUoI4b/0HYic8Ozd9o
         O+Vrh60X2q1O2YD6tsYIU57c3aXZPkIDfoB5x5JLpUwb4QLlXsbc7cMjuNEQoWY0MzGx
         swDdh83XnpzvM5vfFFlD3Xv7x4K3WwgzjiKb+yNQHjgxEQTEVCJ3vlDUlcsvFdaqpisu
         fvtCa0rKsQ9h2gaJebRBy65s7TKGqlXH2e5jw0DVSxEPHiGFi9i8qSQh87Do5K7jdkL8
         gF5nSuh8qIO5Mo9zCty+v4qqWH2d6GcvqoxvCi2vBvKuOAVpP1tOXnpVt0wcNmMvG27Q
         6ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H61KW0cO/8vC8auZZfnwBx0eRjehicYI06KTiTAxhPE=;
        b=c6fsm3kd1zpEj/PQzdGpbMWID+rHm4SrGJgdEZDJX3tPf7dsOrvNUjdEkuMQyOLsxX
         uh5S7S17VanSqdfHpkq4A+XUKVtcplJU47fCrfANZly0mxVNxKPJaVRJLkDwmqAiUF0J
         m9COd8Q/jlmvewd3RQtUCXvXFhVpqtSioJf1WDutuBJYha1UMs3HHwPjIF8Ja6H+vVC9
         P4Br5l4Pefjg0Xvv3e3I1Xv2u6AI4MCbb6A9KcivLqCHcSJBtV0XTeXhrzCVLXBM3uhf
         1UCHFe81bsMoWYx1I99TzvctHXUiSEKDK/PJW+W3bceYwUGgS5tM7JoGQIY4XDU6SDK+
         vCHA==
X-Gm-Message-State: AOAM5326iEWnfFGCZ8fQ+P5PcnxoBAnhJGF8xXFXRR8VvtYY0aVJaD90
        RiBZO1XvjPGVj3IBqmnf+0PhYFMZGTBbO9PfepjJww==
X-Google-Smtp-Source: ABdhPJwNru2VlFUiB5J5tlfq4WYCIDhWoJlbw/HjYQx7ozhe4gph5iyDtDKkBmQY1aerEngIdqRZ4yFpIAXJzTu4SbY=
X-Received: by 2002:a2e:b80b:: with SMTP id u11mr511080ljo.286.1598607467095;
 Fri, 28 Aug 2020 02:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200821111127.3771-1-geert+renesas@glider.be> <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
In-Reply-To: <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 11:37:36 +0200
Message-ID: <CACRpkdb3ODnScRUkJYV8VswPfn6RhrSJK2YtoYLanS3MYjbJ2g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin
 controller node name
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Aug 21, 2020 at 5:27 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 8/21/20 2:11 PM, Geert Uytterhoeven wrote:
>
> > According to Devicetree Specification v0.2 and later, Section "Generic
> > Names Recommendation", the node name for a pin controller device node
> > should be "pinctrl".
>
>    Ugh, what a lame name! :-(
>    And they say DT should be OS agnostic...

Ha ha. :D

The device tree standardization is driven with the bureaucratic ambition to
be generic, predictable and non-personal. Mimicing the characteristic of
the impersonal objects in life, such as the planets, or the plants.

This is just an ambition, in reality the people doing it are Linux-heads.

We (the DT community) try to be better people, we just fail regularly.
That is OK, the important thing is to know one can and should do better.

Yours,
Linus Walleij
