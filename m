From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH v5 1/7] pci: Introduce pci_register_io_range() helper function.
Date: Tue,  4 Mar 2014 15:49:58 +0000
Message-ID: <1393948204-11555-2-git-send-email-Liviu.Dudau@arm.com>
References: <1393948204-11555-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1393948204-11555-1-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Some architectures do not share x86 simple view of the I/O space and
instead use a range of addresses that map to external devices. For PCI,
these ranges can be expressed by OF bindings in a device tree file.

Introduce a pci_register_io_range() helper function that can be used
by the architecture code to keep track of the io ranges described by the
PCI bindings.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 1a54f1f..d1bb30f 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -619,6 +619,11 @@ const __be32 *of_get_address(struct device_node *dev, int index, u64 *size,
 }
 EXPORT_SYMBOL(of_get_address);
 
+int __weak pci_register_io_range(phys_addr_t addr, resource_size_t size)
+{
+	return 0;
+}
+
 unsigned long __weak pci_address_to_pio(phys_addr_t address)
 {
 	if (address > IO_SPACE_LIMIT)
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 5f6ed6b..40c418d 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -56,6 +56,7 @@ extern void __iomem *of_iomap(struct device_node *device, int index);
 extern const __be32 *of_get_address(struct device_node *dev, int index,
 			   u64 *size, unsigned int *flags);
 
+extern int pci_register_io_range(phys_addr_t addr, resource_size_t size);
 extern unsigned long pci_address_to_pio(phys_addr_t addr);
 
 extern int of_pci_range_parser_init(struct of_pci_range_parser *parser,
-- 
1.9.0
