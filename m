From: Jim Quinlan <jim2101024@gmail.com>
Subject: PCI: brcmstb: Add Broadcom Settopbox PCIe support
Date: Wed, 11 Oct 2017 18:34:20 -0400
Message-ID: <1507761269-7017-1-git-send-email-jim2101024@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gregory Fong <gregory.0xf0@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Brian Norris <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch series adds support for the Broadcom Settopbox PCIe host
controller.  It is targeted to Broadcom Settopbox chips running on ARM,
ARM64, and MIPS platforms.  As the HW of the controller is intimately
tied to the memory subsystem, there are some patches required that are
not typical of a PCIe host controller driver.

pci-brcmstb.c -- is the core functionality of the RC driver.
pci-brcmstb-msi.c -- provides the driver for the PCIe's built-in
	MSI controller.
pci-brcmstb-dma.c -- provides the non-standard mapping between
	system memory and the PCIe address space.
drivers/soc/bcm/brcmstb/memory.c -- provides a single call to inform
	the PCIe controller about the size of populated memory in
	the memory controllers.
