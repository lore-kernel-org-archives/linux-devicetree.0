Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1552C433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 17:42:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6A5E20855
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 17:42:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgHURmC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 13:42:02 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39347 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgHURmB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 13:42:01 -0400
Received: by mail-oi1-f195.google.com with SMTP id a24so2190609oia.6;
        Fri, 21 Aug 2020 10:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yl3DEDfQFQnci/99+y+zEAQ28FvahdOCA0UhFPv1PLI=;
        b=TONblqxAn65mARDEYmRc/Uk1Ha/yix1SthUqUuGKQLKYQkwGuBTfIA13oVOFJ27j5r
         bb1ZWIEqoIawxgVjghyVkOIKXp67r4tYv31CMwLF/80tYxfz9sqra5Q5I23qoo5zfc3a
         W2IYHUT/wC/N1w/00ztSiguWJFvsi0sYh7O8XFcVP9kkWygGEgnPkJrFHF5vtVToKD1a
         iw6deR3d6/gOPF8iTd3bGHg1eGoCs+LxRIv/TEsSXQ5tv2x+Q1uz8sUrZxYYIYsVLilB
         17tjG0k/qvWR8SyiyjTjGbVyEdGM1TWxo4+pzMhnnsTnvmM/bDARriRt5O5Y2ZbueXDM
         l5Yw==
X-Gm-Message-State: AOAM533WXD5GiWIQxfPXN9CjjdNzyB8E61YRXLJzJiD2hOJZbkFEVpDz
        HySnIC+Nmla8PFV+mB18KOxFo9jS9vhAuSEyx6E=
X-Google-Smtp-Source: ABdhPJwrSFipn8Bb59EqkLU6EQVkGNI3mbZop4oT6xM6zzFanHfvmHxgsiKExT0kJEaL0ZhvBLQwQ2ZV+ci6elz2fDw=
X-Received: by 2002:aca:b742:: with SMTP id h63mr2378078oif.148.1598031720424;
 Fri, 21 Aug 2020 10:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200821111127.3771-1-geert+renesas@glider.be> <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
In-Reply-To: <56474631-119b-d64b-3545-a14f800aaa61@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 19:41:48 +0200
Message-ID: <CAMuHMdVr1FBD+Gto8zf-tAp4_YTP1zs_qKu=yBeS3n2yjVqX0g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin
 controller node name
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

Hi Sergei,

On Fri, Aug 21, 2020 at 5:27 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 8/21/20 2:11 PM, Geert Uytterhoeven wrote:
> > According to Devicetree Specification v0.2 and later, Section "Generic
> > Names Recommendation", the node name for a pin controller device node
> > should be "pinctrl".
>
>    Ugh, what a lame name! :-(
>    And they say DT should be OS agnostic...
>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>    I think more DTs have "pin-controler".

I was surprised to discover the opposite, too:

$ git grep "\<pinctrl@" v5.9-rc1 | wc -l
335
$ git grep "\<pin-controller@" v5.9-rc1 | wc -l
102

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
