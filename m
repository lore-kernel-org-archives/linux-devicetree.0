From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] ARM: dts: rskrza1: add sdhi1 DT support
Date: Fri, 23 Sep 2016 09:09:07 +0200
Message-ID: <CAMuHMdWckFaU__BM=WAOvJ+fVjEvNdLCFy0GNiKwU159aZTdhg@mail.gmail.com>
References: <20160922213211.7988-1-chris.brandt@renesas.com> <20160922213211.7988-4-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160922213211.7988-4-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 22, 2016 at 11:32 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  arch/arm/boot/dts/r7s72100-rskrza1.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> index e5dea5b..548b51f 100644
> --- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
> +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> @@ -56,6 +56,10 @@
>         };
>  };
>
> +&sdhi1 {
> +       status = "okay";

On all other boards, we have the bus-width property in the board-specific
.dts instead of in the SoC-specific .dtsi.

> +};
> +
>  &scif2 {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
