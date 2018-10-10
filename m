Return-Path: <SRS0=Of4m=MW=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20181008162349.42957-1-chris.brandt@renesas.com> <20181008162349.42957-3-chris.brandt@renesas.com>
In-Reply-To: <20181008162349.42957-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 10:40:47 +0200
Message-ID: <CAMuHMdWNe2Z=q1tHO5_YLX1Q6+ef5BiQU=feBdcJfzcNvzo8HQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk <linux-clk@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Mon, Oct 8, 2018 at 6:24 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The SDHI/MMC controller in the RZ/A2 is almost the same as R-Car gen3, but
> with some minor differences.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -34,7 +34,7 @@
>  #define DTRAN_MODE_CH_NUM_CH0  0       /* "downstream" = for write commands */
>  #define DTRAN_MODE_CH_NUM_CH1  BIT(16) /* "upstream" = for read commands */
>  #define DTRAN_MODE_BUS_WIDTH   (BIT(5) | BIT(4))
> -#define DTRAN_MODE_ADDR_MODE   BIT(0)  /* 1 = Increment address */
> +#define DTRAN_MODE_ADDR_MODE   BIT(0)  /* 1 = Increment address, 0 = Fixed */
>
>  /* DM_CM_DTRAN_CTRL */
>  #define DTRAN_CTRL_DM_START    BIT(0)
> @@ -73,6 +73,9 @@ static unsigned long global_flags;
>  #define SDHI_INTERNAL_DMAC_ONE_RX_ONLY 0
>  #define SDHI_INTERNAL_DMAC_RX_IN_USE   1
>
> +/* RZ/A2 does not have this bit (not safe to set it) */

This comment confused me, as SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED is
set for RZ/A2.

s/this bit/the ADDR_MODE bit/?

> +#define SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED 2
> +
>  /* Definitions for sampling clocks */
>  static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>         {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
