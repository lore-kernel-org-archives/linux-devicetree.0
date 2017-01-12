From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix sdhi clock define
Date: Thu, 12 Jan 2017 20:57:50 +0100
Message-ID: <CAMuHMdUz6nb-STMQK39hDqwHRt4R5t+Lndj150Lkg7prN=HQZQ@mail.gmail.com>
References: <20170112181149.29035-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170112181149.29035-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Thu, Jan 12, 2017 at 7:11 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Now that all the clocks in the boot loader are disabled before booting
> the kernel, and the mstp driver has been fixed for RZ/A1, here is a typo
> that was missed during original testing.
>
> Fixes: 7c8522b7047c ("ARM: dts: r7s72100: add sdhi clock to device tree")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  include/dt-bindings/clock/r7s72100-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
> index 29e01ed..318ab14 100644
> --- a/include/dt-bindings/clock/r7s72100-clock.h
> +++ b/include/dt-bindings/clock/r7s72100-clock.h
> @@ -46,6 +46,6 @@
>
>  /* MSTP12 */
>  #define R7S72100_CLK_SDHI0     3
> -#define R7S72100_CLK_SDHI1     2
> +#define R7S72100_CLK_SDHI1     1

This is strange. There are two SDHI channels, but the STBCR12 documentation
(all versions up to rev. 3.00) says the register has MSTP bits for four SD
host interfaces?

Can you please enlighten me? Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
