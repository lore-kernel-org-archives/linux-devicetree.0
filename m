Return-Path: <SRS0=Gvwe=WR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41548 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfHUIIn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2019 04:08:43 -0400
MIME-Version: 1.0
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-21-git-send-email-cv-dong@jinso.co.jp> <20190429180555.GA25843@bogus>
In-Reply-To: <20190429180555.GA25843@bogus>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Aug 2019 10:08:31 +0200
Message-ID: <CAMuHMdXFEh6fdiUermaBauQFxHNiv2KKKaC+2uQYytxShGoC5w@mail.gmail.com>
Subject: Re: [PATCH v2 20/20] dt-bindings: can: rcar_can: Document r8a77470 bindings
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Biju Das <biju.das@bp.renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>, =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>, Hoan Nguyen An <na-hoan@jinso.co.jp>, =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= <cv-dong@jinso.co.jp>
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 29, 2019 at 8:05 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, 11 Apr 2019 16:54:22 +0900, Cao Van Dong wrote:
> > Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.
> >
> > Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> > ---
> >  Documentation/devicetree/bindings/net/can/rcar_can.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
