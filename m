From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH 3/8] PCI/VPD: Add VPD release quirk for Amazon Annapurna
 Labs host bridge
Date: Thu, 11 Jul 2019 17:55:56 +0300
Message-ID: <20190710164519.17883-4-jonnyc@amazon.com>
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

The Amazon Annapurna Labs pcie host bridge exposes the VPD capability,
but there is no actual support for it.

The reason for not using the already existing quirk_blacklist_vpd()
is that, although this fails pci_vpd_read/write, the 'vpd' sysfs
entry still exists. When running lspci -vv, for example, this
results in the following error:

pcilib: sysfs_read_vpd: read failed: Input/output error

This quirk removes the sysfs entry, which avoids the error print.

Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
---
 drivers/pci/vpd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/vpd.c b/drivers/pci/vpd.c
index 4963c2e2bd4c..b594b2895ffe 100644
--- a/drivers/pci/vpd.c
+++ b/drivers/pci/vpd.c
@@ -644,4 +644,16 @@ static void quirk_chelsio_extend_vpd(struct pci_dev *d=
ev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_CHELSIO, PCI_ANY_ID,
 			quirk_chelsio_extend_vpd);
=20
+static void quirk_al_vpd_release(struct pci_dev *dev)
+{
+	if (dev->vpd) {
+		pci_vpd_release(dev);
+		dev->vpd =3D NULL;
+		pci_warn(dev, FW_BUG "Annapurna Labs pcie quirk - Releasing VPD capabili=
ty (No support for VPD read/write transactions)\n");
+	}
+}
+
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_AMAZON_ANNAPURNA_LABS, 0x0031,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_al_vpd_release);
+
 #endif
--=20
2.17.1
