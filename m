From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH] of_pci_irq: Silence bogus "of_irq_parse_pci() failed ..." messages.
Date: Fri,  4 Sep 2015 12:12:06 -0700
Message-ID: <1441393926-23225-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
Cc: David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

It is perfectly legitimate for a PCI device to have an
PCI_INTERRUPT_PIN value of zero.  This happens if the device doesn't
use interrupts, or on PCIe devices, where only MSI/MSI-X are
supported.

Silence the annoying "of_irq_parse_pci() failed with rc=-19" error
messages by making them conditional on !-ENODEV (which can only be
produced in the PCI_INTERRUPT_PIN == 0 case).

Signed-off-by: David Daney <david.daney@cavium.com>
---
 drivers/of/of_pci_irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_pci_irq.c b/drivers/of/of_pci_irq.c
index 1710d9d..33d242a 100644
--- a/drivers/of/of_pci_irq.c
+++ b/drivers/of/of_pci_irq.c
@@ -106,7 +106,9 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 
 	ret = of_irq_parse_pci(dev, &oirq);
 	if (ret) {
-		dev_err(&dev->dev, "of_irq_parse_pci() failed with rc=%d\n", ret);
+		if (ret != -ENODEV)
+			dev_err(&dev->dev,
+				"of_irq_parse_pci() failed with rc=%d\n", ret);
 		return 0; /* Proper return code 0 == NO_IRQ */
 	}
 
-- 
1.7.11.7
