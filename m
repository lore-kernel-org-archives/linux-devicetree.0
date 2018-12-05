From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2 22/25] dt-bindings: pci: Add NXP Layerscape SoCs PCIe
 Gen4 controller
Date: Wed, 5 Dec 2018 16:40:49 -0600
Message-ID: <CAL_JsqLmV65rt46FiMy1Tvox+5LQa=vkFxQwzQUx1toBq-JzfA@mail.gmail.com>
References: <20181120092615.11680-1-Zhiqiang.Hou@nxp.com> <20181120092615.11680-23-Zhiqiang.Hou@nxp.com>
 <20181205223843.GA2125@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205223843.GA2125@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.Q. Hou" <zhiqiang.hou@nxp.com>
Cc: linux-pci@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>, Shawn Guo <shawnguo@kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, Minghuan Lian <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 4:38 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Nov 20, 2018 at 09:27:51AM +0000, Z.q. Hou wrote:
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >
> > Add PCIe Gen4 controller DT bindings of NXP Layerscape SoCs.
> >
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > ---
> > V2:
> >  - Change to use the layerscape-pci.txt for PCIe Gen4 controller
> >    dt-bindings
>
> Sorry someone suggested this, but it seems there's no point in having
> these in the same file. New IP block, do a new file.
>
> >
> >  .../bindings/pci/layerscape-pci.txt           | 57 +++++++++++++++++++
> >  MAINTAINERS                                   |  8 +++
> >  2 files changed, 65 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> > index 66df1e81e0b8..3ef8836b6e97 100644
> > --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> > +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> > @@ -1,4 +1,6 @@
> > +====================================
> >  Freescale Layerscape PCIe controller
> > +====================================
> >
> >  This PCIe host controller is based on the Synopsys DesignWare PCIe IP
> >  and thus inherits all the common properties defined in designware-pcie.txt.
> > @@ -58,3 +60,58 @@ Example:
> >                               <0000 0 0 3 &gic GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
> >                               <0000 0 0 4 &gic GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> >       };
> > +
> > +===================================
> > +NXP Layerscape PCIe Gen4 controller
> > +===================================
> > +
> > +This PCIe controller is based on the Mobiveil PCIe IP and thus inherits all
> > +the common properties defined in mobiveil-pcie.txt.
> > +
> > +Required properties:
> > +- compatible: should contain the platform identifier such as:
> > +  "fsl,lx2160a-pcie"
> > +- reg: base addresses and lengths of the PCIe controller register blocks.
> > +  "config_axi_slave": PCIe controller registers
> > +  "csr_axi_slave": Bridge config registers
>
> Wouldn't 'config' and 'csr' be sufficient? And these should be listed
> under reg-names.

NM on the names. I see these are inherited.

Rob
