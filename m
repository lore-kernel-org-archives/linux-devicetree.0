Return-Path: <SRS0=YxPl=R4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:37937 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729727AbfCYK4D (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Mar 2019 06:56:03 -0400
MIME-Version: 1.0
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <20190320194410.14870-2-geert+renesas@glider.be> <20190322102324.yxnrwnkyhxrzqdg4@verge.net.au>
In-Reply-To: <20190322102324.yxnrwnkyhxrzqdg4@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Mar 2019 11:55:50 +0100
Message-ID: <CAMuHMdWngVfAUZoF7nsZUbZdZYj1zoCNPQoS_eoVh46UzM7OUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: rskrza1: Add I2C support
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Fri, Mar 22, 2019 at 11:23 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Mar 20, 2019 at 08:44:09PM +0100, Geert Uytterhoeven wrote:
> > Enable the I2C bus, and add the following devices:
> >   - Two CAT9554 port expanders (8 GPIOs, interrupt not wired by
> >     default),
> >   - R1EX24016ASAS0A EEPROM.
> >
> > The bus also contains a MAX9856 Audio Codec, which is not yet supported.
> >
> > All devices (incl. the audio codec) are documented to support an I2C bus
> > running at 400 kHz.
> >
> > Pinctrl is based on the RZ/A BSP.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Pending acceptance of the DT binding patches documenting the
> > "onnn,cat9554" and "renesas,r1ex24016" compatible values.
>
> Thanks.
>
> I'm marking this series as deferred pending acceptance of the bindings.
> Please repost or ping me once that has happened.

next-20190325 has:

    d333bad1f6f3e0df dt-bindings: at24: add Renesas R1EX24016
    5c9f8cfe3cb67dcb dt-bindings: gpio: pca953x: Document onnn,cat9554

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
