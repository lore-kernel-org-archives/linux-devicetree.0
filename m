From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] PCI: Xilinx-NWL-PCIe: Added support for Xilinx NWL
 PCIe Host Controller
Date: Sat, 03 Oct 2015 00:36:53 +0200
Message-ID: <5225360.GkBHX0QnIA@wuerfel>
References: <1443689961-23909-1-git-send-email-bharatku@xilinx.com>
 <2677327.lnRZhqx5GI@wuerfel> <560DD374.4000708@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <560DD374.4000708@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Ray Jui <rjui@broadcom.com>, galak@codeaurora.org, linux-pci@vger.kernel.org, michal.simek@xilinx.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, Bharat Kumar Gogada <bharatku@xilinx.com>, Minghuan.Lian@freescale.com, m-karicheri2@ti.com, Ravi Kiran Gummaluri <rgummal@xilinx.com>, tinamdar@apm.com, hauke@hauke-m.de, bhelgaas@google.com, treding@nvidia.com, soren.brinkmann@xilinx.com
List-Id: devicetree@vger.kernel.org

On Thursday 01 October 2015 17:44:36 Ray Jui wrote:
> 
> Sorry for stealing this discussion, :)
> 
> I have some questions here, since this affects how I should implement
> the MSI support for iProc based PCIe controller. I understand it makes
> more sense to use separate device node for MSI and have "msi-parent"
> from the pci node points to the MSI node, and that MSI node can be
> gicv2m or gicv3 based on more advanced ARMv8 platforms.
> 
> Then I would assume the MSI controller would deserve its own driver?
> Which is a lot of people do nowadays. In that case, how I should handle
> the case when the iProc MSI support is handled through some event queue
> mechanism with their registers embedded in the PCIe controller register
> space?
> 
> Does the following logic make sense to you?
> 
> 1. parse phandle of "msi-parent"
> 2. Call of_pci_find_msi_chip_by_node to hook it up to msi chip already
> registered (in the gicv2m and gicv3 case)
> 3. If failed, fall back to use the iProc's own event queue logic by
> calling iproc_pcie_msi_init.
> 
> The iProc MSI still has its own node that looks like this:
> 141 msi0: msi@20020000 {
> 142                         msi-controller;
> 143                         interrupt-parent = <&gic>;
> 144                         interrupts = <GIC_SPI 277 IRQ_TYPE_NONE>,
> 145                                      <GIC_SPI 278 IRQ_TYPE_NONE>,
> 146                                      <GIC_SPI 279 IRQ_TYPE_NONE>,
> 147                                      <GIC_SPI 280 IRQ_TYPE_NONE>,
> 148                                      <GIC_SPI 281 IRQ_TYPE_NONE>,
> 149                                      <GIC_SPI 282 IRQ_TYPE_NONE>;
> 150                         brcm,num-eq-region = <1>;
> 151                         brcm,num-msi-msg-region = <1>;
> 152                 };
> 
> But it does not have its own "reg" since they are embedded in the PCI
> controller's registers and it relies on one calling iproc_pcie_msi_init
> to pass in base register value and some other information.

I don't think I have a perfect answer to this. One way would be to
separate the actual PCI root device node from the IP block that
contains both the PCI root and the MSI catcher, but I guess that
would require an incompatible change to your binding and it's not
worth the pain.

It's probably also ok to make the PCI host node itself be the msi-controller
node and have an msi-parent phandle that points to the node itself. Not
sure if that violates any rules that we may want or need to follow though.

Having a device node without registers is also a bit problematic,
especially the 'msi@20020000' name doesn't make sense if 0x20020000
is not the first number in the reg property. Maybe it's best to 
put that node directly under the PCI host controller and not assign
any registers. This is still a bit ugly because we'd expect devices
under the host bridge to be PCI devices rather than random other things,
but it may be the least of the evils.

	Arnd
