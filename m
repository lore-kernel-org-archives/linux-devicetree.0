From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [EXT] Re: [PATCH 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Date: Fri, 17 May 2019 10:58:37 +0200
Message-ID: <CAK8P3a0kKb7njiJvUkwJYwf-yc-hEyErSiWcvbdf0XnMoctzrg@mail.gmail.com>
References: <20190515072747.39941-1-xiaowei.bao@nxp.com> <20190515072747.39941-2-xiaowei.bao@nxp.com>
 <CAK8P3a3AXRp_v_7hkoJA28tUCiSh1eYzbk4Q4h29OqL6y-KL8A@mail.gmail.com> <AM5PR04MB329934765FB8EB1828743D79F50B0@AM5PR04MB3299.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM5PR04MB329934765FB8EB1828743D79F50B0@AM5PR04MB3299.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, Kishon <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, gregkh <gregkh@linuxfoundation.org>, "M.h. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Kate Stewart <kstewart@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Shawn Lin <shawn.lin@rock-chips.com>, linux-pci <linux-pci@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2019 at 5:21 AM Xiaowei Bao <xiaowei.bao@nxp.com> wrote:
> -----Original Message-----
> From: Arnd Bergmann <arnd@arndb.de>
> On Wed, May 15, 2019 at 9:36 AM Xiaowei Bao <xiaowei.bao@nxp.com> wrote:
> > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   52 ++++++++++++++++++++++++
> >  1 files changed, 52 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > index b045812..50b579b 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -398,6 +398,58 @@
> >                         status = "disabled";
> >                 };
> >
> > +               pcie@3400000 {
> > +                       compatible = "fsl,ls1028a-pcie";
> > +                       reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
> > +                              0x80 0x00000000 0x0 0x00002000>; /* configuration space */
> > +                       reg-names = "regs", "config";
> > +                       interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>, /* PME interrupt */
> > +                                    <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>; /* aer interrupt */
> > +                       interrupt-names = "pme", "aer";
> > +                       #address-cells = <3>;
> > +                       #size-cells = <2>;
> > +                       device_type = "pci";
> > +                       dma-coherent;
> > +                       num-lanes = <4>;
> > +                       bus-range = <0x0 0xff>;
> > +                       ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000   /* downstream I/O */
> > +                                 0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
>
> Are you sure there is no support for 64-bit BARs or prefetchable memory?
> [Xiaowei Bao] sorry for late reply, Thought that our Layerscape platform has not added prefetchable memory support in DTS, so this platform has not been added, I will submit a separate patch to add prefetchable memory support for all Layerscape platforms.

Ok, thanks.

> Of course, the prefetchable PCIE device can work in our boards, because the RC will
> assign non-prefetchable memory for this device. We reserve 1G no-prefetchable
> memory for PCIE device, it is enough for general devices.

Sure, many devices work just fine, this is mostly a question of supporting those
devices that do require multiple gigabytes, or that need prefetchable memory
semantics to get the expected performance. GPUs are the obvious example,
but I think there are others (infiniband?).

      Arnd
