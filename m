Return-Path: <SRS0=2g+B=O2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41713 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387807AbeLQQUE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Dec 2018 11:20:04 -0500
MIME-Version: 1.0
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com> <1544780260-27590-16-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1544780260-27590-16-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Dec 2018 17:19:50 +0100
Message-ID: <CAMuHMdUiptasxBTqg14cM4WzWXRQPWZ5zAV62OdBXZJoHog-jg@mail.gmail.com>
Subject: Re: [PATCH 15/17] arm64: dts: renesas: r8a774c0: Connect RZ/G2E
 Audio-DMAC to IPMMU
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Dec 14, 2018 at 10:38 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Hook up the RZ/G2E Audio-DMAC device to IPMMU-MP as stated by the
> RZ/G2 User's manual.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
