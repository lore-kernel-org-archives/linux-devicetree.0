From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 1/2] arm64: dts: ls1028a: Fix GPIO work fail.
Date: Wed, 31 Jul 2019 18:17:09 -0500
Message-ID: <CADRPPNT3A_1apr3FNjRbQhCHWLqvAQC0Oz8cGbOjNetAF8zghw@mail.gmail.com>
References: <20190718094902.15562-1-hui.song_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718094902.15562-1-hui.song_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hui Song <hui.song_1@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 4:59 AM Hui Song <hui.song_1@nxp.com> wrote:
>

Change the title to be something like:
arm64: dts: ls1028a: fix gpio nodes

> From: Song Hui <hui.song_1@nxp.com>
>
> Add ls1028a device specify compatible.

Please submit a separate patch to update the device tree binding too.

> Make gpio as little-endian deal.

"Update the nodes to include little-endian property to be consistent
with the hardware."

>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 7975519..488602b 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -277,33 +277,36 @@
>                 };
>
>                 gpio1: gpio@2300000 {
> -                       compatible = "fsl,qoriq-gpio";
> +                       compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
>                         reg = <0x0 0x2300000 0x0 0x10000>;
>                         interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> +                       little-endian;
>                 };
>
>                 gpio2: gpio@2310000 {
> -                       compatible = "fsl,qoriq-gpio";
> +                       compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
>                         reg = <0x0 0x2310000 0x0 0x10000>;
>                         interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> +                       little-endian;
>                 };
>
>                 gpio3: gpio@2320000 {
> -                       compatible = "fsl,qoriq-gpio";
> +                       compatible = "fsl,ls1028a-gpio","fsl,qoriq-gpio";
>                         reg = <0x0 0x2320000 0x0 0x10000>;
>                         interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> +                       little-endian;
>                 };
>
>                 usb0: usb@3100000 {
> --
> 2.9.5
>
