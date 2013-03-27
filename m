From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCHv1 0/5] Use the mvebu PCIe driver on Kirkwood
Date: Wed, 27 Mar 2013 18:07:50 +0000
Message-ID: <201303271807.51023.arnd@arndb.de>
References: <1364407504-13524-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1364407504-13524-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Maen Suleiman <maen@marvell.com>, Thierry Reding <thierry.reding@avionic-design.de>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Olof Johansson <olof@lixom.net>, Tawfik Bayouk <tawfik@marvell.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mitch Bradley <wmb@firmworks.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 27 March 2013, Thomas Petazzoni wrote:
> Here is a set of five patches that demonstrate that the mvebu PCIe
> driver can be used on Kirkwood with no modification at all. Those
> patches are not meant to be applied yet, the Device Trees are not
> completely correct yet (they don't take into account the fact that
> 6281 has one PCIe interface and 6282 has two PCIe interface).
> 
> It took less than two hours to enable PCIe on Kirkwood (and in those
> two hours, the conversion of the DB-88F6281 board to the Device Tree
> has been done as well), and the result works fine:
> 
> # /usr/sbin/lspci
> 00:01.0 PCI bridge: Marvell Technology Group Ltd. Device 7846
> 00:02.0 PCI bridge: Marvell Technology Group Ltd. Device 7846
> 01:00.0 SCSI storage controller: Marvell Technology Group Ltd. 88SX7042 PCI-e 4-port SATA-II (rev 02)
> 02:00.0 Ethernet controller: Intel Corporation 82572EI Gigabit Ethernet Controller (Copper) (rev 06)
> 
> # cat /proc/cpuinfo | grep ^Hardware
> Hardware        : Marvell Kirkwood (Flattened Device Tree)

Very nice!

> I've tested both the e1000e NIC card and the SATA 4 ports card and
> they work fine.

I assume it works with PIO, but does the SATA card use the I/O
space registers, or just memory space?

	Arnd
