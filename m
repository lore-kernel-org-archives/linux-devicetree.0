From: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
Subject: Re: [PATCHv6 5/6] arm64: dts: lx2160a: Add PCIe controller DT nodes
Date: Mon, 3 Jun 2019 10:42:33 +0530
Message-ID: <CAKnKUHH8JU2Bqgq90rfgZ8r0xxB_RMRj16DBBLDhMpg3mwFU2Q@mail.gmail.com>
References: <20190528065129.8769-1-Zhiqiang.Hou@nxp.com>
 <20190528065129.8769-6-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190528065129.8769-6-Zhiqiang.Hou@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "arnd@arndb.de" <arnd@arndb.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Hou Zhiqiang
   Two instances [@3600000 and @3800000] of the six has a different
window count, the RC can not have more than 8 windows.
apio-wins = <256>;  //Can we change it to 8
ppio-wins = <24>;    //Can we change it to 8

On Tue, May 28, 2019 at 12:20 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> The LX2160A integrated 6 PCIe Gen4 controllers.
>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
> V6:
>  - No change.
>
>  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index 125a8cc2c5b3..7a2b91ff1fbc 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -964,5 +964,168 @@
>                                 };
>                         };
>                 };
> +
> +               pcie@3400000 {
> +                       compatible = "fsl,lx2160a-pcie";
> +                       reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
> +                              0x80 0x00000000 0x0 0x00001000>; /* configuration space */
> +                       reg-names = "csr_axi_slave", "config_axi_slave";
> +                       interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
> +                                    <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> +                                    <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
> +                       interrupt-names = "aer", "pme", "intr";
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       dma-coherent;
> +                       apio-wins = <8>;
> +                       ppio-wins = <8>;
> +                       bus-range = <0x0 0xff>;
> +                       ranges = <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
> +                       msi-parent = <&its>;
> +                       #interrupt-cells = <1>;
> +                       interrupt-map-mask = <0 0 0 7>;
> +                       interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 2 &gic 0 0 GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 3 &gic 0 0 GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 4 &gic 0 0 GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };
> +
> +               pcie@3500000 {
> +                       compatible = "fsl,lx2160a-pcie";
> +                       reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
> +                              0x88 0x00000000 0x0 0x00001000>; /* configuration space */
> +                       reg-names = "csr_axi_slave", "config_axi_slave";
> +                       interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
> +                                    <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> +                                    <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
> +                       interrupt-names = "aer", "pme", "intr";
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       dma-coherent;
> +                       apio-wins = <8>;
> +                       ppio-wins = <8>;
> +                       bus-range = <0x0 0xff>;
> +                       ranges = <0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
> +                       msi-parent = <&its>;
> +                       #interrupt-cells = <1>;
> +                       interrupt-map-mask = <0 0 0 7>;
> +                       interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 2 &gic 0 0 GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 3 &gic 0 0 GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 4 &gic 0 0 GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };
> +
> +               pcie@3600000 {
> +                       compatible = "fsl,lx2160a-pcie";
> +                       reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
> +                              0x90 0x00000000 0x0 0x00001000>; /* configuration space */
> +                       reg-names = "csr_axi_slave", "config_axi_slave";
> +                       interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
> +                                    <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> +                                    <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
> +                       interrupt-names = "aer", "pme", "intr";
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       dma-coherent;
> +                       apio-wins = <256>;
> +                       ppio-wins = <24>;
> +                       bus-range = <0x0 0xff>;
> +                       ranges = <0x82000000 0x0 0x40000000 0x90 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
> +                       msi-parent = <&its>;
> +                       #interrupt-cells = <1>;
> +                       interrupt-map-mask = <0 0 0 7>;
> +                       interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 2 &gic 0 0 GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 3 &gic 0 0 GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 4 &gic 0 0 GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };
> +
> +               pcie@3700000 {
> +                       compatible = "fsl,lx2160a-pcie";
> +                       reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
> +                              0x98 0x00000000 0x0 0x00001000>; /* configuration space */
> +                       reg-names = "csr_axi_slave", "config_axi_slave";
> +                       interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
> +                                    <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> +                                    <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
> +                       interrupt-names = "aer", "pme", "intr";
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       dma-coherent;
> +                       apio-wins = <8>;
> +                       ppio-wins = <8>;
> +                       bus-range = <0x0 0xff>;
> +                       ranges = <0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
> +                       msi-parent = <&its>;
> +                       #interrupt-cells = <1>;
> +                       interrupt-map-mask = <0 0 0 7>;
> +                       interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 2 &gic 0 0 GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 3 &gic 0 0 GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 4 &gic 0 0 GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };
> +
> +               pcie@3800000 {
> +                       compatible = "fsl,lx2160a-pcie";
> +                       reg = <0x00 0x03800000 0x0 0x00100000   /* controller registers */
> +                              0xa0 0x00000000 0x0 0x00001000>; /* configuration space */
> +                       reg-names = "csr_axi_slave", "config_axi_slave";
> +                       interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
> +                                    <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> +                                    <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
> +                       interrupt-names = "aer", "pme", "intr";
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       dma-coherent;
> +                       apio-wins = <256>;
> +                       ppio-wins = <24>;
> +                       bus-range = <0x0 0xff>;
> +                       ranges = <0x82000000 0x0 0x40000000 0xa0 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
> +                       msi-parent = <&its>;
> +                       #interrupt-cells = <1>;
> +                       interrupt-map-mask = <0 0 0 7>;
> +                       interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 2 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 3 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 4 &gic 0 0 GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };
> +
> +               pcie@3900000 {
> +                       compatible = "fsl,lx2160a-pcie";
> +                       reg = <0x00 0x03900000 0x0 0x00100000   /* controller registers */
> +                              0xa8 0x00000000 0x0 0x00001000>; /* configuration space */
> +                       reg-names = "csr_axi_slave", "config_axi_slave";
> +                       interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* AER interrupt */
> +                                    <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> +                                    <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
> +                       interrupt-names = "aer", "pme", "intr";
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       device_type = "pci";
> +                       dma-coherent;
> +                       apio-wins = <8>;
> +                       ppio-wins = <8>;
> +                       bus-range = <0x0 0xff>;
> +                       ranges = <0x82000000 0x0 0x40000000 0xa8 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
> +                       msi-parent = <&its>;
> +                       #interrupt-cells = <1>;
> +                       interrupt-map-mask = <0 0 0 7>;
> +                       interrupt-map = <0000 0 0 1 &gic 0 0 GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 2 &gic 0 0 GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 3 &gic 0 0 GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <0000 0 0 4 &gic 0 0 GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };
> +
>         };
>  };
> --
> 2.17.1
>


-- 
Thanks,
Regards,
Karthikeyan Mitran

-- 
Mobiveil INC., CONFIDENTIALITY NOTICE: This e-mail message, including any 
attachments, is for the sole use of the intended recipient(s) and may 
contain proprietary confidential or privileged information or otherwise be 
protected by law. Any unauthorized review, use, disclosure or distribution 
is prohibited. If you are not the intended recipient, please notify the 
sender and destroy all copies and the original message.
