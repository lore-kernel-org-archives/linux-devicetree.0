From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH] arm64: dts: remove big-endian filed from IFC controller
Date: Tue, 28 Aug 2018 13:38:23 -0500
Message-ID: <CADRPPNTCZVkjzFfn7k2As2_VXGx3gXStVcrEOhYDV-i8QiSoeA@mail.gmail.com>
References: <20180828065936.8040-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180828065936.8040-1-prabhakar.kushwaha@nxp.com>
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

On Tue, Aug 28, 2018 at 2:02 AM Prabhakar Kushwaha
<prabhakar.kushwaha@nxp.com> wrote:
>
> As per IFC binding, Absence of "little-endian" field causes registers
> access in big-endian mode.
> So no need to set explicit big-endian field IFC node for LS1043A and
> LS1046A.
>
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> index b9f5d2ff4ff2..68af84a8ade8 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> @@ -3,6 +3,7 @@
>   * Device Tree Include file for Freescale Layerscape-1043A family SoC.
>   *
>   * Copyright 2014-2015 Freescale Semiconductor, Inc.
> + * Copyright 2018 NXP
>   *
>   * Mingkai Hu <Mingkai.hu@freescale.com>
>   */
> @@ -280,7 +281,6 @@
>                 ifc: ifc@1530000 {
>                         compatible = "fsl,ifc", "simple-bus";
>                         reg = <0x0 0x1530000 0x0 0x10000>;
> -                       big-endian;
>                         interrupts = <0 43 0x4>;
>                 };
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 65ce1c3cb568..9f5acb4dfaf3 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -4,6 +4,8 @@
>   *
>   * Copyright 2016 Freescale Semiconductor, Inc.
>   *
> + * Copyright 2018 NXP
> + *

Probably better to align with the other files to not have empty line
between copyright claims?

>   * Mingkai Hu <mingkai.hu@nxp.com>
>   */
>
> @@ -198,7 +200,6 @@
>                 ifc: ifc@1530000 {
>                         compatible = "fsl,ifc", "simple-bus";
>                         reg = <0x0 0x1530000 0x0 0x10000>;
> -                       big-endian;
>                         interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> --
> 2.14.1
>
