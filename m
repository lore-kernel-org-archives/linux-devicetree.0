Return-Path: <SRS0=pVrr=HB=verge.net.au=horms@kernel.org>
Date: Thu, 12 Apr 2018 09:55:07 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/4] soc: renesas: rcar-sysc: Add support for R-Car E3
 power areas
Message-ID: <20180412075506.frylywvges5c6nzx@verge.net.au>
References: <1523439386-1032-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523439386-1032-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVP5U2W3Zmpfe689UYBdNfS6nK7jFW5oQcJQ_QakW1UfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVP5U2W3Zmpfe689UYBdNfS6nK7jFW5oQcJQ_QakW1UfQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 11, 2018 at 05:10:02PM +0200, Geert Uytterhoeven wrote:
> Hi Shimoda-san,
> 
> On Wed, Apr 11, 2018 at 11:36 AM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds Cortex-A53 CPU{0,1}, Cortex-A53 SCU, Cortex-R7, A3VC,
> > A2VC1 and 3DG-{A,B} power domain areas for the R8A77990 SoC.
> 
> Thanks for your patch!
> 
> > NOTE:
> > - The 3DG power domain resume order of R-Car E3 is [3DG-B] -> [3DG-A],
> 
> So 3DG-B is the parent of 3DG-A?
> I have to take your word on this, as I cannot find this in the documentation.
> 
> >   which is different from R-Car H3, M3 and M3N SoCs.
> 
> M3-W and M3-N?

Shimoda-san, could you confirm the above?

> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [shimoda: add SPDX-License-Identifier]
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
