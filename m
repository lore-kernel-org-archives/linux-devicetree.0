Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:46682 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbeK3UNx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Nov 2018 15:13:53 -0500
MIME-Version: 1.0
References: <1543423111-19745-1-git-send-email-biju.das@bp.renesas.com> <1543423111-19745-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543423111-19745-4-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 10:05:02 +0100
Message-ID: <CAMuHMdWiAziak-EGwLY5-5AqAFxszdUHOXjPJZEh-3LRpRLEFA@mail.gmail.com>
Subject: Re: [PATCH 3/5] ARM: dts: r8a7744: Add IPMMU DT nodes
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 28, 2018 at 5:47 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add the six IPMMU instances found in the r8a7744 to DT with a disabled
> status.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
