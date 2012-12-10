From: Michal Simek <monstr@monstr.eu>
Subject: pci and pcie device-tree binding - range No cells
Date: Mon, 10 Dec 2012 13:20:23 +0100
Message-ID: <50C5D387.90908@monstr.eu>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, linux-pci@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

Hi Grant and others,

I have a question regarding number of cells in ranges property
for pci and pcie nodes.

Linux pci/pcie powerpc DTSes contain 7 cells (xpedite5370.dts, sequoia.dts, etc)
but also 6 cells format too (mpc832x_mds.dts)

Here is shown 6 cells ranges format and describe
http://devicetree.org/Device_Tree_Usage#PCI_Host_Bridge

And also in documentation in the linux
Documentation/devicetree/bindings/pci/83xx-512x-pci.txt

Both format uses:
#size-cells = <2>;
#address-cells = <3>;

What is valid format?

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
