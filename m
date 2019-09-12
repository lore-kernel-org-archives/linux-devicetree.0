From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Fix PWM3
Date: Thu, 12 Sep 2019 14:14:26 +0200
Message-ID: <CAMuHMdXg1PDMBEd3S_pdk3KMG00Dq+xV6pCm_y6sXVR4aX1Wig@mail.gmail.com>
References: <20190912103143.985-1-kieran.bingham+renesas@ideasonboard.com> <db2f85e5-3ada-9deb-b62d-9f50d4176b5a@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <db2f85e5-3ada-9deb-b62d-9f50d4176b5a@ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 12:47 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 12/09/2019 11:31, Kieran Bingham wrote:
> > The pwm3 was incorrectly added with a compatible reference to the
> > renesas,pwm-r8a7790 (H2) due to a single characther ommision.
>
> Ugh, my apologies :
>
>  s/characther/character/
>  s/ommision/omission/
>
> Please fix up when applying if there's no need to send a v2.
>
> --
> Kieran
>
>
> >
> > Fix the compatible string.
> >
> > Fixes: de625477c632 ("arm64: dts: renesas: r8a779{7|8}0: add PWM support")
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5, with the above fixed.

BTW, looks like PWM on R-Car Gen2 needs more love...

> > --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > @@ -652,7 +652,7 @@
> >               };
> >
> >               pwm3: pwm@e6e33000 {
> > -                     compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
> > +                     compatible = "renesas,pwm-r8a77970", "renesas,pwm-rcar";
> >                       reg = <0 0xe6e33000 0 8>;
> >                       #pwm-cells = <2>;
> >                       clocks = <&cpg CPG_MOD 523>;
> >

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
