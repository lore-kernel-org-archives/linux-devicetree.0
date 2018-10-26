From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v2 3/4] dts/arm/ls1021a: Clean PCIe controller compatible strings
Date: Fri, 26 Oct 2018 15:58:29 -0500
Message-ID: <CADRPPNQRofR6Upe6_pTNm-bqt0HMVWBOXyYSH8xGvD2g7_nwCA@mail.gmail.com>
References: <20181025094929.29481-1-Zhiqiang.Hou@nxp.com> <20181025094929.29481-4-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025094929.29481-4-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhiqiang Hou <zhiqiang.hou@nxp.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, Minghuan Lian <minghuan.lian@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 4:52 AM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:

The correct prefix for arm dts patches should be: "ARM: dts: ls1021a:
...", and it should be better to mention the string removed in the
title too.

>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> Removed the wrong compatible string "snps,dw-pcie", in case
> match incorrect driver.
>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V2:
>  - no change
>
>  arch/arm/boot/dts/ls1021a.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index bdd6e66a79ad..1aaa3288a450 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -716,7 +716,7 @@
>                 };
>
>                 pcie@3400000 {
> -                       compatible = "fsl,ls1021a-pcie", "snps,dw-pcie";
> +                       compatible = "fsl,ls1021a-pcie";
>                         reg = <0x00 0x03400000 0x0 0x00010000   /* controller registers */
>                                0x40 0x00000000 0x0 0x00002000>; /* configuration space */
>                         reg-names = "regs", "config";
> @@ -739,7 +739,7 @@
>                 };
>
>                 pcie@3500000 {
> -                       compatible = "fsl,ls1021a-pcie", "snps,dw-pcie";
> +                       compatible = "fsl,ls1021a-pcie";
>                         reg = <0x00 0x03500000 0x0 0x00010000   /* controller registers */
>                                0x48 0x00000000 0x0 0x00002000>; /* configuration space */
>                         reg-names = "regs", "config";
> --
> 2.17.1
>
