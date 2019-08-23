From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv2 0/4] Layerscape: Remove num-lanes property from PCIe
 nodes
Date: Fri, 23 Aug 2019 11:35:36 +0100
Message-ID: <20190823103529.GA6956@e121166-lin.cambridge.arm.com>
References: <20190820073022.24217-1-Zhiqiang.Hou@nxp.com>
 <20190822164815.GA12855@e121166-lin.cambridge.arm.com>
 <20190823094424.GB14582@e119886-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190823094424.GB14582@e119886-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Murray <andrew.murray@arm.com>
Cc: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 23, 2019 at 10:44:25AM +0100, Andrew Murray wrote:
> On Thu, Aug 22, 2019 at 05:48:15PM +0100, Lorenzo Pieralisi wrote:
> > On Tue, Aug 20, 2019 at 07:28:37AM +0000, Z.q. Hou wrote:
> > > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > > 
> > > On FSL Layerscape SoCs, the number of lanes assigned to PCIe
> > > controller is not fixed, it is determined by the selected
> > > SerDes protocol. The current num-lanes indicates the max lanes
> > > PCIe controller can support up to, instead of the lanes assigned
> > > to the PCIe controller. This can result in PCIe link training fail
> > > after hot-reset.
> > > 
> > > Hou Zhiqiang (4):
> > >   dt-bindings: PCI: designware: Remove the num-lanes from Required
> > >     properties
> > >   PCI: dwc: Return directly when num-lanes is not found
> > >   ARM: dts: ls1021a: Remove num-lanes property from PCIe nodes
> > >   arm64: dts: fsl: Remove num-lanes property from PCIe nodes
> > > 
> > >  Documentation/devicetree/bindings/pci/designware-pcie.txt | 1 -
> > >  arch/arm/boot/dts/ls1021a.dtsi                            | 2 --
> > >  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi            | 1 -
> > >  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi            | 3 ---
> > >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi            | 6 ------
> > >  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi            | 3 ---
> > >  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi            | 4 ----
> > >  drivers/pci/controller/dwc/pcie-designware.c              | 6 ++++--
> > >  8 files changed, 4 insertions(+), 22 deletions(-)
> > 
> > What a mess.
> > 
> > I am going to apply these but first if anyone can explain to
> > me what commit 907fce090253 was _supposed_ to to I would
> > be grateful, I read it multiple times but I still have not
> > understood it. This series does the right thing but why things
> 
> The DWC controller drivers all implement a .host_init callback -
> some of the drivers choose to call dw_pcie_setup_rc from their
> callback which, amongst other things will set up/train the link.
> 
> As far as I can tell, dw_pcie_setup_rc is the only user of pp->lanes.
> Therefore for hardware where the link is already set up by firmware
> and thus dw_pcie_setup_rc is never called - it is unnecessary to
> read the DT value for pp->lanes. So the first hunk in 907fce090253
> gets rid of the error and makes the num-lanes property optional.
> 
> However this opens up the possibility of a DT misconfiguration for
> other controllers that do call dw_pcie_setup_rc, i.e. they set
> num-lanes to 0 when it is required. Therefore the second hunk
> ensures that an error is emitted when num-lanes was needed but not
> provided.

Yes, the problem is not 907fce090253, it is subsequent changes
(ie feb85d9b1c47 AFAICS).

> > are they way they are in the mainline honestly I have no
> > idea, this does not make any sense in the slightest:
> > 
> > ret = of_property_read_u32(np, "num-lanes", &lanes);
> > if (ret)
> > 	lanes = 0;
> 
> Please note that the code below is in a different function to the
> code above.

In the mainline kernel they are in the same function
ie dw_pcie_setup() and as reported here current code
does not make any sense.

Anyway merging these patches, thanks for having a look.

Lorenzo

> > /* Set the number of lanes */
> > val = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
> > val &= ~PORT_LINK_MODE_MASK;
> > switch (lanes) {
> > case 1:
> > 	val |= PORT_LINK_MODE_1_LANES;
> > 	break;
> > case 2:
> > 	val |= PORT_LINK_MODE_2_LANES;
> > 	break;
> > case 4:
> > 	val |= PORT_LINK_MODE_4_LANES;
> > 	break;
> > case 8:
> > 	val |= PORT_LINK_MODE_8_LANES;
> > 	break;
> > default:
> > 	dev_err(pci->dev, "num-lanes %u: invalid value\n", lanes);
> > 	return;
> > }
> > 
> > why do we need to set lanes to 0 if num-lanes is not present ? To print
> > an error message ?
> 
> At this point in time, the controller is trying to train the link but
> it doesn't know how many lanes, so we need to error. We don't error when
> reading the device tree earlier - because at that point in time we don't
> know if num-lanes is optional or not.
> 
> Thanks,
> 
> Andrew Murray
> 
> > 
> > I really do not understand this code.
> > 
> > Lorenzo
