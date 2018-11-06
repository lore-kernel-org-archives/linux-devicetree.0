From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCH 11/23] PCI: mobiveil: only fixup the Class Code field
Date: Tue, 6 Nov 2018 13:20:16 +0000
Message-ID: <20181106131807.29951-12-Zhiqiang.Hou@nxp.com>
References: <20181106131807.29951-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106131807.29951-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Fixup the Class Code to PCI bridge, do not change the Revision ID.
And move the fixup to *_host_init function.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 drivers/pci/controller/pcie-mobiveil.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controlle=
r/pcie-mobiveil.c
index 884c9f95374d..8e3630359597 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -652,6 +652,12 @@ static int mobiveil_host_init(struct mobiveil_pcie *pc=
ie)
 				   type, resource_size(win->res));
 	}
=20
+	/* fixup for PCIe class register */
+	value =3D csr_readl(pcie, PAB_INTP_AXI_PIO_CLASS);
+	value &=3D 0xff;
+	value |=3D (PCI_CLASS_BRIDGE_PCI << 16);
+	csr_writel(pcie, value, PAB_INTP_AXI_PIO_CLASS);
+
 	/* setup MSI hardware registers */
 	mobiveil_pcie_enable_msi(pcie);
=20
@@ -895,9 +901,6 @@ static int mobiveil_pcie_probe(struct platform_device *=
pdev)
 		goto error;
 	}
=20
-	/* fixup for PCIe class register */
-	csr_writel(pcie, 0x060402ab, PAB_INTP_AXI_PIO_CLASS);
-
 	/* initialize the IRQ domains */
 	ret =3D mobiveil_pcie_init_irq_domain(pcie);
 	if (ret) {
--=20
2.17.1
