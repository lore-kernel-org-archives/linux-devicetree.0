From: "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>
Subject: [PATCH] of/irq: improve error message on irq discovery process failure
Date: Wed,  9 Nov 2016 12:05:08 -0200
Message-ID: <1478700308-25481-1-git-send-email-gpiccoli@linux.vnet.ibm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, frowand.list@gmail.com, robh+dt@kernel.org, gpiccoli@linux.vnet.ibm.com
List-Id: devicetree@vger.kernel.org

On PowerPC machines some PCI slots might not have Level-triggered
interrupts capability (also know as Level Signaled Interrupts - LSI),
leading of_irq_parse_pci() to complain by presenting error messages
on the kernel log - in this case, the properties "interrupt-map" and
"interrupt-map-mask" are not present on the device's node on device
tree.

This patch introduces a different message for this specific case,
and it also reduces the level of the message from error to warning.
Before this patch, when an adapter was plugged in a slot without Level
interrupts capabilities, we saw generic error messages like this:

    [54.239] pci 002d:70:00.0: of_irq_parse_pci() failed with rc=-22

Now, with this applied, we see the following specific message:

    [19.947] pci 0014:60:00.0: of_irq_parse_pci() gave up. The slot of this
    device has no Level-triggered Interrupts capability.

No functional changes were introduced.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@linux.vnet.ibm.com>
---
 drivers/of/irq.c        | 5 ++++-
 drivers/of/of_pci_irq.c | 8 +++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 393fea8..1ad6882 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -275,7 +275,10 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
 	of_node_put(ipar);
 	of_node_put(newpar);
 
-	return -EINVAL;
+	/* Positive non-zero return means no Level-triggered Interrupts
+	 * capability was found.
+	 */
+	return ENOENT;
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_raw);
 
diff --git a/drivers/of/of_pci_irq.c b/drivers/of/of_pci_irq.c
index 2306313..9b6f387 100644
--- a/drivers/of/of_pci_irq.c
+++ b/drivers/of/of_pci_irq.c
@@ -89,8 +89,14 @@ int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *out_irq
 	laddr[0] = cpu_to_be32((pdev->bus->number << 16) | (pdev->devfn << 8));
 	laddr[1] = laddr[2] = cpu_to_be32(0);
 	rc = of_irq_parse_raw(laddr, out_irq);
-	if (rc)
+
+	if (rc < 0) {
 		goto err;
+	} else if (rc > 0) {
+		dev_warn(&pdev->dev,
+			"of_irq_parse_pci() gave up. The slot of this device has no Level-triggered Interrupts capability.\n");
+		return -rc;
+	}
 	return 0;
 err:
 	dev_err(&pdev->dev, "of_irq_parse_pci() failed with rc=%d\n", rc);
-- 
2.1.0
