From: Rob Herring <robherring2@gmail.com>
Subject: Re: pci and pcie device-tree binding - range No cells
Date: Mon, 10 Dec 2012 08:26:37 -0600
Message-ID: <50C5F11D.9060006@gmail.com>
References: <50C5D387.90908@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <50C5D387.90908@monstr.eu>
Sender: linux-pci-owner@vger.kernel.org
To: monstr@monstr.eu
Cc: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, linux-pci@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On 12/10/2012 06:20 AM, Michal Simek wrote:
> Hi Grant and others,
> 
> I have a question regarding number of cells in ranges property
> for pci and pcie nodes.
> 
> Linux pci/pcie powerpc DTSes contain 7 cells (xpedite5370.dts,
> sequoia.dts, etc)
> but also 6 cells format too (mpc832x_mds.dts)
> 
> Here is shown 6 cells ranges format and describe
> http://devicetree.org/Device_Tree_Usage#PCI_Host_Bridge
> 
> And also in documentation in the linux
> Documentation/devicetree/bindings/pci/83xx-512x-pci.txt
> 
> Both format uses:
> #size-cells = <2>;
> #address-cells = <3>;
> 
> What is valid format?

Both. 7 cells are valid when the host (parent) bus is 64-bit and 6 cells
are valid when the host bus is 32-bit. The ranges property is <<child
address> <parent address> <size>>. The parent address #address-cells is
taken from the parent node.

Rob
