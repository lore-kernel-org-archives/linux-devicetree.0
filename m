Return-Path: <SRS0=rCaq=WY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36512 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfH1Ha3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 28 Aug 2019 03:30:29 -0400
MIME-Version: 1.0
References: <1566974375-32482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1566974375-32482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2019 09:30:17 +0200
Message-ID: <CAMuHMdVHtJTmuW0z+LRRFGL4O2bjiNv6odyGTmLi-EqxN1PP8g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: dmaengine: dma-common: Revise the
 dma-channel-mask property
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vinod <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda-san,

I would s/Revise/Fix/ in the subject.

On Wed, Aug 28, 2019 at 8:41 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The commit b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas
> for the generic DMA bindings") changed the property from
> dma-channel-mask to dma-channel-masks. So, this patch revises it.
>
> Fixes: b37e3534ac42 ("dt-bindings: dmaengine: Add YAML schemas for the generic DMA bindings")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
