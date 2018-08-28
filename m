From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 1/2][RESEND] ARM: dts: Add big-endian in nor node for
 ls1021a
Date: Tue, 28 Aug 2018 15:46:03 -0500
Message-ID: <CADRPPNTV4_dUHq0MWY5M2Ga4q0NRmDM2vFCpLAKTYg9i4Q_TBA@mail.gmail.com>
References: <20180828065936.8040-1-prabhakar.kushwaha@nxp.com>
 <20180828065936.8040-2-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180828065936.8040-2-prabhakar.kushwaha@nxp.com>
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

On Tue, Aug 28, 2018 at 2:00 AM Prabhakar Kushwaha
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
>  arch/arm/boot/dts/ls1021a-qds.dts | 2 ++
>  arch/arm/boot/dts/ls1021a-twr.dts | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
> index 499f41a2c6f0..923a25760516 100644
> --- a/arch/arm/boot/dts/ls1021a-qds.dts
> +++ b/arch/arm/boot/dts/ls1021a-qds.dts
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018 NXP
>   *
>   * This file is dual-licensed: you can use it either under the terms
>   * of the GPL or the X11 license, at your option. Note that this dual
> @@ -235,6 +236,7 @@
>                 #size-cells = <1>;
>                 compatible = "cfi-flash";
>                 reg = <0x0 0x0 0x8000000>;
> +               big-endian;
>                 bank-width = <2>;
>                 device-width = <1>;
>         };
> diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
> index f0c949d74833..8b48c3c7cd21 100644
> --- a/arch/arm/boot/dts/ls1021a-twr.dts
> +++ b/arch/arm/boot/dts/ls1021a-twr.dts
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018 NXP
>   *
>   * This file is dual-licensed: you can use it either under the terms
>   * of the GPL or the X11 license, at your option. Note that this dual
> @@ -203,6 +204,7 @@
>                 #size-cells = <1>;
>                 compatible = "cfi-flash";
>                 reg = <0x0 0x0 0x8000000>;
> +               big-endian;
>                 bank-width = <2>;
>                 device-width = <1>;
>         };
> --
> 2.14.1
>
