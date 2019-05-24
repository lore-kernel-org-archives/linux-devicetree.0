From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH] arm64: dts: ls1028a: Add temperature sensor node
Date: Fri, 24 May 2019 17:31:57 -0500
Message-ID: <CADRPPNRYwq0NABXobC1jQrT3QMxxm+e6zvoNwoZ-fu6NU9qDMA@mail.gmail.com>
References: <20190524012151.31840-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524012151.31840-1-andy.tang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuantian Tang <andy.tang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 8:30 PM Yuantian Tang <andy.tang@nxp.com> wrote:
>
> Add nxp sa56004 chip node for temperature monitor.
>
> Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 5 +++++
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts | 5 +++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> index b359068d9605..31fd626dd344 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> @@ -131,6 +131,11 @@
>                                 compatible = "atmel,24c512";
>                                 reg = <0x57>;
>                         };
> +
> +                       temp@4c {

The recommended name for temperature senor in dts spec is temperature-sensor.

> +                               compatible = "nxp,sa56004";

The binding says the following property is required.  If it is not the
case, probably we should update the binding.
- vcc-supply: vcc regulator for the supply voltage.

> +                               reg = <0x4c>;
> +                       };
>                 };
>
>                 i2c@5 {
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> index f9c272fb0738..012b3f8696b7 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
> @@ -119,6 +119,11 @@
>                                 compatible = "nxp,pcf2129";
>                                 reg = <0x51>;
>                         };
> +
> +                       temp@4c {
> +                               compatible = "nxp,sa56004";
> +                               reg = <0x4c>;
> +                       };
>                 };
>         };
>  };
> --
> 2.17.1
>
