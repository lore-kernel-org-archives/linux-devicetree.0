Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E550CC433E2
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 21:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C11492084C
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 21:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cj0QgtAf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgGMV1H (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 17:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbgGMV1H (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 17:27:07 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08A9C061755
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 14:27:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s9so19820419ljm.11
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 14:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M0i+cm/2qImH5MvfqEwzYLh9q23sYVfzwD0CdeOFYso=;
        b=Cj0QgtAfC5HUnM+bKMgYqHL/fmBdYBBRzRZZYifYR5KgO0Ps1/oWkLaDowqyOL3OfX
         HxRyw1deAhh9/h7LHayzwHV6veGQhudNxZP10qgJI4Qrdd+Dbu79JVW7sdnrXGJwQdq5
         Dw5TfiW9vmFNSQkT5ppdvHgxQhzLFGG2LZ+Tq3bktK516asPsdNqkW49wiuTKJwvUgMz
         QtlbXAXFUwCp/sy/mqfVgcIu8fhI17RhAIedk8vgKRolI0gnSaD8QB39nHSmEe7iTbW7
         i7894BpI4niFqaV6B5zBzF/J6kqEk1i7LbAfRUw1BWGM22PFqQc9Mu8agFs7Hnxs6kHT
         W44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M0i+cm/2qImH5MvfqEwzYLh9q23sYVfzwD0CdeOFYso=;
        b=r19pZDl5PIZy/A4H7Anxb/Di6QDcxEIPYWEfNdQu9CgU0n+dWOfNCPp1vj+lrAlV0U
         EFlju0Owmgvr7HmuKVd1QewZvVTk2RN9FrcyeMq6EFx7PCU2wGsRl5Bga8bIgdvWS9hT
         05XRu+S/u+yMxH5qjzDVC8tHOxoXTU9TXxy6zdh/OmGrM/zKQFeAHg1Appjm94BUVOfg
         iivAh7sD92wnEJHEfqWVBvcMhbUn5jmdVd8l728VR+6/zL50nAtTKhuzyALEKcM7FOdU
         72Vq1W6sYufZwTmvzJOXTqeiQUc8Q6Ylj83ljl2xqbhh9zIAs+gqNAyn75K8Gg5ggtRw
         xqNQ==
X-Gm-Message-State: AOAM530WzKHgbtZ3ERaDeSf25FVd3/e7XkNBZagrnjPPq0xIbnIFN77B
        lIJB0V9Tak53qWiMGJaaMKiL6HKs9q/OIpDHgLqejA==
X-Google-Smtp-Source: ABdhPJzLwjTTkwJxPnjSMVJqCSW4Kk1XJ72UeXKhD8NfUFwJYpPZF1VgCCBoNC0gnTkKJ7z5PX1ZtHK+8z/mAxaJt+E=
X-Received: by 2002:a2e:9c3:: with SMTP id 186mr744318ljj.293.1594675625195;
 Mon, 13 Jul 2020 14:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com> <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com> <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com>
In-Reply-To: <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Jul 2020 23:26:54 +0200
Message-ID: <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
Subject: Re: [RFC] GPIO lines [was: GPIO User I/O]
To:     Rodolfo Giometti <giometti@enneenne.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jul 13, 2020 at 4:20 PM Rodolfo Giometti <giometti@enneenne.com> wrote:

> >>                 motor {
> >>                         gpios = <&gpionb 8 GPIO_ACTIVE_HIGH>;
> >>                         mode = "out-high-open-drain";
> >>                 };
(...)
> > /* Bit 2 express Open drain or open source */
> > #define GPIO_LINE_OPEN_SOURCE 0
> > #define GPIO_LINE_OPEN_DRAIN 4
(...)
> These modes came from include/linux/gpio/consumer.h:

OK I was a bit unclear. Mainly open drain should be a flag on
the line, not a mode.

> Maybe I can do something similar to hog-gpio as below, if you prefer...
>
> bypass0 {
>         gpios = <&gpionb 10 GPIO_ACTIVE_LOW>;
>         output-low;

Yes this is better, just boolean flags is not natural than strings
for this.

However it addresses in a way an issue we have had popping
up from time to time which is assignment of default values to
lines before they are used overall.

I think that would be a bit of thing that should be proper to
solve as part of this.

The discussion has often stopped short due to different
opinions on the device tree bindings for that.

Yours,
Linus Walleij
