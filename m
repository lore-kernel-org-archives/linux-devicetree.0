From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH 0/2] irqchip/gicv3-its: Handle "msi-map" properties.
Date: Thu, 17 Sep 2015 11:00:57 -0700
Message-ID: <1442512859-31633-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

The first patch from Mark Rutland adds the OF device tree binding
description, which explains what we are attempting to do here.  For
MSI messages on GICv3 systems there is some side-band data that
accompanies the message, this data is specified in the OF device tree
"msi-map" property of the PCI host driver.

The second patch parses the required information out of the device tree.

David Daney (1):
  irqchip/gicv3-its:  Handle OF device tree "msi-map" properties.

Mark Rutland (1):
  Docs: dt: Add PCI MSI map bindings

 Documentation/devicetree/bindings/pci/pci-msi.txt | 220 ++++++++++++++++++++++
 drivers/irqchip/irq-gic-v3-its-pci-msi.c          |  73 +++++++
 2 files changed, 293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/pci-msi.txt

-- 
1.9.1
