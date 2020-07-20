Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F729C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 08:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F45122B4D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 08:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4wJa+dL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgGTIRY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 04:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgGTIRY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 04:17:24 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA61C0619D2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 01:17:23 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id w6so17111283ejq.6
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 01:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=46j7Dn5MEAHJtn0suMXqVFDrZeSh7nUoyIL19nPzl0Y=;
        b=c4wJa+dLCqLMzgm4hcg3Jwf9eZXoikb/medTIK/niFSbiP9s0gsH5Q91j0GdHearDQ
         HsGl4M0H2099EO627e1E51ATLA3mJvrltyfOYXmx30hq31JrThxyVZlJBer747F6O8/x
         iTvFQY9kY7266Lv3vOeY5T1ZegL/uz+d98hxFNJQUWlxLJsEjyFsH07rXwgdohP1wc6p
         tz0XAnG5ORjgfM1Le8+6sB1pUjHM1G9jcTYLGO4Ny8Yftbk4/QISejJj4XvJ6v/t5Vjm
         XWpyPu5FhnAwA28BRRxnLmSvd4xzJww50ux3rsKG+oAqSUMLbcVsmCuFpQffFvxgorW7
         7tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=46j7Dn5MEAHJtn0suMXqVFDrZeSh7nUoyIL19nPzl0Y=;
        b=kgTQlDUOo6lHeuqbkHVD9U4TpBfMW+cwDAxRw6KhZx0NZSN43dnrkKY56aPjCx+s8U
         qGHYwkuGa4WUWt2x3hAMpyMc/YwfjP2tUq4nxDkKW+aqXfKVeeNedOd7dzdT40elw0L3
         XWOYIOilVAsEJhyQ/2r9Nyjmi6SCIx1zyjq69odgd9jEQQdvKhyWShNeVpxuJAfFPam2
         CDzd6RH67niGyvAeZd0z20oGqXa6LXlJyaN7CPlDsinoVMVxIp1u90QX0M8xDPTgZ5j+
         2ijaaIejdglem2P6yZkkrlO7af6Qp1ue/+VdCGUyeJAVFjjrpmBLvsf9wFYpv0/BbKvp
         IitA==
X-Gm-Message-State: AOAM532F/2NJsJbrH+q/BbAFSVTQhpKB59OVHF2eGC8F7wwtbdVCPxgY
        jf0DXnkEMsx4t5A4qlFuwR+x5N1Fvwwfs6HNLUEEXQ==
X-Google-Smtp-Source: ABdhPJy0rAmpAf6RnG5QxTyVO73cdbc27ZV833fxW+bRehVyY0dT+TX3Jt8wfuQasSMB26lcIlHa7sPXVQDiYW3XE8Q=
X-Received: by 2002:a17:906:8688:: with SMTP id g8mr19265716ejx.505.1595233042407;
 Mon, 20 Jul 2020 01:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com> <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com> <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com> <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
 <80bf1236-aacd-1044-b0e5-5b5718b7e9f0@enneenne.com> <CAHp75Vc1ezuW9m8OCQUmEJoNVoD-Z3eWF=Lzcr2v32Br8Gr60w@mail.gmail.com>
In-Reply-To: <CAHp75Vc1ezuW9m8OCQUmEJoNVoD-Z3eWF=Lzcr2v32Br8Gr60w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 10:17:09 +0200
Message-ID: <CACRpkdY+amtrDE4gaSU5Du2CUivxo6gnUV5zZOcaJJ8=md-4Kg@mail.gmail.com>
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Rodolfo Giometti <giometti@enneenne.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Sun, Jul 19, 2020 at 8:36 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jul 16, 2020 at 6:17 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
> > On 16/07/2020 15:38, Linus Walleij wrote:
>
> > I see but this interface is not designed for such complex usage nor to compete
> > with the current character interface! It is designed to allow boards
> > manufactures to "describe" some I/O lines that are not used by any driver in the
> > device tree,
>
> Why are they not in firmware tables? Platform is a set of hardware
> that makes it so.
> If something is not in DT, then there is no possible way to know what
> is that line?
>
> Or in other words how does the OS know that the certain line is
> connected to a relay?

IIUC Rodolfo's idea is to provide this with a DT compatible.
The use case will be industrial automation-ish tasks from userspace.

Currently the only mechanism we have in the device tree to
assign a use for a line is the "gpio-line-names" property,
which creates a name that is reported upward to the character
device.

Rodolfo's patch is for scripting use cases, assigning some lines
for some cases to be handled by scripts, not the character device.

What I am a bit worried about is if this would be a Linuxism, as DT
should be OS neutral.

Yours,
Linus Walleij
