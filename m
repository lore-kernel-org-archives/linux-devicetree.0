From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Correct UART and add all other UARTs
Date: Thu, 6 Sep 2018 16:38:07 +0200
Message-ID: <CAMuHMdVSLaaJmLEnke-iPSrgkRa4SUQyAnm_Tw9TPs3KcekFFA@mail.gmail.com>
References: <1535622742-6237-1-git-send-email-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535622742-6237-1-git-send-email-phil.edworthy@renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Phil,

On Thu, Aug 30, 2018 at 11:52 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> - UART0 was missing the bus clock ("apb_pclk").
> - Now that the relevant rzn1 bindings have been added, replace the Synopsys
>   compat string with the rzn1 strings.
> - Add all the other UARTs.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But a few notes/questions below.

> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -78,13 +78,90 @@
>                 };
>
>                 uart0: serial@40060000 {
> -                       compatible = "snps,dw-apb-uart";
> +                       compatible = "renesas,r9a06g032-uart", "renesas,rzn1-uart";

Apparently not all 8 UARTs are identical: the first 3 don't have DMA, the
last 5 do, and they have more registers.

Are you sure no different compatible values are needed to distinguish
between them?
Can you handle them purely based on the presence or absence of
"dmas" properties (which are not yet present)?

According to commit 72b0505f0830df95 ("dt: serial: Add Renesas RZ/N1
binding documentation"), the Synopsis compatible string would work if you
are not using DMA, so perhaps it should be added for the ports that cannot
do DMA?

>                         reg = <0x40060000 0x400>;
>                         interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
>                         reg-shift = <2>;
>                         reg-io-width = <4>;
> -                       clocks = <&sysctrl R9A06G032_CLK_UART0>;
> -                       clock-names = "baudclk";
> +                       clocks = <&sysctrl R9A06G032_CLK_UART0>, <&sysctrl R9A06G032_HCLK_UART0>;

It's a pity the clock names don't match the datasheet, but the output from
the internal Renesas tools. So I have to trust you to not list them
in the wrong order.

> +                       clock-names = "baudclk", "apb_pclk";
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
