Return-Path: <SRS0=qqZh=OJ=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1543319795-48325-6-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVrPimL2yRNfb7xm6vM6Rm-LPr2hwY0mHfMTr_3O+KjmA@mail.gmail.com> <OSBPR01MB2103A7E014E262348194B586B8D30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2103A7E014E262348194B586B8D30@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Nov 2018 12:05:54 +0100
Message-ID: <CAMuHMdVYnjNVZv4WXu-+oJpGAWMigf_ZmP+ijskUcjdh42+vYg@mail.gmail.com>
Subject: Re: [PATCH 05/22] ARM: dts: r8a7744-iwg20m: Add eMMC support
Content-Type: text/plain; charset="UTF-8"
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju,

On Fri, Nov 30, 2018 at 11:43 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 05/22] ARM: dts: r8a7744-iwg20m: Add eMMC support
> >
> > On Tue, Nov 27, 2018 at 1:05 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > > Add eMMC support for iWave RZ/G1N Qseven System On Module.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I assume the PCB is the same for RZ/G1M and RZ/G1N, so perhaps this can
> > be factored out in a common .dtsi file, like we did for Salvator-X(S)?
>
> SoM is different between RZ/G1M and RZ/G1N in terms of memory and PCie/SATA.
>
> The only common part in SoM is eMMC,SDHI0 and QSPI flash. So it doesn't make sense to factored it out.
>
> What do you think?

OK, then it's fine for me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
