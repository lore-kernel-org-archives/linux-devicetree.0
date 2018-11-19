Return-Path: <SRS0=byPw=N6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39807 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbeKTBBf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Nov 2018 20:01:35 -0500
Received: by mail-lf1-f67.google.com with SMTP id n18so21479886lfh.6
        for <devicetree@vger.kernel.org>; Mon, 19 Nov 2018 06:37:46 -0800 (PST)
MIME-Version: 1.0
References: <20181118163909.9202-1-geert@linux-m68k.org> <CACRpkdZ58BeYQ112g90HKboesMOGtVFnVBJtnUNeuy0qsfUteg@mail.gmail.com>
 <CAMuHMdVUK-aZBy0iib2Nh87nwWwQWH9RDi6wkRX5xkh9xOc2cw@mail.gmail.com>
In-Reply-To: <CAMuHMdVUK-aZBy0iib2Nh87nwWwQWH9RDi6wkRX5xkh9xOc2cw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Nov 2018 15:37:33 +0100
Message-ID: <CACRpkdYJwObxJfv8QD6CQu_G-yOz20F_vksXnwOc0LeR8QDDKw@mail.gmail.com>
Subject: Re: [RFC] C64 DTS
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Matt Porter <mporter@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Nov 18, 2018 at 9:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> BTW, how do you describe a separate button connected to an NMI line?
> Or just omit it completely? Reset buttons are usually not described neither.

Just add it as a stand-alone button connected to the
NMI line of the interrupt controller. It's what it is after
all.

The ARM Juno board has an ordinary gpio button marked
"NMI". I think we should take that (in the input subsystem)
and configure it as a NMI (in ARM terms an "FIQ") but that
arch has a distinction where every IRQ line can be switched
between beeing IRQ or FIQ so it is quite different.

Anyways: NMI buttons is pretty common on some servers
I am told, I would look to x86 for an answer.

> The {clock,data}-out lines are driving TTL open-collector buffers.
> So combined with the {clock,data}-in lines, they're actually emulating
> open-collector GPIOs.
>
> So an IEC bus could be implemented using only 3 GPIOs, if two of
> them can be configured as GPIO_LINE_OPEN_DRAIN.
>
> Do you intend supporting the emulation of an open-collector GPIO in
> gpiolib using a pair of GPIOs, so avoid implementing that in every
> driver that may need it? ;-)

Somebody already suggested adding GPIOs on top of buffer
drivers in turn controlled by GPIO. So I think the answer is yes.
But it depends on this person implementing the code for it.
I can look up a reference if you're interested!

Yours,
Linus Walleij
