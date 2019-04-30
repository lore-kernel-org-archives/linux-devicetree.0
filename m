Return-Path: <SRS0=NzLh=TA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34596 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfD3NA7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Apr 2019 09:00:59 -0400
MIME-Version: 1.0
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp> <1554969262-15028-2-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-2-git-send-email-cv-dong@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Apr 2019 15:00:46 +0200
Message-ID: <CAMuHMdU8rHVBVuuQW5GqXr5qOK7Ln9Hz-6Y9B+8RPwbU9eojyQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] ARM: dts: r8a77470: Add HSCIF support
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>, =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>, Hoan Nguyen An <na-hoan@jinso.co.jp>
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 11, 2019 at 9:54 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> Add hscif{0|1|2} nodes to dtsi for HSCIF support on the RZ/G1C (r8a77470) SoC.
>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
