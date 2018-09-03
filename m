Return-Path: <SRS0=6DmN=LR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41550 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbeICWEi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Sep 2018 18:04:38 -0400
MIME-Version: 1.0
References: <20180903173000.6877-1-geert+renesas@glider.be>
In-Reply-To: <20180903173000.6877-1-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Sep 2018 19:43:14 +0200
Message-ID: <CAMuHMdW1gv+EYVVbdj1BJHCqvaRe=xAjzeQZ4rg8s7oH4kU5Kw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add all MSIOF nodes
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, uli+renesas@fpond.eu, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 3, 2018 at 7:30 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add the device nodes for all MSIOF SPI controllers, incl. clocks, power
> domains, and resets properties.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

FTR, this was tested on the Ebisu development board using MSIOF0 on CN41,
with:
  - spidev and a SmartScope in logic analyzer mode,
  - 2x74HCT595 shift registers providing GPIOs for a HD44780 character LCD.

All using DT overlays from
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
