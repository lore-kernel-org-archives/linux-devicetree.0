From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 03/19] soc: renesas: Identify R-Car M3-N
Date: Tue, 20 Feb 2018 16:40:34 +0100
Message-ID: <CAMuHMdVw4OSPP7XYLGuE7SfVjOk_6VK847NdsVwszBX9XshQ3A@mail.gmail.com>
References: <1519139541-18783-1-git-send-email-jacopo+renesas@jmondi.org>
 <1519139541-18783-4-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519139541-18783-4-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Tue, Feb 20, 2018 at 4:12 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add support for indentifying R-Car M3-N (R8A77965) SoC.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -149,6 +149,11 @@ static const struct renesas_soc soc_rcar_v3m __initconst __maybe_unused = {
>         .id     = 0x54,
>  };
>
> +static const struct renesas_soc soc_rcar_m3_n __initconst __maybe_unused = {
> +       .family = &fam_rcar_gen3,
> +       .id     = 0x55,
> +};

Note that the list was sorted by SoC part number.

> +
>  static const struct renesas_soc soc_rcar_v3h __initconst __maybe_unused = {
>         .family = &fam_rcar_gen3,
>         .id     = 0x56,
> @@ -214,6 +219,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
>  #ifdef CONFIG_ARCH_R8A7796
>         { .compatible = "renesas,r8a7796",      .data = &soc_rcar_m3_w },
>  #endif
> +#ifdef CONFIG_ARCH_R8A77965
> +       { .compatible = "renesas,r8a77965",     .data = &soc_rcar_m3_n },
> +#endif
>  #ifdef CONFIG_ARCH_R8A77970
>         { .compatible = "renesas,r8a77970",     .data = &soc_rcar_v3m },
>  #endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
