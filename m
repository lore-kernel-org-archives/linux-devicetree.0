From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 1/3] irqdomain: Allow domain lookup with DOMAIN_BUS_WIRED token
Date: Tue, 26 Jan 2016 13:52:25 +0000
Message-ID: <1453816347-32720-2-git-send-email-marc.zyngier@arm.com>
References: <1453816347-32720-1-git-send-email-marc.zyngier@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453816347-32720-1-git-send-email-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jiang Liu <jiang.liu@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Let's take the (outlandish) example of an interrupt controller
capable of handling both wired interrupts and PCI MSIs.

With the current code, the PCI MSI domain is going to be tagged
with DOMAIN_BUS_PCI_MSI, and the wired domain with DOMAIN_BUS_ANY.

Things get hairy when we start looking up the domain for a wired
interrupt (typically when creating it based on some firmware
information - DT or ACPI).

In irq_create_fwspec_mapping(), we perform the lookup using
DOMAIN_BUS_ANY, which is actually used as a wildcard. This gives
us one chance out of two to end up with the wrong domain, and
we try to configure a wired interrupt with the MSI domain.
Everything grinds to a halt pretty quickly.

What we really need to do is to start looking for a domain that
would uniquely identify a wired interrupt domain, and only use
DOMAIN_BUS_ANY as a fallback.

In order to solve this, let's introduce a new DOMAIN_BUS_WIRED
token, which is going to be used exactly as described above.
Of course, this depends on the irqchip to setup the domain
bus_token, and nobody had to implement this so far.

Only so far.

Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 include/linux/irqdomain.h |  1 +
 kernel/irq/irqdomain.c    | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index d5e5c5b..b236d82 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -70,6 +70,7 @@ struct irq_fwspec {
  */
 enum irq_domain_bus_token {
 	DOMAIN_BUS_ANY		= 0,
+	DOMAIN_BUS_WIRED,
 	DOMAIN_BUS_PCI_MSI,
 	DOMAIN_BUS_PLATFORM_MSI,
 	DOMAIN_BUS_NEXUS,
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 22aa961..def2664 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -573,10 +573,15 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 	unsigned int type = IRQ_TYPE_NONE;
 	int virq;
 
-	if (fwspec->fwnode)
-		domain = irq_find_matching_fwnode(fwspec->fwnode, DOMAIN_BUS_ANY);
-	else
+	if (fwspec->fwnode) {
+		domain = irq_find_matching_fwnode(fwspec->fwnode,
+						  DOMAIN_BUS_WIRED);
+		if (!domain)
+			domain = irq_find_matching_fwnode(fwspec->fwnode,
+							  DOMAIN_BUS_ANY);
+	} else {
 		domain = irq_default_domain;
+	}
 
 	if (!domain) {
 		pr_warn("no irq domain found for %s !\n",
-- 
2.1.4
