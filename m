From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 3/3] arm64: dts: ls1088a: Revise gpio registers to little-endian
Date: Wed, 31 Jul 2019 18:19:30 -0500
Message-ID: <CADRPPNQhRjEx=0Rr-XkHXtLTaWGM_b5zsjrL7vhhzzmQc35j9A@mail.gmail.com>
References: <20190529083254.39581-1-chuanhua.han@nxp.com> <20190529083254.39581-3-chuanhua.han@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529083254.39581-3-chuanhua.han@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhua Han <chuanhua.han@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 29, 2019 at 3:32 AM Chuanhua Han <chuanhua.han@nxp.com> wrote:
>
> Since fsl-ls1088a Soc GPIO registers are used as little endian,
> the patch adds the little-endian attribute to each gpio node.
>
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 661137ffa319..3e6d20d065bd 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -272,6 +272,7 @@
>                         compatible = "fsl,qoriq-gpio";
>                         reg = <0x0 0x2300000 0x0 0x10000>;
>                         interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
> +                       little-endian;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
> @@ -282,6 +283,7 @@
>                         compatible = "fsl,qoriq-gpio";
>                         reg = <0x0 0x2310000 0x0 0x10000>;
>                         interrupts = <0 36 IRQ_TYPE_LEVEL_HIGH>;
> +                       little-endian;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
> @@ -292,6 +294,7 @@
>                         compatible = "fsl,qoriq-gpio";
>                         reg = <0x0 0x2320000 0x0 0x10000>;
>                         interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
> +                       little-endian;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
> @@ -302,6 +305,7 @@
>                         compatible = "fsl,qoriq-gpio";
>                         reg = <0x0 0x2330000 0x0 0x10000>;
>                         interrupts = <0 37 IRQ_TYPE_LEVEL_HIGH>;
> +                       little-endian;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
> --
> 2.17.1
>
