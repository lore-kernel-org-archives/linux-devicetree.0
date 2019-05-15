From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Date: Wed, 15 May 2019 10:05:19 +0200
Message-ID: <CAK8P3a3AXRp_v_7hkoJA28tUCiSh1eYzbk4Q4h29OqL6y-KL8A@mail.gmail.com>
References: <20190515072747.39941-1-xiaowei.bao@nxp.com> <20190515072747.39941-2-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190515072747.39941-2-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, Kishon <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, gregkh <gregkh@linuxfoundation.org>, "M.h. Lian" <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Shawn Lin <shawn.lin@rock-chips.com>, linux-pci <linux-pci@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 15, 2019 at 9:36 AM Xiaowei Bao <xiaowei.bao@nxp.com> wrote:
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   52 ++++++++++++++++++++++++
>  1 files changed, 52 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index b045812..50b579b 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -398,6 +398,58 @@
>                         status = "disabled";
>                 };
>
> +               pcie@3400000 {
> +                       compatible = "fsl,ls1028a-pcie";
> +                       reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
> +                              0x80 0x00000000 0x0 0x00002000>; /* configuration space */
> +                       reg-names = "regs", "config";
> +                       interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> +                                    <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>; /* aer interrupt */
> +                       interrupt-names = "pme", "aer";
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       dma-coherent;
> +                       num-lanes = <4>;
> +                       bus-range = <0x0 0xff>;
> +                       ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000   /* downstream I/O */
> +                                 0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */

Are you sure there is no support for 64-bit BARs or prefetchable memory?

Is this a hardware bug, or something that can be fixed in firmware?

       Arnd
