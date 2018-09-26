Return-Path: <SRS0=Rhmc=MI=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1537956082-17542-1-git-send-email-chris.paterson2@renesas.com>
In-Reply-To: <1537956082-17542-1-git-send-email-chris.paterson2@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Sep 2018 13:41:14 +0200
Message-ID: <CAMuHMdXQSwp_rVPADG8BWPj8BJCPZXLF7hkt6wgDPjUf4QM6mg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: iwg20d-q7-dbcm-ca: Improve model string
Content-Type: text/plain; charset="UTF-8"
To: Chris Paterson <chris.paterson2@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Sep 26, 2018 at 12:01 PM Chris Paterson
<chris.paterson2@renesas.com> wrote:
> Update the model string for this platform configuration and fix the
> grammar at the same time.
>
> This brings the syntax in line with the RZ/G1E iWave board.
>
> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
> Perhaps this patch isn't really needed, but the current string annoys me.
>
> Patch applies cleanly to renesas-devel-20180925-v4.19-rc5.
> ---
>  arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> index 0d006aea99da1b40..6811ddc4af6460ce 100644
> --- a/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> +++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts
> @@ -11,7 +11,7 @@
>  #include "iwg20d-q7-dbcm-ca.dtsi"
>
>  / {
> -       model = "iW-RainboW-G20D-Q7 RZ/G1M based plus camera daughter board";
> +       model = "iWave RainboW-G20D-Q7 RZ/G1M based board with camera add-on";
>         compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743";
>  };

Perhaps you want to harmonize the other differences, too?
  - "iWave" vs. "iWave Systems",
  - "Q7" vs. "Qseven",
  - "iW-Rainbow" vs. "Rainbow".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
