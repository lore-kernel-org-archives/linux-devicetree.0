From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 2/2][RESEND] arm64: dts: Add big-endian in nor node for
 ls104xa
Date: Tue, 28 Aug 2018 15:44:54 -0500
Message-ID: <CADRPPNRhYxrmUrG5Ni3H9_KKLUOkr=VXzjF7QQmaNb9sT4Btkw@mail.gmail.com>
References: <20180828065936.8040-1-prabhakar.kushwaha@nxp.com>
 <20180828065936.8040-3-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180828065936.8040-3-prabhakar.kushwaha@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 28, 2018 at 2:03 AM Prabhakar Kushwaha
<prabhakar.kushwaha@nxp.com> wrote:
>
> NOR and IFC controller connectivity is big-endian.
> So add big-endian field in nor device tree node allowing
> IFC controller to read/write data from/to the flash correctly.
>
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
> Based on 147395ea40b36b "dt-bindings: mtd-physmap: Add endianness supports"
> RESEND keeping Li Yang <leoyang.li@nxp.com>
>
>  arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts | 2 ++
>  arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 2 ++
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> index c7b8d2c009cd..dff3d648172e 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
> @@ -3,6 +3,7 @@
>   * Device Tree Include file for Freescale Layerscape-1043A family SoC.
>   *
>   * Copyright 2014-2015 Freescale Semiconductor, Inc.
> + * Copyright 2018 NXP
>   *
>   * Mingkai Hu <Mingkai.hu@freescale.com>
>   */
> @@ -50,6 +51,7 @@
>         nor@0,0 {
>                 compatible = "cfi-flash";
>                 reg = <0x0 0x0 0x8000000>;
> +               big-endian;
>                 bank-width = <2>;
>                 device-width = <1>;
>         };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> index 7b01ba8d3b7e..17ca357e854f 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
> @@ -3,6 +3,7 @@
>   * Device Tree Include file for Freescale Layerscape-1043A family SoC.
>   *
>   * Copyright 2014-2015 Freescale Semiconductor, Inc.
> + * Copyright 2018 NXP
>   *
>   * Mingkai Hu <Mingkai.hu@freescale.com>
>   */
> @@ -65,6 +66,7 @@
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>                         reg = <0x0 0x0 0x8000000>;
> +                       big-endian;
>                         bank-width = <2>;
>                         device-width = <1>;
>                 };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> index e69306e6b0b1..e58a8ca1386c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> @@ -3,6 +3,7 @@
>   * Device Tree Include file for Freescale Layerscape-1046A family SoC.
>   *
>   * Copyright 2016 Freescale Semiconductor, Inc.
> + * Copyright 2018 NXP
>   *
>   * Shaohui Xie <Shaohui.Xie@nxp.com>
>   */
> @@ -141,6 +142,7 @@
>         nor@0,0 {
>                 compatible = "cfi-flash";
>                 reg = <0x0 0x0 0x8000000>;
> +               big-endian;
>                 bank-width = <2>;
>                 device-width = <1>;
>         };
> --
> 2.14.1
>
