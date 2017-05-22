From: Code Kipper <codekipper@gmail.com>
Subject: Re: [linux-sunxi] [PATCH 4/6] ARM: sun8i: a83t: Add device node for
 DMA controller
Date: Mon, 22 May 2017 09:18:49 +0200
Message-ID: <CAEKpxB=daPuD0YNToTiEzcD0VAUjVen0nTDY0BhkLfQzcLFoTw@mail.gmail.com>
References: <20170522062552.19026-1-wens@csie.org> <20170522062552.19026-5-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170522062552.19026-5-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On 22 May 2017 at 08:25, Chen-Yu Tsai <wens@csie.org> wrote:
> The A83T SoC has a DMA controller that supports 8 DMA channels
> to and from various peripherals.
>
> Add a device node for it.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index e12dd7170b8f..47196feda26b 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -163,6 +163,15 @@
>                 #size-cells = <1>;
>                 ranges;
>
> +               dma: dma-controller@1c02000 {
> +                       compatible = "allwinner,sun8i-a83t-dma";
> +                       reg = <0x01c02000 0x1000>;
> +                       interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&ccu 21>;
> +                       resets = <&ccu 7>;
Hi Wens,
these should be ccu defines, otherwise everything else looks great.
Great Work,
CK
> +                       #dma-cells = <1>;
> +               };
> +
>                 ccu: clock@1c20000 {
>                         compatible = "allwinner,sun8i-a83t-ccu";
>                         reg = <0x01c20000 0x400>;
> --
> 2.11.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
