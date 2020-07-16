Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9558BC433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 13:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 746D2207E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 13:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lt/vkTuB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgGPNiw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 09:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728093AbgGPNiv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 09:38:51 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7788C08C5C0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 06:38:50 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j21so3290223lfe.6
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DisuJGOhTsqZLSRTciJy2DTkS0uWS+KfhdVsbvwNxkE=;
        b=lt/vkTuBb1vzcvotKi8msv7LGAcjJiMecx/VQsrwFlPVSU++Dt4BH5vYmROr/xqrnG
         bChm8JUkTuhcZQtrlBY+nk/oIpQhDfxhqsoVBsDShV+IpsMx/7z/0xXZeaAWQSJrlHno
         1mHZjBT+6rQaG0xMrgWtzRM9xL7y4DfatspuoxLSaqOV3G+50U+9XVM+a3CYNXXmkOHJ
         +17AdgVIshQGs/pPvRLAgimJ1z1QRKAWbkVa90zvU3nwkuYmdC5u5SlorDArWq6W2DLW
         9tg8jdqxMsDzAuFsQDrgHkNaMq93G30Nod8tNd6mfhaGh74ddN9+mEptDKq58KNj5LxR
         q1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DisuJGOhTsqZLSRTciJy2DTkS0uWS+KfhdVsbvwNxkE=;
        b=tjQFwsBGAMm5qTiEMm2cKJUqM961Fc02d7dL2D41ivllHoOcLPEG0ViJfuBbo6HUE8
         7Y9AqYfvkvRp055J86p+iqNFm/+iJT9pJKcLqH0UB+9jfBtz00/d6kStpNIvgQx1ilWK
         qaqAXcPelez+SQ0DmhISUhm3hHb7VSUDF9k/CUSdiuYKkXQMu5m3T36vi80p4NUKC/Jb
         DxfAc3U71jG/IOBtFb0YJrNNTDDuhLq6C1Hi0dizUmEY+UAwcHfCcEeV/uaJztQOK1Hg
         Z2RzwEk8cEIZBv++3UxIkT2F5GfiLqHgLn7QFHG8B3FqAdbQyAL4OpT2uDiUTAks5QhY
         Qbhw==
X-Gm-Message-State: AOAM531J7+V61yZt37+nSlqb8Qen+QrLa2tZC1MPCQ5hl+eum1pgyzhL
        +l6zuSuzQU8knIZKt6xst0vIeoWYeRcnV5GKIF2KtA==
X-Google-Smtp-Source: ABdhPJx1ef0CZ/3q2wngXBad0JwjLf4fGb8uc5oFMLSEFTqnUhW8aBck8YeJovmK7bjTdr3XajgcAFBpOPdaVGn6bxs=
X-Received: by 2002:a19:70d:: with SMTP id 13mr2060201lfh.194.1594906729036;
 Thu, 16 Jul 2020 06:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com> <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com> <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com> <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com> <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com>
In-Reply-To: <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 15:38:38 +0200
Message-ID: <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
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

On Tue, Jul 14, 2020 at 4:01 PM Rodolfo Giometti <giometti@enneenne.com> wrote:

> I see... however attached is a new version of my proposal patch

I looked a bit at this!

IIUC the idea is a "new" sysfs interface that does not require the exporting
etc used by the current "old" sysfs interface. Instead of poking around in
sysfs to export lines we do that from the device tree.

It also does not use any global GPIO numbers which would be my other
main concern.

I must admit that it has some elegance to it. Especially when it comes
to scripting.

The problem I see is that lines are left in whatever state they were in
if a script crashes, so there is no "return to the initial value" that was
there when the GPIOs were picked from the device tree. This makes
this a bit fragile.

Also users regularly need to listen to events. This interface can and
should never support that, for this one must use the character device,
which will of course not work in parallel with using this sysfs ABI.
And the day someone wants that we simply have to say no. There
is no way to hold states for event handling in a stateless ABI.

Well of course they can poll for a line to change, but that is not
proper event handling that reacts to an interrupt.

So while this is much more elegant the old sysfs ABI, and certainly
better for scripting, it still suffers from some conflicts with
the character device, and there is a risk to make users dissatisfied
when they want to e.g. script event handlers.

What are your thoughts on this?

Yours,
Linus Walleij
