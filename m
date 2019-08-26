Return-Path: <SRS0=gJgO=WW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot1-f65.google.com ([209.85.210.65]:32807 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbfHZHjM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 26 Aug 2019 03:39:12 -0400
MIME-Version: 1.0
References: <20190825140135.12150-1-jacopo+renesas@jmondi.org> <20190825140135.12150-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20190825140135.12150-2-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2019 09:39:00 +0200
Message-ID: <CAMuHMdVjhjsHEEocBjRxf71DqVBSbT6AOHJnBmL79d7HuFa=Dg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: Add LIF channel indices to
 vsps property
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sun, Aug 25, 2019 at 4:00 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> According to the Renesas R-Car DU bindings documentation, the 'vsps'
> property should be composed of a phandle to the VSP instance and the
> index of the LIF channel assigned to the DU channel. Some SoC device
> tree source files do not specify any LIF channel index, relying on the
> driver defaulting it to 0 if not specified.
>
> Align all device tree files by specifying the LIF channel index as
> prescribed by the bindings documentation.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
