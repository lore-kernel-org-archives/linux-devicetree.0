From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH 4/8] PCI: Add quirk to disable MSI support for Amazon's
 Annapurna Labs host bridge
Date: Thu, 11 Jul 2019 17:56:25 +0300
Message-ID: <20190710164519.17883-5-jonnyc@amazon.com>
References: <20190710164519.17883-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710164519.17883-1-jonnyc@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

On some platforms, the host bridge exposes an MSI-X capability but
doesn't actually support it.
This causes a crash during initialization by the pcieport driver, since
it tries to configure the MSI-X capability.

Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
---
 drivers/pci/quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 11850b030637..0fb70d755977 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2925,6 +2925,14 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATTANSIC, 0x10=
a1,
 			quirk_msi_intx_disable_qca_bug);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATTANSIC, 0xe091,
 			quirk_msi_intx_disable_qca_bug);
+
+static void quirk_al_msi_disable(struct pci_dev *dev)
+{
+	dev->no_msi =3D 1;
+	dev_warn(&dev->dev, "Annapurna Labs pcie quirk - disabling MSI\n");
+}
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_al_msi_disable);
 #endif /* CONFIG_PCI_MSI */
=20
 /*
--=20
2.17.1
