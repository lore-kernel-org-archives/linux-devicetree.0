From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv4 03/28] PCI: mobiveil: correct the returned error number
Date: Mon, 11 Mar 2019 09:30:20 +0000
Message-ID: <20190311093130.7209-4-Zhiqiang.Hou@nxp.com>
References: <20190311093130.7209-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311093130.7209-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

This patch corrected the returned error number by convention,
and removed a unnecessary error check.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
---
V4:
 - no change

 drivers/pci/controller/pcie-mobiveil.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controlle=
r/pcie-mobiveil.c
index b87471f08a40..563210e731d3 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -819,7 +819,7 @@ static int mobiveil_pcie_init_irq_domain(struct mobivei=
l_pcie *pcie)
=20
 	if (!pcie->intx_domain) {
 		dev_err(dev, "Failed to get a INTx IRQ domain\n");
-		return -ENODEV;
+		return -ENOMEM;
 	}
=20
 	raw_spin_lock_init(&pcie->intx_mask_lock);
@@ -845,11 +845,9 @@ static int mobiveil_pcie_probe(struct platform_device =
*pdev)
 	/* allocate the PCIe port */
 	bridge =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
-		return -ENODEV;
+		return -ENOMEM;
=20
 	pcie =3D pci_host_bridge_priv(bridge);
-	if (!pcie)
-		return -ENOMEM;
=20
 	pcie->pdev =3D pdev;
=20
@@ -866,7 +864,7 @@ static int mobiveil_pcie_probe(struct platform_device *=
pdev)
 						    &pcie->resources, &iobase);
 	if (ret) {
 		dev_err(dev, "Getting bridge resources failed\n");
-		return -ENOMEM;
+		return ret;
 	}
=20
 	/*
--=20
2.17.1
