Return-Path: <SRS0=HAag=NQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:40611 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbeKEV1h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Nov 2018 16:27:37 -0500
MIME-Version: 1.0
References: <1541418561-21977-1-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1541418561-21977-1-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 13:07:58 +0100
Message-ID: <CAMuHMdUXVnQtJKCmzBx1Rk0OzZQ4McPqDLtRk2XNb3qaCs8mTA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Fix VIN endpoint numbering
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Jacopo,

Thanks for your patch!

On Mon, Nov 5, 2018 at 12:49 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> The VIN driver bindings dictates fixed numbering for VIN endpoints connected
> to CSI-2 endpoints, even when a single endpoint exists.
>
> Without proper endpoint numbering the VIN driver fails to probe.
>
> Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Was this patch authored by you or by Matsuoka-san?

> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
