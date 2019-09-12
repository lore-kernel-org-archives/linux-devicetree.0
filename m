From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH v6 4/7] PCI: Add quirk to disable MSI-X support for Amazon's Annapurna Labs Root Port
Date: Thu, 12 Sep 2019 16:00:42 +0300
Message-ID: <20190912130042.14597-5-jonnyc@amazon.com>
References: <20190912130042.14597-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912130042.14597-1-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: andrew.murray@arm.com, dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

The Root Port (identified by [1c36:0031]) doesn't support MSI-X. On some
platforms it is configured to not advertise the capability at all, while
on others it (mistakenly) does. This causes a panic during
initialization by the pcieport driver, since it tries to configure the
MSI-X capability. Specifically, when trying to access the MSI-X table
a "non-existing addr" exception occurs.

Example stacktrace snippet:

  SError Interrupt on CPU2, code 0xbf000000 -- SError
  CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc1-Jonny-14847-ge76f1d4a1828-dirty #33
  Hardware name: Annapurna Labs Alpine V3 EVP (DT)
  pstate: 80000005 (Nzcv daif -PAN -UAO)
  pc : __pci_enable_msix_range+0x4e4/0x608
  lr : __pci_enable_msix_range+0x498/0x608
  sp : ffffff80117db700
  x29: ffffff80117db700 x28: 0000000000000001
  x27: 0000000000000001 x26: 0000000000000000
  x25: ffffffd3e9d8c0b0 x24: 0000000000000000
  x23: 0000000000000000 x22: 0000000000000000
  x21: 0000000000000001 x20: 0000000000000000
  x19: ffffffd3e9d8c000 x18: ffffffffffffffff
  x17: 0000000000000000 x16: 0000000000000000
  x15: ffffff80116496c8 x14: ffffffd3e9844503
  x13: ffffffd3e9844502 x12: 0000000000000038
  x11: ffffffffffffff00 x10: 0000000000000040
  x9 : ffffff801165e270 x8 : ffffff801165e268
  x7 : 0000000000000002 x6 : 00000000000000b2
  x5 : ffffffd3e9d8c2c0 x4 : 0000000000000000
  x3 : 0000000000000000 x2 : 0000000000000000
  x1 : 0000000000000000 x0 : ffffffd3e9844680
  Kernel panic - not syncing: Asynchronous SError Interrupt
  CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc1-Jonny-14847-ge76f1d4a1828-dirty #33
  Hardware name: Annapurna Labs Alpine V3 EVP (DT)
  Call trace:
   dump_backtrace+0x0/0x140
   show_stack+0x14/0x20
   dump_stack+0xa8/0xcc
   panic+0x140/0x334
   nmi_panic+0x6c/0x70
   arm64_serror_panic+0x74/0x88
   __pte_error+0x0/0x28
   el1_error+0x84/0xf8
   __pci_enable_msix_range+0x4e4/0x608
   pci_alloc_irq_vectors_affinity+0xdc/0x150
   pcie_port_device_register+0x2b8/0x4e0
   pcie_portdrv_probe+0x34/0xf0

Notice that this quirk also disables MSI (which may work, but hasn't
been tested nor has a current use case), since currently there is no
standard way to disable only MSI-X.

Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
Reviewed-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Reviewed-by: Andrew Murray <andrew.murray@arm.com>
---
 drivers/pci/quirks.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 2e983f2a0ee9..c1077e806291 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2977,6 +2977,24 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATTANSIC, 0x10a1,
 			quirk_msi_intx_disable_qca_bug);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATTANSIC, 0xe091,
 			quirk_msi_intx_disable_qca_bug);
+
+/*
+ * Amazon's Annapurna Labs 1c36:0031 Root Ports don't support MSI-X, so it
+ * should be disabled on platforms where the device (mistakenly) advertises it.
+ *
+ * Notice that this quirk also disables MSI (which may work, but hasn't been
+ * tested), since currently there is no standard way to disable only MSI-X.
+ *
+ * The 0031 device id is reused for other non Root Port device types,
+ * therefore the quirk is registered for the PCI_CLASS_BRIDGE_PCI class.
+ */
+static void quirk_al_msi_disable(struct pci_dev *dev)
+{
+	dev->no_msi = 1;
+	pci_warn(dev, "Disabling MSI/MSI-X\n");
+}
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_al_msi_disable);
 #endif /* CONFIG_PCI_MSI */
 
 /*
-- 
2.17.1
